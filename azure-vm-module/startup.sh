#!/bin/bash
# this script will be executed by Foreman or other boot strapping system.
# the indent is to enable access to NSV Jenkins job to the provisioned nodes for node config and app setup
 
DEVOPSUSER=ngc-devops
DEVOPSGROUP=ngc-automation
SREUSER=ngc-sre
 
groupadd $DEVOPSGROUP
useradd -m  -s /bin/bash -c "NGC DevOps" -g $DEVOPSGROUP $DEVOPSUSER
useradd -m  -s /bin/bash -c "NGC SRE" -g $DEVOPSGROUP $SREUSER
 
# https://gitlab-master.nvidia.com/ngcsecurity/vault/blob/master/certificates/ssh/ngc-automation-ca-keys.pem
DEVOPS_SSHCERT="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC8ggs5q2zmtfyezekWOUFKr+vET2+oHFYg6ELb+vFDkKDcQ9FOBwy6m1Q1mpZr3Z9gvmBEUvVHrtVmGjzU0imlLP4QMdh0nFS7b+Uwxo8NM2eGeUKa9vGlmo9AZPJsVMyvk8iHc2BSsHWtt64x6JA7QmZcQJKdTr0O59J4vhP/KBtSQirvOQa8swwzaX0OWbpN7K4hOzpSyLZmqADeaFG7UUWHTztk6vyFxk4qKgmhytogCP3+MritLG7+Lu3T4WUBzBcaCJul8B6nWfOFLMtGD1jqACSuE8yWIHQemZR2Ci8Jz2g0b9vJ0CtrIKpdpbct/VphmAkhtDyxVJt2R5TJbBXryUVY3PYPeXTKafPWZxzt4C+3gY3nO7ojCssNswvvNDJSRWgRPeYKP21/27fFrRsZFJI2Wq+hPBzqy+Wd86f3QoGqJj6CE4k7AN6XnoWXw64x0G8fKaayF4fyoOAgxE+ttDbmECik3VSM2iwq78dO6lSukT3N852bwZGmBdCJQ04c3vk0em6KLU5/5cY6Cg5EaKRYuQgMuwoDp2TNRodKE6uF88X2FWbfnolJO1JycI7qxKz4AUb2vzbfaNj9zJmDuxTVOcy614jwmzN5kyTuw4gAzsdhq+i01DK+njEs04NJm7lNgllICRRns7BnGiLGo8wFPnGsvT8meazBUw== sshca-devopscert@ngc.prod.vault.nvidia.com"
 
echo $DEVOPS_SSHCERT > /etc/ssh/ngc-automation-ca-keys.pem
sudo chmod 644 /etc/ssh/ngc-automation-ca-keys.pem
 
echo "${DEVOPSUSER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${DEVOPSUSER}_sudo
echo "${SREUSER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${SREUSER}_sudo
 
echo "TrustedUserCAKeys /etc/ssh/ngc-automation-ca-keys.pem" >> /etc/ssh/sshd_config
 
# make sure you restart sshd after changes
systemctl restart sshd
###########################################
SSH_USER="$1"
DOCKER_CONTAINER="$2"
DOCKER_CONTAINER_NETWORK="$3"
DOCKER_CONTAINER_IP=$DOCKER_CONTAINER
###########################################

echo "SSH_USER : $SSH_USER"
echo "DOCKER_CONTAINER : $DOCKER_CONTAINER"
echo "DOCKER_CONTAINER_NETWORK: $DOCKER_CONTAINER_NETWORK"

echo "docker_container_ip:  $DOCKER_CONTAINER_IP"

# Adding public key to the docker instance in order to SSH access as root
pub=$(cat ~/.ssh/id_rsa.pub)
docker exec -it $DOCKER_CONTAINER /bin/bash -c "echo $pub >> /root/.ssh/authorized_keys"

# Restart ssh to apply changes
docker exec -it $DOCKER_CONTAINER /bin/bash -c "service ssh restart"

#############################################################
# When loggin with SSH, env vars differ from DOCKER env vars

# 1. Dumping docker env vars to a file
docker exec -it $DOCKER_CONTAINER /bin/bash -c "env > /etc/environment_docker"

# 2. Adding all DOCKER env vars to SSH env vars -> This will make available spark-submit and others.
ssh $SSH_USER@$DOCKER_CONTAINER_IP -- "cat /etc/environment_docker >> /etc/environment"










#  Instructions

## Prerequisites
### Install tools
 1. [tfenv](https://github.com/tfutils/tfenv)
 2. [Python](https://www.python.org/downloads/)
 3. [Pip](https://pip.pypa.io/en/stable/)
 4. [Virtualenv](https://pypi.org/project/virtualenv/)

## Provision the infrastructure

####  Retrieve the cluster kubeconfig

    cd terraform/clusters

    aws eks --region us-east-1 update-kubeconfig --name clusters-prod1

####  Create Python virtual environment

    virtualenv ~/ansible
    source ~/ansible/bin/activate

####  Install ansible and k8s modules

    pip install 'ansible<3.0' openshift pyyaml requests 'kubernetes<12.0'

####  Execute ansible-playbook to configure the cluster

    ansible-playbook -i \
                ../../ansible/inventories/clusters/ \
                -e "worker_iam_role_arn=$(terraform output worker_iam_role_arn) \
                    cluster_name=$(terraform output cluster_full_name) \
                    aws_default_region=$(terraform output aws_region)" \
                ../../ansible/cluster.yaml
#### Verify the cluster

    kubectl get nodes
    kubectl get namespaces
    kubectl get pods --all-namespaces

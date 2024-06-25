#!/bin/zsh

# keep in one line so it opens just one new tab
npx @trint/trint-creds@latest --aws devops --mongo-dev devops --mongo-prod devops --mongo-prod-eu devops

# only need this once
# kubectl-ctx infra=arn:aws:eks:eu-west-2:476412941051:cluster/infra
# kubectl-ctx dev=arn:aws:eks:us-east-1:378239092462:cluster/dev
# kubectl-ctx prod=arn:aws:eks:us-east-1:143850348497:cluster/prod
# kubectl-ctx prod-eu=arn:aws:eks:eu-west-1:143850348497:cluster/prod-eu

# dev
aws --profile trint-dev --region us-east-1 ecr get-login-password | docker login --username AWS --password-stdin 378239092462.dkr.ecr.us-east-1.amazonaws.com
aws --profile trint-dev --region eu-west-2 ecr get-login-password | docker login --username AWS --password-stdin 378239092462.dkr.ecr.eu-west-2.amazonaws.com
aws --profile trint-dev --region us-east-1 eks update-kubeconfig --name dev

# prod
aws --profile trint-prod --region us-east-1 ecr get-login-password | docker login --username AWS --password-stdin 143850348497.dkr.ecr.us-east-1.amazonaws.com
aws --profile trint-prod --region eu-west-2 ecr get-login-password | docker login --username AWS --password-stdin 143850348497.dkr.ecr.eu-west-2.amazonaws.com
aws --profile trint-prod --region us-east-1 eks update-kubeconfig --name prod

# prod-eu
aws --profile trint-prod --region eu-west-1 ecr get-login-password | docker login --username AWS --password-stdin 143850348497.dkr.ecr.eu-west-1.amazonaws.com
aws --profile trint-prod --region eu-west-1 eks update-kubeconfig --name prod-eu

# infra/toys
aws --profile trint-infra --region eu-west-1 ecr get-login-password | docker login --username AWS --password-stdin 476412941051.dkr.ecr.eu-west-1.amazonaws.com
aws --profile trint-toys --region us-east-1 ecr get-login-password | docker login --username AWS --password-stdin 633946266320.dkr.ecr.us-east-1.amazonaws.com
aws --profile trint-infra --region eu-west-2 eks update-kubeconfig --name infra
# sleep 5
# aws configure import --csv ~/.aws/kuba_accessKeys.csv
# aws configure set profile.kuba.region eu-west-2

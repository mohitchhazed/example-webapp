#!/bin/bash

/usr/local/bin/aws cloudformation $ACTION \
    --region ap-south-1 \
    --stack-name $STACK_NAME \
    --template-body file://service.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters \
    ParameterKey=DockerImage,ParameterValue=861673107443.dkr.ecr.ap-south-1.amazonaws.com/example-webapp:$(git rev-parse HEAD) \
    ParameterKey=VPC,ParameterValue=vpc-b35673db
    ParameterKey=Cluster,ParameterValue="default" \
    ParameterKey=Listener,ParameterValue="arn:aws:elasticloadbalancing:ap-south-1:861673107443:listener/app/example-webapp/4a66d1981521ec9e/57a0a82f28c0399c"

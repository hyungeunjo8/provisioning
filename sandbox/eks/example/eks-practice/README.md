# Terraform으로 EKS 프로비저닝 실습 가이드

### 1. 설정 변경하기
1. sandbox/eks-practice1/terraform.tfvars
2. sandbox/eks-practice1/alb/terraform.tfvars

### 2. VPC, EKS, S3, DynamoDB, Endpoint 생성
1. cd sandbox/eks-practice1
2. terraform init
3. terraform plan (생성 계획 확인)
4. terraform apply
   1. yes
5. corends 생성 중 pending 아래와 같이 pending 발생 후, 처리
   1. aws_eks_addon.coredns: Still creating...
   2. aws eks update-kubeconfig --name [설정한 eks cluster name]
   3. ec2 type 설정 제거 https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/fargate-getting-started.html#fargate-gs-coredns
   ```
      kubectl patch deployment coredns \
      -n kube-system \
      --type json \
      -p='[{"op": "remove", "path": "/spec/template/metadata/annotations/eks.amazonaws.com~1compute-type"}]'
      ```
   4. kubectl get pod -n kube-system 으로 coredns 정상 동작 확인 (이후 eks 생성의 정상 종료까지 시간이 꽤 소요됨)

### 3. AWS Load Balancer Controller, SeviceAccount 생성
1. cd alb
2. terraform init
3. terraform plan -var-file ../terraform.tfvars (생성 계획 확인)
4. terraform apply -var-file ../terraform.tfvars
   1. yes

### 4. Deployment, Service, Ingress 생성
1. https://github.com/hyungeunjo8/eks-fargate-practice clone
2. 3단계에서 생성한 service account 명으로 k8s/deployment.yaml serviceAccountName 변경
   1. 생성한 service account 확인 방법 kubectl get serviceaccount
3. cd k8s
4. deployment 배포
   1. kubectl apply -f deployment.yaml
5. service 배포
   1. kubectl apply -f service.yaml
6. ingress 배포
   1. kubectl apply -f ingress.yaml

### 5. Application Load Balancer 생성 확인 및, API 테스트
1. kubectl get ing, Address 확인
2. API 테스트
   1. http://[Address]:80 (정상 동작 확인)
   2. http://[Address]:80/s3 (s3 정상 생성 및 권한 확인, 정상 생성 되었다면 리스트에 존재)
   3. http://[Address]:80/dynamo (dynamo 정상 생성 및 권한 확인, 정상 생성 되었다면 리스트에 존재)
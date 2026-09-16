##Build directly into ACR
az acr build --registry acr4b8d3897 --image genai-api:v1 https://github.com/bipeensinha/AI-200-GenAI-AKS.git

##Verify
az acr repository list --name acr4b8d3897 --output table

##Attach ACR to AKS
az aks update --name aks-4b8d3897 --resource-group ResourceGroup1 --attach-acr acr4b8d3897

##deploy to your existing AKS
kubectl create deployment genai-api --image=acr4b8d3897.azurecr.io/genai-api:v1

##Expose it:

kubectl expose deployment genai-api --name genai-api-service --type LoadBalancer --port 80 --target-port 5000

##Check:
kubectl get pods
kubectl get svc
  

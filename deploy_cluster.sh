#!/bin/bash
 echo "###################################"
 echo "##Ejecutando init de terraform...##"
 echo "###################################"
 terraform init

 echo "####################################################################"
 echo "##Creando infraestructura para la aplicacion de boutique online...##"
 echo "####################################################################"
 terraform apply -auto-approve 
 CLUSTER_NAME=$(cat clustername.txt)
 echo "#######################################"
 echo "##Login contra cluster $CLUSTER_NAME ##"
 echo "#######################################"

 aws eks --region us-east-1 update-kubeconfig --name $CLUSTER_NAME

FOLDER=./appcode/
FINDER=$(find $FOLDER -name *.yaml)
for f in  $FINDER
do
	#echo $f
	kubectl apply -f $f
done

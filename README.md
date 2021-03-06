## boutique-online-isc
### Infraestructura  
La infraestructura esta desplegada en un cluster de EKS en AWS, el mismo se encuentra en alta disponibilidad en la region de us-east-1 ubicado en las siguientes zonas de disponibilidad: us-east-1c y us-east-1a.

El cluster de EKS cuenta con un despliegue de worker-nodes con un minimo de 1 nodo y un maximo de 3, por defecto despliega solo dos nodos.
Luego contamos con un security group que solo habilita el trafico hacia el puerto 443 en el cluster de EKS.

Tambien se creo un internet gateway y un route table para la salida a internet.

Por ultimo en los deployment que se ejecutan para desplegar la aplicacion se crea un load balancer en el cluster de EKS que permite el acceso a la misma en alta disponibilidad y con balanceo de carga, esto hace que genere un load balancer clasico en AWS.

### Redes

Para el VPC se eligio la siguiente red: 10.0.0.0/16
Luego se crearon dos publics-subnet en diferentes zonas de disponibilidad, las subredes tienen los siguientes rangos:

1 us-east-1a -> 10.0.1.0/24 
2 us-east-1c -> 10.0.2.0/24 

### Cluster EKS

Para el despliegue de la aplicacion se utilizo el servicio de EKS, los nodos del mismo se despliegan a travez de worker-nodes en una instancia t3.medium con un escalado de hasta maximo 3 nodos.
La configuracion de la app se hace a travez de los archivos de configuracion .yaml ubicados en sus carpetas segun el microservicio.. 

### ECR

Utilizamos el servicio de ECR para almacenar las imagenes creadas que se utilizan en los archivos de configuracion anteriormente nombrado, este proceso no se automatizo y se hizo a mano la creacion y el pull de las mismas al Registry.

### Security Group

Se creo un security group solo que permite el trafico hacia el puerto 443 en el cluster de EKS.


### Diagrama de infraestructura
![Diagrama](cloud_oblig_2022.jpg)


### Como ejecutar automatizmo para crear infra y desplegar app

Consideraciones: 
* Actualizar credenciales en .aws/credentials (importante que tenga el nombre default)
* Validar el ARN del "labrole" 
* Estar parado en la carpeta del repositorio
* Tener comando terraform instalado
* Tener comando kubectl instalado
* Tener comando aws instalado

Luego con estas consideraciones validadas procedemos a ejecutar el script deploy_cluster.sh, el mismo desplegara la infra y dejara disponible la aplicacion.
Ejecutamos de la siguiente manera:
sh deploy_cluster.sh

Ya con el script ejecutado sin errores para conseguir la url del servicio ejecutamos kubectl get services y ya veremos la url.
 # Kubernetes

Kubernetes (also known as K8s) is an open-source container orchestration platform. It is used for automating deployment, scaling, and management of containerized applications. Kubernetes provides a flexible and scalable architecture for managing containers, which makes it an ideal choice for modern applications that are built using micro-services and containerization.

Kubernetes provides a unified API for managing and deploying containerized applications across multiple nodes or clusters. It enables developers to focus on building their applications without worrying about the underlying infrastructure. Kubernetes provides features such as load balancing, scaling, self-healing, and rolling updates, which ensure that the applications are always available and running smoothly.

Kubernetes can run on-premises, in the cloud, or in a hybrid environment. It works with a variety of container runtimes such as Docker, containerd, and CRI-O, and can manage containers across multiple hosts and clouds. Kubernetes also has a large and active community of contributors, which helps in continuous development and improvement of the platform.

# K8 Architecture

![kubernetes architecture](./Images/k8-arch.jpg)

# Kubernetes Architectural Components

## 1. Control Plane

The control plane is the central management layer responsible for maintaining the desired state of the cluster and orchestrating the various components. It includes several components:

- **API Server**: The API server is the central point of contact for managing the Kubernetes cluster. It exposes the Kubernetes API, which clients and other control plane components use to interact with the cluster. It validates and processes API requests, updating the cluster state as needed.

- **Scheduler**: The scheduler is responsible for placing pods (containers) on nodes within the cluster. It evaluates the current state of the cluster, including resource availability and constraints, to determine the optimal placement for each pod.

- **Controller Manager**: The controller manager runs various controllers that watch the state of the cluster and take action to maintain the desired state. For example, it handles replication controllers, endpoints, and namespace controllers.

- **Etcd**: Etcd is a distributed key-value store used by Kubernetes to persist the state of the cluster. It stores configuration data, metadata, and other information that the control plane components use to manage the cluster.

## 2. Nodes

Nodes are the worker machines that run the actual workloads. Each node includes the following components:

- **Kubelet**: The kubelet is an agent that runs on each node and ensures the desired state of the node's assigned pods. It communicates with the API server to get pod definitions and manages the lifecycle of the pods on the node.

- **Kube-proxy**: Kube-proxy is responsible for network routing and load balancing. It manages network rules to ensure that communication within the cluster and between external clients and services is properly handled.

- **Container Runtime**: The container runtime is the software responsible for running containers. Kubernetes supports several container runtimes, such as Docker, containerd, and CRI-O.

# Kubernetes Manifests

## What are Kubernetes Manifests?

Kubernetes manifests are configuration files that define the desired state of resources in a Kubernetes cluster. They specify various properties such as the number of replicas, container images, networking settings, and more. Manifests are written in YAML or JSON format.

# Pods and Deployments in Kubernetes

## Pods

A pod is the smallest and most basic unit of deployment in Kubernetes. It represents a single instance of a running process in a cluster. Pods can contain one or more containers that share resources such as network interfaces and storage volumes.

### Key Characteristics of Pods

- **Multiple Containers**: While most pods contain a single container, they can have multiple containers. Containers within a pod share the same network namespace and storage volumes, allowing them to communicate using `localhost`.

- **Lifecycle**: Pods have a lifecycle that starts with scheduling onto a node and ends when they are terminated. Kubernetes manages pod lifecycles, including health checks and restarts in case of failures.

- **Ephemeral**: Pods are ephemeral, meaning they can be created and destroyed as needed. They are not intended to be long-lived or persistent.

- **Configuration**: Pods can be configured with specific resource requirements, such as CPU and memory limits, and can specify environmental variables and other settings for the contained containers.

- **Network**: Each pod gets its own IP address in the cluster, allowing direct communication with other pods.

### Uses of Pods

- **Workload Deployment**: Pods are used to deploy and manage individual workloads, such as running applications or services.

- **Stateful Workloads**: Pods can be used for stateful workloads such as databases or caches when managed with StatefulSets.

## Deployments

A Deployment is a higher-level Kubernetes resource that manages and automates the deployment and lifecycle of pods in a cluster. Deployments provide declarative updates for pods and help manage rolling updates, rollbacks, and other deployment strategies.

### Key Characteristics of Deployments

- **Declarative**: Deployments define the desired state of the application, including the number of replicas, pod templates, and update strategies.

- **Pod Templates**: Deployments use a pod template, which specifies the configuration of the pods to be managed.

- **Scaling**: Deployments allow you to scale the number of replicas up or down based on demand. This can be done manually or automatically using an autoscaler.

- **Rolling Updates**: Deployments support rolling updates, which gradually replace old pods with new ones to avoid downtime. You can specify the maximum number of pods to update at once and other update parameters.

- **Rollbacks**: If an update goes wrong, you can roll back to a previous revision to restore the last working state.

- **Health Checks**: Deployments can specify readiness and liveness probes to monitor the health of the pods.

### Benefits of Deployments

- **Automated Management**: Deployments automate the process of deploying and managing pods, including handling updates and scaling.

- **Version Control**: Deployments keep track of different versions of your application and allow you to roll back to previous versions.

- **Load Balancing**: Deployments work well with Kubernetes Services to ensure that the pods are load balanced.

- **Consistency**: Deployments provide consistency in deploying applications across multiple clusters and environments.

In summary, pods and deployments are core Kubernetes concepts for managing and deploying containerized applications in a cluster. Pods provide a way to run individual workloads, while deployments automate and manage the lifecycle of pods, offering features such as rolling updates and scaling.

# Kubernetes Service and Its Types

## Introduction to Kubernetes Service

In Kubernetes, a Service is an abstraction that defines a logical set of pods and a policy for accessing them. Services provide stable network endpoints for a set of pods, making it easier for other services or external clients to communicate with them. Services can use selectors to match pods and route traffic to them, even as pods are added or removed.

## Types of Kubernetes Service

Kubernetes supports several types of services based on the networking needs of your application:

### 1. ClusterIP

- **Description**: ClusterIP is the default type of Kubernetes service. It exposes the service on a cluster-internal IP address, which means it is only accessible from within the cluster.

- **Use Cases**: ClusterIP is useful for internal communication between services and applications within the cluster.

### 2. NodePort

- **Description**: NodePort is a service type that exposes the service on the same port on each node in the cluster. It also creates a ClusterIP service to enable internal communication.

- **Use Cases**: NodePort is useful when you want to expose the service on a specific port on all cluster nodes, allowing access from outside the cluster using the node's IP address and the NodePort.

### 3. LoadBalancer

- **Description**: LoadBalancer is a service type that exposes the service externally using a cloud provider's load balancer. It creates a ClusterIP service and a NodePort service as part of its setup.

- **Use Cases**: LoadBalancer is ideal for exposing services to the outside world while benefiting from the cloud provider's load balancing features.

### 4. ExternalName

- **Description**: ExternalName is a service type that maps the service to an external DNS name (CNAME record). It doesn't create ClusterIP, NodePort, or LoadBalancer services.

- **Use Cases**: ExternalName is useful for providing access to external resources using an easy-to-remember DNS name within the cluster.

## Service Selectors and Endpoints

- **Selectors**: Services use selectors to match and route traffic to specific pods based on labels.

- **Endpoints**: Kubernetes automatically creates an `Endpoints` resource for each service, which keeps track of the IP addresses of the pods that match the service's selector.

## Additional Service Features

- **Session Affinity**: Services can be configured to support session affinity (also known as sticky sessions), which ensures that requests from the same client are consistently routed to the same pod.

- **DNS**: Services are automatically assigned DNS names based on their names and namespaces, allowing other services to communicate with them using human-readable names.

- **Annotations**: Services can be annotated with metadata to customize their behavior, such as specifying load balancer settings for a LoadBalancer service.

## Conclusion

Kubernetes services provide a stable and scalable way to manage and expose your application components within a cluster and to the outside world. Choosing the appropriate service type for your application can ensure efficient and reliable communication between your services and clients.


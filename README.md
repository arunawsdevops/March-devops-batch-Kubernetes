# Kubernetes Commands Related to Nodes

Kubernetes provides several commands to manage and retrieve information about nodes in your cluster using the `kubectl` command-line tool. Here are some useful commands:

## Get Information About Nodes

- **List all nodes**: To list all nodes in the cluster:

    ```plaintext
    kubectl get nodes
    ```

- **Describe a specific node**: To describe a specific node and get detailed information about it:

    ```plaintext
    kubectl describe node <node-name>
    ```

## Managing Nodes

- **Cordon a node**: To cordon a node, which prevents new pods from being scheduled onto it:

    ```plaintext
    kubectl cordon <node-name>
    ```

- **Uncordon a node**: To uncordon a node, allowing new pods to be scheduled onto it:

    ```plaintext
    kubectl uncordon <node-name>
    ```

- **Drain a node**: To safely drain a node, which evicts all pods and ensures the node is ready for maintenance:

    ```plaintext
    kubectl drain <node-name> --ignore-daemonsets --delete-local-data
    ```

    - The `--ignore-daemonsets` flag allows DaemonSet pods to remain running.
    - The `--delete-local-data` flag deletes any local data on the node.

## Patching Nodes

- **Patch a node**: To patch a node's configuration:

    ```plaintext
    kubectl patch node <node-name> --patch '{"spec": {"taints": [{"effect": "NoSchedule", "key": "example-key", "value": "example-value"}]}}'
    ```

    - This example patches the node with a taint to prevent scheduling new pods on the node.

## Logs and Events

- **Get logs from a node**: Logs are collected from the containers running on nodes. You can view the logs of a specific pod:

    ```plaintext
    kubectl logs <pod-name> -n <namespace>
    ```

- **Get events related to a node**: To view events related to a specific node:

    ```plaintext
    kubectl get events --field-selector involvedObject.kind=Node,involvedObject.name=<node-name>
    ```

## Monitoring Node Status

- **Monitor node status**: To monitor the status of nodes, use the watch flag:

    ```plaintext
    kubectl get nodes --watch
    ```

This command provides a real-time view of node status changes.

These commands help you manage and monitor the nodes in your Kubernetes cluster effectively. Let me know if there's anything else I can assist you with.


# Kubernetes Commands Related to Pods, Services, and Deployments

Kubernetes provides various commands using the `kubectl` command-line tool to manage and retrieve information about Pods, Services, and Deployments in your cluster.

## Pods

### Get Information About Pods

- **List all pods**: To list all pods in the cluster or in a specific namespace:

    ```plaintext
    kubectl get pods
    kubectl get pods -n <namespace>
    ```

- **Describe a specific pod**: To describe a specific pod and get detailed information about it:

    ```plaintext
    kubectl describe pod <pod-name>
    ```

- **View pod logs**: To view logs from a specific pod:

    ```plaintext
    kubectl logs <pod-name>
    ```

- **View live logs**: To stream live logs from a pod:

    ```plaintext
    kubectl logs -f <pod-name>
    ```

### Managing Pods

- **Create a new pod**: To create a new pod from a YAML manifest file:

    ```plaintext
    kubectl apply -f path/to/pod.yaml
    ```

- **Delete a pod**: To delete a specific pod:

    ```plaintext
    kubectl delete pod <pod-name>
    ```

## Services

### Get Information About Services

- **List all services**: To list all services in the cluster or in a specific namespace:

    ```plaintext
    kubectl get services
    kubectl get services -n <namespace>
    ```

- **Describe a specific service**: To describe a specific service and get detailed information about it:

    ```plaintext
    kubectl describe service <service-name>
    ```

### Managing Services

- **Create a new service**: To create a new service from a YAML manifest file:

    ```plaintext
    kubectl apply -f path/to/service.yaml
    ```

- **Delete a service**: To delete a specific service:

    ```plaintext
    kubectl delete service <service-name>
    ```

## Deployments

### Get Information About Deployments

- **List all deployments**: To list all deployments in the cluster or in a specific namespace:

    ```plaintext
    kubectl get deployments
    kubectl get deployments -n <namespace>
    ```

- **Describe a specific deployment**: To describe a specific deployment and get detailed information about it:

    ```plaintext
    kubectl describe deployment <deployment-name>
    ```

### Managing Deployments

- **Create a new deployment**: To create a new deployment from a YAML manifest file:

    ```plaintext
    kubectl apply -f path/to/deployment.yaml
    ```

- **Scale a deployment**: To scale the number of replicas in a deployment:

    ```plaintext
    kubectl scale deployment <deployment-name> --replicas=<number>
    ```

- **Rolling update**: To perform a rolling update of a deployment:

    ```plaintext
    kubectl rollout status deployment/<deployment-name>
    ```

- **Roll back a deployment**: To roll back a deployment to a previous revision:

    ```plaintext
    kubectl rollout undo deployment/<deployment-name>
    ```

- **Delete a deployment**: To delete a specific deployment:

    ```plaintext
    kubectl delete deployment <deployment-name>
    ```

These commands help you manage and monitor the Pods, Services, and Deployments in your Kubernetes cluster effectively. Let me know if you need further assistance.
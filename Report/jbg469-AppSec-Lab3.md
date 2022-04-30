# Part 1
We get the environment working per lab instructions. Gift card site successfully lanches on command. 
<img width="1086" alt="Screen Shot 2022-04-14 at 3 43 19 PM" src="https://user-images.githubusercontent.com/72175659/163492337-b1a0e95a-a554-44a6-9dfd-5f23df33b368.png">
For each control we will Verify, Remediatem Validate
## Kubernetes Control 1 5.2.1:
### Subtask a (Validate findings)
The bench mark book says that if we have a psp that does not return true on kubectl get psp unrestricted -o=jsonpath='{.spec.privileged}' then we pass the audit, however we see this is not the case. Pods defined with spec.containers[].securityContext.privileged: true will not be permitted.
<img width="1081" alt="Screen Shot 2022-04-14 at 11 18 21 PM" src="https://user-images.githubusercontent.com/72175659/163512908-62234ae6-72e4-49d4-82c3-cb5a0f3d8b47.png">
### Subtask b (Remediate)
We remidiate the PSP by finding the name unrestricted in the django-psp.yaml. We changed the prvileged field to false from true. 
<img width="1089" alt="jbg469 5 2 1 remediate" src="https://user-images.githubusercontent.com/72175659/163651465-35df9ad3-bbee-4457-a845-755fb83d0642.png">

### Subtask c (Verify finding resolution)
We run the comand ```kubectl apply -f GiftcardSite/k8```  and check to see no PSP return true with the specified command in the benchmark book. 
kubectl get psp unrestricted -o=jsonpath='{.spec.privileged}'
No PSP return true and kubect get psp shows us the privilege is false now.
<img width="1089" alt="jbg469 5 2 1 resolution" src="https://user-images.githubusercontent.com/72175659/163652360-d7235518-6b68-4eb4-9288-1f1cf20f221e.png">

## Control 2 5.2.2:
### Subtask a
<img width="1077" alt="jbg469 5 2 2 validate " src="https://user-images.githubusercontent.com/72175659/163654214-a5978aa0-ec4b-46b7-bb25-3cd1bffcb256.png">
We run the specified command in kubernetes benchmark manual we return true which verfies the findings of the security audit.

"kubectl get psp unrestricted -o=jsonpath='{.spec.hostPID}'"


### Subtask b
<img width="1090" alt="jbg469 5 2 2 remediate" src="https://user-images.githubusercontent.com/72175659/163654367-36d11b39-5492-4866-9ffe-c1b525aac91d.png">
we change the hostPID field to false

### Subtask c
We run the comand ```kubectl apply -f GiftcardSite/k8```  and check to see no PSP return true with the specified command in the benchmark book.
"kubectl get psp unrestricted -o=jsonpath='{.spec.hostPID}'"

<img width="1082" alt="jbg469 5 2 2 resolution" src="https://user-images.githubusercontent.com/72175659/163654808-4bbb9202-b723-493c-a84a-21c1092a830d.png">

No PSP return true and kubect get psp shows us the privilege is false now.

## Control 3 5.2.3:
### Subtask a
The benchmark book says that pods with spec.hostIPC: true will not be permitted unless they are run under a specific PSP. Containers run with the hostIPC flag can’t be set to true.
We run the specified command in kubernetes benchmark manual and we return true which verifies the findings of the security audit.
"kubectl get psp unrestricted -o=jsonpath='{.spec.hostIPC}'"

<img width="619" alt="jbg469-screenshot5 2 3v" src="https://user-images.githubusercontent.com/72175659/163660600-882e5b0c-4316-4148-8e40-afd3fa0c1cdd.png">

### Subtask b

We change the hostIPC field to false

<img width="607" alt="jbg469-screenshot5 2 3r" src="https://user-images.githubusercontent.com/72175659/163660697-22a4cf92-a4a2-4ff7-be57-137dcb5f98d7.png">

### Subtask c
No PSP return true and kubect get psp shows us the privilege is false now. We run the comand kubectl apply -f GiftcardSite/k8 and check to see no PSP return true with the specified command in the benchmark book. "kubectl get psp unrestricted -o=jsonpath='{.spec.hostIPC}'"

<img width="613" alt="jbg469-screenshot5 2 3res" src="https://user-images.githubusercontent.com/72175659/163660814-c4db592b-92a0-4c14-99c1-81c9ec8e357a.png">

## Control 4 5.2.4:
### Subtask a
The benchmark book says that pods with spec.hostNetwork: true will not be permitted unless they are run under a specific PSP. Containers run with the hostIPC flag can’t be set to true.
We run the specified command in kubernetes benchmark manual and we return true which verifies the findings of the security audit.
"kubectl get psp unrestricted -o=jsonpath='{.spec.hostNetwork}'"
<img width="926" alt="image" src="https://user-images.githubusercontent.com/72175659/164360407-edd61423-3cb7-4a6d-9b3c-a5eb42373b80.png">

### Subtask b
We change the hostNetwork field to false in the django-psp.yaml file in GiftcardSite/k8. 
<img width="784" alt="image" src="https://user-images.githubusercontent.com/72175659/164360744-98251694-82d1-4d55-a0d1-79ab88881329.png">

### Subtask c
After revoking the permission that allows sharing the host network namespace in the appropriate PodSecurityPolicy we reapply the security policy with kubectl command kubectl apply -f GiftcardSite/k8. We check to see no PSP return true with the specified command in the benchmark book. "kubectl get psp unrestricted -o=jsonpath='{.spec.hostNetwork}'"

<img width="787" alt="image" src="https://user-images.githubusercontent.com/72175659/164361290-da025cd2-0b86-4a8c-b2bd-f9a9197734b1.png">


## Control 5 5.2.5:
### Subtask a
The benchmark book says the container running the allowPrivilegeEscalation flag set to true may have processes that can gain more privileges than their parent and this can’t be permitted. We run the specified command in kubernetes benchmark manual and we return true which verifies the findings of the security audit.
"kubectl get psp unrestricted -o=jsonpath='{.spec.allowPrivilegeEscalation}'"

<img width="783" alt="image" src="https://user-images.githubusercontent.com/72175659/164362401-7ad727b0-df8c-4725-ae0c-64cfeb02db2b.png">

### Subtask b
We change the allowPrivilegeEscalation field in the django-psp.yaml file to false. 
<img width="784" alt="image" src="https://user-images.githubusercontent.com/72175659/164363268-0cb8cbfe-cccf-4202-8892-0e7223abbf61.png">

### Subtask c
Once we apply the changes with the kubectl command, we check to see with the command "kubectl get psp unrestricted o=jsonpath='{.spec.allowPrivilegeEscalation}'" if it prints false.

<img width="782" alt="image" src="https://user-images.githubusercontent.com/72175659/164363764-7333ac59-084b-4992-b8e0-f72cd9c26e7d.png">

## Control 6 5.2.6:
### Subtask a
In the benchmark book, it says to not permit containers to be run as the root user and all should be run as a defined non-UID 0 user. We run the specified command in kubernetes benchmark manual "kubectl get psp unrestricted -o=jsonpath='{.spec.runAsUser.rule}'" and the output shows as RunAsAny. 

<img width="785" alt="image" src="https://user-images.githubusercontent.com/72175659/164363988-687a7a84-ed0d-4401-9860-4cdd452193b4.png">

### Subtask b

We Create a PSP as described in the Kubernetes documentation, ensuring that the .spec.runAsUser.rule is set to either MustRunAsNonRoot or MustRunAs with the range of UIDs not including 0.
<img width="789" alt="image" src="https://user-images.githubusercontent.com/72175659/164364099-d21c7d1c-3467-4cc0-ad9d-6af13e084e75.png">

### Subtask c
We run the command "kubectl apply -f GiftcardSite/k8 and then run "kubectl get psp unrestricted -o=jsonpath='{.spec.runAsUser.rule}'". The output now shows as MustRunAsNonRoot.

<img width="1263" alt="image" src="https://user-images.githubusercontent.com/72175659/164550367-b5c091f9-25a6-4839-a8b2-09e0c4f0b658.png">



## Control 7 5.2.7:
### Subtask a
We run the command "kubectl get psp unrestricted -o=jsonpath='{.spec.requiredDropCapabilities}'. We verify that there is at least one PSP which returns NET_RAW or ALL.
images.githubusercontent.com/72175659/164551140-4c0e9f6b-146b-48ef-8b65-c09c6d799084.png">

### Subtask b
We create a PSP as described in the Kubernetes documentation, ensuring that the .spec.requiredDropCapabilities is set to include either NET_RAW or ALL

<img width="783" alt="image" src="https://user-images.githubusercontent.com/72175659/164552374-f4f1b968-6ade-4e82-9654-198a25fc4782.png">

### Subtask c
<img width="780" alt="image" src="https://user-images.githubusercontent.com/72175659/164552577-a0050d0c-e8cf-4556-a4cb-26a3d0238be7.png">


## Control 8 5.4.1:
### Subtask a
We run the command "kubectl get all -o jsonpath='{range .items[?(@..secretKeyRef)]} {.kind} {.metadata.name} {"\n"}{end}' -A". This command finds references to objects which use environment variables.
defined from secrets<img width="782" alt="image" src="https://user-images.githubusercontent.com/72175659/164552831-f409b764-8c06-41cd-b44b-bbf89a5248f8.png">

### Subtask b
We rewrite application code to read secrets from mounted secret files, rather than from environment variable. Mounting secrets as volumes has the additional benefit that secret values can be updated without restarting the pod.

This is the secrets file for the MYSQL_ROOT_PASSWORD in the django-deploy.yaml file. I have encoded the password thisisatesthing. and got the output dGhpc2lzYXRlc3R0aGluZy4=
<img width="1357" alt="image" src="https://user-images.githubusercontent.com/72175659/165236532-58e69265-58f1-4dd4-8f12-1ff727287ba1.png">


I deleted the password value: thisisatestthing. for the MYSQL_ROOT_PASSWORD and then referenced it to the name that is in the secrets file in Giftcardsite/k8 that I have made. I also did the same for SECRET_KEY that was in the settings.py file.
<img width="1358" alt="image" src="https://user-images.githubusercontent.com/72175659/165227592-a1c56065-78f1-45c1-9e69-e58c3596c030.png">


I have commented out the SECRET_KEY inside the settings.py file and used the python command SECRET_KEY = os.environ.get('SECRET_KEY'). We are mounting by using this command.
<img width="1360" alt="image" src="https://user-images.githubusercontent.com/72175659/165239652-69ed0afa-6ae7-4805-adf4-db52e79c3c28.png">

I have also referenced SECRET_KEY inside a secrets file I made for it. I took the original SECRET_KEY value and encoded it using command "echo -n "kmgysa#fz+9(z1*=c0ydrjizk*7sthm2ga1z4=^61$cxcq8b$l" | base64". 

The python command SECRET_KEY = os.environ.get('SECRET_KEY') is going to get the SECRET_KEY value that is encoded from the secrets file.

<img width="1358" alt="image" src="https://user-images.githubusercontent.com/72175659/165240015-34abdbb6-4223-4ccd-9db8-933d35bcdbb1.png">

I have referenced to the name mysql-secrets that was also in the secrets file I have made in the secrets file (in the previous image). The key is the MYSQL_ROOT_PASSWORD that has been encoded in the django secret's file.

<img width="1357" alt="image" src="https://user-images.githubusercontent.com/72175659/165242462-92005ce6-dc86-4629-8a53-6c5acf6706d8.png">

### Subtask c
<img width="1357" alt="image" src="https://user-images.githubusercontent.com/72175659/165404475-bdb25ef3-f335-42f0-959a-8b4329e2c91d.png">


## Control 9 5.7.1:
### Subtask a
We run the command "kubectl get namespaces". This command outputs the namespaces that are currently created in the cluster. By default, Kubernetes starts with two initial namespaces:
1. default - The default namespace for objects with no other namespace
2. kube-system - The namespace for objects created by the Kubernetes system
3. kube-node-lease - Namespace used for node heartbeats
4. kube-public - Namespace used for public information in a cluster

<img width="783" alt="image" src="https://user-images.githubusercontent.com/72175659/165404993-bc2121da-05a0-44fe-a195-42b9009df276.png">

### Subtask b
We created a namespace by making a file with the kind:namespace. I named my namespace as jbg469. I then ran the command “kubectl create -f Benchmarks/namespace.yaml”. 
<img width="788" alt="image" src="https://user-images.githubusercontent.com/72175659/165650389-ba63b3bc-3704-44a8-9472-57d8426011b8.png">

We inserted the namespace: jbg469 in every pod’s yaml file under metadata. Below is an example. 
<img width="778" alt="image" src="https://user-images.githubusercontent.com/72175659/165650543-cd284560-6aa5-41b2-b303-1089167c5bef.png">


### Subtask c
We run the commands “ kubectl apply -f db/k8
kubectl apply -f GiftcardSite/k8
kubectl apply -f proxy/k8” to show that it has been applied to all the yaml files that we have added namespace: jbg469 to. Then when we check our namespaces we see the new one that we had made.

<img width="778" alt="image" src="https://user-images.githubusercontent.com/72175659/165650782-b0f64ac1-4e49-4bbc-aea7-14bd8fb55e99.png">


## Control 10 5.7.2:
### Subtask a
Seccomp (secure computing mode) is used to restrict the set of system calls applications can make, allowing cluster administrators greater control over the security of workloads running in the cluster. Kubernetes disables seccomp profiles by default for historical reasons. So we know by default that Kubernetes disables seccomp profiles and we will need to add them into the deployment files for all the pods.
### Subtask b

We add these three lines to all the deployment files for each pod underneath where it says spec so it will look like the following.
spec:
    securityContext:
        seccompProfile:
            type: RuntimeDefault
            
<img width="785" alt="image" src="https://user-images.githubusercontent.com/72175659/165650981-4f87a028-92ac-42e2-ad45-d586c1842d00.png">
<img width="782" alt="image" src="https://user-images.githubusercontent.com/72175659/165651096-98450dba-8fdb-4b0e-adae-18bb8dc7b719.png">
<img width="780" alt="image" src="https://user-images.githubusercontent.com/72175659/165651143-a8786a1a-5667-497e-8572-75c5ceca61fc.png">

### Subtask c
We applied for each pod by running the commands 
“kubectl apply -f db/k8
kubectl apply -f GiftcardSite/k8
kubectl apply -f proxy/k8”
<img width="780" alt="image" src="https://user-images.githubusercontent.com/72175659/165651375-eb4c32bd-1d34-4d97-b881-8ffa052dc6ce.png">

## Docker Control 11 4.1:
### Subtask a
We run the command:
docker ps --quiet | xargs --max-args=1 -I{} docker exec {} cat /proc/1/status | grep '^Uid:' | awk '{print $3}'
Returns 3 0 meaning that 3 containers are running as root. 
This should return the effective UID for each container and where it returns 0, it indicates that the container process is running as root.
<img width="783" alt="image" src="https://user-images.githubusercontent.com/72175659/165651465-4e018f97-ae89-4e01-ae0f-0cfdff7302e1.png">

### Subtask b
We should ensure that the Dockerfile for each container image contains the information below:
Remediation should be performed on the Giftcard site and proxy. Ensure users are created and switched by the completion of the build.

<img width="781" alt="image" src="https://user-images.githubusercontent.com/72175659/165651529-13874667-53df-44e8-bd23-c8a727dd4c4d.png">
We created a username for nginx by putting “USER nginx” in the dockerfile for proxy.

<img width="781" alt="image" src="https://user-images.githubusercontent.com/72175659/165651628-963338c6-e487-47fd-8bb4-2988c44ea42f.png">
We changed the user to django-app by putting USER django-app in the GiftcardSite docker file. We saved the files and then rebuilt it using the docker commands 
“docker build -t nyuappsec/assign3:v0 .
docker build -t nyuappsec/assign3-proxy:v0 proxy/
docker build -t nyuappsec/assign3-db:v0 db/”



### Subtask c
We should only have one output as 0 to show that there is a root and it has to be there.

<img width="780" alt="image" src="https://user-images.githubusercontent.com/72175659/165652027-ec3756e6-28f9-4b8f-9c61-a06cd60137fe.png">

## Control 12 4.2:
### Subtask a
There is no guarantee that these images are safe and do not contain security vulnerabilities or malicious code. We should review what Docker images are present on the host by executing the command “docker images”
We then use the command to review the history of commits to the image ”docker history <imageName>”
<img width="784" alt="image" src="https://user-images.githubusercontent.com/72175659/165652463-1a775e3b-e23c-488c-8e7b-2c5d62707f8c.png">
We checked the docker history for nyuappsec/assign3, nyuappsec-db and nyuappsec-proxy and see that the images are recent and not old images.
<img width="780" alt="image" src="https://user-images.githubusercontent.com/72175659/165652532-58b5110b-8aac-4b8b-9066-719c39093127.png">
<img width="783" alt="image" src="https://user-images.githubusercontent.com/72175659/165652568-53e73958-1c66-4bb1-8ed3-97e32cf8d824.png">
<img width="782" alt="image" src="https://user-images.githubusercontent.com/72175659/165652597-09d3ce3d-dec6-4b5a-bf43-0a0c795e6978.png">
### Subtask b
Each dockerfile is built off a high trust base image major images like Ubuntu, Debian, spline, MySQL, etc are trusted. If you build off some random image built two years ago then it is not so much trusted. Thus, we do not need a remediation for these images.
### Subtask c
    
## Control 13 4.3:
### Subtask a
We audit the Dockerfiles and locate excessive package installation. We run the command docker ps --quiet to list all the running instances of containers.
<img width="1330" alt="image" src="https://user-images.githubusercontent.com/72175659/166090024-8847299c-a878-4cbe-a944-73fd5a01c2f0.png">

### Subtask b
We delete the "RUN apk add openjdk11" package 
<img width="1089" alt="image" src="https://user-images.githubusercontent.com/72175659/165700889-58bf921f-e2e0-4b6d-bbe9-dfb76be6e767.png">

### Subtask c
<img width="1093" alt="image" src="https://user-images.githubusercontent.com/72175659/165700727-abe8f687-e8db-4489-ab8b-695d653c902e.png">

## Control 14 4.9:
### Subtask a
We run the command "docker images"
<img width="1019" alt="image" src="https://user-images.githubusercontent.com/72175659/165653334-8f16991b-6daf-4712-9b54-41246a9c0f59.png">
In the Dockerfiles for the image that we have, we should verify that there are no ADD instructions.
### Subtask b
We should use COPY rather than ADD instructions in Dockerfiles so we change all the COPY to ADD.
<img width="1014" alt="image" src="https://user-images.githubusercontent.com/72175659/165654121-b44e0303-ffef-4602-af51-9f2c43fafc23.png">
<img width="1087" alt="image" src="https://user-images.githubusercontent.com/72175659/165683704-baacc9e2-53f2-4c29-9b4a-a3efb63c2513.png">
The COPY instruction simply copies files from the local host machine to the container file system. The ADD instruction could potentially retrieve files from remote URLs and perform operations such as unpacking them. The ADD instruction therefore introduces security risks. For example, malicious files may be directly accessed from URLs without scanning, or there may be vulnerabilities associated with decompressing them.
    
### Subtask c
We were able to apply the changes and log into the gift card site. 
<img width="1086" alt="image" src="https://user-images.githubusercontent.com/72175659/165691968-d45ce60c-86d2-479a-a3e3-4b2fc98cc63e.png">


## Control 15 4.10:
### Subtask a
We verify that there are no secrets for the dockerfile in the images that we have access for. In the dockerfile for db/Dockerfile, we comment out the secret. 
<img width="1091" alt="image" src="https://user-images.githubusercontent.com/72175659/165690417-cfbc86bd-b3f6-44da-aed6-00dd75a8cd62.png">

### Subtask b
We delete the environment variable in the docker file.
<img width="1089" alt="image" src="https://user-images.githubusercontent.com/72175659/165690758-28e6e994-abee-47b7-bbd1-83c7e0ab5991.png">
We make a secrets file and ensure that the MYSQL_ROOT_PASSWORD value is encoded as "mysql_root_password: dGhpc2lzYXRlc3R0aGluZy4=".
<img width="1087" alt="image" src="https://user-images.githubusercontent.com/72175659/165693094-56563cc4-28c0-4ffe-9f34-819b9f5a732c.png">


### Subtask c
After we apply the changes we see that everything is working in the dockerfile.
We remove secrets from Dockerfiles and configure to use the secrets file instead. We apply the changes using kubectl and ensure the application is still working correctly which it does.
<img width="986" alt="image" src="https://user-images.githubusercontent.com/72175659/166089616-183e7612-4725-4595-a5d6-ae5b33ed1411.png">



 
## Oracle Control 16 1.2:
### Subtask a
We execute ```ps -ef | egrep '^mysql.*$'``` inside a bash shell of the pod with the commands in the FAQ.

```kubectl exec --stdin --tty mysql-container-5545ddcfd4-2hkc8 -- bash```

We return 
```
mysql          1       0  0 Apr24 ?        00:01:53 mysqld --secure-file-priv=/
```
To fail we must return no lines but we return the expected user 'mysql' so this is indeed a pass. 

<img width="1272" alt="Screen Shot 2022-04-24 at 10 10 16 PM" src="https://user-images.githubusercontent.com/72175659/165009385-59c5a0bc-35fb-4c8d-b8f7-cfb222bfe42f.png">

### Subtask b
We pass the security audit so there is no remediation. 
### Subtask c
No remediation therefore no resolution. Good
## Control 17 2.3:
### Subtask a
We will run a couple of commands to audit this control first we do kubectl get pods and kubectl get services. This shows us each pod is built for a specific purpose each with it's own port and IP adress, Custom applications accommodate database connections over the network rather than on the use (e.g., using TCP/IP connections).

<img width="1269" alt="Screen Shot 2022-04-24 at 8 57 46 PM" src="https://user-images.githubusercontent.com/72175659/165004749-471f4d23-237c-46c2-8b6c-01fb55dbe176.png">

Auditing the DB .yaml files (in k8 and k8s) and Docker file we dont find any extraneous users, roles, or services set to be deployed. Just users, roles, and services specific to MySQL use
<img width="1260" alt="Screen Shot 2022-04-24 at 9 14 15 PM" src="https://user-images.githubusercontent.com/72175659/165005596-9cb641f9-3ac7-410d-9e60-3ef95378a186.png">

Reviewing the log for the pod we see no extraneous users, roles, or services related to MySQL use. When we examine the output kubectl describe pod <sqlpod> we also see no extraneous entities related to SQL use.
LOG
```
nyuappsec@ubuntu:~/AppSec3$ kubectl logs mysql-container-5545ddcfd4-2hkc8
2022-04-24 21:34:40+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.0.28-1debian10 started.
2022-04-24 21:34:40+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
2022-04-24 21:34:40+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.0.28-1debian10 started.
2022-04-24 21:34:40+00:00 [Note] [Entrypoint]: Initializing database files
2022-04-24T21:34:40.210727Z 0 [System] [MY-013169] [Server] /usr/sbin/mysqld (mysqld 8.0.28) initializing of server in progress as process 45
2022-04-24T21:34:40.217081Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
2022-04-24T21:34:40.516152Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
2022-04-24T21:34:41.367101Z 6 [Warning] [MY-010453] [Server] root@localhost is created with an empty password ! Please consider switching off the --initialize-insecure option.
2022-04-24 21:34:43+00:00 [Note] [Entrypoint]: Database files initialized
2022-04-24 21:34:43+00:00 [Note] [Entrypoint]: Starting temporary server
2022-04-24T21:34:43.521173Z 0 [Warning] [MY-010099] [Server] Insecure configuration for --secure-file-priv: Data directory is accessible through --secure-file-priv. Consider choosing a different directory.
2022-04-24T21:34:43.521180Z 0 [Warning] [MY-010101] [Server] Insecure configuration for --secure-file-priv: Location is accessible to all OS users. Consider choosing a different directory.
2022-04-24T21:34:43.521226Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.0.28) starting as process 94
2022-04-24T21:34:43.532594Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
2022-04-24T21:34:43.652434Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
2022-04-24T21:34:43.799001Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
2022-04-24T21:34:43.799032Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
2022-04-24T21:34:43.799598Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
2022-04-24T21:34:43.814166Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Socket: /var/run/mysqld/mysqlx.sock
2022-04-24T21:34:43.814235Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.28'  socket: '/var/run/mysqld/mysqld.sock'  port: 0  MySQL Community Server - GPL.
2022-04-24 21:34:43+00:00 [Note] [Entrypoint]: Temporary server started.
Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/leap-seconds.list' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.
2022-04-24 21:34:45+00:00 [Note] [Entrypoint]: Creating database GiftcardSiteDB

2022-04-24 21:34:45+00:00 [Note] [Entrypoint]: /entrypoint.sh: running /docker-entrypoint-initdb.d/setup.sql


2022-04-24 21:34:45+00:00 [Note] [Entrypoint]: Stopping temporary server
2022-04-24T21:34:45.872776Z 12 [System] [MY-013172] [Server] Received SHUTDOWN from user root. Shutting down mysqld (Version: 8.0.28).
2022-04-24T21:34:47.331945Z 0 [System] [MY-010910] [Server] /usr/sbin/mysqld: Shutdown complete (mysqld 8.0.28)  MySQL Community Server - GPL.
2022-04-24 21:34:47+00:00 [Note] [Entrypoint]: Temporary server stopped

2022-04-24 21:34:47+00:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.

2022-04-24T21:34:48.106428Z 0 [Warning] [MY-010099] [Server] Insecure configuration for --secure-file-priv: Data directory is accessible through --secure-file-priv. Consider choosing a different directory.
2022-04-24T21:34:48.106435Z 0 [Warning] [MY-010101] [Server] Insecure configuration for --secure-file-priv: Location is accessible to all OS users. Consider choosing a different directory.
2022-04-24T21:34:48.106496Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.0.28) starting as process 1
2022-04-24T21:34:48.115578Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
2022-04-24T21:34:48.236708Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
2022-04-24T21:34:48.348164Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
2022-04-24T21:34:48.348195Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
2022-04-24T21:34:48.349083Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
2022-04-24T21:34:48.362896Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.28'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.
2022-04-24T21:34:48.362900Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Bind-address: '::' port: 33060, socket: /var/run/mysqld/mysqlx.sock
nyuappsec@ubuntu:~/AppSec3$ 
```
DESCRIBE
```
  kubectl describe pod mysql-container-5545ddcfd4-2hkc8
Name:         mysql-container-5545ddcfd4-2hkc8
Namespace:    default
Priority:     0
Node:         minikube/192.168.49.2
Start Time:   Sun, 24 Apr 2022 14:34:38 -0700
Labels:       app=mysql-container
              pod-template-hash=5545ddcfd4
              tier=backend
Annotations:  <none>
Status:       Running
IP:           172.17.0.4
IPs:
  IP:           172.17.0.4
Controlled By:  ReplicaSet/mysql-container-5545ddcfd4
Containers:
  mysql-container:
    Container ID:   docker://b6beb234210db10564c2b8cc192d6dc61ff78cb9674a176c7f4761f0028ede4f
    Image:          nyuappsec/assign3-db:v0
    Image ID:       docker://sha256:4bca394a57cabeda359c25d6fdb66a776e867d1f74c5fd910771b082e9809298
    Port:           3306/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Sun, 24 Apr 2022 14:34:40 -0700
    Ready:          True
    Restart Count:  0
    Environment:
      MYSQL_DATABASE:  GiftcardSiteDB
    Mounts:
      /var/lib/mysql from mysql-volume-mount (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-s7984 (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  mysql-volume-mount:
    Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:  mysql-pvc
    ReadOnly:   false
  kube-api-access-s7984:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:                      <none>
  
```
finally we get the process id of our sql container with docker ps then do docker top <sql pod pid>. This benchmark is a pass. 
<img width="1270" alt="Screen Shot 2022-04-24 at 9 48 38 PM" src="https://user-images.githubusercontent.com/72175659/165007795-d346d039-ecad-4e9b-8069-96bae58131f6.png">
We see nothing out of the ordinary. Nice
### Subtask b
There is no remediation 
### Subtask c
There is no remediation therefore no resolution. We audited the 
## Control 18 2.7:
### Subtask a
We run 
Password lifetime is set to 0, which means that the password will not expire
SELECT VARIABLE_NAME, VARIABLE_VALUE
FROM performance_schema.global_variables where VARIABLE_NAME like 'default_password_lifetime';
Then running mysql> SELECT user, host, password_lifetime from mysql.user where password_lifetime = 0 OR password_lifetime >= 365;
Returns an Empty set. Which means we just change one password expiry date. 

<img width="1055" alt="Screen Shot 2022-04-24 at 7 44 16 PM" src="https://user-images.githubusercontent.com/72175659/165001649-7fb6dd22-8437-46bd-b37e-480a9a338e20.png">

### Subtask b
we run 
set persist default_password_lifetime = 365;

<img width="988" alt="Screen Shot 2022-04-24 at 7 50 27 PM" src="https://user-images.githubusercontent.com/72175659/165001867-ffb628ec-e4dc-45cc-bd15-485ebf825b28.png">

### Subtask c
<img width="1054" alt="Screen Shot 2022-04-24 at 7 51 40 PM" src="https://user-images.githubusercontent.com/72175659/165001884-6325a314-6df2-4722-8e9c-0b03dc8192aa.png">

Now the password expires in one year as opposed to never. Nice

## Control 19 2.9:
### Subtask a
<img width="1277" alt="Screen Shot 2022-04-24 at 6 56 28 PM" src="https://user-images.githubusercontent.com/72175659/165000217-e4367058-57cc-443d-a838-4183d21f7b6a.png">
We get 0's after running  
SELECT VARIABLE_NAME, VARIABLE_VALUE
FROM performance_schema.global_variables where VARIABLE_NAME in ('password_history', 'password_reuse_interval');

which indicates that NO policy is defined for the associated variable.
The password_history variable indicates the number of subsequent account password changes that must occur before the password can be reused. 

### Subtask b
Set a global policy that passwords may not be reused for a minimum of five password changes:
SET PERSIST password_history = 5;
Set a global policy that passwords have a lifetime to approximately one year (in days)
SET PERSIST password_reuse_interval = 365;
<img width="972" alt="Screen Shot 2022-04-24 at 7 00 11 PM" src="https://user-images.githubusercontent.com/72175659/165000301-cf563b07-8d51-48e8-9a26-5aec79ffd552.png">

### Subtask c

<img width="1168" alt="Screen Shot 2022-04-24 at 7 01 45 PM" src="https://user-images.githubusercontent.com/72175659/165000341-9afaadb8-c4a5-4c9e-98e3-c53ba1692ad6.png">

resolved per textbook specifications.

## Control 20 4.2:
### Subtask a
To validate this control we interact with the database pod and run
  SELECT * FROM information_schema.SCHEMATA where SCHEMA_NAME not in ('mysql','information_schema', 'sys', 'performance_schema'); we see that in this case the only database returned from the benchmark book command is GiftcardSiteDB. This is a false positive.
  <img width="619" alt="Screen Shot 2022-04-24 at 6 09 52 PM" src="https://user-images.githubusercontent.com/72175659/164998794-1bcc0a85-242d-4f85-bd4f-877ab13e9d65.png">
<img width="620" alt="Screen Shot 2022-04-24 at 6 10 02 PM" src="https://user-images.githubusercontent.com/72175659/164998800-b62654f1-238d-4416-84b4-e73ee3722d3f.png">

### Subtask b

<img width="624" alt="Screen Shot 2022-04-24 at 6 10 49 PM" src="https://user-images.githubusercontent.com/72175659/164998817-c6d95f4c-d571-4036-b72e-4eb59b1e1008.png">

Dropping the GiftcardSiteDB file would make registering, logging in, and out non-functional so we can’t drop it. If we do we get a 500 Server error. Therefore there must be a flaw in the security review there are no test databases present. There is no remediation for this control. 

### Subtask c
There is no resolution, no extra db’s to drop. 

# Part 2
We made a CronJobs file and ensured that the file had the schedule set to hourly which was "@hourly". We include our namespace name, the image here is image: mysql:latest since the control 2.7 from SQL was used. We use the command from the audit in 2.7 and then add the following with the mysql root password and mysql-service from the value in django-deploy file. Thus, this will be everything that is inside the command which will successfully show on our minikube dashboard.
    - date; echo Hello from the Kubernetes cluster; mysql -h mysql-service --user=root --password=thisisatestthing. -e "SELECT VARIABLE_NAME, VARIABLE_VALUE
              FROM performance_schema.global_variables where VARIABLE_NAME like
              'default_password_lifetime';"; echo cron complete
    
 
<img width="1329" alt="image" src="https://user-images.githubusercontent.com/72175659/166086198-721e88cc-3de7-49ee-82d7-c6a129a044f0.png">

We apply the changes to the cronjobs file using the kubectl command that we have made and then open up minikube dashboard where we will see our cronjob and the logs of the pod that we have made. 
<img width="1326" alt="image" src="https://user-images.githubusercontent.com/72175659/166086511-4cea893e-9211-4634-915f-f94925171f6d.png">

 We see that our dashboard shows the job successfully for our Cronjobs named "hello". 
 <img width="1328" alt="image" src="https://user-images.githubusercontent.com/72175659/166086555-874460d3-e8a3-4bce-9f74-1fdb8bc52791.png">
   

Now, we will make another job file for the MYSQL problem 2.9. We make another jobs file but change the name and in this case I changed it to "anotherjob" (has to be all lowercase) and I changed the command to what was inside the audit in 2.9. We put this inside the command - date; echo Hello from the Kubernetes cluster; mysql -h mysql-service --user=root --password=thisisatestthing. -e "SELECT VARIABLE_NAME, VARIABLE_VALUE
              FROM performance_schema.global_variables where VARIABLE_NAME in
              ('password_history', 'password_reuse_interval');"; echo cron is complete
<img width="1328" alt="image" src="https://user-images.githubusercontent.com/72175659/166086664-b312d129-ee1e-430f-99c2-b679b259cc8b.png">
    
We apply the changes inside the cronjobs file and then open the minikube dashboard. 

<img width="1328" alt="image" src="https://user-images.githubusercontent.com/72175659/166086763-19dcc56a-d3f2-48f1-8de1-5f78b5e8cc0e.png">

On minikube dashboard it shows that our command worked and even printed out that the cron is complete.
<img width="1331" alt="image" src="https://user-images.githubusercontent.com/72175659/166086865-0788b92f-0947-4b51-89aa-841dd10ab54e.png">



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
<img width="785" alt="image" src="https://user-images.githubusercontent.com/72175659/164553416-effadfb7-cd3e-4e31-a301-facbbebe1448.png">

### Subtask c
## Control 9 5.7.1:
### Subtask a

### Subtask b
### Subtask c
## Control 10 5.7.2:
### Subtask a
We see in VS code when we search for "securityContext" (Ctr+F) in all the pod definition files it doesn't exist, therefore confirming the benchmark security review that no seccomp profile is set in pod definitions.
### Subtask b
### Subtask c
## Docker Control 11 4.1:
### Subtask a
### Subtask b
### Subtask c
## Control 12 4.2:
### Subtask a
### Subtask b
### Subtask c
## Control 13 4.3:
### Subtask a
### Subtask b
### Subtask c
## Control 14 4.9:
### Subtask a
### Subtask b
### Subtask c
## Control 15 4.10:
### Subtask a
### Subtask b
### Subtask c
## Oracle Control 16 1.2:
### Subtask a
### Subtask b
### Subtask c
## Control 17 2.3:
### Subtask a
### Subtask b
### Subtask c
## Control 18 2.7:
### Subtask a
### Subtask b
### Subtask c
## Control 19 2.9:
### Subtask a
### Subtask b
### Subtask c
## Control 20 4.2:
### Subtask a
### Subtask b
### Subtask c

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

### Subtask b
<img width="806" alt="image" src="https://user-images.githubusercontent.com/72175659/163656692-e1cc0c72-632e-4d9f-bb61-fa39df475873.png">

### Subtask c

## Control 4 5.2.4:
### Subtask a

### Subtask b
### Subtask c
## Control 5 5.2.5:
### Subtask a

### Subtask b
### Subtask c
## Control 6 5.2.6:
### Subtask a

### Subtask b
### Subtask c
## Control 7 5.2.7:
### Subtask a

### Subtask b
### Subtask c
## Control 8 5.4.1:
### Subtask a

### Subtask b
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


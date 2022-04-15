# Part 1

We get the environment working per lab instructions. Gift card site successfully lanches on command. 

<img width="1086" alt="Screen Shot 2022-04-14 at 3 43 19 PM" src="https://user-images.githubusercontent.com/72175659/163492337-b1a0e95a-a554-44a6-9dfd-5f23df33b368.png">

For each control we will Verify, Remediatem Validate
    
## Kubernetes Control 1 5.2.1:
### Subtask a (Validate findings)
The bench mark book says that if we have a psp that does not return true then we pass the audit, however we see this is not the case. Pods defined with spec.containers[].securityContext.privileged: true will not be permitted.
<img width="1081" alt="Screen Shot 2022-04-14 at 11 18 21 PM" src="https://user-images.githubusercontent.com/72175659/163512908-62234ae6-72e4-49d4-82c3-cb5a0f3d8b47.png">    
### Subtask b (Remediate)
We remidiate the PSP by 
```
inser code here
```
### Subtask c (Verify finding resolution)
## Control 2 5.2.2:
### Subtask a
<img width="821" alt="Screen Shot 2022-04-15 at 2 01 03 PM" src="https://user-images.githubusercontent.com/72175659/163605043-bd4adc1a-fbdd-47ab-8db7-2f49ae8f67f4.png">

### Subtask b
### Subtask c
## Control 3 5.2.3:
### Subtask a
<img width="810" alt="image" src="https://user-images.githubusercontent.com/72175659/163607841-3a2b8c6b-7037-4b4b-945b-bb972f0fdf2b.png">

### Subtask b
### Subtask c
## Control 4 5.2.4:
### Subtask a
<img width="812" alt="Screen Shot 2022-04-15 at 2 32 27 PM" src="https://user-images.githubusercontent.com/72175659/163607908-f3a97538-94a0-4899-866d-bfb922ae63c8.png">

### Subtask b
### Subtask c
## Control 5 5.2.5:
### Subtask a
<img width="809" alt="Screen Shot 2022-04-15 at 2 33 05 PM" src="https://user-images.githubusercontent.com/72175659/163607976-e4e7212c-2267-4cd7-ba29-073cb2293e40.png">

### Subtask b
### Subtask c
## Control 6 5.2.6:
### Subtask a
<img width="809" alt="image" src="https://user-images.githubusercontent.com/72175659/163608020-60310130-9013-400f-ba39-4ef71eba6a82.png">

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
<img width="1018" alt="validate 5 7 2" src="https://user-images.githubusercontent.com/72175659/163626917-d5988f50-a468-40e9-ac86-a6e4d56a230a.png">
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

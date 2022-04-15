# Part 1

We get the environment working per lab instructions. Gift card site successfully lanches on command. 

<img width="1086" alt="Screen Shot 2022-04-14 at 3 43 19 PM" src="https://user-images.githubusercontent.com/72175659/163492337-b1a0e95a-a554-44a6-9dfd-5f23df33b368.png">

For each control we will Verify, Remediatem Validate
    
## Kubernetes Control 1 5.2.1:
### Subtask a (Validate findings)
The bench mark book says that if we have a psp that does not return true then we pass the audit, however we see this is not the case. Pods defined with spec.containers[].securityContext.privileged: true will not be permitted.
<img width="1081" alt="Screen Shot 2022-04-14 at 11 18 21 PM" src="https://user-images.githubusercontent.com/72175659/163512908-62234ae6-72e4-49d4-82c3-cb5a0f3d8b47.png">    
### Subtask b (Remediate)
We remidiate the PSP by finding the name unrestricted in the django-psp.yaml 
```
We change 
spec:
  privileged: true
```
to 
```
spec:
  privileged: false
```
<img width="1089" alt="jbg469 5 2 1 remediate" src="https://user-images.githubusercontent.com/72175659/163650275-16f86042-d360-4a73-b6d8-2e0da6caca34.png">

### Subtask c (Verify finding resolution)
## Control 2 5.2.2:
### Subtask a
<img width="808" alt="Screen Shot 2022-04-15 at 6 10 44 PM" src="https://user-images.githubusercontent.com/72175659/163648400-22ef0e4d-c97a-4c2b-9396-e3446f53397d.png">
### Subtask b
### Subtask c
## Control 3 5.2.3:
### Subtask a
<img width="805" alt="Screen Shot 2022-04-15 at 6 11 03 PM" src="https://user-images.githubusercontent.com/72175659/163648425-093e5d5e-33f8-4d09-8df3-aa3eff7b2fcd.png">
### Subtask b
### Subtask c
## Control 4 5.2.4:
### Subtask a
<img width="804" alt="Screen Shot 2022-04-15 at 6 11 27 PM" src="https://user-images.githubusercontent.com/72175659/163648451-a4b33dcd-36c7-47aa-8257-2c111d9b04f8.png">
### Subtask b
### Subtask c
## Control 5 5.2.5:
### Subtask a
<img width="807" alt="Screen Shot 2022-04-15 at 6 11 48 PM" src="https://user-images.githubusercontent.com/72175659/163648489-98e0b282-1b42-4aea-9504-5c5f427c35b8.png">
### Subtask b
### Subtask c
## Control 6 5.2.6:
### Subtask a
<img width="804" alt="Screen Shot 2022-04-15 at 6 12 24 PM" src="https://user-images.githubusercontent.com/72175659/163648521-49e0d90b-6626-4119-8125-ba02c50e07fe.png">
### Subtask b
### Subtask c
## Control 7 5.2.7:
### Subtask a
<img width="803" alt="Screen Shot 2022-04-15 at 6 12 56 PM" src="https://user-images.githubusercontent.com/72175659/163648536-07906e69-a68f-4c50-96d2-8dd10a7858d0.png">
### Subtask b
### Subtask c
## Control 8 5.4.1:
### Subtask a
<img width="809" alt="Screen Shot 2022-04-15 at 6 13 18 PM" src="https://user-images.githubusercontent.com/72175659/163648587-7a25b110-7c3c-489d-bb95-48ab49cb5b71.png">
### Subtask b
### Subtask c
## Control 9 5.7.1:
### Subtask a
<img width="808" alt="Screen Shot 2022-04-15 at 6 15 24 PM" src="https://user-images.githubusercontent.com/72175659/163648681-1a4ec1b6-87f3-445b-a0c5-ad38e2c66782.png">
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

# Keyword-Algorithm
Currently it just detects the time for task and prints it in the console

#Possible Inputs
### Next
  1) **action** next **day**
  
  2) **action** next **day** at **time**
  
  3) **action** next **day** at **place**
  
  4) **action** next month
  
  5) **action** next year
  
  6) **action** next week

### At
1) **action** at **place**

2) **action** at **time**

3) **action** at **place** on **date**

4) **action** at **time** on **date**

### In
1) **action** in **value** hours/days/weeks/months

### On
1) **action** on **date**

Ps. Currently only **in** and **Next** work completely, none of them recognize the minutes. If you enter : *next week at 12 pm*, its fine, but if you enter: *next week at 1230 pm* it will recognize it as 1230 hours which will result an error*

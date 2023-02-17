###############################################################################                 CALCULADORA


msg_0 = "Enter an equation"

msg_1 = "Do you even know what numbers are? Stay focused!"

msg_2 = "Yes ... an interesting math operation. You've slept through all classes, haven't you?"

msg_3 = 'Yeah... division by zero. Smart move...'

msg_4 = "Do you want to store the result? (y / n):" 

msg_5 = "Do you want to continue calculations? (y / n):"

# write your code here

memory = 0

while True:
    
    mensagem = input(msg_0)
    x, oper, y = mensagem.split()

    if x == 'M':
        x = memory
    if y == 'M':
        y = memory
    
    try:
        x = float(x)
        y = float(y)
    except Exception:
        print(msg_1)
        continue
    if oper == '+' or oper == '-' or oper == '/' or oper == '*':
        pass
    else:
        print(msg_2)
        continue
    
    if oper == '+':
        result = x + y
    elif oper == '-':
        result = x - y
    elif oper == '*':
        result = x * y
    elif oper == '/' and y != 0:
        result = x / y
    else:
        print(msg_3)
        continue
    print(result)
    
    answer = input(msg_4)
    if answer == 'y':
        memory = result

    answer = input(msg_5)
    if answer == 'y':
        continue
    break

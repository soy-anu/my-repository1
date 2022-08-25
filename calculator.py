def add(x,y):
    print(x,"+",y,"=",x+y)
    return(x+y)


def subtract(x,y):
    print(x,"-",y,"=",x-y)
    return(x-y)

def multiply(x,y):
    print(x,"*",y,"=",x*y)
    return(x*y)


def divide(x,y):
    print(x,"/",y,"=",x/y)
    return(x/y)

def history(x,y,r):
    fhandle = open("history.txt","a")
    record = str(first_number) + str(choice) + str(second_number) + "=" + str(result) + "\n"
    fhandle.write(record)
    fhandle.close()

def delete():
    fhandle3 = open("history.txt","w")
    fhandle3.close()


while True:
    choice = input("select operation\n1.addition +\n2.subtration -\n3.multiplication *\n4.division / \nhistory h\ndelete history d\n")

    if choice == 'h':
        fhandle2 = open("history.txt", "r")
        print(fhandle2.read())
        continue

    if choice == 'd':
        delete()
        print("history deleted\n")
        continue



    if choice in('+','-','*','/'):
        first_number = float(input("enter first number:\n"))
        second_number = float(input("enter second number\n"))







        if choice == '+':
                result = add(first_number,second_number)
                history(first_number,second_number,result)

        elif choice == '-':
                result = subtract(first_number,second_number)
                history(first_number, second_number, result)

        elif choice == '*':
                result = multiply(first_number,second_number)
                history(first_number, second_number, result)

        elif choice == '/':
                result = divide(first_number,second_number)
                history(first_number, second_number, result)






    else:
        print("invalid operation\n")


    next_calculation = input("more calculations?\n(yes/no)\n")
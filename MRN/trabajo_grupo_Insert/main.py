import os
from random import randint

LETRAS=['T','R','W','A','G','M','Y','F','P','D','X','B','N','J','Z','S','Q','V','H','L','C','K','E','T']


def aleatorio():
    return randint(10000000, 99999999)

def main():
    dni_lista=[]
    for i in range(60):
        dni=aleatorio()
        dni_lista.append(dni)
        if not dni in dni_lista:
            os.system(f"echo {dni}{LETRAS[dni%23]} >> alejandro_insert.sql")


if __name__=='__main__':
    main()
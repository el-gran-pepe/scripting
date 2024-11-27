# Esta funcion genera password de la longitud que deseemos

import string
import random


def passGen(LONG):
    A_MAYUS = string.ascii_uppercase
    A_MINUS = string.ascii_lowercase
    NUMBERS = string.digits
    CHARACTERS = string.punctuation

    ALL_CHARACTERS = A_MAYUS + A_MINUS + NUMBERS + CHARACTERS

    LONG = int(LONG)
    PASS = random.sample(ALL_CHARACTERS, LONG)
    print(''.join(PASS))


# Ejemplo de uso
passGen(12)  # Generará una contraseña de longitud 12

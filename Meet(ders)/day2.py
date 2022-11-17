# input
userInput = input("Değer Giriniz: ")
print(f"Girilen değer: {userInput}")

#Type Conversion
numberStr = "10"
print(type(numberStr))
number = int(numberStr)
print(number + 10)
print(type(number))

userInput = input("Ders Notunu Giriniz: ")
lessonNote = int(userInput)
print(f"Ders notu = {lessonNote}")

# Şart blokları
if lessonNote>50:
    print("Geçtiniz")
elif lessonNote == 50:
    print("Sinirda Geçtiniz")
elif lessonNote == 49:
    print("Sinirda Kaldiniz")
else:
    print("Kaldiniz")





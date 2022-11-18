# try-catch

try:
    examNote = float(input("Lütfen Sinav notunuzu giriniz: "))
    print(examNote)
    number = examNote/0
    print(number)
except ValueError:
    print("Deneme 123")
except ZeroDivisionError:
    print("Hic bir sayi 0'a bolunemez.")
except:
    print("Doğru Bir Girdi Girmediniz: ")
finally:
    print("Try except blogu sona erdi.")

# Dosya İşlemleri
# w -- write
# a -- append
# r - read
file = open("sample.txt","r")
# file.writelines("\nDeneme")
print(file.read())
file.close()




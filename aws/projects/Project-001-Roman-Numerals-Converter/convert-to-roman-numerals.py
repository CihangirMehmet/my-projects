e

def to_roman(num):
    # Anahtar olarak Romen rakamları ve değer olarak karşılık gelen değerleri içeren bir sözlük oluşturun
    roman = {
        "M": 1000,
        "CM": 900,
        "D": 500,
        "CD": 400,
        "C": 100,
        "XC": 90,
        "L": 50,
        "XL": 40,
        "X": 10,
        "IX": 9,
        "V": 5,
        "IV": 4,
        "I": 1
    }
   # Sonuç dizesini başlat
    result = ""
    # Sözlükte dolaşın ve sayının Romen rakamının değerinden büyük veya ona eşit olup olmadığını kontrol edin
    # Eğer öyleyse, karşılık gelen rakamı sonuç dizisine ekleyin ve değeri sayıdan çıkarın
    # Sayı 0 olana kadar devam edin
    for key, value in roman.items():
        while num >= value:
            result += key
            num -= value
   # Sonuç dizesini döndür
    return result
# Bir giriş mesajı yazdırın
# Bu program ondalık sayıları Romen Rakamlarına dönüştürür
print("This program converts decimal numbers to Roman Numerals")
print("(To exit the program, please type 'exit')")
# Kullanıcı çıkmak isteyene kadar döngü
while True:
   # Kullanıcıdan bir numara isteyin
    user_input = input("Please enter a number between 1 and 3999, inclusively: ")
    # Kullanıcı "exit" girerse programdan çıkar
    if user_input.lower() == "exit":
        print("Exiting the program... Good Bye")
        break
    # Kullanıcı girişi geçerli bir sayı değilse, bir hata mesajı gösterin ve tekrar giriş isteyin
    if not user_input.isdigit():
        print("Not Valid Input !!!")
        continue
    # Kullanıcı girişini bir tam sayıya dönüştürün
    num = int(user_input)
    # Sayı geçerli aralıkta değilse, bir hata mesajı gösterin ve tekrar giriş isteyin
    if not 1 <= num <= 3999:
        print("Not Valid Input !!!")
        continue
    # Sayıyı Romen rakamına dönüştürün ve yazdırın
    print(to_roman(num))


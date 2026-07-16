class TeaSet:
    def info(self):
        print("Это чайный сервиз")


class PorcelainTeaSet(TeaSet):
    def info(self):
        print("Это фарфоровый чайный сервиз")

    def material(self):
        print("Сервиз изготовлен из фарфора")


tea_set = TeaSet()
porcelain_set = PorcelainTeaSet()

print("Базовый класс:")
tea_set.info()

print("\nПроизводный класс:")
porcelain_set.info()
porcelain_set.material()
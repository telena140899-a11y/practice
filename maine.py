n = int(input("Введите количество элементов массива: "))
a = []

print("Введите элементы массива:")
for i in range(n):
    a.append(int(input()))

max_index = a.index(max(a))
min_index = a.index(min(a))

start = min(max_index, min_index)
end = max(max_index, min_index)

sum_negative = 0
for i in range(start + 1, end):
    if a[i] < 0:
        sum_negative += a[i]

print("Сумма отрицательных элементов:", sum_negative)
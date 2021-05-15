import random

print('discipline\tprofessor')

d = 12
p = 60

dis = list(range(1,d+1))
pro = list(range(1,p+1))

for p in pro:
    for di in  random.sample(dis, k=random.randint(1,3)):
        print(f"{di}\t{p}")


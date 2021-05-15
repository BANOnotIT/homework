import random
from datetime import timedelta, time

concurrent_lessons = 20

groups = list(range(1, 26))
auditorium = list(range(1, 21))
professors = {1: [9],
              2: [12],
              3: [2],
              4: [4],
              5: [5, 3],
              6: [2],
              7: [6, 1, 9],
              8: [11],
              9: [11],
              10: [6, 9, 12],
              11: [10, 9],
              12: [7, 10, 6],
              13: [11, 2, 6],
              14: [12],
              15: [10, 8, 2],
              16: [9, 3],
              17: [6],
              18: [1],
              19: [5],
              20: [2, 8],
              21: [11, 2],
              22: [5],
              23: [1],
              24: [11, 8, 5],
              25: [3, 8, 2],
              26: [9, 10],
              27: [8, 7, 6],
              28: [6],
              29: [10, 11],
              30: [5, 10],
              31: [5, 12, 7],
              32: [8, 10, 6],
              33: [7, 8, 11],
              34: [2, 8],
              35: [1, 2],
              36: [6, 11, 12],
              37: [6, 1, 4],
              38: [6],
              39: [12, 6, 8],
              40: [10],
              41: [9],
              42: [7],
              43: [8, 11],
              44: [5, 9, 12],
              45: [8, 7],
              46: [7, 10],
              47: [8, 9, 6],
              48: [11],
              49: [8, 1, 6],
              50: [9, 12, 6],
              51: [1, 4],
              52: [12, 11],
              53: [8],
              54: [5, 12, 10],
              55: [9, 2, 5],
              56: [3, 7],
              57: [10, 12],
              58: [11, 9, 2],
              59: [7, 2, 4],
              60: [1, 8, 9]}


def gen_row(start_time, day):
    gr = random.sample(groups, concurrent_lessons)
    pr = random.sample(professors.items(), concurrent_lessons)
    aud = random.sample(auditorium, concurrent_lessons)

    for i, (p, dis) in enumerate(pr):
        l = day, time.isoformat(start_time), p, random.choice(dis), aud[i], gr[i]
        print('\t'.join(map(str, l)))


print('day\ttime\tprofessor\tdiscipline\tauditorium\tgroup')
for day_of_week in range(1, 6):
    for hour in range(4):
        gen_row(time(hour=9 + hour*2), day_of_week)

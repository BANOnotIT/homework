def fn(n):
    d = bool(n&1)
    c = bool(n&2)
    b = bool(n&4)
    a = bool(n&8)

    result = "{:0>4},{:d},{:d},{:d}".format(
            bin(n)[2:],not d,a and b,a and b or c or not d
    )

    print (result)
    # ('%03s,%i,%i,%i,%i,%i' % (bin(n),not b, not c, a and not b, a and not c, (a and not b) or (a and not c)))

for i in range(0,1<<4):
    fn(i)

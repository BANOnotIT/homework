def fn(n):
    c = bool(n&1)
    b = bool(n&2)
    a = bool(n&4)

    result = "{:0>3},{:d},{:d},{:d},{:d},{:d}".format(
            bin(n)[2:],not b, not c, a and not b, a and not c, (a and not b) or (a and not c)
    )

    print (result)
    # ('%03s,%i,%i,%i,%i,%i' % (bin(n),not b, not c, a and not b, a and not c, (a and not b) or (a and not c)))

for i in range(0,8):
    fn(i)

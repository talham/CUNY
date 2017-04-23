# 1. fill in this function
#   it takes a list for input and return a sorted version
#   do this with a loop, don't use the built in list functions
def sortwithloops(input):
    # implement the selection sort algorithm
    cp = input[:]
    sorted = []
    n = len(input)
    for i in range(n):
        if i == 0:
            lo = min(cp)
            num = cp.index(lo)
            sorted.append(lo)
            del cp[num]
        else:
            lo = min(cp)
            num = cp.index(lo)
            sorted.append(lo)
            del cp[num]
    return sorted  # return a value


# 2. fill in this function
#   it takes a list for input and return a sorted version
#   do this with the built in list functions, don't us a loop
def sortwithoutloops(input):
    out = sorted(input)
    return out  # return a value


# 3. fill in this function
#   it takes a list for input and a value to search for
#	it returns true if the value is in the list, otherwise false
#   do this with a loop, don't use the built in list functions
def searchwithloops(input, value):
    n = len(input)
    for i in range(n):
        if input[i] == value:
            v = True
            return v
        elif i == n - 1:
            v = False
            return v
        else:
            i = i
            # return a value


# 4. fill in this function
#   it takes a list for input and a value to search for
#	it returns true if the value is in the list, otherwise false
#   do this with the built in list functions, don't use a loop
def searchwithoutloops(input, value):
    v = value in input
    return v  # return a value


if __name__ == "__main__":
    L = [5, 3, 6, 3, 13, 5, 6]

    print sortwithloops(L)  # [3, 3, 5, 5, 6, 6, 13]
    print sortwithoutloops(L)  # [3, 3, 5, 5, 6, 6, 13]
    print searchwithloops(L, 5)  # true
    print searchwithloops(L, 11)  # false
    print searchwithoutloops(L, 5)  # true
    print searchwithoutloops(L, 11)  # false

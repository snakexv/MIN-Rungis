import os

a=os.listdir("//ulisngp/Ulis/interface/ulisngp/QFQ")

print(a)

b=len(a)
print(b)

c=[]
for k in a:
    if 'creaclibat' in k:
        c.append(k)
print(c)

d=[]
for k in a:
    if 'resiclibat' in k:
        d.append(k)
print(d)

e=c+d
print(e)
print(len(e))

print(e[0])

direc = "//ulisngp/Ulis/interface/ulisngp/QFQ/" + e[0]
print(direc)

os.remove(direc)

#!/usr/bin/python3
import os
os.chdir("/home/monica/lab2-shlab-handout")
for i in range(1,17):
    if i < 10:
        # os.system("echo '➜  lab2-shlab-handout $make test0"+str(i)+"'>>tsh.sh")
        # os.system("echo '➜  lab2-shlab-handout $make rtest0"+str(i)+"'>>tshref.sh")
        os.system("make test0"+str(i)+">>tsh.sh")
        os.system("make rtest0"+str(i)+">>tshref.sh")
    else:
        # os.system("echo '➜  lab2-shlab-handout $make test"+str(i)+"'>>tsh.sh")
        # os.system("echo '➜  lab2-shlab-handout $make rtest"+str(i)+"'>>tshref.sh")
        os.system("make test"+str(i)+">>tsh.sh")
        os.system("make rtest"+str(i)+">>tshref.sh")
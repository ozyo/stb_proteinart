#!/usr/bin/python
import argparse
parser = argparse.ArgumentParser(description='A file with two columns Time and Data and return the derivative of the Data')
parser.add_argument('--inp', metavar='InPut', nargs=1, help='data.xvg file')
parser.add_argument('--outp', metavar='OutPut', nargs=1, help='out.xvg file')

args=parser.parse_args()
df=open(args.inp[0],'r').readlines()
df_n=[]

for line in df:
    line=line.split()
    df_n.append([int(line[0]),float(line[1])])

derivative=[[] for i in xrange(len(df_n))]

for i in range(1,len(df_n)):
    try:
        dydx=(df_n[i-1][1]-df_n[i+1][1])/(df_n[i+1][0]-df_n[i-1][0])
        derivative[i].append(dydx)
    except:
        dydx='null'

#complete the end of the derivative
derivative[0].append(2*derivative[1][0]-derivative[2][0])
derivative[len(df_n)-1].append(2*derivative[len(df_n)-2][0]-derivative[len(df_n)-3][0])

outf=open(args.outp[0],'w')

for der in derivative:
    outf.write("%f\n" % der[0])
outf.close()

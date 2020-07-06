# -*- coding: utf-8 -*-
"""
Created on Tue Mar 17 13:59:44 2020

@author: JAN-GRASIC
"""

import argparse

parser = argparse.ArgumentParser()

parser.add_argument("group", help="specify the group")
parser.add_argument("scaffolds", help="the scaffolds and ranges")

args = parser.parse_args()

def bed_file():
    

    f = open(args.scaffolds, "r")
    scaffolds = []
    for line in f:
        f1 = line.split()
        scaffolds.append(f1)
    
    k = open("bed_file.txt", "w+")

    
    end = 0
    start = 0

    for i in range(len(scaffolds)):
        scaffold_name = scaffolds[i][0]
        scaffold_length = int(scaffolds[i][1])
      
        end = end + scaffold_length
        if i % 2 == 0:
            orientation = "+"
        else:
            orientation = "-"
        line = str(args.group)+"\t"+str(start)+"\t"+str(end)+"\t"+str(scaffold_name)+"\t"+str(255)+"\t"+str(orientation)+"\n"
        print(line)
        k.write(str(line))
        start = end + 1
     
       
    k.close()
        
bed_file()
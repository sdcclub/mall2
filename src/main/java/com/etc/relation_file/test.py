# -*- coding: utf-8 -*-
"""
Created on Tue Jul 16 16:06:20 2019

@author: Administrator
"""

import pandas as pd
from collections import defaultdict
import sys
import numpy as np
from operator import itemgetter


data = pd.read_csv('test.csv',header=0)

data["Favorable"]=data["gid"]>0
'''print(data)'''
favorable_goods_by_users=dict((k,frozenset(v.values))for k,v in data.groupby("onumber")["gid"])
print(favorable_goods_by_users)
s=set(data['onumber'])
L=len(s)
print(L)
num_favorable_by_goods=data[["gid","Favorable"]].groupby("gid").sum()
print(num_favorable_by_goods)
frequent_itemsets={}#频繁项集的字典
min_support=50#最小支持度
frequent_itemsets[1]=dict((frozenset((gid,)),row["Favorable"])for gid,row in num_favorable_by_goods.iterrows() if ((row["Favorable"]/L*100)>min_support))#包含一个元素的平凡项集
print(frequent_itemsets)
d=dict()
def find_frequent_itemsets(favorable_goods_by_users,k_i_itemsets,min_support):#在前一个频繁项集的基础上使频繁项集包含的元素个数加一
    counts=defaultdict(int)#计数字典
    
    for onumber,goods in favorable_goods_by_users.items():#遍历每一个订单物品      
        for itemset in k_i_itemsets:#遍历上一个频繁项集       
            if itemset.issubset(goods):#如果频繁项集中的一个集合是这个订单物品的子集        
                for other_reviewed_movie in goods-itemset:#把这个订单其他物品单个遍历
                    current_superset=itemset|frozenset((other_reviewed_movie,))#与前一个频繁项集进行合并，生成新的频繁项集
                    counts[current_superset]+=1#该个频繁项集计数加一
    return dict([(itemset,frequency)for itemset,frequency in counts.items() if ((frequency/L*100) >= min_support)])#返回新的频繁项集

for k in range(2,20):#生成含2-20个元素的频繁项集
    cur_frequent_itemsets=find_frequent_itemsets(favorable_goods_by_users,frequent_itemsets[k-1],min_support)
    frequent_itemsets[k]=cur_frequent_itemsets
    '''print(cur_frequent_itemsets)'''
    if len(cur_frequent_itemsets)==0:
        print("Did not find any frequent itemsets of length{}".format(k))
        sys.stdout.flush()#这个是确保代码还在运行时，把缓冲区内容输出到终端
    else:
        print("I found {} frequent itemsets of length {}".format(len(cur_frequent_itemsets),k))
        sys.stdout.flush()
del frequent_itemsets[1]#删除只含一个元素的频繁项集'''

candidate_rules=[]
k='\t'
for itemset_length,itemset_counts in frequent_itemsets.items():
    for itemset in itemset_counts.keys():
        for conclusion in itemset:
            premise=itemset-set((conclusion,))
            candidate_rules.append((premise,conclusion))
'''print(candidate_rules)'''
correct_counts=defaultdict(int)
incorrect_counts=defaultdict(int)
for order,goods in favorable_goods_by_users.items():
    for candidate_rule in candidate_rules:
        premise,conclusion=candidate_rule
        if premise.issubset(goods):
            if conclusion in goods:
                correct_counts[candidate_rule]+=1
            else:
                incorrect_counts[candidate_rule]+=1
rule_confidence={candidate_rule:correct_counts[candidate_rule]/float(correct_counts[candidate_rule]+incorrect_counts[candidate_rule])for candidate_rule in candidate_rules}
sorted_confidence=sorted(rule_confidence.items(),key=itemgetter(1),reverse=True)#按置信度排序
jg=open(r'result.txt','w')#输出到txt
for index in range(len(candidate_rules)):
    (premise,conclusion)=sorted_confidence[index][0]
    if rule_confidence[(premise,conclusion)]>0.8:
        print("#Rule #{}".format(index+1))
        print("Rule:If a person recommends{},they will also recommend {}".format(premise,conclusion))

        jg.write('{')
        n=1
        for i in premise:
            jg.write(str(i))
            if n<len(premise):
                jg.write(',')
                n+=1
        jg.write('}')
        jg.write(str(conclusion)+'\n')
        
        print("- Confidence:{0:.3f}".format(rule_confidence[(premise,conclusion)]))

    print('\n')
jg.close()
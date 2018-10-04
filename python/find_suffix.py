#!/bin/python3

import os
import sys


def findSuffix(collections, queryString):
    #
    # Write your code here.
    #



    return ""

if __name__ == '__main__':

    strings_count = int(input())
    strings = []
    for _ in range(strings_count):
        strings_item = input()
        strings.append(strings_item)

    q = int(input())
    for q_itr in range(q):
        queryString = input()
        res = findSuffix(strings, queryString)

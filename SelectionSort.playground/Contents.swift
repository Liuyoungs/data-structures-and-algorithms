//: Playground - noun: a place where people can play

import UIKit

func sortHelper() -> [Int] {
    var unsortedArray: [Int] = []
//    生成100以内的随机数数组
    for _ in 0 ..< 100 {
        unsortedArray.append(Int(arc4random_uniform(100)))
    }
    return unsortedArray
}

//选择排序

func selectionSort<T: Comparable>(arr: inout [T]) {
    
    var minIndex = 0
    
//    遍历外层所有元素
    for i in 0 ..< arr.count {
        minIndex = i

        for j in (i+1) ..< arr.count {
            if arr[j] < arr[minIndex] {
                minIndex = j
            }
        }
        
        if i != minIndex {
            arr.swapAt(i, minIndex)
        }
    }
    
}

var chars = ["b", "a", "f", "e", "d", "c", "b"]
var nums = sortHelper()

selectionSort(arr: &nums)
selectionSort(arr: &chars)

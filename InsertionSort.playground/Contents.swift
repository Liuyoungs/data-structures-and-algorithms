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

var nums = sortHelper()
var chars = ["a", "c", "f", "d", "b", "a", "e","b"]

func insertionSort<T: Comparable>(arr: inout [T]) -> [T] {
    
    if arr.count == 0 || arr.count == 1 {
        return arr
    }
    
//    对于插入排序来说 第0个元素本身有序  所以从索引值为1的元素开始遍历
    for i in 1 ..< arr.count {
        var j = i
        let e: T = arr[i]
//        从第 i 个元素开始比较, j 递减, 往前比较
        while j > 0 && arr[j-1] > e{
//
            arr[j] = arr[j-1]
            j -= 1
        }
        arr[j] = e
    }
    return arr
}



print(insertionSort(arr: &nums))
print(insertionSort(arr: &chars))

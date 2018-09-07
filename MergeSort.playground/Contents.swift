//: Playground - noun: a place where people can play

import UIKit

private func testDuration(function: ()->()) {
    let start = CACurrentMediaTime()
    function()
    let end = CACurrentMediaTime()
    print("测量时间：\(end - start)")
}

private func sortHelper() -> [Int] {
    var unsortedArray: [Int] = []
    //    生成100以内的随机数数组
    for _ in 0 ..< 100 {
        unsortedArray.append(Int(arc4random_uniform(100)))
    }
    return unsortedArray
}

var nums = sortHelper()
var chars = ["a", "c", "f", "d", "b", "a", "e","b"]

// 归并排序的时间复杂度是 nlogn
// 归并排序在针对近乎有序的数组进行排序时 性能会下降

func mergeSort<T: Comparable>(_ arr: [T]) -> [T] {
    guard arr.count > 1 else {
        return arr
    }
    
    let mid = arr.count/2
    let left = mergeSort(Array(arr[0..<mid]))
    let right = mergeSort(Array(arr[mid..<arr.count]))

    return mergeSort(left: left, right: right)
}

private func mergeSort<T: Comparable>(left: [T], right: [T]) -> [T] {
    var leftIdx = 0
    var rightIdx = 0
    var ordered = [T]()
    
    while leftIdx < left.count && rightIdx < right.count {
        if left[leftIdx] < right[rightIdx] {
            ordered.append(left[leftIdx])
            leftIdx += 1
        }else if left[leftIdx] > right[rightIdx]{
            ordered.append(right[rightIdx])
            rightIdx += 1
        }else{
            ordered.append(left[leftIdx])
            leftIdx += 1
            ordered.append(right[rightIdx])
            rightIdx += 1
        }
    }
    
    while leftIdx < left.count {
        ordered.append(left[leftIdx])
        leftIdx += 1
    }
    
    while rightIdx < right.count {
        ordered.append(right[rightIdx])
        rightIdx += 1
    }
    return ordered
}

mergeSort(nums)
mergeSort(chars)

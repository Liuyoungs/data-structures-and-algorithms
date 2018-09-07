//: Playground - noun: a place where people can play

import UIKit

private func testDuration(function: ()->()) {
    let start = CACurrentMediaTime()
    function()
    let end = CACurrentMediaTime()
    print("测量时间：\(end - start)")
}

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
// MARK:- 对插入排序进行优化 先使用一个中间常量 e ,将索引为 i 的值赋给它, 再进行二层循环的条件判断 如果符合交换条件那么就将索引为 j-1 的值赋值给索引为 j
func opInsertionSort<T: Comparable>(arr: inout [T]) -> [T]{
    
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

// MARK:- 优化前的插入排序
func insertionSort<T: Comparable>(arr: inout [T]) -> [T]{
    
    if arr.count == 0 || arr.count == 1 {
        return arr
    }
    //    对于插入排序来说 第0个元素本身有序  所以从索引值为1的元素开始遍历
    for i in 1 ..< arr.count {
        var j = i
        //        从第 i 个元素开始比较, j 递减, 往前比较
        while j > 0 && arr[j-1] > arr[j]{
            //
            arr.swapAt(j, j-1)
            j -= 1
        }
    }
    return arr
}

testDuration {
    print("优化之前:\(insertionSort(arr: &nums))")
}
testDuration {
    print("优化之后:\(opInsertionSort(arr: &nums))")
}
testDuration {
    print("优化之前:\(insertionSort(arr: &chars))")
}
testDuration {
    print("优化之后:\(opInsertionSort(arr: &chars))")
}

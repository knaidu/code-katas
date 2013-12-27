---
layout: post
title: Binary Search
---

## Problem

Given an array of integers, implement binary search. Assume the input array is sorted.

## Example

Input: Array: [1,2,3,4,5], Key: 5

Output: 4 (position of element 5 in the array)

## Algorithm

1. Compare with the middle element of the array, if it matches return middle position as the result.
2. If the element is smaller than the middle element recuse on the left side of the array
3. If the element is larger than the middle element recurse on the right side of the array.

## Code
{% highlight ruby %}

{% include code/searching/binary_search.rb %}

{% endhighlight %}

## Tests
{% highlight ruby %}

{% include code/searching/binary_search_spec.rb %}

{% endhighlight %}

## Time complexity

O(log n)

We are eliminating half the array at every iteration, hence log n.
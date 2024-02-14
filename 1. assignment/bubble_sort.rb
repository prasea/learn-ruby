def bubble_sort(numbers)
  for i in 0...numbers.length 
    for j in 1...numbers.length-i
      if numbers[j] < numbers[j-1]
        # temp = numbers[j]
        # numbers[j] = numbers[j-1]
        # numbers[j-1] = temp
        numbers[j], numbers[j-1] = numbers[j-1], numbers[j]
      end
    end
  end 
  return numbers
end
print bubble_sort([4,3,78,2,0,2])

def swap(a, b)
  b,a = a, b
  return a, b
end
print swap(2,5)
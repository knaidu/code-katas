---
layout: post
---

{% include table-of-contents.html %}

## 3. Linked Lists

A linked list is a linear data structure that is made up of objects connected to one another by pointers. Another linear data structure we looked earlier was a array.

### Differences Between Array and Linked Lists

### Implementing Singly Linked List

#### Linked List Class and Node Class

`SinglyLinkedList` class and `Node` class is used to create instances of the lists and nodes. `attr_accessor` method creates setter and getter method for attributes of `SinglyLinkedList` class and `Node` class. `SinglyLinkedList` class has three attributes, *head*, *tail*, and *count*. `Node` class has two attributes, *data*, and *next*.

##### SinglyLinkedList Class Attributes

- head: a node that points to the starting node of the linked list
- tail: a node that points to the ending node of the linked list
- count: number of nodes in the linked list

##### Node Class Attributes

- data: contains the value of the node
- next: pointer that is used to point to the location of the next node

`initialize` method for `SinglyLinkedList` initializes head, tail and count attributes. Head node and tail node for the linked list are created. Head node points to tail node by setting the next pointer to the tail node. Tail node points to head node by setting the next pointer to the head node, since there are no other nodes in the list.

##### Code

    class SinglyLinkedList
      attr_accessor :head, :tail, :count
  
      def initialize
        @head = Node.new(nil)
        @tail = Node.new(nil)
    
        @head.next = @tail
        @tail.next = @head
        @count = 1
      end
    end

    class Node
      attr_accessor :data, :next
  
      def initialize(data)
        @data = data
      end
    end

#### Instantiation of the Linked List and the Node

We have `initialize` methods ready. We can instiate the list and the node using `new` method.

##### Code

    class SinglyLinkedList
      attr_accessor :head, :tail, :count
      
      def initialize
        @head = Node.new(nil)
        @tail = Node.new(nil)
        
        @head.next = @tail
        @tail.next = @head
        @count = 1
      end
    end
    
    class Node
      attr_accessor :data, :next
      
      def initialize(data)
        @data = data
      end
    end
    
    list = SinglyLinkedList.new
    node = Node.new(1)

If you run the code, nothing interesting appears on the console. Well, let's change that.

##### Code

    list = SinglyLinkedList.new
    node = Node.new(1)

    puts list    # => #<SinglyLinkedList:0x007fa96304cd38>
    puts node    # => #<Node:0x007fa96304cab8>
    puts node.data    # => 1

#### Inserting Nodes into the Linked List

We will create a method that will instantiate a node and insert it into a linked list at the beginning and at the end. 

##### Code

    class SinglyLinkedList
      ...
  
      def insert_front(data)
        @node = Node.new(data)
        @node.next = @head.next
        @head.next = @node
        if @count < 1
          @tail.next = @node
        end
        @count += 1
      end
  
      def insert_back(data)
        @node = Node.new(data)
        @node.next = @tail
        @tail.next.next = @node
        @tail.next = @node
        @count += 1
      end
    end

##### `insert_front` method

`insert_front` method takes `data` as an argument and creates a node with that `data`, which is inserted at the beginning of the linked list.

1. Instantiate a new node with data
2. The new node's next pointer points to the node where head node points to.
3. Head node's next pointer is updated to point to the newly created node.
4. If there is no node in the linked list, tail node's next pointer should set to the new node.
5. Increment count by 1, since a new node has been created.

##### `insert_back` method

`insert_back` method takes `data` as an argument and creates a node with that `data` just like `insert_front` method. However, unlike `insert_front`, `insert_back` method pushes the node at the back of the linked list.

1. Instantiate a new node with data
2. The new node's next pointer points to the tail node.
3. The previous ending node's (the node that the tail node currently points to) next pointer now is set to the new node. The new node is now the ending node.
4. The tail node now points to the new node.
5. Increment count by 1.

##### Adding Some Nodes in the List

Previously we created a linked list named `list`. We can add nodes into this `list` by applying `insert_front` and `insert_back` methods.

##### Code

    list.insert_front(1)
    list.insert_back(2)
    list.insert_front(3)
    list.insert_back(4)

#### Accessing Attributes of the Linked List

Previously we discussed that the linked list class has `head`, `tail` and `count` attributes. You can access these attributes by using accessor methods created with `attr_accessor` method.

##### Code

    list.count
    list.head
    list.tail

Let's print what the accessors return.

##### Code
    puts list.count
    puts list.tail
    puts list.head

    # console output
    4
    #<Node:0x007fef7a083d30>
    #<Node:0x007fef7a083d58>

We have 4 nodes in the linked list, and returns head and tail nodes of the linked list. And finally, you can print the values of first node and the last node.

##### Code

    puts list.head.next.data
    puts list.tail.next.data

    # console output
    3
    4

#### Linked List to Array

Arrays are a type of a list. Linked lists are also a type of a list. It only makes sense that we write a method that converts a listed list into an array.

##### Code

    class SinglyLinkedList
      ...
    
      def to_array
        array = []
        cursor = @head.next
        while cursor != @tail
          array << cursor.data
          cursor = cursor.next
        end
        array
      end
    end

##### `to_array` method

1. Create an array.
2. `cursor` is a pointer. It start from the beginning node.
3. The while loop runs until the `cursor` pointer hits the tail node.
4. Push the data of the current node that `cursor` points to.
5. By the end of the while loop, the array will have all the nodes' data.
6. Return the array.

#### Printing Linked List

We've created a linked list and we can add nodes into it, but we don't have a good way to visualize the result yet. Let us create a method that prints the list.

##### Code

    class SinglyLinkedList
      ...
      
      def print_forward
        puts self.to_array.to_s
      end
      
      def print_reverse
        puts self.to_array.reverse.to_s
      end
    end
    
    ...
    
    list.print_forward
    list.print_reverse   

    # console output
    [3, 1, 2, 4]
    [4, 2, 1, 3]

#### Does This Node Exist in the Linked List?

Say you want to find out if a node exists in the linked list or not. `exist?` is the just the method you are looking for.

##### Code

    class SinglyLinkedList      
      ...
      
      def exist?(data)
        cursor = @head.next
        while cursor != @tail
          if cursor.data == data
            return true
          end
          cursor = cursor.next
        end
        false
      end
    end

    puts list.exist?(4)
    puts list.exist?(5)
    
    # console output
    true
    false

##### `exist?` method

1. `cursor` is a pointer. It start from the beginning node.
2. The while loop runs until the `cursor` pointer hits the tail node.
3. The while loop will end before it reaches the tail node, if the node we are looking for is found. If that is the case, we return true.
4. If the `cursor` pointer reaches the end, the node doesn't exist in the linked list. So we return false.

#### Deleting Node

We should be able to delete nodes in a linked list just as we can add nodes in linked list.

##### Code

    class SinglyLinkedList
      ...
      
      def delete!(data)
        first = @head
        second = @head.next
        while second != @tail
          if second.data == data
            @count -= 1
            first.next = second.next
            return true
          end
          first = first.next
          second = second.next
        end
        false
      end
    end

    puts list.delete!(5)
    puts list.delete!(4)
    list.print_forward

    # console output    
    false
    true
    [3, 1, 2]

##### `delete!` method

1. `data` is taken as an argument for the method
2. We need two pointers. `first` pointer starts at `head` node. `second` pointer starts at the beginning node.
3. The while loop runs until the `second` pointer hits the tail node.
4. As we interate through all the nodes in the linked list, we compare the node data that `second` pointer points to with the `data` argument. If the node data of `second` pointer points to is equal to the `data` argument, then we've found the node to delete.
5. Decrement `count` attribute of the linked list.
6. The node that `first` pointer points to should have `next` set to the node that comes after where the `second` node currently points to.
7. Then return true and terminate the method.
8. If the node is not found in the linked list, return false.

---
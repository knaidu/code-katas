---
layout: post
---

{% include table-of-contents.html %}

## 2. Introduction to Ruby

This is a very brief introduction to Ruby programming language. While this section is sufficient for following tutorials in the book, it is in no way a complete guide to Ruby. Keep in mind throughout this section that the introduction obmits a large chunk of Ruby. Also some new Ruby syntaxes will be introduced in future sections which are not covered in this section.

### Hello World!

#### Interactive Ruby Shell (IRB)

Interactive Ruby Shell, more commonly known as IRB is a great tool to run concise Ruby scripts. In order to fire up IRB, open your terminal and type `irb`. You should see `1.9.3p194 :001 >` in your terminal. In IRB, type Code 2.1 and press enter.

##### Code 2.1

    "Hello World!"

This should return ` => "Hello World!" `. Boom! There's your first Ruby program.
### Variables

#### Local Variables

These are all valid local variables.

##### Code 2.1

    foobar
    foobar2
    this_is_a_variable
    _this_is_fine_too

Local variables begin with a lowercase letter (a-z) or underscore(_). It can end with either lowercase letter or number (0-9).

Local variables are accessible within the block it was initialized in.

#### Instance Variables

Instance variables belongs to the class itself. It begins with `@`

##### Code 2.2

    @foobar
    @foo_bar

### Built-in Data Types

Ruby has several built-in ways to represent data. Using these basic building blocks to represent data, you can build more complex data structures such as lists and trees later.

#### String

String objects represent text characters by storing sequences of bytes. String objects are instantiated simply using single quotes, `'` or double quotes, `"`.

##### Code

    "string value"
    'this is also a string value'
    
You can also insert a variable into a string, and Ruby compiler will attempt to convert the variable's type to string type. This is done by inserting variable in `#{variable_name}`.

##### Code
    
    x = "Kurt"
    "#{x} Cobain played for Nirvana." # => "Kurt Cobain played for Nirvana."

You can also embed ruby code within `#{}`.

##### Code

    "3*3 is equal to #{3*3}." # => "3*3 is equal to 9."

#### Integer

Ruby represents integer simply by writing a sequence of numbers.

##### Code

    12345     # => 12345
    1         # => 1
    1_000_000 # => 1000000

#### Float

There are several ways to write rational numbers in Ruby.

##### Code
    
    1.0         # => 1.0
    3.14        # => 3.14
    1e12        # => 1000000000000.0 

#### Array

Arrays store a list of values with unique positions, *index*. Arrays are instantiated using square brackets, `[]` and values are separated by commas, `,`. Accessing values in arrays are done by indicating the index of the value you'd like to access.

##### Code

    [1]                            # => [1]
    [1, 2, 3]                      # => [1, 2, 3]
    ["one", "two", "three"]        # => ["one", "two", "three"]
    g = [5, 6, 7]                  # => [5, 6, 7]
    g[0]                           # => 5
    g[2]                           # => 7
    g[3]                           # => nil

Nested arrays are arrays that have other arrays as values.

##### Code

    n = [[3, 4], [5, 6, 7], [8, 9, 10, 11]]
    n[0]                                         # => [3, 4]
    n[2]                                         # => [8, 9, 10, 11]
    n[2][3]                                      # => 11
     
Assigning new values into an array is done by indicating the index of the new value and assigning the new value into the index of the array.

##### Code

    inception = ["level 1", "level 2", "level 3"]
    inception[3] = "limbo"
    inception     # => ["level 1", "level 2", "level 3", "limbo"]

You can overwrite a value in array as well.

##### Code

    g = [5, 6, 7]
    g[0] = "zero"
    g                # => ["zero", 6, 7]
    
You can concatenate two arrays with `+`.

##### Code

    [3, 4] + [5, 6, 7]     # => [3, 4, 5, 6, 7]

#### Hash

Hash is like a dictionary. A dictionary has a respective meaning of a word for every word entry. Similarly, a hash has a *value* for every *key*. Instantiating a hash is doen with squiggly brackets, `{}`.

##### Code

    h = {}
    h["Vancouver"] = "British Columbia"
    h["Toronto"] = "Ontario"
    h["Montreal"] = "Quebec"
    h                # => {"Vancouver"=>"British Columbia", "Toronto"=>"Ontario", "Montreal"=>"Quebec"}
    h["Montreal"]    # => "Quebec"
    
You can assign an array as a value for a key.

##### Code

    starcraft = {}
    starcraft["Terran"] = ["Marine", "Medic", "SCV"]
    starcraft["Zerg"] = ["Zergling", "Hydrarisk", "Drone"]
    starcraft["Protoss"] = ["Zealot", "Dragoon", "Probe"]
    starcraft    # =>  => {"Terran"=>["Marine", "Medic", "SCV"], "Zerg"=>["Zergling", "Hydrarisk", "Drone"], "Protoss"=>["Zealot", "Dragoon", "Probe"]} 

You can assign multiple key-value pairs at the same time.

##### Code

    stars = {"Pablo Honey" => 4, "The Bends" => 4.5, "OK Computer" => 5}

Since Ruby 1.9, you can also use `:` to replace `=>`.

##### Code

    more_stars = {"Kid A": 5, "Amnesiac": 4, "Hail to the Cheif": 4, "In Rainbows": 3}

#### Symbol

Symbols are like string substitutes with some different properties. They often used in Ruby to avoid computationally expensive string comparisons. Symbols start with `:` followed by some symbol name

If you have a code where you are using strings as identifiers for something, consider using symbols instead. For example, if you have two strings, `"male"` and `"female"` as identifier for a person's gender, use `:male` and `:female` to identify a person's gender instead.

You can covert from string to symbol and symbol to string easily using `to_sym` method and `to_s` method.

##### Code

"string_to_symbol".to_sym        # => :string_to_symbol
"string to symbol".to_sym        # => :"string to symbol"
:symbol_to_string.to_s           # => "symbol_to_string" 

#### Boolean

There are only two Boolean values, `true` and `false`. `nil` in Ruby indicates an absence of value. In other programming languages such as JavaScript, `null` is the comparable keyword to `nil` in Ruby. 

#### Range

Range object has a start value, an ending value and a list of values in between. Range starts with a start value, followed by `..` or `...`, and an ending value.

##### Code
    
    (1..5)  # includes the ending value, 5
    (1...5) # does not include the ending value, 5  

You can use range object on alphabets as well, which makes printing alphabets super easy.

##### Code

    ("a".."z").each {|x| print x }    # prints abcdefghijklmnopqrstuvwxyz

You can even do that with alphabets of other languages. Here is a list of Korean vowel alphabets.

##### Code
    
    ("ㅏ".."ㅣ").each {|x| print x}  # prints ㅏㅐㅑㅒㅓㅔㅕㅖㅗㅘㅙㅚㅛㅜㅝㅞㅟㅠㅡㅢㅣ

### Methods

Methods usually define particular behaviours of a class in Ruby. But unlike some other languages such as Java and C#, Ruby method doesn't have to be written for a class. A Ruby method may not belong to any class at all. Return types for a method is not explicitly defined either.

##### Code 2.3

    def square(number)
      number*number
    end

Code 2.3 shows a method named `square` and it takes an argument called `number`. The `square` method multiplies `number` value with another `number` value and returns the multications as the result.

In order to call a method, invoke the name of the method with appropriate argument.

##### Code 2.4
    
    square(4)

Notice that Ruby method does not require explicit `return` keyword. If you are not terminating the method prematurely, use of `return` is discouraged. Code 2.4 shows a method that uses `return` keyword.
##### Code 2.5

    def largest_prime_number_below(number)
      number.downto(2).each do |count_down|
          if is_prime?(count_down)
            return count_down
          end
      end
      false
    end
    
    def is_prime?(count_down)
      2.upto(count_down/2).each do |count_up|
          if count_down%count_up == 0
            return false
          end
      end
      true
    end

`largest_prime_number_below` method takes an argument called `number`, and browse down each number from `number` to 2, which is the smallest prime number. While we go down through each number, `count_down`, we divide the number up with numbers between 2 to half of `count_down` and check for its remainder. If the remainder is 0, we terminate `is_prime?` method by *returning* false. Eitherwise, the block runs up to the half of `count_down` and implicitly returns true. When `is_prime?` for a `count_down` number is true, `largest_prime_number_below` returns the `count_down` number and terminates the method.

Method names are written in lower case letters. Method names may contain numbers and underscore. Method names may also end with an exclamation mark `!` or a question mark `?`.

By convention, a method name ending with `!` denotes that it is a *mutator*. It is a method that changes the argument the method takes. It should be used with caution. A method name ending with `?` denotes that the method returns boolean value of true or false.

#### Iterators

Ruby programmers don't use `while` loops that often. `for` loops are used even less often. This is because Ruby has a wide array of *iterator* methods, you can use on arrays and hash tables. 

Here are some common methods you can apply on collections to get you started.

1. `each` - executes block and returns the list of objects without mutating

    prints 246810 and returns [1, 2, 3, 4, 5]
    
    `[1, 2, 3, 4, 5].each {|x| print x*2}`
    
    prints artists' name and their nationality and returns the hash itself
    
    `{"Justin Bieber" => "Canadian", "Psy" => "Korean", "Nicki Minaj" => "American"}.each {|key, value| puts "#{key}: #{value}" }`

2. `map` - executes block and returns the list of mutated objects

    returns [2, 4, 6, 8, 10]

    `[1, 2, 3, 4, 5].map {|x| x*2}`

3. `select` - returns a list of objects when condition is true
    
    returns [2]

    `[1, 2, 3, 4, 5].select {|x| x==2}`

4. `reject` - returns a list of objects when condition is false

    returns [1, 3, 4, 5]
    
    `[1, 2, 3, 4, 5].reject {|x| x==2}`

5. `uniq` - returns a list without duplicates

    returns [1, 2, 3, 4] 
    
    `[1, 2, 3, 3, 3, 4].uniq`

6. `reverse` - reverse the list

    returns [4, 3, 2, 1]

    `[1, 2, 3, 4].reverse`

7. `compact` - return all non-nil objects

    returns [1, 2, 3, 4]

    `[1, 2, 3, nil, nil, 4].compact`

8. `flatten` - flatten inner arrays

    returns [3, 2, 4, 4] 
    
    `[[3,2], [4,4]].flatten`

9. `partition` - Create two collections. First collection for true, second for false.

    returns  [[4, 5], [1, 6]]

    `[1, 4, 5, 6].partition {|x| x==4 || x==5}`

9. `sort` without argument - Sorts the list

    returns [1, 3, 11, 23, 31, 34]

    `[31, 34, 11, 23, 1, 3].sort`

### Classes and Objects

Ruby is an object orient language. Every value in Ruby is an instance of some class. 

#### Attributes

#### Class Methods and Instance Methods

---
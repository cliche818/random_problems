# Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

# push(x) -- Push element x onto stack.
# pop() -- Removes the element on top of the stack.
# top() -- Get the top element.
# getMin() -- Retrieve the minimum element in the stack in constant time.

# Example : 

# minStack = MinStack.new;
# minStack.push(0);
# minStack.push(1);
# minStack.push(2);
# minStack.getMin();   --> Returns 0.
# minStack.pop();
# minStack.top();      --> Returns 1.
# minStack.getMin();   --> Returns 0.

class Stack
    attr_reader :array
    
    def initialize
        @array = []
        @min_history = []
    end    

    def push(value)
        @array.push(value)
        if @min_history.empty? || @min_history[-1] > value
            @min_history.push(value)
        end    
    end

    def pop
        value = @array.pop

        if @min_history[-1] == value
            @min_history.pop
        end    
    end
    
    def top
        @array[-1]
    end
    
    def get_min
        @min_history[-1]    
    end    
end   
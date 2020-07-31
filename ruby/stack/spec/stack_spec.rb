require 'stack'

RSpec.describe Stack do
    describe "#push" do
        it 'should add 2 elements to the array' do
            stack = Stack.new
            stack.push(1)
            stack.push(2)
            expect(stack.array).to eq([1,2])
        end
    end

    describe "#pop" do
        it 'should take the top element' do
            stack = Stack.new
            stack.push(1)
            stack.push(2)
            stack.pop
            expect(stack.array).to eq([1])
        end
    end

    describe "#top" do
        it 'should return the top element on the stack' do
            stack = Stack.new
            stack.push(1)
            stack.push(2)
            expect(stack.top).to eq(2)
        end
    end

    describe "#get_min" do
        it 'should return the min element on the stack' do
            stack = Stack.new
            stack.push(1)
            stack.push(2)
            stack.push(3)
            expect(stack.get_min).to eq(1)
        end

        it 'should return nil if there is an empty stack' do
            stack = Stack.new
            expect(stack.get_min).to eq(nil)
        end

        it 'should handle pop of min element on the stack' do
            stack = Stack.new
            stack.push(3)
            stack.push(2)
            stack.push(1)
            stack.pop
            expect(stack.get_min).to eq(2)
        end
    end

    describe 'overall test' do
        it 'should work as the instructions stated' do
            stack = Stack.new
            stack.push(0)
            stack.push(1)
            stack.push(2)
            expect(stack.get_min).to eq(0)
            stack.pop
            expect(stack.top).to eq(1)
            expect(stack.get_min).to eq(0)
        end
    end
end
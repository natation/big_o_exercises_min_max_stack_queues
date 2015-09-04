class MyStack
  def initialize
    @store = []
  end

  def push(el)
    @store.push(el)
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end
end

class Queue
  def initialize
    @input = MyStack.new
    @output = MyStack.new
  end

  def enqueue(el)
    @input.push(el)
  end

  def dequeue
    if @output.size == 0
      @input.size.times { @output.push(@input.pop) }
    end
    @output.pop
  end

  def peek
    if @output.size == 0
      @input.size.times { @output.push(@input.pop) }
    end
    @output.peek
  end

  def size
    @input.size + @output.size
  end
end

class MyStack

  def initialize
    @store = []
    @max = []
    @min = []
  end

  def push(el)
    store_max(el)
    store_min(el)
    @store.push(el)
  end

  def pop
    @max.pop
    @min.pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def max
    @max.last
  end

  def min
    @min.last
  end

  private
  def store_max(el)
    if @max.empty?
      @max.push(el)
    else
      el > @max.last ? @max.push(el) : @max.push(@max.last)
    end
  end

  def store_min(el)
    if @min.empty?
      @min.push(el)
    else
      el < @min.last ? @min.push(el) : @min.push(@min.last)
    end
  end
end

class MinMaxStackQueue
  attr_reader :max, :min
  def initialize
    @input = MyStack.new
    @output = MyStack.new
    @max = []
    @min = []
  end

  def enqueue(el)
    store_max(el)
    store_min(el)
    @input.push(el)
  end

  def dequeue
    if @output.size == 0
      @input.size.times { @output.push(@input.pop) }
    end
    el = @output.pop
    store_max(peek)
    store_min(peek)
    el
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

  private
  def store_max(el)
    if el
      in_max = @input.max
      out_max = @output.max
      cur_max = el
      if in_max
        cur_max = in_max > cur_max ? in_max : cur_max
      end
      if out_max
        cur_max = out_max > cur_max ? out_max : cur_max
      end
      @max = cur_max
    else
      @max = nil
    end
  end

  def store_min(el)
    if el
      in_min = @input.min
      out_min = @output.min
      cur_min = el
      if in_min
        cur_min = in_min < cur_min ? in_min : cur_min
      end
      if out_min
        cur_min = out_min < cur_min ? out_min : cur_min
      end
      @min = cur_min
    else
      @min = nil
    end
  end
end

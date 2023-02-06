require_relative 'p04_linked_list'

class HashMap
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    if @count == num_buckets
      resize!
    end
    unless bucket(key).include?(key)
      bucket(key).append(key, val)
      @count += 1
    end
  end

  def get(key)
    bucket(key).each do |node|
      if node.key == key
        return node
      end
    end
  end

  def delete(key)

  end

  def each
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2){LinkedList.new}
    @store.each do |linked_list|
      linked_list.each do |node|
        new_store[node.key.hash % (num_buckets * 2)].append(node.key,node.val)
      end
    end
    @store = new_store
  end

  def bucket(key)
    @store[key.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `key`
  end
end

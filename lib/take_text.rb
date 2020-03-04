require "take_text/version"
require 'stringio'

module TakeText
  class Error < StandardError; end
  # Your code goes here...

  def TakeText.take(string, max_bytes)
    io = StringIO.new(string)
    head = io.gets(nil, max_bytes)
    tail = io.gets
    if head.bytesize > max_bytes
      # there is one extra character
      tail = head[-1] + tail
      head = head[...-1]
    end
    return head, tail
  end

  def TakeText.each_slice(string, max_bytes)
    io = StringIO.new(string)
    extra = ''
    while c = io.gets(nil, max_bytes - extra.bytesize)
      head = extra + c
      extra = ''
      if head.bytesize > max_bytes
        # there is one extra character
        extra = head[-1]
        head = head[...-1]
      end
      yield head
    end
    yield extra unless extra.empty?
  end
end

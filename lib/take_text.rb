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
end

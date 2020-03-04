RSpec.describe TakeText do
  it "has a version number" do
    expect(TakeText::VERSION).not_to be nil
  end

  it "takes valid text" do
    head = '本日は'.encode('utf-8')
    tail = '晴天なり'.encode('utf-8')
    str = head + tail
    max_bytes = 10
    expect(head.bytesize <= max_bytes)
    expect(TakeText.take(str, max_bytes)).to eq([head, tail])
  end

  it "leaves a nil" do
    str = '本日は'.encode('utf-8')
    max_bytes = 9
    expect(TakeText.take(str, max_bytes)).to eq([str, nil])
  end
end

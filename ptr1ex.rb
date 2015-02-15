class Label
  attr_accessor :text
end

a = Label.new
a.text = "Sonia"

b = Label.new
b.text = "Rafal has high expectations"

print a.text, "\n"
print b.text, "\n"

a = b
print a.text, "\n"

b = Label.new
b.text = "I am not as smart as he thinks"

print a.text, "\n"

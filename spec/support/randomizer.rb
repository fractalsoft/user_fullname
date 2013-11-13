# encoding: utf-8
def rand_text(size = 5)
  ('a'..'z').to_a.sample(size).join
end

def rand_name
  rand_text.capitalize
end

def rand_fullname
  "#{rand_name} #{rand_name}"
end

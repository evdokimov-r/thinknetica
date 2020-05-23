alphabet = ('a'..'z').to_a

vowel = ['a', 'e', 'i', 'o', 'u', 'y']

procedure = {}

alphabet.each_with_index { |v, index| procedure[v] = (index + 1) if vowel.include? v}

print procedure
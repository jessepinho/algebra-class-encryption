# Take the alphabet, turn it into an array (a.k.a., a list), and then reverse
# it.

def reverse_alphabet
  ('a'..'z').to_a.reverse
end

# Turn all the characters in the text into an array (list) of single
# characters. Then, map each character in the list to the encrypted version of
# itself by calling "encrypt_character" on it. At the end, join the whole list
# of newly encrypted characters back together so that it is text again (instead
# of just an array of characters).

def encrypt(text)
  text.each_char.map { |character|
    encrypt_character(character)
  }.join('')
end

# If the character is a space, just return a space. Otherwise, find the number
# in the reverse alphabet that corresponds to this character. We do this using
# "find_index," which tells us which number the character is in the
# reverse_alphabet array. We add 1 to this number, though, because the computer
# considers the first character in reverse_alphabet to be at position "0," not
# "1," and the second character to be at position "1," not "2," and so on.

# Finally, at the end, we turn the number into a string (a.k.a., text) using
# the "to_s" (short for "to string") method, and we right-justify using the
# "rjust" method. We want it to be 2 characters long with a zero before it if
# it's not already that long. This makes "1" turn into "01," but it leaves "15"
# as-is.

def encrypt_character(character)
  return character if character == ' '
  number = reverse_alphabet.find_index(character) + 1
  number.to_s.rjust(2, '0')
end

# The first line is a little weird. Basically, we're going over the text and
# scanning for *either* two characters that are digits (represented by "\d") or
# one space (represented by "\s"). We want two characters that are digits
# because each encrypted letter is a two-digit number, like 01 or 26. We get an
# array of these one- or two-character bits of text, then map each item in the
# array to the decrypted version of itself by calling "decrypt_character" on
# it. At the end, join the whole list back together so that it is text again.

def decrypt(text)
  text.scan(/\d\d|\s/).map { |character|
    decrypt_character(character)
  }.join('')
end

# If the character is a space, just return a space. Otherwise, turn the
# two-digit number into a normal integer by calling "to_i" on the number. Then,
# find the letter in reverse_alphabet that corresponds to that number. We have
# to subtract 1 from this number, though, for the same reason I described above:
# computers consider the first character in reverse_alphabet to be at position
# "0" instead of "1," and so on.

def decrypt_character(character)
  return character if character == ' '
  reverse_alphabet[character.to_i - 1]
end

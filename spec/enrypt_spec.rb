# This file contains tests to make sure the code works as expected.

require_relative '../encrypt'

describe 'encrypt_character' do

  it 'converts a letter into a number representing its position in the reversed alphabet' do
    encrypt_character('a').should == '26'
    encrypt_character('z').should == '01'
  end

  it 'encrypts a single space to a single space' do
    encrypt_character(' ').should == ' '
  end
end

describe 'encrypt' do

  it 'encrypts each character' do
    encrypt('az').should == '2601'
  end

  it 'encrypts a string with spaces correctly' do
    encrypt('this is a test').should == '07191808 1808 26 07220807'
  end
end

describe 'decrypt_character' do

  it "converts a number to a letter in the number's position in the reversed alphabet" do
    decrypt_character('26').should == 'a'
    decrypt_character('01').should == 'z'
  end

  it 'decrypts a single space to a single space' do
    decrypt_character(' ').should == ' '
  end
end

describe 'decrypt' do

  it 'decrypts each character' do
    decrypt('2601').should == 'az'
  end

  it 'decrypts a string with spaces correctly' do
    decrypt('07191808 1808 26 07220807').should == 'this is a test'
  end
end

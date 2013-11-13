# encoding: utf-8
require 'spec_helper'

# Testing class
class DummyClass
  attr_accessor :fullname

  def initialize(fullname = nil)
    @fullname = fullname
  end

  include UserFullname
end

describe DummyClass do
  context 'set' do
    let(:firstname) { rand_name }
    let(:lastname) { rand_name }
    subject { DummyClass.new(rand_fullname) }

    before do
      @firstname, @lastname = subject.firstname, subject.lastname
      @fullname = [firstname, lastname].join(' ')
    end

    its(:fullname) do
      subject.fullname = @fullname
      should eq(@fullname)
    end

    its(:fullname) do
      subject.firstname = firstname
      should eq([firstname, @lastname].join(' '))
    end

    its(:fullname) do
      subject.lastname = lastname
      should eq([@firstname, lastname].join(' '))
    end
  end

  context 'get' do
    let(:firstname) { rand_name }
    let(:lastname) { rand_name }
    let(:fullname) { [firstname, lastname].join(' ') }
    let(:shortname) { "#{firstname[0]}.#{lastname}" }
    subject { DummyClass.new(fullname) }

    # its(:fullname) { should eq(fullname) }
    its(:firstname) { should eq(firstname) }
    its(:lastname) { should eq(lastname) }
    its(:firstname) do
      subject.fullname = " #{lastname}"
      should eq('')
    end
    its(:lastname) do
      subject.fullname = "#{firstname} "
      should eq('')
    end
    its(:shortname) { should eq(shortname) }
  end
end

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

    describe '#fullname' do
      it do
        subject.fullname = @fullname
        expect(subject.fullname).to eq(@fullname)
      end
    end

    describe '#firstname' do
      it do
        subject.firstname = firstname
        expect(subject.fullname).to eq([firstname, @lastname].join(' '))
      end
    end

    describe '#lastname' do
      it do
        subject.lastname = lastname
        expect(subject.fullname).to eq([@firstname, lastname].join(' '))
      end
    end
  end

  context 'get' do
    let(:firstname) { rand_name }
    let(:lastname) { rand_name }
    let(:fullname) { [firstname, lastname].join(' ') }
    let(:shortname) { "#{firstname[0]}.#{lastname}" }
    subject { DummyClass.new(fullname) }

    describe '#fullname' do
      it { expect(subject.fullname).to eq(fullname) }
    end

    describe '#firstname' do
      it { expect(subject.firstname).to eq(firstname) }
    end

    describe '#lastname' do
      it { expect(subject.lastname).to eq(lastname) }
    end

    describe '#shortname' do
      it { expect(subject.shortname).to eq(shortname) }
    end

    describe '#firstname' do
      it do
        subject.fullname = " #{lastname}"
        expect(subject.firstname).to eq('')
      end
    end

    describe '#lastname' do
      it do
        subject.fullname = "#{firstname} "
        expect(subject.lastname).to eq('')
      end
    end
  end

  describe 'long name' do
    it 'double firstname' do
      names = 'David Lee Roth'
      subject.fullname = 'David Lee Roth'
      # subject.firstname = 'David Lee'
      # subject.lastname = 'Roth'
      expect(subject.fullname).to eq(names)
    end

    it 'double lastname' do
      names = 'Abraham Van Helsing'
      subject.fullname = names
      # subject.firstname = 'Abraham'
      # subject.lastname = 'Van Helsing'
      expect(subject.fullname).to eq(names)
    end
  end
end

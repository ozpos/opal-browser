require 'spec_helper'

describe Browser::DOM::Element::Attributes do
  html <<-HTML
    <div id="lol" class="name" for="hue"></div>
  HTML

  describe '#[]' do
    it 'gets an attribute' do
      expect($document[:lol].attributes[:id]).to eq(:lol)
    end

    it 'gets the class attribute' do
      expect($document[:lol].attributes[:class]).to eq(:name)
    end

    it 'gets the for attribute' do
      expect($document[:lol].attributes[:for]).to eq(:hue)
    end
  end

  describe '#[]' do
    it 'sets an attribute' do
      $document[:lol].attributes[:a] = :foo

      expect($document[:lol].attributes[:a]).to eq(:foo)
    end

    it 'sets the class attribute' do
      $document[:lol].attributes[:class] = :bar

      expect($document[:lol].attributes[:class]).to eq(:bar)
    end

    it 'sets the for attribute' do
      $document[:lol].attributes[:for] = :baz

      expect($document[:lol].attributes[:for]).to eq(:baz)
    end
  end

  describe '#each' do
    it 'enumerates over the attributes' do
      expect($document[:lol].attributes.to_a).to eq \
        [[:id, :lol], [:class, :name], [:for, :hue]]
    end
  end
end

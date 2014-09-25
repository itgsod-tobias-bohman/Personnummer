require 'rspec'
require_relative '../lib/personnummer'

describe Personnummer do

  before do
    @pnr = Personnummer.new(min_age: 10, max_age: 14, gender: "unknown")
    @pnr2 = Personnummer.new(min_age: 10, max_age: 10, gender: "unknown")
  end

  it 'should give us a valid year from two ages' do

    allow(Kernel).to receive(:rand).and_return(12)
    expect( @pnr.generate_year(10, 14) ).to eq 2002

  end

  it 'should give us a valid month from current month and random month' do

    allow(Kernel).to receive(:rand).and_return(10)
    expect( @pnr.generate_month ).to eq 11

  end

  it 'should decrease the year when the month is the year before' do

    allow(Kernel).to receive(:rand).and_return(12)
    expect( @pnr2.generate_month ).to eq 9
    expect( @pnr2.year ).to eq 2003

  end


end


#expect { Fight.new(@opponent1, @opponent2) }.not_to raise_error
require 'spec_helper'

describe 'cf_validator' do
  context 'with no value' do
    it 'is invalid' do
      expect(Person.new).to be_valid
    end

    it 'has no error' do
      @person = Person.new
      expect(@person.valid?).to be_truthy
      expect(@person.errors[:cf].size).to eq(0)
    end
  end

  VALID_CFS.each do |code|
    context "with the valid code #{code}" do
      it 'has no errors' do
        @person = Person.new(cf: code)
        expect(@person.valid?).to be_truthy
        expect(@person.errors[:cf].size).to eq(0)
      end
    end
  end

  INVALID_CFS.each do |code|
    context "with the invalid code #{code}" do
      before do
        @person = Person.new(cf: code)
        @person.valid?
      end

      it 'has an error' do
        expect(@person).to be_invalid
        expect(@person.errors[:cf].size).to eq(1)
      end

      it 'returns an invalid_format error' do
        expect(@person.errors[:cf]).to eq [I18n.t('activerecord.errors.codice_fiscale.invalid_format')]
      end
    end
  end
end

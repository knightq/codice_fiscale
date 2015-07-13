require 'spec_helper'

describe CodiceFiscale do
  describe '.male?' do
    MALE_CFS.each do |code|
      context "with the male fiscal code #{code}" do
        it 'must return true' do
          expect(CodiceFiscale.male?(code)).to be_truthy
        end
      end
    end

    FEMALE_CFS.each do |code|
      context "with the female fiscal code #{code}" do
        it 'must return false' do
          expect(CodiceFiscale.male?(code)).to be_falsey
        end
      end
    end
  end

  describe '.female?' do
    MALE_CFS.each do |code|
      context "with the male fiscal code #{code}" do
        it 'must return false' do
          expect(CodiceFiscale.female?(code)).to be_falsey
        end
      end
    end

    FEMALE_CFS.each do |code|
      context "with the female fiscal code #{code}" do
        it 'must return true' do
          expect(CodiceFiscale.female?(code)).to be_truthy
        end
      end
    end
  end
end

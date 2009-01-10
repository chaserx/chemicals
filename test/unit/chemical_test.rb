require 'test_helper'

class ChemicalTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Chemical.new.valid?
  end
end

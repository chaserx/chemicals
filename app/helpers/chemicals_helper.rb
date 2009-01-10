module ChemicalsHelper
  def number_of_chemicals
    chemical_count = Chemical.all.size
  end
end

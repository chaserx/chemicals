require 'test_helper'

class ChemicalsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Chemical.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Chemical.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Chemical.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to chemical_url(assigns(:chemical))
  end
  
  def test_edit
    get :edit, :id => Chemical.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Chemical.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Chemical.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Chemical.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Chemical.first
    assert_redirected_to chemical_url(assigns(:chemical))
  end
  
  def test_destroy
    chemical = Chemical.first
    delete :destroy, :id => chemical
    assert_redirected_to chemicals_url
    assert !Chemical.exists?(chemical.id)
  end
end

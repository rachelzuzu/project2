require 'rails_helper'

RSpec.describe EntriesController, :type => :controller do
  describe "DELETE destroy" do
    it "destroys the requested entry" do
      entry = build(:entry)
      expect do
        delete :destroy, {:id => entry.to_param}
      end.to change(Entry, :count).by(-1)
    end
  end

end

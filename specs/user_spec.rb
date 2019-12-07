require_relative '../models/user'

RSpec.describe User do

  describe "#valid?" do

    it "returns true if the given user is valid" do
      user = User.new
      expect(user.valid?).to be false

      user.email = "niklas.han@ontiger.media"
      user.verified = true
      user.firstname = "Niklas"
      user.lastname = "Hanft"
      user.password = "whateverbro"

      expect(user.valid?).to be true

      user.lastname = nil
      expect(user.valid?).to be false
      user.lastname = ''
      expect(user.valid?).to be false
      user.verified = nil
      expect(user.valid?).to be false
      user.firstname = nil
      expect(user.valid?).to be false
      user.firstname = ""
      expect(user.valid?).to be false
      user.password = nil
      expect(user.valid?).to be false
      user.email = nil
      expect(user.valid?).to be false
    end

    it "validates uniqueness of the email address" do

      user = User.new
      expect(user.valid?).to be false

      user.email = "niklas.han@ontiger.media"
      user.verified = true
      user.firstname = "Niklas"
      user.lastname = "Hanft"
      user.password = "whateverbro"

      expect(user.valid?).to be true
      user.save

      user = User.new
      expect(user.valid?).to be false

      user.email = "niklas.han@ontiger.media"
      user.verified = true
      user.firstname = "Niklas"
      user.lastname = "Hanft"
      user.password = "whateverbro"
      expect(user.valid?).to be false
    end


  end

end

require "rails_helper"

RSpec.describe Book, type: :model do
    subject { Book.new(name: "Harry Potter", description: "This is for live", edition: "1", quantity: "1", author: "rishisomani", user_id: "1") }

    before { subject.save }

    it 'name should be present' do
        subject.name =  nil
        expect(subject).to_not be_valid
    end
    it 'description should be not null' do
      subject.description =  nil
      expect(subject).to_not be_valid
    end
    it 'author should be present' do
      subject.author =  nil
      expect(subject).to_not be_valid
    end
    it 'edition should be present' do
      subject.edition =  nil
      expect(subject).to_not be_valid
    end
    it 'quantity should be present' do
      subject.quantity =  nil
      expect(subject).to_not be_valid
    end
    it 'user_id should be present' do
      subject.user_id =  nil
      expect(subject).to_not be_valid
    end
     
  
end
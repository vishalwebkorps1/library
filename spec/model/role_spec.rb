require "rails_helper"

RSpec.describe Role, type: :model do
  subject { Role.new(name: "admin") }

  before { subject.save}
  it 'name should be present' do
    subject.name =  nil
    expect(subject).to_not be_valid
 end
end



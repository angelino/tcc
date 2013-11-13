require_relative '../lib/user'

describe User do
  it 'should have a user id' do
    user = User.new(userid: '1234')
    user.id.should == '1234'
  end

  it 'should have a location' do
    user = User.new(location: 'nyc, new york, usa')
    user.location.should == 'nyc, new york, usa'
  end

  it 'should have an age' do
    user = User.new(age: '0')
    user.age.should == '0'
  end

  it 'should have all things' do
    data = { userid: '10', location: 'albacete, wisconsin, spain', age: '26' }
    user = User.new(data)

    user.id.should == '10'
    user.location.should == 'albacete, wisconsin, spain'
    user.age.should == '26'
  end
end

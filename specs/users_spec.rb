require_relative '../lib/users'

describe Users do
  it 'should have a filename' do
    users = Users.new('./specs/fixtures/users_sample.csv')
    users.filename.should == './specs/fixtures/users_sample.csv'
  end

  it 'should load data' do
    users = Users.new('./specs/fixtures/users_sample.csv')

    user = users.entries.last
    user.id.should == '10'
    user.location.should == 'albacete, wisconsin, spain'
    user.age.should == '26'
  end
end

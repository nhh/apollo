require 'apollo/core/job_manager'

RSpec.describe Apollo::Core::JobManager do

  it "its initialize method is private" do
    expect { Apollo::Core::JobManager.new }.to raise_error(NoMethodError)
  end

end

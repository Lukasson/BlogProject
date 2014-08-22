require "spec_helper"

require "mail"

describe Post do
  it "Notify author by email when a comment is made on a post" do 
    
    Mail.defaults do
      delivery_method :test
    end
    
    Author.send_alert("ocs.mailtest2@gmail.com", 9)
    
    # Expected outcomes from https://github.com/mikel/mail
    expect(Mail::TestMailer.deliveries.length).to eq(1)
    expect(Mail::TestMailer.deliveries.clear).to eq([])
  end
  
  
end
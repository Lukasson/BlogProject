class Author < ActiveRecord::Base
  has_many :posts
  validates :name, length: {minimum: 3}
  validates :email, format: {with: /@/, message: "email must include '@' symbol"}
  
  
  # DOES THIS MAKE MORE SENSE AS A CLASS METHOD OR INSTANCE METHOD
  def self.send_alert (email, post_id)
    mail = Mail.new do
      from     'ocs.mailtest1@gmail.com'
      to       email
      subject  'Post has been commented'
      body     "The following comment was made on post no. #{post_id}"    # File.read('body.txt')
      # add_file :filename => 'somefile.png', :content => File.read('/somefile.png')
    end
    
    mail.delivery_method :sendmail
    
    mail.deliver
  end
  
  def self.author_hash
    all_authors=Author.all     # Array of objects of Author class ( :id, :name, :email )
    author_hash={}
    all_authors.each do |obj|
      author_hash[obj.id] = obj.name
    end
    author_hash
  end
  
end
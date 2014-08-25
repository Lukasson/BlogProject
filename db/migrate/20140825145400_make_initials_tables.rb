class MakeInitialsTables < ActiveRecord::Migration
  def change
    
    create_table :posts do |p|
      p.text :content
      p.string :date
      p.integer :author_id
      p.string :title
    end
    
    create_table :authors do |a|
      a.string :name
      a.string :email
    end
    
    create_table :comments do |c|
      c.text :content
      c.string :date
      c.integer :post_id
    end
    
    create_table :tags do |t|
      t.string :description
    end
    
    create_table :posts_tags, :id => false do |p_t|
      p_t.integer :post_id
      p_t.integer :tag_id
    end
    
  end
end

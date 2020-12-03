class AddAuthDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    # columns to track the login provider
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_index :users, [:provider, :uid], unique: true

    # columns for traceable
    # add_column :users, :sign_in_count, :integer, default: 0, null: false
    # add_column :users, :current_sign_in_at, :datetime
    # add_column :users, :last_sign_in_at, :datetime
    # add_column :users, :current_sign_in_ip, :string
    # add_column :users, :last_sign_in_ip, :string
  end
end
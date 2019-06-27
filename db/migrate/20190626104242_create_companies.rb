class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :logo_url
      t.timestamps
    end

    create_table :users do |t|
      t.string :name
      t.string :email, index: :unique, null: false
      t.references :company, foreign_key: { on_delete: :cascade }, index: true
      t.integer :role, default: 0
      t.integer :status, default: 0
      t.timestamps
    end

    create_table :user_login_tokens do |t|
      t.references :user, foreign_key: { on_delete: :cascade }, index: true
      t.string :token, index: :unique
      t.timestamps
    end
  end
end

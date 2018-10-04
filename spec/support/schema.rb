ActiveRecord::Schema.define do
  self.verbose = false

  create_table(:users) do |t|
    t.string :name

    t.timestamps
  end

  create_table(:authors) do |t|
    t.string :name

    t.timestamps
  end

  create_table(:books) do |t|
    t.string :title
    t.datetime :published_on
    t.references :author

    t.timestamps
  end

  create_table(:likes) do |t|
    t.references :user
    t.references :book

    t.timestamps
  end

  # create_table(:follows) do |t|
  #   t.references :user
  #   t.references :author
  #
  #   t.timestamps
  # end
end

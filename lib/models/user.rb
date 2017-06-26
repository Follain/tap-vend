
module Models
  class User < Base
    schema do
      string :id
      string :username
      string :displayname
      string :email, nil: true
      datetime :email_verified_at
      string :account_type
      string :created_at
      string :updated_at
      datetime :deleted_at
      datetime :seen_at
      timestamps
    end

    def transform
      super.slice 'id',
        'username',
        'email',
        'account_type',
        'email_verified_at',
        'created_at',
        'updated_at',
        'deleted_at',
        'seen_at'
    end
  end
end

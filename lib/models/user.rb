
module Models
  class User < Base
    schema do
      string :id
      string :username
      string :displayname
      string :email, nil: true
      string :email_verified_at, nil: true
      string :account_type
      string :created_at
      string :updated_at
      string :deleted_at, nil: true
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

class User < ApplicationRecord
  has_secure_password
  # セキュアにハッシュ化したパスワードを、データベース内のpassword_digestという属性に保存できるようになる。
  # 仮想的な属性「password」と「password_confirmation」が使えるようになる。
  # また、存在性と値が一致するかどうかのバリテーションも追加される。
  # authenticateメソッドが使えるようになる。
  # 引数の文字列がパスワードと一致するとUserオブジェクトを、間違っているとfalseを返すメソッド。
  validates :name, presence: true, length: { maximum: 15}
  validates :email, presence: true, length: { maximum: 50}
  validates :password_digest, presence: true, length: { maximum: 50}
end

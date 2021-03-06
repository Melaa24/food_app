class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone
  attribute :topic
  attribute :message
  attribute :nickname,  :captcha  => true
  
  def headers
    {
      :subject => "Freshly Balanced Web Inquiry",
      :to => "deborah@freshlybalanced.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end

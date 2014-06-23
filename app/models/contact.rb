class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone
  attribute :topic
  attribute :message
  attribute :nickname,  :captcha  => true
  
  def headers
    {
      :subject => "Freshly Balanced Web Inquiary",
      :to => "dmugherini@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end

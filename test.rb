# encoding=utf-8
require 'active_resource'

class Message < ActiveResource::Base
  self.site = 'http://localhost:3000/api'
  self.user = 'badenkov@yandex.ru'
  self.password = 'BKUCJLOTD'
  #self.user = 'badenkov1@yandex.ru'
  #self.password = 'QMWPOJLEV'
  self.element_name = 'message'
  schema = { 'name' => :string,
             'phone' => :string,
             'email' => :string,
             'content' => :string }
end

#message = Message.new(name: "Alexey", phone: "1290090", email: "badenkov@yandex.ru", content: "Привет")
#message.content = "test"
#if message.save
  #puts "Сохранено"
#else
  #puts "Ошибки"
  #puts message.errors.to_json
#end
messages = Message.find(:all, params: { email: "badenkov@yandex.ru" })
p messages

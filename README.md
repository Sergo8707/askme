# Askme

##Описание
Приложение на Rails - аналог ask.fm. Пользователи могут задавать вопросы другим зарегистрированным пользователям, а также отвечать на вопросы, адресованные им.

##Демо
###[Open](https://vopros.herokuapp.com)

##Запуск
- Для запуска у вас должен быть установлен Ruby (желательно версии 2.0 или выше)
- Перед запуском требуется выполнить `bundle install` и `rake db:migrate`.
- Настроить и прописать ключи для Captcha

Использует jQuery, Google Captcha

В окружении Production: Настроение на использование Heroku и PostgreSQL.

В окружении Development: Использование SQLite.

##Используемые гемы:
```
gem 'rails', '4.2.6'

gem 'jquery-rails'

gem 'rails_12factor'

gem 'recaptcha', require: 'recaptcha/rails'

group :development, :test do  
  gem 'byebug'  
  gem 'sqlite3'  
end

group :production do 
  gem 'pg'  
  gem 'uglifier'  
end

group :development do  
  gem 'web-console', '~> 2.0' 
end
```







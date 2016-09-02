module ApplicationHelper

  # Этот метод возвращает ссылку на автарку пользователя, если она у него есть
  # Или ссылку на дефолтную аватарку, которая лежит в app/assets/images
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def name(user)
    if user.name.present?
      user.name
    else
      asset_path 'аноним'
    end
    end


  # Хелпер, рисующий span тэг с иконкой из font-awesome
  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  #склонятор
  def sklonyator(count, text, krokodil, krokodila, krokodilov)
    ostatok = count % 10
    ostatok100 = count % 100
    if count == 0
      text
    elsif ostatok100 >= 11 && ostatok100 <= 14
      "#{count} #{krokodilov}"
    elsif ostatok == 1
      "#{count} #{krokodil}"
    elsif ostatok >= 2 && ostatok <= 4
      "#{count} #{krokodila}"
    elsif ostatok > 4 || ostatok == 0
      "#{count} #{krokodilov}"
    end
  end
end

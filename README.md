# Домашние задания ИУ6. Вариант 5

Тут хранится домашка, иногда РК, иногда даже экзамены по всем программистским предметам за курс ИУ6 Бауманки

## Дисциплины

- [web](./web/) -- Языки Интернет-программирования / ИП / III
- [oop](./oop/) -- Объектно-ориентированное Программирование / ООП / II
- [prog basics](./prog%20basics/) -- Основы программирования / ОП / I
- [informatics](./informatics/) -- Информатика / Инфа / I


*<папка> -- <дисциплина> / <краткое название> / <семестр>*

## Генерация отчётов

В каждой готовой работе есть `README.adoc`, в котором находится текст на языке AsciiDoc. В качестве процессора используется [asciidoctor](https://asciidoctor.org/)

Для генерации отчётов нужно:
- установить ruby-пакеты из Gemfile 
- иметь настроенный graphiz (dot) -- чтобы генерировать схемы, например в практике за первый курс
- установить TexLive -- чтобы генерировать титульник
- заполнить `settings.rb` своими данными

### TexLive
Используется для генерации титульника (`latex/labreport.cls`). Какие конкретно ему нужны пакеты я не знаю, у меня в системе установлены следующие, из deb репозиториев:

```
texlive
texlive-base
texlive-binaries
texlive-extra-utils
texlive-fonts-recommended
texlive-generic-extra
texlive-generic-recommended
texlive-lang-cyrillic
texlive-lang-greek
texlive-latex-base
texlive-latex-extra
texlive-latex-recommended
texlive-pictures
texlive-plain-generic
texlive-science
texlive-xetex
```

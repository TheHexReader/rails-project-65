### Hexlet tests and linter status:
[![Actions Status](https://github.com/TheHexReader/rails-project-65/workflows/hexlet-check/badge.svg)](https://github.com/TheHexReader/rails-project-65/actions)

### My tests and linter status:
[![project-check](https://github.com/TheHexReader/rails-project-65/actions/workflows/project-check.yml/badge.svg)](https://github.com/TheHexReader/rails-project-65/actions/workflows/project-check.yml)

# Проект: Доска объявлений

Аналог avito.ru. Сервис, на котором можно размещать объявления и выполнять поиск по существующим. Включает в себя процессы публикации и управлении объявлениями, продвинутый поиск и многое другое.

## Требования для запуска проекта

- Ruby 3.1.2
- Ruby on Rails 7.0.4.3
- Node.js 18.13.0

## Установка

1. Клонировать репозиторий


```bash
bundle install
yarn install
bin/rails assets:precompile
bin/rails db:migrate
bin/rails db:seed
```

## Ссылка на Railway
https://rails-project-65-production-9642.up.railway.app/

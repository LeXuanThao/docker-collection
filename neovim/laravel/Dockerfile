FROM neovim:base

# Laravel composer install
RUN apk add php81-tokenizer php81-dom php81-xml php81-xmlwriter php81-fileinfo php81-session

WORKDIR /root/workspace
RUN composer create-project laravel/laravel .

EXPOSE 8000

CMD ["php", "artisan", "serve", "--host=0.0.0.0"]


return {
    'phpactor/phpactor',
    build = 'composer install --no-dev --optimize-autoloader',
    ft = 'php',
    keys = {
        { '<Leader>pn', ':PhpactorClassNew<CR>' },
    },
}

# Imona

Official frontend for the [Anomi API](https://github.com/AnomiNet/anomi) built with Ruby on Rails.

**TODO** This code runs https://www.anomi.net/.


## Setup

### Secrets

Before booting the app you must configure the app secrets.

`cp config/secrets.yml.example config/secrets.yml` and follow the instructions in the file.

## Development

#### Verbose mode

Set the `V` env var when booting, e.g. `V=1 rails c`.

### Deployment

**TODO** something something Docker zoom go


## Credits

API delegation and ActiveRecord-like abstraction are provided by the gem [her](https://github.com/remiprev/her).

I like Ruby.

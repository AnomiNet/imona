# Imona

Official frontend for the [Anomi API](https://github.com/AnomiNet/anomi) built with Ruby on Rails.

**TODO** This code runs https://www.anomi.net/.

## Development

### Install dependencies

```sh
bundle install
rake bower:install
```

### Secrets

Rails secret key and other secrets are configured in `config/secrets.yml`, ignored by .gitignore.

`cp config/secrets.yml.example config/secrets.yml` and follow instructions inline.

### Verbose mode

Set the `V` env var when booting, e.g. `V=1 rails c`.

## Deployment

**TODO** something something Docker zoom go


## Credits

API delegation and ActiveRecord-like abstraction are provided by the gem [her](https://github.com/remiprev/her).

I like Ruby.

## License

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

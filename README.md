# CDSS Common Documentation

[![Deploy Jekyll site to Pages](https://github.com/berkeley-cdss/docs/actions/workflows/jekyll.yml/badge.svg)](https://github.com/berkeley-cdss/docs/actions/workflows/jekyll.yml)[![Run all page tests](https://github.com/berkeley-cdss/docs/actions/workflows/rspec.yml/badge.svg)](https://github.com/berkeley-cdss/docs/actions/workflows/rspec.yml)

## Installation

### Install Ruby and Bundler
**The berkeley-class-site template requires Ruby 3.3.7 or higher and bundler >= 2.6**
Install Ruby before continuing. You can check your Ruby version by running:

```bash
ruby --version
bundle --version
```

Prerequisites:

- You have everything that [Jekyll requires](https://jekyllrb.com/docs/installation/)
- You have installed [Bundler](https://bundler.io/): Run `gem install jekyll bundler`
- Clone this repository
- Install dependencies with `bundle install`

## Usage

To run the site locally, run:

```
bundle exec jekyll serve
```

Note that if you alter `_config.yml`, you will need to rerun the above command to see the changes reflected.

## Deployment

Via [GitHub Pages](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll).

## Contributing

Please use pull requests! 

## License

[MIT](LICENSE)

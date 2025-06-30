# Contributing

We welcome contributions from any current or former UC Berkeley course staff or instructors
by submitting a pull request and requesting a review from any of our [maintainers]({% link about.md })
If you're not sure what to work on or would like to submit a bug report,
see our open [GitHub issues](https://github.com/berkeley-cdss/docs/issues).

## Installation

See [README.md](README.md)

## just-the-docs Theme

Don't reinvent the wheel! Many features come out-of-the-box since this website
uses the [just-the-docs](https://just-the-docs.com/) Jekyll theme. If you want to have things like
callouts, tables of contents, etc. check their documentation first.

## Style

When creating a new page, make sure that it goes in the appropriate category.
Page titles should match their file names, which will also be used as the slug
for the page. For example, if your page is titled "A New Page Title," your
Markdown file should be named `a-new-page-title.md` so that the slug for that
page is `/a-new-page-title`. Be aware that renaming titles and files
will break existing downstream links and having consistency is useful for organization!

## Liquid Tags

[Liquid](https://shopify.github.io/liquid/) is a template language. Liquid tags look like `{% tag_name ... %}` and you can read more about how they work with Jekyll [here](https://jekyllrb.com/docs/liquid/).

Some tags you may find useful:

- [`{% link <path> %}`](https://jekyllrb.com/docs/liquid/tags/#links)

## Continuous Integration (GitHub Actions)

We use [GitHub Actions](https://docs.github.com/en/actions) for continuous integration status checks,
such as running web accessiblity tests and code style checks/linters/autoformatters.

Most of the linters in `.github/workflows/linters.yml` are powered by [reviewdog](https://github.com/reviewdog/reviewdog).

Run `bundle exec rubocop` to run [Rubocop](https://rubocop.org/). To autocorrect certain errors, run `bundle exec rubocop --autocorrect`.

## Testing

To run web accessibility tests, run `bundle exec rspec`.

## Resources

- [Jekyll](https://jekyllrb.com/)
- [GitHub](https://docs.github.com/)

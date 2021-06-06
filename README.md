# Crystal Books

Simple in memory book keeping program

https://user-images.githubusercontent.com/16901597/120935847-8eaec580-c6b9-11eb-8a70-bc68dfe7644f.mp4

## Installation

```bash
git clone git@github.com:robertsimoes/crystal-books.git
cd crystal-books
make build
```

## Usage

Basic accounting system in Crystal 

```bash
./bin/crystal-books

>>>commands
ls - list accounts
save [name] - save ledger to file
debit [account, amount] - debit
credit [account, amount] - debit
addaccount [name] - add account

```

Loading from file:
```bash
tree 

* ledger.yml
```

```bash
./bin/crystalbooks --file ledger.yml

Loading ledger.yml into session

>>>
```
## Development

```bash
git clone git@github.com:robertsimoes/crystal-books.git
cd crystal-books
make install
```

## Contributing

1. Fork it (<https://github.com/your-github-user/accounting/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Robert](https://github.com/robertsimoes) - creator and maintainer

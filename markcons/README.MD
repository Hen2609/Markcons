# Markcons
## The ![N|Solid](https://img.shields.io/badge/Marko-3daee4?style=for-the-badge&logo=marko&logoColor=white) _icons package_

markcons aims to consolidate awesome icons in one package.
the icons are provided with minimal configuration, you choose which one to use and how.
feel free to create an issue requestin a specific icon package or create a pull request and add it yourself.

## Installation
Markcons is written with compatiblity to marko 5, earlier version were not tested. 
```sh
npm install markcons
```

## Usage
each icon library defines it's own behivor, the common factor is the `<markcon-*>` tag prefix
currently included icon pakcages:
| Icon Package | Icon Prefix |
| ------ | ------ |
| Material Design Icons | `<markcons-mdi-*>` |

### Material Design Icons
template: `<markcons-mdi-{style}-{fill}-{name}/>`
Go to [Google Fonts Icons](https://fonts.google.com/icons) and choose your desired icon and fill the template.
| Icon | Icon Component |
| ------ | ------ |
| outlined arrow forwared | `<markcons-mdi-outlined-arrow_forward>` |
| outlined arrow forwared  filled | `<markcons-mdi-outlined-fill-arrow_forward>` |

## License
> Note: the license is apache and not mit because of the google license

APACHE 2.0

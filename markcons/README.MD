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
Each icon library defines it's own behivor, the common factor is the `<markcon-*>` tag prefix.
Each Icon aceepts two common attributes for accessiblity: title and desc 
Currently included icon pakcages:
| Icon Package | Icon Prefix |
| ------ | ------ |
| Material Design Icons | `<markcons-mdi-*>` |
| Free Font Awesome 6 Icons | `<markcons-fa-*>` |


Styling is done by css or inline attributes, all icons include the class: `.markcons`

### Material Design Icons
Template: `<markcons-mdi-{style}-{fill}-{name}/>`
Go to [Google Fonts Icons](https://fonts.google.com/icons) and choose your desired icon and fill the template.
| Icon | Icon Component |
| ------ | ------ |
| outlined arrow forwared | `<markcons-mdi-outlined-arrow_forward>` |
| outlined arrow forwared  filled | `<markcons-mdi-outlined-fill-arrow_forward>` |

Icons are inline svg 

### Font Awesome 6
Template: `<markcons-fa-{type}-{name}/>`
Go to [Font Awesome Icons](https://fontawesome.com/icons) search for your icon, make sure to filter only free icons.
once you choose your icon a pop will come up with html code which needs to be transalted to a component name.  
in the above example the type is brand, and the name is waze.
| Icon | Font Awesome |Icon Component |
| ------ | ------ | ------ |
| waze | `<i class="fa-brands fa-waze"></i>` |`<markcons-fa-brands-waze>` |
| warehouse| `<i class="fa-solid fa-warehouse"></i>` | `<markcons-fa-solid-warehouse>` |

Icons are inline svg 

## License
> Note: the license is apache and not mit because of the google license

APACHE 2.0

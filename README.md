# Cyrillic Slug

  This plugin provide some addition methods which allow generate cyrillic slugs

## Requirements

  Main project witch mount engine should include libraries such as:

  * jQuery
  * Coffee Script
  * rails ~> 4.0
  * gem the_string_to_slug

## Installation

```
gem "cyrillic_slug", git: 'https://github.com/stavskiys/cyrillic_slug.git'
```

## Usage

Controller
```
class Admin::ServicesController < ApplicationController
  include_generate_cyrillyc_slug_method
end
```

Route
```
get '/admin/generate-cyrillic-slug' => 'admin/services#generate_cyrillic_slug', as: :generate_cyrillic_slug
```

Javascript
```
$('#generate_slug').generateSlug({
  $fieldVal: $('#category_name'),
  $slugField: $('#category_slug')
})
```

View(HAML example)
```
...
= f.label :slug, 'Cyrillic', class: 'col-md-2 control-label no-padding'
= f.text_field :slug, class: 'col-md-6 control-label'
= link_to 'Generate', generate_cyrillic_slug_path, id: 'generate_slug', class: 'btn btn-info'
...
```






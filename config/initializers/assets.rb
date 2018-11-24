# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( map.js )
Rails.application.config.assets.precompile += %w( pc/index.css.scss )
Rails.application.config.assets.precompile += %w( pc/index_favorite.scss )
Rails.application.config.assets.precompile += %w( pc/maps.scss )
Rails.application.config.assets.precompile += %w( pc/show.scss )
Rails.application.config.assets.precompile += %w( pc/about.scss )
Rails.application.config.assets.precompile += %w( mobile/index.css.scss )
Rails.application.config.assets.precompile += %w( mobile/index_favorite.scss )
Rails.application.config.assets.precompile += %w( mobile/maps.scss )
Rails.application.config.assets.precompile += %w( mobile/show.scss )
Rails.application.config.assets.precompile += %w( mobile/about.scss )

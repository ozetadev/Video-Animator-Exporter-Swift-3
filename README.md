
# VideoExporter (wip)
Allows you to load local assets from the users camera roll, and render layers over the vieos using CALayers.

##Asset Loader
Provides functionality for requesting and checking permission of access to photo library, as well as loading the content associated with the user library.

##Video Exporter
Provides functionality for exporting assets, using the export animator to add layers (text, images, anything a CALayer can do)

##Export Animator
Allows you to add to add layers (text, images, anything a CALayer can do)

##Video Player
Wrapper around AVPlayer, as a UIView, that allows tap to play and tap to pause. CALayer (player layer) auto changes frame with player.

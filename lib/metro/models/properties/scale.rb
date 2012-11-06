module Metro
  class Model

    #
    # A scale property maintains an x and y scaling factor. This scale is not applied to any
    #
    # A font property also defines a `font_size` property and a `font_name` property which allows a
    # more direct interface. Changing these values will update the font the next time that it is drawn.
    #
    # A font is stored in the properties as a hash representation and is converted into
    # a Gosu::Font when it is retrieved within the system. When retrieving a font the Font
    # Property will attempt to use a font that already exists that meets that criteria.
    #
    # The fonts are cached within the font property to help performance by reducing the unncessary
    # creation of similar fonts.
    #
    # @example Defining a font property
    #
    #     class Scoreboard < Metro::Model
    #       property :font
    #
    #       def draw
    #         font.draw text, x, y, z_order, x_factor, y_factor, color
    #       end
    #
    #     end
    #
    # @example Defining a font property providing a default
    #
    #     class Hero < Metro::Model
    #       property :font, default: { name: 'Comic Sans', size: 80 }
    #     end
    #
    # @example Using the `font_size` and `font_name` properties
    #
    #     class Hero < Metro::Model
    #       property :color, default: "rgba(255,0,0,1.0)"
    #
    #       def dignified
    #         self.font_size = 45
    #         self.font_name = 'Helvetica'
    #       end
    #     end
    #
    # @example Using a font property with a different property name
    #
    #     class Hero < Metro::Model
    #       property :alt_font, type: :font, default: "rgba(255,0,255,1.0)"
    #
    #       def draw
    #         puts "Font: #{alt_font_name}:#{alt_font_size}"
    #         alt_font.draw text, x, y, z_order, x_factor, y_factor, color
    #       end
    #     end
    #
    class ScaleProperty < Property

      define_property :x_factor

      define_property :y_factor

      get_or_set do |value|
        Scale.new default_x, default_y
      end

      get_or_set Scale do |value|
        value
      end

      get_or_set String do |value|
        x,y = value.split(",")
        Scale.new x.to_f, y.to_f
      end

      def default_x
        options[:default] ? options[:default].x_factor : 1.0
      end

      def default_y
        options[:default] ? options[:default].y_factor : 1.0
      end

    end

  end
end

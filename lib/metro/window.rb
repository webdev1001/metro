require_relative 'scenes'

module Metro

  #
  # A subclass of the Gosu::Window which simply acts as system
  # to shuffle in and out scenes and transfer events.
  #
  class Window < Gosu::Window

    attr_reader :scene

    def initialize(width,height,something)
      super width, height, something
    end

    def scene=(new_scene)
      @scene = new_scene
    end

    def update
      scene.event_manager.trigger_held_buttons
      scene.update
    end

    def draw
      scene._draw
    end

    def button_up(id)
      scene.event_manager.button_up(id)
    end

    def button_down(id)
      scene.event_manager.button_down(id)
    end

  end
end
require_relative 'animation_factory'

module Metro
  module HasAnimations

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods

      #
      # Define an animation to execute when the scene starts.
      #
      # @example Defining an animation that fades in and moves a logo when it is
      #   done, transition to the title scene.
      #
      #     animate actor: :logo, to: { y: 80, alpha: 50 }, interval: 120 do
      #       transition_to :title
      #     end
      #
      def animate(options,&block)
        scene_animation = AnimationFactory.new options, &block
        animations.push scene_animation
      end

      #
      # All the animations that are defined for the scene to be run the scene starts.
      #
      def animations
        @animations ||= []
      end

    end

  end
end
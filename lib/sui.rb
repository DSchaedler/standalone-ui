# frozen_string_literal: true

require 'lib/sui/bar.rb' # rubocop:disable Style/RedundantFileExtensionInRequire
require 'lib/sui/checkbox.rb' # rubocop:disable Style/RedundantFileExtensionInRequire

DEGREES_TO_RADIANS = Math::PI / 180

# Drop-in ui elements for DRGTK
module SUI
  def ui_update
    if $gtk.args.inputs.mouse.click
      $gtk.args.state.checkboxes.each do |_k, v|
        v[:checked] = !v[:checked] if $gtk.args.inputs.mouse.inside_rect? v
      end
    end
  end

  private

  def hex_to_rgb(hexstring)
    hexstring.gsub('#', '').split('').each_slice(2).map { |e| e.join.to_i(16) }
  end

  def randr(min, max)
    rand(max - min + 1) + min
  end

  def gaussian(mean, stddev)
    theta = 2 * Math::PI * rand
    rho = Math.sqrt(-2 * Math.log(1 - rand))
    scale = stddev * rho
    [mean + scale * Math.cos(theta), mean + scale * Math.sin(theta)]
  end
end

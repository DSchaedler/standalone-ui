# frozen_string_literal: true

require 'lib/sui/bar.rb'
require 'lib/sui/button.rb'
require 'lib/sui/checkbox.rb'

# These Constants are not namespaced
DEGREES_TO_RADIANS = Math::PI / 180
CENTER_X = 640
CENTER_Y = 360

# Drop-in ui elements for DRGTK
module SUI
  def ui_update
    SUI.checkboxes_check_click
  end

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

SUI.extend SUI

#!/usr/bin/env ruby

require 'bindata'

class LinesV3 < BinData::Record
    string :magic, :read_length => 0x2B
    uint32le :num_layer
    array :layer, :initial_length => :num_layer do
        uint32le :num_lines
        array :lines, :initial_length => :num_lines do 
            uint32le :brush_type
            uint32le :color
            uint32le :padding_zero
            float_le :brush_size
            uint32le :point_num
            array :points, :initial_length => :point_num do
                float_le :x
                float_le :y
                float_le :pressure
                float_le :rotation_x
                float_le :rotation_y
                float_le :unknown
            end
        end
    end
end

def parseLines(content)
    LinesV3.read(content)
end


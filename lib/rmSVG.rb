
def toSVGs(lines)
    svgs = Array.new
    lines[:layer].each do |layer|
        svg = ""
        svg += '<svg xmlns="http://www.w3.org/2000/svg" height="1404" width="1872">' 
        layer[:lines].each do |line|
            svg += '<polyline style="fill:none;stroke:black;stroke-width:5.000;opacity:0.9" points="' 
            line[:points].each do |point|
                svg += (1872 - point[:y]).to_s
                svg += ','
                svg += point[:x].to_s
                svg += ' '
            end
            svg += '" />'
        end
        svg += '</svg>'
        svgs.push svg
    end
    svgs
end


def toSVGsJoined(lines)
    svgs = Array.new
    polylines = Array.new
    lines[:layer].each do |layer|
        svg = ""
        svg += '<svg xmlns="http://www.w3.org/2000/svg" height="1404" width="1872">' 
        layer[:lines].each do |line|
            polyline = ""
            polyline += '<polyline style="fill:none;stroke:white;stroke-width:5.000;opacity:0.9" points="' 
            line[:points].each do |point|
                polyline += (1872 - point[:y]).to_s
                polyline += ','
                polyline += point[:x].to_s
                polyline += ' '
            end
            polyline += '" />'
            polylines.push polyline
        end
        svg += polylines.join('')
        svg += '</svg>'
        svgs.push svg
    end
    svgs
end

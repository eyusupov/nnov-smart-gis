#!/bin/env ruby
require 'cgi'

#attrs = %w[
#  ORCL_PORTAL:V_PORTAL2_EXIST_BUILDINGS_A
#  ORCL_PORTAL:V_PORTAL2_CONSTR_BUILDINGS_A
#  ORCL_PORTAL:V_PORTAL2_VETH_BUILDINGS_A
#  ORCL_PORTAL:V_PORTAL2_AVAR_BUILDINGS_A
#]

table = ARGV.shift
id_file = ARGV.shift
part = ARGV.shift.to_i || 1
parts = ARGV.shift.to_i || 1

ids = File.read("data/#{id_file}.txt").split("\n").map { |id| id.sub('_G.', '_A.') }

size = 50
count = ids.count / parts
n = count / size
i = count * (part - 1)

base_uri = "https://geonn.grad-nn.ru/proxy.php?url=http%3A%2F%2Flocalhost%3A8080%2Fgeoserver%2FORCL_PORTAL%2Fows%3Fservice%3DWFS%26version%3D1.0.0%26request%3DGetFeature%26outputFormat%3Dapplication%252Fjson%26typeName%3D#{CGI::escape(table)}%26featureID%3D"

(1..n).each do |idx|
  uri = base_uri + ids[i, size].compact.join(",")
  puts uri
  `curl -o "data/#{table}_#{part}_#{idx}.json" -k #{uri}`
  i += size
end

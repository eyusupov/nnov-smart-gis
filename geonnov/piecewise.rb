#!/bin/env ruby
require 'cgi'
layers = %w[
  ORCL_PORTAL:V_PORTAL2_EXIST_BUILDINGS_G
  ORCL_PORTAL:V_PORTAL2_UDC_ATI
  ORCL_PORTAL:V_PORTAL_GKN
  ORCL_PORTAL:V_PORTAL2_AD_PERM_ACTUAL
  ORCL_PORTAL:V_PORTAL2_UBORKA_SAD
  ORCL_PORTAL:V_PORTAL2_UBORKA_ZUT
]
  
attrs = %w[
  ORCL_PORTAL:V_PORTAL2_EXIST_BUILDINGS_A
  ORCL_PORTAL:V_PORTAL2_CONSTR_BUILDINGS_A
  ORCL_PORTAL:V_PORTAL2_VETH_BUILDINGS_A
  ORCL_PORTAL:V_PORTAL2_AVAR_BUILDINGS_A
]

bbox = [
  4863191.269102, 7641409.717669,
  4913448.615199, 7601929.992560
]

steps = 40
#(attrs + layers).each do |table|
attrs.each do |table|
  stepw = (bbox[2] - bbox[0]) / steps.to_f
  steph = (bbox[3] - bbox[1]) / steps.to_f
  idx = 1

  y1 = bbox[1]

  (1..steps).each do
    x1 = bbox[0]
    y0 = y1
    y1 = y0 + steph
    (1..steps).each do
      x0 = x1
      x1 = x0 + stepw
      coords = [x0,y0,x1,y1].join(',')
      puts coords
      params = "http://localhost:8080/geoserver/ORCL_PORTAL/ows?service=WFS&version=1.0.0&request=GetFeature&outputFormat=application%2Fjson&typeName=#{table}&CQL_FILTER=BBOX(GEOMETRY,#{coords})"
      uri = "https://geonn.grad-nn.ru/proxy.php?url=" + CGI::escape(params)
      puts uri
      `curl -o "data/piecewise/#{table}_#{idx}.json" -k #{uri}`
      idx += 1
    end
  end
end

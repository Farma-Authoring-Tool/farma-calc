collection @exercises, object_root: false

attributes :id

node(:label) {|t| "#{t.title}-#{t.position}"}
node(:value) {|t| "#{t.title}-#{t.position}"}

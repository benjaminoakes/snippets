# Quick script for a coworkers birthday.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

name = "Jane" # Not the real name, obviously -- just a Jane Doe

puts <<EOF
<html>
<head>
<style>
body {
  background: #333333;
  color: white;
  padding: 100px;
  text-align: center;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
}

.rainbow {
  padding: 50px;
  font-size: 800%;
}

.rainbow:hover {
EOF

increment = 10
i = 1

puts "text-shadow:"

colors = []

[
  '#dd0000',
  '#fe6230',
  '#fef600',
  '#00bc00',
  '#009bfe',
  '#000083',
  '#30009b',
].each do |color|
  increment.times do
    colors << "  #{i}px #{i}px 0 #{color}"
    i += 1
  end
end

puts colors.join(",\n")

puts ";"

puts <<EOF
  top: -70px;
  left: -70px;
  position: relative;
}

</style>
</head>
<body>
<marquee>
Happy birthday to you<br />
Happy birthday to you<br />
Happy birthday dear #{name}<br />
Happy birthday to you!<br />
</marquee>
<div class="rainbow">
Happy birthday, #{name}!
</div>
<marquee>
Happy birthday to you<br />
Happy birthday to you<br />
Happy birthday dear #{name}<br />
Happy birthday to you!<br />
</marquee>
</body>
</html>
EOF


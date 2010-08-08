# Didn't fix...
login_form.buttons.each { |b| b.node['disabled'] = '' }

# Better:
login_form.buttons.each { |b| b.node.delete('disabled') }


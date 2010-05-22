function include(class_to_modify, module)
  field_names = fieldnames(module);

  for index = 1:length(field_names)
    field_name = char(field_names(index));

    field = getfield(module, field_name);

    if strcmp('function_handle', class(field))
      class_to_modify = setfield(class_to_modify, field_name, field);
    end
  end

  assignin('caller', 'self', class_to_modify);
end


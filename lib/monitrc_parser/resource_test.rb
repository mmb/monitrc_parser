module MonitrcParser

  ResourceTest = Struct.new('ResourceTest',
    :resource,
    :operator,
    :value,
    :unit,
    :action,
    :cycles
    )

end

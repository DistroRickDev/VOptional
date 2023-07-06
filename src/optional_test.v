module optional

fn test_default_optional_value(){
	test_object := Optional.new_default[u64]()
	assert test_object.is_none()
}

fn test_defined_optional_value(){
	test_object := Optional.new[u64](42)
	assert test_object.is_some()
	assert test_object.value() == 42
}

fn test_defaulted_object_emplaces_values(){
	mut test_object := Optional.new_default[u64]()
	assert test_object.is_none()
	test_object.emplace(42)
	assert test_object.value() == 42
}

fn test_emplaced_value_resets(){
	mut test_object := Optional.new_default[u64]()
	assert test_object.is_none()
	test_object.emplace(42)
	assert test_object.value() == 42
}

fn test_object_reset(){
	mut test_object := Optional.new[u64](42)
	test_object.reset()
	assert test_object.is_none()
}

fn test_copy_object(){
	mut test_object_a := Optional.new[u64](42)
	mut test_object_b := Optional.new[u64](24)
	test_object_a.copy(test_object_b)
	assert test_object_a.value() == test_object_b.value()
}

fn test_value_or(){
	test_object := Optional.new_default[u64]()
	assert test_object.value_or(42) == 42
}

fn test_value_as_ref(){
	object_to_reference := 'test'
	mut test_object := Optional.new[string](object_to_reference)
	assert &object_to_reference == test_object.value_as_ref()
}
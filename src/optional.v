module optional

struct Optional[T]{
	mut:
		m_contained_object &T = unsafe{nil}
}

fn (option &Optional[T]) value[T]() T {
	assert unsafe{option.m_contained_object != nil}, 'Optional value is not set'
	return *option.m_contained_object 
}

fn (option &Optional[T]) value_as_ref[T]() &T {
	assert unsafe{option.m_contained_object != nil}, 'Optional value is not set'
	return option.m_contained_object 
}

fn (option &Optional[T]) value_or[T](other T) T{
	if unsafe{option.m_contained_object != nil}{
		return *option.m_contained_object
	}
	return other
}

fn (option &Optional[T]) is_some[T]() bool {
	return unsafe{ option.m_contained_object != nil }
}

fn (option &Optional[T]) is_none[T]() bool {
	return !option.is_some()
}

fn (mut option Optional[T]) emplace[T](value T) {
	option.m_contained_object = &value
}

fn (mut option Optional[T]) reset[T](){
	unsafe{option.m_contained_object = nil}
}

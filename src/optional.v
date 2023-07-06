module optional

struct Optional[T] {
mut:
	m_contained_object &T = unsafe { nil }
}

fn Optional.new[T](value T) Optional[T] {
	return Optional[T]{
		m_contained_object: &value
	}
}

fn Optional.new_default[T]() &Optional[T] {
	return &Optional[T]{}
}

fn (optional &Optional[T]) value[T]() T {
	assert unsafe { optional.m_contained_object != nil }, 'Optional value is not set'
	return *optional.m_contained_object
}

fn (optional &Optional[T]) value_as_ref[T]() &T {
	assert unsafe { optional.m_contained_object != nil }, 'Optional value is not set'
	return optional.m_contained_object
}

fn (optional &Optional[T]) value_or[T](other T) T {
	if unsafe { optional.m_contained_object != nil } {
		return *optional.m_contained_object
	}
	return other
}

fn (optional &Optional[T]) is_some[T]() bool {
	return unsafe { optional.m_contained_object != nil }
}

fn (optional &Optional[T]) is_none[T]() bool {
	return !optional.is_some()
}

fn (mut optional Optional[T]) emplace[T](value T) {
	optional.m_contained_object = &value
}

fn (mut optional Optional[T]) reset[T]() {
	unsafe {
		optional.m_contained_object = nil
	}
}

fn (mut optional Optional[T]) copy[T](other &Optional[T]) {
	optional.m_contained_object = other.value_as_ref()
}

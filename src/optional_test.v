module optional

fn test_default_optional_value(){
	test_object := Optional[u8]{}
	assert test_object.is_none()
}
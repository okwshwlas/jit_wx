/**
 * 仿照MooTools的Hash做的Hash类，主要是要做支持Struts2模型驱动的toQueryString方法
 */
MyHash = function(obj){
	if(obj){
		this.data = obj;
	}else{
		this.data = {};
	}
};
/**
 * <b>向Hash中新增一个键值对,或覆盖已有的键值对的值</b>
 * @param key (String) 要新增或修改的键
 * @param value (String) 要新增或修改的值
 * @return (MyHash) set后返回对象本身（为了支持new MyHash().set('a','a').set('b','b').set.....）
 */
MyHash.prototype.set=function(key,value){
	if (!this.data[key] || this.data.hasOwnProperty(key)) this.data[key] = value;
	return this;
}
/**
 * <b>获取Hash中指定键的值</b>
 * @param value (string) 键
 * @return (String)获取Hash中指定键的值
 */
MyHash.prototype.get=function(key){
	return (this.data.hasOwnProperty(key)) ? this.data[key] : null;
}
/**
 * <b>检测Hash中是否已存在指定的键</b>
 * @param value (string) 键
 * @return (boolean) 如果指定的键在Hash中存在,则返回true; 否则返回false
 */
MyHash.prototype.contains=function(key){
	return this.get(key) == null?false:true
}
/**
 * <b>从Hash中删除指定的键</b>
 * @param value (string) 键
 * @return (MyHash) remove后返回对象本身（为了支持new MyHash().remove('a','a').remove('b','b').remove.....）
 */
MyHash.prototype.remove=function(key){
	delete this.data[key];
	return this;
}
/**
 * <b>返回一个Hash中包含的所有键的数组</b><br>
 * 数组中键的排列顺序和MyHash:getValues方法所返回的值数组的顺序是一一对应的
 * @return (array) Hash中包含的所有键的数组
 */
MyHash.prototype.getKeys=function(){
	var arr = [];
	for(var key in this.data){
		arr.push(key);
	}
	return arr;
}
/**
 * <b>返回一个Hash中包含的所有值的数组</b><br>
 * 数组中键的排列顺序和MyHash:getKeys方法所返回的值数组的顺序是一一对应的
 * @return (array) Hash中包含的所有值的数组
 */
MyHash.prototype.getValues=function(){
	var keys = this.getKeys();
	var arr = [];
	for(var i=0,j=keys.length;i<j;i++){
		arr.push(this.data[keys[i]]);
	}
	return arr;
}
/**
 * <b>取得Hash键值对数量</b>
 */
MyHash.prototype.getLength=function(){
	return this.getKeys().length;
}
/**
 * <b>对Hash中的键值对进行迭代</b>
 */
MyHash.prototype.each=function(fn, bind){
	for (var key in this.data){
		if (this.contains(key)) fn.call(bind, this.data[key], key, this);
	}
}
/**
 * <b>由Hash中的键值对生成一个查询字符串(这些值都经过URI编码)</b>
 */
MyHash.prototype.toQueryString=function(){
	var queryString = [];
	var o = this;
	var tempArr = this.getKeys();
	for(var k=0;k<tempArr.length;k++){
		var key = tempArr[k];

		var result;
		var value = o.get(key);

		//switch($type(value)){
			//alert(typeof(value));
		switch(typeof(value)){
			case 'object':
				if (Object.prototype.toString.call(value) == '[object Array]')
				{
					var qs = {};
					var i=0;
					//for(var v=0,w=value.length;v<w;v++){ // 如果使用下面被注掉的for，将给数组多生成一个{name:'array'}，经查证，有一个下标为"$family"的属性
					for(var v in value){ // 这是原来的写法
						//if($type(value[v])!='function'){
						if(typeof(value[v])!='function'){
							qs[key+"["+i+"]"] = value[v];
							i++;
						}
					}
					result = new MyHash(qs).toQueryString();
				}else{
					var qs = {};
					var i=0;
					for(var v in value){
						//if($type(value[v])!='function'){
						if(typeof(value[v])!='function'){
							qs[key+"."+v] = value[v];
							i++;
						}
					}
					result = new MyHash(qs).toQueryString();
				}
					break;
				case 'array':
				break;
			default:
				result = key + '=' + encodeURIComponent(value);
		}

		if (value != undefined) queryString.push(result);
	}
	/*
	this.getKeys().each(function(key,index){
		var result;
		var value = o.get(key);
		switch($type(value)){
			case 'object':
				var qs = {};
				var i=0;
				for(var v in value){
					if($type(value[v])!='function'){
						qs[key+"."+v] = value[v];
						i++;
					}
				}
				result = new MyHash(qs).toQueryString();
				break;
			case 'array':
				var qs = {};
				var i=0;
				//for(var v=0,w=value.length;v<w;v++){ // 如果使用下面被注掉的for，将给数组多生成一个{name:'array'}，经查证，有一个下标为"$family"的属性
				for(var v in value){ // 这是原来的写法
					if($type(value[v])!='function'){
						qs[key+"["+i+"]"] = value[v];
						i++;
					}
				}
				result = new MyHash(qs).toQueryString();
				break;
			default:
				result = key + '=' + encodeURIComponent(value);
		}
		if (value != undefined) queryString.push(result);
	});
	*/
	return queryString.join('&');
}
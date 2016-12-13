package dogo.modeljson;

/**
 * 
 * @Project:  jit_crj
 * @ClassName: BaseJson.java
 * @Company: JIT Northeast R & D 
 * @Description: TODO
 * @author  lenovo
 * @date  2015年12月31日
 */
public class BaseJson {
	
	// 所有返回值
	private Object data;
	// 成功失败的标识 （000000：成功 000001:失败）
	private String code;

	// 成功或失败说明
	private String msg;
	
	

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	

}

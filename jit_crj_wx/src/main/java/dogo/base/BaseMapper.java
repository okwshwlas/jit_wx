package dogo.base;


/**
 * 封装了自动生成的根据主键基本增删改查
 * @author tj
 *
 * @param <T>
 * @param <PK>
 */
public interface BaseMapper<T, PK extends java.io.Serializable> {
	
	void deleteByPrimaryKey(PK modelPK);

    Integer insertSelective(T model);

    T selectByPrimaryKey(PK modelPK);

    void updateByPrimaryKeySelective(T model);

   
	
	
}

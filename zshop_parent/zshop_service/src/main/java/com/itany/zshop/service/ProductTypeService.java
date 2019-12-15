package com.itany.zshop.service;

        import com.itany.zshop.common.exception.ProductTypeExistException;
        import com.itany.zshop.pojo.ProductType;
        import java.util.List;

public interface ProductTypeService {
    //查找所有商品类型
    public List<ProductType> findAll();
    //查找启用了的商品类型
    public List<ProductType> findEnable();
    //添加商品类型
    public void add(String name)throws ProductTypeExistException;
    //根据id查找
    public ProductType findById(int id);
    //修改商品类型name
    public void modifyName(int id,String name)throws ProductTypeExistException;
    //删除商品类型
    public void removeById(int id);
    //修改商品类型status
    public void modifyStatus(int id);

}

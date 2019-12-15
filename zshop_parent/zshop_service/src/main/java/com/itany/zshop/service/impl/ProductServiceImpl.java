package com.itany.zshop.service.impl;

import com.itany.zshop.common.util.StringUtils;
import com.itany.zshop.dao.ProductDao;
import com.itany.zshop.dto.ProductDto;
import com.itany.zshop.params.ProductParam;
import com.itany.zshop.pojo.Product;
import com.itany.zshop.pojo.ProductType;
import com.itany.zshop.service.ProductService;
import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StreamUtils;

import java.io.*;
import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductDao productDao;

    @Override
    public List<Product> findAll(){
        return productDao.selectAll();
    }
    @Override
    public void add(ProductDto productDto)throws FileUploadException{
        //文件上传
        String fileName=StringUtils.renameFileName(productDto.getFileName());
        String filePath=productDto.getUploadPath()+"/"+fileName;
        try {
            StreamUtils.copy(productDto.getInputStream(), new FileOutputStream(filePath));
        }catch (IOException e){
            throw new FileUploadException("文件上传失败"+e.getMessage());
        }
        //保存到数据库
        Product product=new Product();
        product.setName(productDto.getName());
        product.setImage("/upload/"+fileName);
        product.setPrice(productDto.getPrice());
        ProductType productType=new ProductType();
        productType.setId(productDto.getProductTypeId());
        product.setProductType(productType);

        productDao.insert(product);
    }
    @Override
    public boolean checkName(String name){
        Product product=productDao.selectByName(name);
        if (product!=null)
            return false;
        return true;
    }
    @Override
    public Product findById(int id){
        return productDao.selectById(id);
    }
    @Override
    public void modify(ProductDto productDto)throws FileUploadException{
        //文件上传
        String fileName=StringUtils.renameFileName(productDto.getFileName());
        String filePath=productDto.getUploadPath()+"/"+fileName;
        try {
            StreamUtils.copy(productDto.getInputStream(), new FileOutputStream(filePath));
        }catch (IOException e){
            throw new FileUploadException("文件上传失败"+e.getMessage());
        }
        //保存到数据库
        Product product=new Product();
        product.setId(productDto.getId());
        product.setName(productDto.getName());
        product.setImage("/upload/"+fileName);
        product.setPrice(productDto.getPrice());

        ProductType productType=new ProductType();
        productType.setId(productDto.getProductTypeId());
        product.setProductType(productType);

        productDao.update(product);
    }
    @Override
    public void removeById(int id){
        productDao.deleteById(id);
    }
    @Override
    public List<Product> findByParams(ProductParam productParam){
        return productDao.selectByParams(productParam);
    }

}

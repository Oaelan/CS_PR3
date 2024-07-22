package org.hj.mapper.pub;

import java.util.ArrayList;

import org.hj.model.Product_manufacturingDto;

public interface ProductRePub_Mapper {
// 상품 등록
public void uploadP(Product_manufacturingDto pmd);
// 상품 리스트 가져오기
public  ArrayList <Product_manufacturingDto> productList();

}

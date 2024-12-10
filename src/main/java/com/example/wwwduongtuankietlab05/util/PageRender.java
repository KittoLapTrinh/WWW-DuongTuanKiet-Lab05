package com.example.wwwduongtuankietlab05.util;

import java.util.Collections;
import java.util.List;

public class PageRender <T>{
    public List<T> getPageOfModel(int size, int startItem, int pageSize, List<T> entity){
        List<T> list;
        if (size >= startItem) {
            int toIndex = Math.min(startItem + pageSize,size);
            list = entity.subList(startItem, toIndex);
        } else {
            list = Collections.emptyList();
        }
        return  list;
    }
}

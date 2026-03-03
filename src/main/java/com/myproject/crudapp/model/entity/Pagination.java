package com.myproject.crudapp.model.entity;

public class Pagination {

    private int page;
    private int pagesize;

    public Pagination() {
    }

    public Pagination(int page, int pagesize) {
        this.page = page;
        this.pagesize = pagesize;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPagesize() {
        return pagesize;
    }

    public void setPagesize(int pagesize) {
        this.pagesize = pagesize;
    }

    public int getOffset(){
        return (page-1)*pagesize;
    }

    @Override
    public String toString() {
        return page+"\t"+pagesize;
    }
}

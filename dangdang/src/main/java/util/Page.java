package util;

import model.Book;

import java.util.ArrayList;

public class Page {
    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPa() {
        return pa;
    }

    public void setPa(int pa) {
        this.pa = pa;
    }

    public ArrayList<Book> getList() {
        return list;
    }

    public void setList(ArrayList<Book> list) {
        this.list = list;
    }

    public int getCountPa() {
        return countPa;
    }

    public void setCountPa(int countPa) {
        this.countPa = countPa;
    }

    public int getSumPage() {
        return countPa%pa==0?countPa/pa:((countPa/pa)+1);
    }

    public void setSumPage(int sumPage) {
        this.sumPage = sumPage;
    }

    int currentPage;     //当前页
    int pa;             //一页显示多少条
    ArrayList<Book> list;

    int countPa;        //总记录数

    int sumPage;        //一共多少页

}

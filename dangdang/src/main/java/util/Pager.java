package util;

import java.util.List;

/**分页辅助类，通过泛型*/
public class Pager<T> {
	int currentPage;
	int pa;
	List<T> list;
	int countPa;
	int sumPage;
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
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
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
	
}

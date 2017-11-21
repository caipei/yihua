package com.doing.dataservice.entity;

import com.google.gson.annotations.Expose;

import java.util.List;

/**
 * Created by xujin on 2016/1/17.
 */
@SuppressWarnings("serial")
public class BaseListEntity extends DataEntity {

    private BaseList<?> data;

    @Override
    public BaseList<?> getData() {
        return data;
    }

    public void setData(BaseList<?> data) {
        this.data = data;
    }

    public static class BaseList<T> {

        @Expose
        private int totalpage;
        @Expose
        private int currentpage;
        @Expose
        private int totalnum;
        @Expose
        private List<T> list;

        public int getTotalpage() {
            return totalpage;
        }

        public void setTotalpage(int totalpage) {
            this.totalpage = totalpage;
        }

        public int getCurrentpage() {
            return currentpage;
        }

        public void setCurrentpage(int currentpage) {
            this.currentpage = currentpage;
        }

        public int getTotalnum() {
            return totalnum;
        }

        public void setTotalnum(int totalnum) {
            this.totalnum = totalnum;
        }

        public List<T> getList() {
            return list;
        }

        public void setList(List<T> list) {
            this.list = list;
        }
    }
}

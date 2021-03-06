package com.cqust.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class salebillExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table salebill
     *
     * @mbg.generated Fri Mar 13 11:23:59 CST 2020
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table salebill
     *
     * @mbg.generated Fri Mar 13 11:23:59 CST 2020
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table salebill
     *
     * @mbg.generated Fri Mar 13 11:23:59 CST 2020
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table salebill
     *
     * @mbg.generated Fri Mar 13 11:23:59 CST 2020
     */
    public salebillExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table salebill
     *
     * @mbg.generated Fri Mar 13 11:23:59 CST 2020
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table salebill
     *
     * @mbg.generated Fri Mar 13 11:23:59 CST 2020
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table salebill
     *
     * @mbg.generated Fri Mar 13 11:23:59 CST 2020
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table salebill
     *
     * @mbg.generated Fri Mar 13 11:23:59 CST 2020
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table salebill
     *
     * @mbg.generated Fri Mar 13 11:23:59 CST 2020
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table salebill
     *
     * @mbg.generated Fri Mar 13 11:23:59 CST 2020
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table salebill
     *
     * @mbg.generated Fri Mar 13 11:23:59 CST 2020
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table salebill
     *
     * @mbg.generated Fri Mar 13 11:23:59 CST 2020
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table salebill
     *
     * @mbg.generated Fri Mar 13 11:23:59 CST 2020
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table salebill
     *
     * @mbg.generated Fri Mar 13 11:23:59 CST 2020
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table salebill
     *
     * @mbg.generated Fri Mar 13 11:23:59 CST 2020
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andSalebillidIsNull() {
            addCriterion("saleBillID is null");
            return (Criteria) this;
        }

        public Criteria andSalebillidIsNotNull() {
            addCriterion("saleBillID is not null");
            return (Criteria) this;
        }

        public Criteria andSalebillidEqualTo(String value) {
            addCriterion("saleBillID =", value, "salebillid");
            return (Criteria) this;
        }

        public Criteria andSalebillidNotEqualTo(String value) {
            addCriterion("saleBillID <>", value, "salebillid");
            return (Criteria) this;
        }

        public Criteria andSalebillidGreaterThan(String value) {
            addCriterion("saleBillID >", value, "salebillid");
            return (Criteria) this;
        }

        public Criteria andSalebillidGreaterThanOrEqualTo(String value) {
            addCriterion("saleBillID >=", value, "salebillid");
            return (Criteria) this;
        }

        public Criteria andSalebillidLessThan(String value) {
            addCriterion("saleBillID <", value, "salebillid");
            return (Criteria) this;
        }

        public Criteria andSalebillidLessThanOrEqualTo(String value) {
            addCriterion("saleBillID <=", value, "salebillid");
            return (Criteria) this;
        }

        public Criteria andSalebillidLike(String value) {
            addCriterion("saleBillID like", value, "salebillid");
            return (Criteria) this;
        }

        public Criteria andSalebillidNotLike(String value) {
            addCriterion("saleBillID not like", value, "salebillid");
            return (Criteria) this;
        }

        public Criteria andSalebillidIn(List<String> values) {
            addCriterion("saleBillID in", values, "salebillid");
            return (Criteria) this;
        }

        public Criteria andSalebillidNotIn(List<String> values) {
            addCriterion("saleBillID not in", values, "salebillid");
            return (Criteria) this;
        }

        public Criteria andSalebillidBetween(String value1, String value2) {
            addCriterion("saleBillID between", value1, value2, "salebillid");
            return (Criteria) this;
        }

        public Criteria andSalebillidNotBetween(String value1, String value2) {
            addCriterion("saleBillID not between", value1, value2, "salebillid");
            return (Criteria) this;
        }

        public Criteria andMerchidIsNull() {
            addCriterion("merchID is null");
            return (Criteria) this;
        }

        public Criteria andMerchidIsNotNull() {
            addCriterion("merchID is not null");
            return (Criteria) this;
        }

        public Criteria andMerchidEqualTo(String value) {
            addCriterion("merchID =", value, "merchid");
            return (Criteria) this;
        }

        public Criteria andMerchidNotEqualTo(String value) {
            addCriterion("merchID <>", value, "merchid");
            return (Criteria) this;
        }

        public Criteria andMerchidGreaterThan(String value) {
            addCriterion("merchID >", value, "merchid");
            return (Criteria) this;
        }

        public Criteria andMerchidGreaterThanOrEqualTo(String value) {
            addCriterion("merchID >=", value, "merchid");
            return (Criteria) this;
        }

        public Criteria andMerchidLessThan(String value) {
            addCriterion("merchID <", value, "merchid");
            return (Criteria) this;
        }

        public Criteria andMerchidLessThanOrEqualTo(String value) {
            addCriterion("merchID <=", value, "merchid");
            return (Criteria) this;
        }

        public Criteria andMerchidLike(String value) {
            addCriterion("merchID like", value, "merchid");
            return (Criteria) this;
        }

        public Criteria andMerchidNotLike(String value) {
            addCriterion("merchID not like", value, "merchid");
            return (Criteria) this;
        }

        public Criteria andMerchidIn(List<String> values) {
            addCriterion("merchID in", values, "merchid");
            return (Criteria) this;
        }

        public Criteria andMerchidNotIn(List<String> values) {
            addCriterion("merchID not in", values, "merchid");
            return (Criteria) this;
        }

        public Criteria andMerchidBetween(String value1, String value2) {
            addCriterion("merchID between", value1, value2, "merchid");
            return (Criteria) this;
        }

        public Criteria andMerchidNotBetween(String value1, String value2) {
            addCriterion("merchID not between", value1, value2, "merchid");
            return (Criteria) this;
        }

        public Criteria andSalenumIsNull() {
            addCriterion("saleNum is null");
            return (Criteria) this;
        }

        public Criteria andSalenumIsNotNull() {
            addCriterion("saleNum is not null");
            return (Criteria) this;
        }

        public Criteria andSalenumEqualTo(Integer value) {
            addCriterion("saleNum =", value, "salenum");
            return (Criteria) this;
        }

        public Criteria andSalenumNotEqualTo(Integer value) {
            addCriterion("saleNum <>", value, "salenum");
            return (Criteria) this;
        }

        public Criteria andSalenumGreaterThan(Integer value) {
            addCriterion("saleNum >", value, "salenum");
            return (Criteria) this;
        }

        public Criteria andSalenumGreaterThanOrEqualTo(Integer value) {
            addCriterion("saleNum >=", value, "salenum");
            return (Criteria) this;
        }

        public Criteria andSalenumLessThan(Integer value) {
            addCriterion("saleNum <", value, "salenum");
            return (Criteria) this;
        }

        public Criteria andSalenumLessThanOrEqualTo(Integer value) {
            addCriterion("saleNum <=", value, "salenum");
            return (Criteria) this;
        }

        public Criteria andSalenumIn(List<Integer> values) {
            addCriterion("saleNum in", values, "salenum");
            return (Criteria) this;
        }

        public Criteria andSalenumNotIn(List<Integer> values) {
            addCriterion("saleNum not in", values, "salenum");
            return (Criteria) this;
        }

        public Criteria andSalenumBetween(Integer value1, Integer value2) {
            addCriterion("saleNum between", value1, value2, "salenum");
            return (Criteria) this;
        }

        public Criteria andSalenumNotBetween(Integer value1, Integer value2) {
            addCriterion("saleNum not between", value1, value2, "salenum");
            return (Criteria) this;
        }

        public Criteria andSaledateIsNull() {
            addCriterion("saleDate is null");
            return (Criteria) this;
        }

        public Criteria andSaledateIsNotNull() {
            addCriterion("saleDate is not null");
            return (Criteria) this;
        }

        public Criteria andSaledateEqualTo(Date value) {
            addCriterion("saleDate =", value, "saledate");
            return (Criteria) this;
        }

        public Criteria andSaledateNotEqualTo(Date value) {
            addCriterion("saleDate <>", value, "saledate");
            return (Criteria) this;
        }

        public Criteria andSaledateGreaterThan(Date value) {
            addCriterion("saleDate >", value, "saledate");
            return (Criteria) this;
        }

        public Criteria andSaledateGreaterThanOrEqualTo(Date value) {
            addCriterion("saleDate >=", value, "saledate");
            return (Criteria) this;
        }

        public Criteria andSaledateLessThan(Date value) {
            addCriterion("saleDate <", value, "saledate");
            return (Criteria) this;
        }

        public Criteria andSaledateLessThanOrEqualTo(Date value) {
            addCriterion("saleDate <=", value, "saledate");
            return (Criteria) this;
        }

        public Criteria andSaledateIn(List<Date> values) {
            addCriterion("saleDate in", values, "saledate");
            return (Criteria) this;
        }

        public Criteria andSaledateNotIn(List<Date> values) {
            addCriterion("saleDate not in", values, "saledate");
            return (Criteria) this;
        }

        public Criteria andSaledateBetween(Date value1, Date value2) {
            addCriterion("saleDate between", value1, value2, "saledate");
            return (Criteria) this;
        }

        public Criteria andSaledateNotBetween(Date value1, Date value2) {
            addCriterion("saleDate not between", value1, value2, "saledate");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table salebill
     *
     * @mbg.generated do_not_delete_during_merge Fri Mar 13 11:23:59 CST 2020
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table salebill
     *
     * @mbg.generated Fri Mar 13 11:23:59 CST 2020
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}
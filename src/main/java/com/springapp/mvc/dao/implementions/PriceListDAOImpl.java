package com.springapp.mvc.dao.implementions;

import com.springapp.mvc.dao.interfaces.PriceListDAO;
import com.springapp.mvc.domain.plywood.PlywoodEntity;
import com.springapp.mvc.domain.plywood.PriceListEntity;
import com.springapp.mvc.domain.plywood.PriceListPK;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class PriceListDAOImpl implements PriceListDAO{
    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<PriceListEntity> listPrices() {
        return sessionFactory.getCurrentSession().createQuery("from PriceListEntity").list();
    }

    @SuppressWarnings("unchecked")
    public List<PriceListEntity> listFiltered(String[] brandArr, String[] typeArr, int[] priceRangeArr,
                                              int[] lengthRangeArr, int[] widthRangeArr, Integer[] thicknessArr, int[] weightRangeArr) {


        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PriceListEntity.class);
        criteria.createCriteria("priceListPK.plywood", "p");
        if (brandArr != null) {
            criteria.add(Restrictions.in("p.brand", brandArr));
        }
        if (typeArr != null) {
            criteria.add(Restrictions.in("p.type", typeArr));
        }
        if (priceRangeArr != null) {
            criteria.add(Restrictions.between("price", priceRangeArr[0], priceRangeArr[1]));
        }
        if (lengthRangeArr != null) {
            criteria.add(Restrictions.between("priceListPK.length", lengthRangeArr[0], lengthRangeArr[1]));
        }
        if (widthRangeArr != null) {
            criteria.add(Restrictions.between("priceListPK.width", widthRangeArr[0], widthRangeArr[1]));
        }
        if (thicknessArr != null) {
            criteria.add(Restrictions.in("priceListPK.thickness", thicknessArr));
        }
        if (weightRangeArr != null) {
            criteria.add(Restrictions.between("weight", weightRangeArr[0], weightRangeArr[1]));
        }
        return criteria.list();
    }

    @SuppressWarnings("unchecked")
    public List<String[]> listPlywoodForSiteMap() {
        return null;
    }

    public PriceListEntity getPriceListItem(String productId, Integer length, Integer width, Integer thickness) {
        PriceListPK pk = new PriceListPK(getPlywood(productId), length, width, thickness);
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PriceListEntity.class);
        criteria.add(Restrictions.eq("priceListPK", pk));
        return (PriceListEntity) criteria.list().get(0);
    }

    @SuppressWarnings("unchecked")
    public PlywoodEntity getPlywood(String productId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from PlywoodEntity where productId='" + productId + "'");
        return (PlywoodEntity) query.uniqueResult();
    }

    @SuppressWarnings("unchecked")
    public PriceListEntity getPriceList(String productId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from PriceListEntity where productId='" + productId + "'");
        return (PriceListEntity) query.uniqueResult();
    }


    @Transactional
    @SuppressWarnings("unchecked")
    public void addPriceList(PriceListEntity priceList) {
        sessionFactory.getCurrentSession().saveOrUpdate(priceList);
    }

    @SuppressWarnings("unchecked")
    public void editPriceList(PriceListEntity priceList) {
        sessionFactory.getCurrentSession().update(priceList);
    }

}

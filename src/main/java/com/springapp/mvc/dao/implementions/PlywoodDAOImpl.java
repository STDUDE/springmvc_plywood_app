package com.springapp.mvc.dao.implementions;

import com.springapp.mvc.dao.interfaces.PlywoodDAO;
import com.springapp.mvc.domain.plywood.PlywoodEntity;
import com.springapp.mvc.domain.plywood.PriceListEntity;
import com.springapp.mvc.domain.plywood.PriceListPK;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class PlywoodDAOImpl implements PlywoodDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<PlywoodEntity> listPlywood() {
        return sessionFactory.getCurrentSession().createQuery("from PlywoodEntity").list();
    }

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
        Query query = sessionFactory.getCurrentSession().createQuery("select P.priceListPK.plywood.productId, P.priceListPK.length, P.priceListPK.width, P.priceListPK.thickness from PriceListEntity P");
        return (List<String[]>) query.list();
    }

    @SuppressWarnings("unchecked")
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
    public void addPlywood(PlywoodEntity plywood) {
        sessionFactory.getCurrentSession().saveOrUpdate(plywood);
    }

    @Transactional
    @SuppressWarnings("unchecked")
    public void addPriceList(PriceListEntity priceList) {
        sessionFactory.getCurrentSession().saveOrUpdate(priceList);
    }

    @SuppressWarnings("unchecked")
    public void editPlywood(PlywoodEntity plywood) {
        sessionFactory.getCurrentSession().update(plywood);
    }

    @SuppressWarnings("unchecked")
    public void editPriceList(PriceListEntity priceList) {
        sessionFactory.getCurrentSession().update(priceList);
    }

    @SuppressWarnings("unchecked")
    public List<PriceListEntity> randomPriceList() {
        return sessionFactory.getCurrentSession().createQuery("from PriceListEntity order by random()").setMaxResults(4).list();
    }

    @SuppressWarnings("unchecked")
    public List<PriceListEntity> newArrivalsList() {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PriceListEntity.class);
        criteria.addOrder(Order.desc("priceListPK.plywood.productId")).setMaxResults(4);
        return criteria.list();
    }
}

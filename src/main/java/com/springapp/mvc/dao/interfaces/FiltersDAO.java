package com.springapp.mvc.dao.interfaces;

import com.springapp.mvc.domain.hmc.HmcBrandFilter;
import com.springapp.mvc.domain.hmc.MachineLocationFilter;
import com.springapp.mvc.domain.hmc.HmcSlidersFilter;
import com.springapp.mvc.domain.hmc.SystemCNCFilter;

import java.util.List;

public interface FiltersDAO {
    public List<HmcBrandFilter> listBrandFilter();
    public List<MachineLocationFilter> listMachineLocationFilter();
    public List<SystemCNCFilter> listSystemCNCFilter();
    public List<HmcSlidersFilter> listSlidersFilter();
    public void renewBrandFilter();
    public void renewMachineLocationFilter();
    public void renewSystemCNCFilter();
    public void renewSlidersFilter();
}

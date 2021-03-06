// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.eol.domain;

import com.eol.domain.SMMGroupDataOnDemand;
import com.eol.maintenance.domain.SMMGroup;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;

import org.springframework.stereotype.Component;

privileged aspect SMMGroupDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SMMGroupDataOnDemand: @Component;
    
    private Random SMMGroupDataOnDemand.rnd = new SecureRandom();
    
    private List<SMMGroup> SMMGroupDataOnDemand.data;
    
    public SMMGroup SMMGroupDataOnDemand.getNewTransientSMMGroup(int index) {
        SMMGroup obj = new SMMGroup();
        setUuid(obj, index);
        return obj;
    }
    
    public void SMMGroupDataOnDemand.setUuid(SMMGroup obj, int index) {
        Long uuid = new Integer(index).longValue();
        obj.setUuid(uuid);
    }
    
    public SMMGroup SMMGroupDataOnDemand.getSpecificSMMGroup(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        SMMGroup obj = data.get(index);
        Long id = obj.getId();
        return SMMGroup.findSMMGroup(id);
    }
    
    public SMMGroup SMMGroupDataOnDemand.getRandomSMMGroup() {
        init();
        SMMGroup obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return SMMGroup.findSMMGroup(id);
    }
    
    public boolean SMMGroupDataOnDemand.modifySMMGroup(SMMGroup obj) {
        return false;
    }
    
    public void SMMGroupDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = SMMGroup.findSMMGroupEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'SMMGroup' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<SMMGroup>();
        for (int i = 0; i < 10; i++) {
            SMMGroup obj = getNewTransientSMMGroup(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}

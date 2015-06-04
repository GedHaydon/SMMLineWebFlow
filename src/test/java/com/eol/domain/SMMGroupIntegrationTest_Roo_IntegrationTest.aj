// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.eol.domain;

import com.eol.domain.SMMGroupDataOnDemand;
import com.eol.domain.SMMGroupIntegrationTest;
import com.eol.maintenance.domain.SMMGroup;

import java.util.Iterator;
import java.util.List;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SMMGroupIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SMMGroupIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SMMGroupIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: SMMGroupIntegrationTest: @Transactional;
    
    @Autowired
    SMMGroupDataOnDemand SMMGroupIntegrationTest.dod;
    
    @Test
    public void SMMGroupIntegrationTest.testCountSMMGroups() {
        Assert.assertNotNull("Data on demand for 'SMMGroup' failed to initialize correctly", dod.getRandomSMMGroup());
        long count = SMMGroup.countSMMGroups();
        Assert.assertTrue("Counter for 'SMMGroup' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SMMGroupIntegrationTest.testFindSMMGroup() {
        SMMGroup obj = dod.getRandomSMMGroup();
        Assert.assertNotNull("Data on demand for 'SMMGroup' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SMMGroup' failed to provide an identifier", id);
        obj = SMMGroup.findSMMGroup(id);
        Assert.assertNotNull("Find method for 'SMMGroup' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'SMMGroup' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void SMMGroupIntegrationTest.testFindAllSMMGroups() {
        Assert.assertNotNull("Data on demand for 'SMMGroup' failed to initialize correctly", dod.getRandomSMMGroup());
        long count = SMMGroup.countSMMGroups();
        Assert.assertTrue("Too expensive to perform a find all test for 'SMMGroup', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<SMMGroup> result = SMMGroup.findAllSMMGroups();
        Assert.assertNotNull("Find all method for 'SMMGroup' illegally returned null", result);
        Assert.assertTrue("Find all method for 'SMMGroup' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SMMGroupIntegrationTest.testFindSMMGroupEntries() {
        Assert.assertNotNull("Data on demand for 'SMMGroup' failed to initialize correctly", dod.getRandomSMMGroup());
        long count = SMMGroup.countSMMGroups();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<SMMGroup> result = SMMGroup.findSMMGroupEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'SMMGroup' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'SMMGroup' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void SMMGroupIntegrationTest.testFlush() {
        SMMGroup obj = dod.getRandomSMMGroup();
        Assert.assertNotNull("Data on demand for 'SMMGroup' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SMMGroup' failed to provide an identifier", id);
        obj = SMMGroup.findSMMGroup(id);
        Assert.assertNotNull("Find method for 'SMMGroup' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifySMMGroup(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'SMMGroup' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SMMGroupIntegrationTest.testMergeUpdate() {
        SMMGroup obj = dod.getRandomSMMGroup();
        Assert.assertNotNull("Data on demand for 'SMMGroup' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SMMGroup' failed to provide an identifier", id);
        obj = SMMGroup.findSMMGroup(id);
        boolean modified =  dod.modifySMMGroup(obj);
        Integer currentVersion = obj.getVersion();
        SMMGroup merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'SMMGroup' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SMMGroupIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'SMMGroup' failed to initialize correctly", dod.getRandomSMMGroup());
        SMMGroup obj = dod.getNewTransientSMMGroup(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'SMMGroup' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'SMMGroup' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'SMMGroup' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void SMMGroupIntegrationTest.testRemove() {
        SMMGroup obj = dod.getRandomSMMGroup();
        Assert.assertNotNull("Data on demand for 'SMMGroup' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SMMGroup' failed to provide an identifier", id);
        obj = SMMGroup.findSMMGroup(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'SMMGroup' with identifier '" + id + "'", SMMGroup.findSMMGroup(id));
    }
    
}
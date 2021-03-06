// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.eol.web;

import com.eol.maintenance.domain.SMMGroup;
import com.eol.web.SMMGroupController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect SMMGroupController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SMMGroupController.create(@Valid SMMGroup SMMGroup_, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, SMMGroup_);
            return "smmgroups/create";
        }
        uiModel.asMap().clear();
        SMMGroup_.persist();
        return "redirect:/smmgroups/" + encodeUrlPathSegment(SMMGroup_.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String SMMGroupController.createForm(Model uiModel) {
        populateEditForm(uiModel, new SMMGroup());
        return "smmgroups/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String SMMGroupController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("smmgroup_", SMMGroup.findSMMGroup(id));
        uiModel.addAttribute("itemId", id);
        return "smmgroups/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SMMGroupController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("smmgroups", SMMGroup.findSMMGroupEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) SMMGroup.countSMMGroups() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("smmgroups", SMMGroup.findAllSMMGroups(sortFieldName, sortOrder));
        }
        return "smmgroups/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SMMGroupController.update(@Valid SMMGroup SMMGroup_, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, SMMGroup_);
            return "smmgroups/update";
        }
        uiModel.asMap().clear();
        SMMGroup_.merge();
        return "redirect:/smmgroups/" + encodeUrlPathSegment(SMMGroup_.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String SMMGroupController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, SMMGroup.findSMMGroup(id));
        return "smmgroups/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String SMMGroupController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        SMMGroup SMMGroup_ = SMMGroup.findSMMGroup(id);
        SMMGroup_.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/smmgroups";
    }
    
    void SMMGroupController.populateEditForm(Model uiModel, SMMGroup SMMGroup_) {
        uiModel.addAttribute("SMMGroup_", SMMGroup_);
    }
    
    String SMMGroupController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}

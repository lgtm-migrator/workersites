package com.baker.util;

import org.springframework.core.io.Resource;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.context.support.ServletContextResource;

import javax.servlet.ServletContext;
import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.io.InputStreamReader;

public class ServletContextResourceReaderPropertyEditor extends PropertyEditorSupport implements ServletContextAware {

    /**
	 * @uml.property  name="servletContext"
	 * @uml.associationEnd  
	 */
    private ServletContext servletContext;

	@Override
	public void setAsText(String path) throws IllegalArgumentException {
		Resource resource = new ServletContextResource(servletContext, path);

        try {
			setValue(new InputStreamReader(resource.getInputStream()));
		}
		catch (IOException ex) {
			throw new IllegalArgumentException(
					"Could not retrieve InputStream for " + resource + ": " + ex.getMessage());
		}
	}

	@Override
	public String getAsText() {
        throw new UnsupportedOperationException("Not implemented");
    }

    /**
	 * @param servletContext
	 * @uml.property  name="servletContext"
	 */
    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }
}

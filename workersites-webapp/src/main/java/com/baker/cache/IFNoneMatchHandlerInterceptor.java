package com.baker.cache;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

public class IFNoneMatchHandlerInterceptor extends HandlerInterceptorAdapter {

    /**
	 * @uml.property  name="messageSource"
	 * @uml.associationEnd  readOnly="true"
	 */
    @Autowired
    private MessageSource messageSource;
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (! (HandlerMethod.class.isAssignableFrom(handler.getClass()))) {
            return true;
        }

        HandlerMethod handlerMethod = (HandlerMethod) handler;
        IfNoneMatch eTagAnn = handlerMethod.getMethod().getAnnotation(IfNoneMatch.class);

        if (eTagAnn == null) {
            // if no annotation, proceed with request
            return true;
        }
        
        // Récupère le localeResolver du contexte qui se trouve être le CookieLocaleResolver puis retrouve la langue.
        Locale locale = RequestContextUtils.getLocaleResolver(request).resolveLocale(request);
        // Le CookieLocaleResolver utilise soit Accept-Language de la réponse soit le localeChangeInterceptor qui est configuré comme <mvc:interceptors> dans spring-servlet.xml
        
        
        // Ex : Retrouve la localeResolver seulement
        //LocaleResolver localResolver = RequestContextUtils.getLocaleResolver(request);
        // Ex: on peut ici changer la langue à la volé.
        //localResolver.setLocale(request, response, locale);
        
        
        // TODO (oleksiy on 01.11.12): implement SpEL support
//        SpelExpressionParser expressionParser = new SpelExpressionParser();
//        Expression eTagExpression = expressionParser.parseExpression(eTagAnn.value(), new TemplateParserContext());
//
//        String eTag = eTagExpression.getValue(String.class);
     //   Locale locale = localeResolver.resolveLocale(request);

       
        
        String eTag = messageSource.getMessage("build.number", null, null) + "/" + locale.toString();

        ServletWebRequest swr = new ServletWebRequest(request, response);
        if (swr.checkNotModified(eTag)) {
            return false;
        }
        return true;
    }
}

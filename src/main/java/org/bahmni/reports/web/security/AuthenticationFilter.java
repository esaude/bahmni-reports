package org.bahmni.reports.web.security;

import org.apache.log4j.Logger;
import org.bahmni.reports.BahmniReportsProperties;
import org.bahmni.reports.util.BahmniLocale;
import org.bahmni.reports.web.ReportGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

@Component(value = "authenticationFilter")
public class AuthenticationFilter extends HandlerInterceptorAdapter {
    private static final Logger logger = Logger.getLogger(AuthenticationFilter.class);

    public static final String REPORTING_COOKIE_NAME = "reporting_session";
    private OpenMRSAuthenticator authenticator;
    private BahmniReportsProperties properties;

    @Autowired
    public AuthenticationFilter(OpenMRSAuthenticator authenticator,
                                BahmniReportsProperties properties) {
        this.authenticator = authenticator;
        this.properties = properties;
    }


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND,
                    BahmniLocale.getResourceBundle().getString("CANT_HANDLE_URL_ERROR") + " " + request.getRequestURI());
            return false;
        }

        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            return redirectToLogin(request, response);
        }
        AuthenticationResponse authenticationResponse = AuthenticationResponse.NOT_AUTHENTICATED;

        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(REPORTING_COOKIE_NAME)) {
                authenticationResponse = authenticator.authenticate(cookie.getValue());
            }
        }

        switch (authenticationResponse) {
            case AUTHORIZED:
                return true;
            case UNAUTHORIZED:
                response.sendError(HttpServletResponse.SC_FORBIDDEN,
                        BahmniLocale.getResourceBundle().getString("PRIVILEGES_REQUIRED_ERROR"));
                return false;
            default:
                return redirectToLogin(request, response);
        }
    }

    private boolean redirectToLogin(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException {
        httpServletResponse.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
        httpServletResponse.getWriter().write(BahmniLocale.getResourceBundle().getString("LOG_IN_TO_CONTINUE"));

        StringBuffer redirectUrl = new StringBuffer();
        redirectUrl.append(properties.getBahmniLoginUrl());
        char paramChar = '?';
        if(redirectUrl.toString().contains("?")) {
            paramChar = '&';
        }
        redirectUrl.append(paramChar)
                .append("from=")
                .append(URLEncoder.encode(httpServletRequest.getRequestURL() + "?" + httpServletRequest.getQueryString(), "UTF-8"));
        httpServletResponse.sendRedirect(redirectUrl.toString());
        return false;
    }
}

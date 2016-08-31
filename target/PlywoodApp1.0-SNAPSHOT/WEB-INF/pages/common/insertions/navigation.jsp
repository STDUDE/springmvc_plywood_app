<!-- ============================================== TOP NAVIGATION ======================================= -->
<nav class="top-bar animate-dropdown">
    <div class="container">
        <div class="col-xs-12 col-sm-6 no-margin">
            <ul>
                <li><a href="/"><spring:message code="common.home"/></a></li>
                <li><a href="/about"><spring:message code="common.about"/></a> </li>
                <li><a href="/contact" target="_blank"><spring:message code="common.contact"/></a></li>
            </ul>
        </div>

        <div class="col-xs-12 col-sm-6 no-margin">
            <ul class="right">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <c:url value="/plywood/j_spring_security_logout" var="logoutUrl" />
                    <form:form action="${logoutUrl}" method="post" id="logoutForm">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form:form>
                    <li><a><spring:message code="common.welcome"/>, ${pageContext.request.userPrincipal.name}</a></li>
                    <li><a onclick="$('#logoutForm').submit()"><spring:message code="common.logout"/></a></li>
                </c:if>
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <li><a href="/plywood/authentication"><spring:message code="common.signIn"/></a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
<!-- ================================================ TOP NAVIGATION : END ========================================= -->
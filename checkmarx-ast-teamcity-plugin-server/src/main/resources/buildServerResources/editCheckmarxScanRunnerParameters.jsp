<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="props" tagdir="/WEB-INF/tags/props" %>
<%@ taglib prefix="bs" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="propertiesBean" scope="request" type="jetbrains.buildServer.controllers.BasePropertiesBean"/>
<jsp:useBean id="constants" class="com.checkmarx.teamcity.common.CheckmarxScanRunnerConstants"/>
<jsp:useBean id="runners" class="com.checkmarx.teamcity.common.runner.Runners"/>
<jsp:useBean id="optionsBean" class="com.checkmarx.teamcity.server.CheckmarxOptions"/>


<c:if test="${propertiesBean.properties[optionsBean.useDefaultServer] == 'true'}">
    <c:set var="hideServerOverrideSection" value="${optionsBean.noDisplay}"/>
</c:if>
<c:if test="${propertiesBean.properties[optionsBean.useGlobalFileFilters] == 'true'}">
    <c:set var="hideFileFiltersServerOverrideSection" value="${optionsBean.noDisplay}"/>
</c:if>

<l:settingsGroup title="Checkmarx Scan Settings">

    <tr>
        <th>
            <label for="${optionsBean.useDefaultServer}">Use Global Settings for AST Server.<br>
              Server URL: ${propertiesBean.properties[optionsBean.globalAstServerUrl]} <br>
        </th>
        <td>
            <c:set var="onclick">
                $('serverOverrideSection').toggle();
            </c:set>
            <props:checkboxProperty name="${optionsBean.useDefaultServer}" onclick="${onclick}"/>
        </td>
    </tr>

  <tbody id="serverOverrideSection" ${hideServerOverrideSection}>
  <tr>
    <th><label for="${optionsBean.serverUrl}.text">AST Server Url:<l:star/></label></th>
    <td>
      <props:textProperty name="${optionsBean.serverUrl}" className="longField" id="${optionsBean.serverUrl}.text"/>
      <span class="smallNote">AST Server Url</span>
    </td>
  </tr>

    <tr>
      <th><label for="${optionsBean.authenticationUrl}.text">AST Authentication Url:</label></th>
      <td>
        <props:textProperty name="${optionsBean.authenticationUrl}" className="longField" id="${optionsBean.authenticationUrl}.text"/>
        <span class="smallNote">AST Authentication Url</span>
      </td>
    </tr>

    <tr>
      <th><label for="${optionsBean.tenant}.text">Tenant:</label></th>
      <td>
         <props:textProperty name="${optionsBean.tenant}" className="longField" id="${optionsBean.tenant}.text"/>
         <span class="smallNote">Tenant</span>
      </td>
    </tr>

    <tr>
      <th><label for="${optionsBean.astClientId}.text">AST Client Id:</label></th>
      <td>
        <props:textProperty name="${optionsBean.astClientId}" className="longField" id="${optionsBean.astClientId}.text"/>
        <span class="smallNote">AST Client Id</span>
      </td>
    </tr>

    <tr>
      <th><label>AST Secret:</label><l:star/></th>
      <td>
        <props:passwordProperty name="${optionsBean.astSecret}" className="longField"/>
        <span class="smallNote">The Secret obtained from AST.</span>
        <span class="error" id="error_${optionsBean.astSecret}"></span>
      </td>
    </tr>
    </tbody>

  <tr>
    <th><label for="${optionsBean.projectName}.text">Project name:</label></th>
    <td>
      <props:textProperty name="${optionsBean.projectName}" className="longField" id="${optionsBean.projectName}.text"/>
      <span class="smallNote">Project Name for AST</span>
    </td>
  </tr>

    <tr>
        <th><label for="${optionsBean.useGlobalFileFilters}">Use Global file filters.<br></th>
        <td>
            <c:set var="onclick">
                $('fileFiltersOverrideSection').toggle();
            </c:set>
            <props:checkboxProperty name="${optionsBean.useGlobalFileFilters}" onclick="${onclick}"/>
        </td>
    </tr>



<tbody id="fileFiltersOverrideSection" ${hideFileFiltersServerOverrideSection}>
  <tr>
    <th><label for="${optionsBean.zipFileFilters}.text">Zip File Filters:</label></th>
    <td>
      <props:textProperty name="${optionsBean.zipFileFilters}" className="longField" expandable="true" id="${optionsBean.zipFileFilters}.text"/>
      <span class="smallNote">File filters to be used while zipping the source code.</span>
    </td>
  </tr>
</tbody>

  <tr>
    <th><label for="${optionsBean.additionalParameters}.text">Additional parameters:</label></th>
    <td>
      <props:textProperty name="${optionsBean.additionalParameters}" className="longField" expandable="true" id="${optionsBean.additionalParameters}.text"/>
      <span class="smallNote">Refer to the <a href="https://github.com/CheckmarxDev/ast-cli">Checkmarx AST CLI help page</a> for information on additional arguments.</span>
    </td>
  </tr>

</l:settingsGroup>




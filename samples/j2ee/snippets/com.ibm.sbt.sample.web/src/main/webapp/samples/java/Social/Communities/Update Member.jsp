<!-- /*
 * � Copyright IBM Corp. 2012
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); 
 * you may not use this file except in compliance with the License. 
 * You may obtain a copy of the License at:
 * 
 * http://www.apache.org/licenses/LICENSE-2.0 
 * 
 * Unless required by applicable law or agreed to in writing, software 
 * distributed under the License is distributed on an "AS IS" BASIS, 
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or 
 * implied. See the License for the specific language governing 
 * permissions and limitations under the License.
 */-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="java.io.PrintWriter"%>
<%@page import="com.ibm.commons.runtime.Application"%>
<%@page import="com.ibm.commons.runtime.Context"%>
<%@page import="com.ibm.sbt.services.client.connections.communities.Community"%>
<%@page import="com.ibm.sbt.services.client.connections.communities.CommunityService"%>
<%@page import="com.ibm.sbt.services.client.connections.communities.Member"%>
<%@page import="com.ibm.sbt.services.client.base.datahandlers.EntityList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page 
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
	<title>SBT JAVA Sample - Update Member</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<body>	
	<div id="content">
	<%
	try {
		CommunityService communityService = new CommunityService();
		EntityList<Community> communities = communityService.getMyCommunities();
		String communityId = communities.get(0).getCommunityUuid();
		
		EntityList<Member> members = communityService.getMembers(communityId);
		if(members !=null && members.size()>1){ // size>1 so as to ensure we do not change onwnership of already a owner
		Boolean roleMemberFound = false;
			for (Member member :members){
				if(member.getRole().equalsIgnoreCase("member")){
					roleMemberFound = true;
					member.setRole("owner");
					communityService.updateMember(communityId,member);
					member = member.load();
					out.println("member with name : "+member.getName()+" updated with role "+ member.getRole()+"<br>");
				}
			}
			if(roleMemberFound == false){
					out.println("No members with \"member\" role found in this community");
			}
		}
		else{
			out.println("No members with \"member\" role found");
		}
		
	} catch (Throwable e) {
		out.println("<pre>");
		out.println(e.getMessage());
		out.println("</pre>");
	}			
	%>
	</div>
</body>
</html>
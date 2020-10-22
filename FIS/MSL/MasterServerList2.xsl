<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>Master Server List</title>
				<link rel="stylesheet" type="text/css" href="MSL.css" />
			</head>
			<body>
				<table>
					<tr>
						<td class="header" colspan="6">MSL Legend</td>
					</tr>
					<tr>
						<td class="sred">
                Not Assigned
						</td>
						<td class="syellow">
								Windows 2000 Server
						</td>
						<td class="slblue">
								DXD Install Mirror
						</td>
						<td class="sorange">
								In Launch
						</td>
						<td class="spink">
								LMA
						</td>
						<td  class="stan">
								P3 Linked
						</td>
					</tr>
				</table>
				
				<table class="grid" border="2">
					<xsl:for-each select="ServerInfo/Row">
						<tr>
							<xsl:for-each select="Site">
							<td>
								<table class="outside">
									<tr>
                    <td colspan="5">
										<xsl:choose>
											<xsl:when test="Links/HomePage='Not Assigned'">
												<xsl:value-of select="@Code" />
											</xsl:when>
											<xsl:otherwise>
												<a class="header" name="{@Code}" href="{Links/HomePage}" target="_blank"><xsl:value-of select="@Code" /></a>
											</xsl:otherwise>
										</xsl:choose>
                      </td>
									</tr>
									<tr>
										<td >
											<table class="inside" border="1">
												<!-- PAGING/LOGON -->
												<xsl:if test="Logon">
													<tr><td class="header" colspan="5">Paging/Logon</td></tr>
													<tr>
														
															<xsl:choose>
																<xsl:when test="Logon='Not Assigned'">
                                  <td colspan="5" class="red">
                                    <xsl:value-of select="Logon" />
                                  </td>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:choose>
																		<xsl:when test="Links/HomePage='Not Assigned'">
																			 <td colspan="5" class="white">
                                       <a href="http://{Logon}/FIS" target="_blank"><xsl:value-of select="Logon" /></a>
                                       </td>
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:choose>
																				<xsl:when test="Logon/@DXDMirror='True'">
																					  <td colspan="5" class="lblue">
																						<a href="{Links/HomePage}" target="_blank"><xsl:value-of select="Logon" /></a>
																					</td>
																				</xsl:when>
																				<xsl:otherwise>
																					  <td colspan="5" class="white">
																						<a href="{Links/HomePage}" target="_blank"><xsl:value-of select="Logon" /></a>
																					  </td>
																				</xsl:otherwise>
																			</xsl:choose>
																		</xsl:otherwise>
																	</xsl:choose>
																</xsl:otherwise>
															</xsl:choose>
													</tr>
												</xsl:if>
												
												<!-- ODB -->
												<xsl:if test="ODB">
													<tr><td class="header" colspan="5">Offline Application/Database</td></tr>
													<tr>
														<td colspan="5">
															<xsl:choose>
																<xsl:when test="ODB='Not Assigned'">
																	<table class="red">
																		<tr><td><xsl:value-of select="ODB" /></td></tr>
																	</table>
																</xsl:when>
																<xsl:otherwise>
																	<table class="white">
																		<tr><td><xsl:value-of select="ODB" /></td></tr>
																	</table>
																</xsl:otherwise>
															</xsl:choose>
														</td>
													</tr>
													<tr><td colspan="5">fffff</td></tr>
												</xsl:if>
												
												<!-- SeQent -->
												<xsl:if test="SAPP">
													<tr><td class="header" colspan="5">SeQent Application</td></tr>
													<tr>
														<td colspan="5">
															<xsl:choose>
																<xsl:when test="SAPP='Not Assigned'">
																	<table class="red">
																		<tr><td><xsl:value-of select="SAPP" /></td></tr>
																	</table>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:choose>
																		<xsl:when test="SAPP/@P3Linked='True'">
																			<table class="tan">
																				<tr><td><xsl:value-of select="SAPP" /></td></tr>
																			</table>
																		</xsl:when>
																		<xsl:otherwise>
																			<table class="white">
																				<tr><td><xsl:value-of select="SAPP" /></td></tr>
																			</table>
																		</xsl:otherwise>
																	</xsl:choose>
																</xsl:otherwise>
															</xsl:choose>
														</td>
													</tr>
													<tr><td colspan="5">jjjjj</td></tr>
												</xsl:if>
												<xsl:if test="SDB">
													<tr><td class="header" colspan="5">SeQent Database</td></tr>
													<tr>
														<td colspan="5">
															<xsl:choose>
																<xsl:when test="SDB='Not Assigned'">
																	<table class="red">
																		<tr><td><xsl:value-of select="SDB" /></td></tr>
																	</table>
																</xsl:when>
																<xsl:otherwise>
																	<table class="white">
																		<tr><td><xsl:value-of select="SDB" /></td></tr>
																	</table>
																</xsl:otherwise>
															</xsl:choose>
														</td>
													</tr>
													<tr><td colspan="5"></td></tr>
												</xsl:if>
												<xsl:if test="SEQENT">
													<tr><td class="header" colspan="5">SeQent Application and Database</td></tr>
													<tr>
														<td colspan="5">
															<xsl:choose>
																<xsl:when test="SEQENT='Not Assigned'">
																	<table class="red">
																		<tr><td><xsl:value-of select="SEQENT" /></td></tr>
																	</table>
																</xsl:when>
																<xsl:otherwise>
																	<table class="white">
																		<tr><td><xsl:value-of select="SEQENT" /></td></tr>
																	</table>
																</xsl:otherwise>
															</xsl:choose>
														</td>
													</tr>
													<tr><td colspan="5"></td></tr>
												</xsl:if>
												
												<!-- AREA -->
												<xsl:if test="Areas/Area/APP or Areas/Area/LAPP">
													<tr><td class="header" colspan="5">Area(s)</td></tr>
													<tr>
														<xsl:for-each select="Areas/Area">
															<xsl:choose>
																<xsl:when test="@InLaunch='True'">
																	<td>
																		<table class="sorange">
																			<tr><td><xsl:value-of select="AreaName" /></td></tr>
																		</table>
																	</td>
																</xsl:when>
																<xsl:otherwise>
																	<td>
																		<table class="sgreen">
																			<tr><td><xsl:value-of select="AreaName" /></td></tr>
																		</table>
																	</td>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5"></td></tr>
												</xsl:if>
												
												<!-- APPLICATION -->
												<xsl:if test="Areas/Area/APP">
													<tr>
														<xsl:for-each select="Areas/Area">
															<td class="header">Application</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5"></td></tr>
													<tr>
														<xsl:for-each select="Areas/Area">
															<td>
																<xsl:choose>
																	<xsl:when test="APP='Not Assigned'">
																		<table class="sred">
																			<tr><td><xsl:value-of select="APP" /></td></tr>
																		</table>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:choose>
																			<xsl:when test="APP/@OSVersion='Windows 2000'">
																				<table class="syellow">
																					<tr><td><xsl:value-of select="APP" /></td></tr>
																				</table>
																			</xsl:when>
																			<xsl:otherwise>
																				<xsl:choose>
																					<xsl:when test="APP/@P3Linked='True'">
																						<table class="stan">
																							<tr><td><a href="http://{APP}/activplant" target="_blank"><xsl:value-of select="APP" /></a></td></tr>
																						</table>
																					</xsl:when>
																					<xsl:otherwise>
																						<xsl:choose>
																							<xsl:when test="APP/@LMA='True'">
																								<table class="spink">
																									<tr><td><a href="http://{APP}/activplant" target="_blank"><xsl:value-of select="APP" /></a></td></tr>
																								</table>
																							</xsl:when>
																							<xsl:otherwise>
																								<table class="swhite">
																									<tr><td><a href="http://{APP}/activplant" target="_blank"><xsl:value-of select="APP" /></a></td></tr>
																								</table>
																							</xsl:otherwise>
																						</xsl:choose>
																					</xsl:otherwise>
																				</xsl:choose>
																			</xsl:otherwise>
																		</xsl:choose>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5"></td></tr>
												</xsl:if>
												
												<!-- FIS-LITE APPLICATION -->
												<xsl:if test="Areas/Area/LAPP">
													<tr>
														<xsl:for-each select="Areas/Area">
															<td class="header">FIS-Lite Application</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5"></td></tr>
													<tr>
														<xsl:for-each select="Areas/Area">
															<td>
																<xsl:choose>
																	<xsl:when test="LAPP='Not Assigned'">
																		<table class="sred">
																			<tr><td><xsl:value-of select="LAPP" /></td></tr>
																		</table>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:choose>
																			<xsl:when test="LAPP/@OSVersion='Windows 2000'">
																				<table class="syellow">
																					<tr><td><xsl:value-of select="LAPP" /></td></tr>
																				</table>
																			</xsl:when>
																			<xsl:otherwise>
																				<xsl:choose>
																					<xsl:when test="APP/@P3Linked='True'">
																						<table class="stan">
																							<tr><td><a href="http://{LAPP}/activplant" target="_blank"><xsl:value-of select="APP" /></a></td></tr>
																						</table>
																					</xsl:when>
																					<xsl:otherwise>
																						<xsl:choose>
																							<xsl:when test="LAPP/@LMA='True'">
																								<table class="spink">
																									<tr><td><a href="http://{LAPP}/activplant" target="_blank"><xsl:value-of select="LAPP" /></a></td></tr>
																								</table>
																							</xsl:when>
																							<xsl:otherwise>
																								<table class="swhite">
																									<tr><td><a href="http://{LAPP}/activplant" target="_blank"><xsl:value-of select="LAPP" /></a></td></tr>
																								</table>
																							</xsl:otherwise>
																						</xsl:choose>
																					</xsl:otherwise>
																				</xsl:choose>
																			</xsl:otherwise>
																		</xsl:choose>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5"></td></tr>
												</xsl:if>
												
												<!-- RTDB DBName: RTDB -->
												<xsl:if test="Areas/Area/RTDB">
													<tr>
														<xsl:for-each select="Areas/Area">
															<td class="header">Database Name</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5"></td></tr>
													<tr>
														<xsl:for-each select="Areas/Area">
															<td>
																<xsl:choose>
																	<xsl:when test="RTDB/@DBName='Not Assigned'">
																		<table class="sred">
																			<tr><td><xsl:value-of select="RTDB/@DBName" /></td></tr>
																		</table>
																	</xsl:when>
																	<xsl:otherwise>
																		<table class="swhite">
																			<tr><td><xsl:value-of select="RTDB/@DBName" /></td></tr>
																		</table>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5"></td></tr>
												</xsl:if>
												
												<!-- RTDB DBName: LDB -->
												<xsl:if test="Areas/Area/LDB">
													<tr>
														<xsl:for-each select="Areas/Area">
															<td class="header">Database Name</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5"></td></tr>
													<tr>
														<xsl:for-each select="Areas/Area">
															<td>
																<xsl:choose>
																	<xsl:when test="LDB/@DBName='Not Assigned'">
																		<table class="sred">
																			<tr><td><xsl:value-of select="LDB/@DBName" /></td></tr>
																		</table>
																	</xsl:when>
																	<xsl:otherwise>
																		<table class="swhite">
																			<tr><td><xsl:value-of select="LDB/@DBName" /></td></tr>
																		</table>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5"></td></tr>
												</xsl:if>
												
												<!-- RTDB DBName: Redmond -->
												<xsl:if test="RTDB-PRI">
													<tr>
														<xsl:for-each select="Areas/Area">
															<td class="header">Database Names</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5"></td></tr>
													<tr>
														<xsl:for-each select="Areas/Area">
															<td>
																<xsl:choose>
																	<xsl:when test="@DBName-AP='Not Assigned' or @DBName-EG='Not Assigned'">
																		<table class="sred">
																			<tr><td><xsl:value-of select="@DBName-AP" /></td></tr>
																			<tr><td><xsl:value-of select="@DBName-EG" /></td></tr>
																		</table>
																	</xsl:when>
																	<xsl:otherwise>
																		<table class="swhite">
																			<tr><td><xsl:value-of select="@DBName-AP" /></td></tr>
																			<tr><td><xsl:value-of select="@DBName-EG" /></td></tr>
																		</table>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5"></td></tr>
												</xsl:if>
												
												<!-- RTDB -->
												<xsl:if test="Areas/Area/RTDB">
													<tr>
														<xsl:for-each select="Areas/Area">
															<td class="header">Real-time Database</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5"></td></tr>
													<tr>
														<xsl:for-each select="Areas/Area">
															<td>
																<xsl:choose>
																	<xsl:when test="RTDB='Not Assigned'">
																		<table class="sred">
																			<tr><td><xsl:value-of select="RTDB" /></td></tr>
																		</table>
																	</xsl:when>
																	<xsl:otherwise>
																		<table class="swhite">
																			<tr><td><xsl:value-of select="RTDB" /></td></tr>
																		</table>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5"></td></tr>
												</xsl:if>
												
												<!-- Redmond -->
												<xsl:if test="RTDB-PRI">
													<tr><td class="header" colspan="5">Multi-Area Real-time Database</td></tr>
													<tr>
														<td colspan="5">
															<xsl:choose>
																<xsl:when test="RTDB-PRI='Not Assigned' or RTDB-SEC='Not Assigned' or RTDB-HAG='Not Assigned'">
																	<table class="red">
																		<tr><td><strong>Primary: </strong><xsl:value-of select="RTDB-PRI" /></td></tr>
																		<tr><td><strong>Secondary: </strong><xsl:value-of select="RTDB-SEC" /></td></tr>
																		<tr><td><strong>HA Group: </strong><xsl:value-of select="RTDB-HAG" /></td></tr>
																	</table>
																</xsl:when>
																<xsl:otherwise>
																	<table class="white">
																		<tr><td><strong>Primary: </strong><xsl:value-of select="RTDB-PRI" /></td></tr>
																		<tr><td><strong>Secondary: </strong><xsl:value-of select="RTDB-SEC" /></td></tr>
																		<tr><td><strong>HA Group: </strong><xsl:value-of select="RTDB-HAG" /></td></tr>
																	</table>
																</xsl:otherwise>
															</xsl:choose>
														</td>
													</tr>
													<tr><td colspan="5"></td></tr>
												</xsl:if>
												
												<!-- FIS-LITE DB -->
												<xsl:if test="Areas/Area/LDB">
													<tr>
														<xsl:for-each select="Areas/Area">
															<td class="header">FIS-Lite Database</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5"></td></tr>
													<tr>
														<xsl:for-each select="Areas/Area">
															<td>
																<xsl:choose>
																	<xsl:when test="LDB='Not Assigned'">
																		<table class="sred">
																			<tr><td><xsl:value-of select="LDB" /></td></tr>
																		</table>
																	</xsl:when>
																	<xsl:otherwise>
																		<table class="swhite">
																			<tr><td><xsl:value-of select="LDB" /></td></tr>
																		</table>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5">cccccc</td></tr>
												</xsl:if>
												
												<!-- DXDs -->
												<xsl:if test="Areas/Area/APP or Areas/Area/LAPP">
													<tr>
														<xsl:for-each select="Areas/Area">
															<td class="header">Collecters</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5"></td></tr>
													<tr>
														<xsl:for-each select="Areas/Area">
															<td>
																<table class="swhite">
																	<xsl:for-each select="DXDs/DXD">
																		<xsl:choose>
																			<xsl:when test="@LMA='True'">
																				<tr><td class="spink"><xsl:value-of select="." /></td></tr>
																			</xsl:when>
																			<xsl:otherwise>
																				<tr><td><xsl:value-of select="." /></td></tr>
																			</xsl:otherwise>
																		</xsl:choose>
																	</xsl:for-each>
																</table>
															</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5">888888</td></tr>
												</xsl:if>
												
												<!-- AP Support Code -->
												<xsl:if test="Areas/Area/APP">
													<tr><td class="header" colspan="5">AP Support Code(s)</td></tr>
													<tr>
														<xsl:for-each select="Areas/Area">
															<td>
																<xsl:choose>
																	<xsl:when test="APP/@APSupportCode='Not Assigned'">
																		<table class="sred">
																			<tr><td><xsl:value-of select="APP/@APSupportCode" /></td></tr>
																		</table>
																	</xsl:when>
																	<xsl:otherwise>
																		<table class="swhite">
																			<tr><td><xsl:value-of select="APP/@APSupportCode" /></td></tr>
																		</table>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5"></td></tr>
												</xsl:if>
												<xsl:if test="Areas/Area/LAPP">
													<tr><td class="header" colspan="5">AP Support Code(s)</td></tr>
													<tr>
														<xsl:for-each select="Areas/Area">
															<td>
																<xsl:choose>
																	<xsl:when test="LAPP/@APSupportCode='Not Assigned'">
																		<table class="sred">
																			<tr><td><xsl:value-of select="LAPP/@APSupportCode" /></td></tr>
																		</table>
																	</xsl:when>
																	<xsl:otherwise>
																		<table class="swhite">
																			<tr><td><xsl:value-of select="LAPP/@APSupportCode" /></td></tr>
																		</table>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5"></td></tr>
												</xsl:if>
												
												<!-- FIS Admin -->
												<xsl:if test="Areas/Area/APP or Areas/Area/LAPP">
													<tr><td class="header" colspan="5">FIS Admin</td></tr>
													<tr>
														<xsl:for-each select="Areas/Area">
															<td>
																<xsl:choose>
																	<xsl:when test="FISAdmin/@CDSID='Not Assigned'">
																		<table class="sred">
																			<tr><td><xsl:value-of select="FISAdmin/@CDSID" /></td></tr>
																		</table>
																	</xsl:when>
																	<xsl:otherwise>
																		<table class="swhite">
																			<tr><td><xsl:value-of select="FISAdmin/@CDSID" /></td></tr>
																		</table>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</xsl:for-each>
													</tr>
													<tr><td colspan="5">kkkkkk</td></tr>
												</xsl:if>
												
												<!-- Links -->
												<tr>
													<td colspan="5" class="white">
															<xsl:choose>
																<xsl:when test="Links/HealthMon='Not Assigned'">
																	Health Monitor
																</xsl:when>
																<xsl:otherwise>
																	<a href="{Links/HealthMon}" target="_blank">Health Monitor</a>
																</xsl:otherwise>
															</xsl:choose>
                            <br />
															<xsl:choose>
																<xsl:when test="Links/SupportMon='Not Assigned'">
																	Support Monitor
																</xsl:when>
																<xsl:otherwise>
																	<a href="{Links/SupportMon}" target="_blank">Support Monitor</a>
																</xsl:otherwise>
															</xsl:choose>
													</td>
												</tr>
												<tr><td colspan="5">pppppp</td></tr>
												
												<!-- FIS Version -->
												<tr><td class="header" colspan="5">FIS Version</td></tr>
												<tr>
													<td colspan="5">
														<xsl:choose>
															<xsl:when test="@FISVersion='Not Assigned'">
																<table class="red">
																	<tr><td colspan="5"><xsl:value-of select="@FISVersion" /></td></tr>
																</table>
															</xsl:when>
															<xsl:otherwise>
																<xsl:choose>
																	<xsl:when test="Links/BOM='Not Assigned'">
																		<table class="white">
																			<tr><td colspan="5"><xsl:value-of select="@FISVersion" /></td></tr>
																		</table>
																	</xsl:when>
																	<xsl:otherwise>
																		<table class="white">
																			<tr><td colspan="5"><a href="{Links/BOM}" target="_blank"><xsl:value-of select="@FISVersion" /></a></td></tr>
																		</table>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr><td colspan="5">aaaaaa</td></tr>
												
											</table>
										</td>
									</tr>
								</table>
							</td>
							</xsl:for-each>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
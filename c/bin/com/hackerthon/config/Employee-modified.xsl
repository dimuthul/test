<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

	<xsl:template match="/">
		<Employees>
			<xsl:apply-templates select="employees/*" />
		</Employees>
	</xsl:template>
	
	<xsl:template match="employee_profile">
		<Employee>
			<xsl:apply-templates />
		</Employee>
	</xsl:template>

	<xsl:template match="employee_id">
		<EmployeeID>
			<xsl:value-of select="text()" />
		</EmployeeID>
	</xsl:template>

	<xsl:template match="employee_name">
		<EmployeeFullName>
			<xsl:value-of select="concat(first_name/text(), ' ', last_name/text())" />
		</EmployeeFullName>
	</xsl:template>

	<xsl:template match="address">
		<EmployeeFullAddress>
			<xsl:value-of select="concat(no/text(), ',', address_line1/text(), ',', address_line2/text())" />
		</EmployeeFullAddress>
	</xsl:template>

	<xsl:template match="designation">
		<Designation>
			<xsl:value-of select="text()" />
		</Designation>
	</xsl:template>

	<xsl:template match="faculty">
		<FacultyName>
			<xsl:value-of select="@name" />
		</FacultyName>
		<Department>
			<xsl:value-of select="department/text()" />
		</Department>
	</xsl:template>

</xsl:stylesheet>

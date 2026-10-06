<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" encoding="UTF-8"/>

    <!-- SQL table -->
    <xsl:template match="/">

        CREATE TABLE IF NOT EXISTS moodle_users (
            id INT PRIMARY KEY,
            username VARCHAR(100) NOT NULL,
            email VARCHAR(30) NOT NULL,
            firstname VARCHAR(100) NOT NULL,
            lastname VARCHAR(100) NOT NULL,
            idnumber INT NOT NULL,
            password VARCHAR(100) NOT NULL,
            city VARCHAR(100) NOT NULL,
            country VARCHAR(2) NOT NULL
        );

        <xsl:text>&#10;</xsl:text>

        <xsl:for-each select="users/user">

            INSERT INTO moodle_users
            (id, username, email, firstname, lastname, idnumber, password, city, country)
            VALUES (
            <xsl:value-of select="id"/>,
            '<xsl:value-of select="username"/>',
            '<xsl:value-of select="email"/>',
            '<xsl:value-of select="firstname"/>',
            '<xsl:value-of select="lastname"/>',
            <xsl:value-of select="idnumber"/>,
            '<xsl:value-of select="password"/>',
            '<xsl:value-of select="city"/>',
            '<xsl:value-of select="country"/>'
            );

            <xsl:text>&#10;</xsl:text>

        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>

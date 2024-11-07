<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>RKT Examination Data Style Sheet Ver1.01</title>
      </head>
      <body>
        <xsl:apply-templates />
        <br />
        <a title="Nidek home page" href="http://www.nidek.co.jp/">
          <address align="center">NIDEK CO., LTD.</address>
        </a>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="Data">
    <h1 align="center">
      <xsl:value-of select="ModelName" /> Examination Data</h1>
    <xsl:call-template name="AKNData" />
  </xsl:template>
  <xsl:template name="AKNData">
    <table border="1" width="600" align="center">
      <colgroup>
        <col span="2" style="background:#E0E0E0" />
      </colgroup>
      <tr>
        <th colspan="2" width="300">Company</th>
        <td width="300">
          <xsl:value-of select="Company" />
        </td>
      </tr>
      <tr>
        <th colspan="2">Model Name</th>
        <td>
          <xsl:value-of select="ModelName" />
        </td>
      </tr>
      <tr>
        <th colspan="2">ROM Version</th>
        <td>
          <xsl:value-of select="ROMVersion" />
        </td>
      </tr>
      <tr>
        <th colspan="2">Format Version</th>
        <td>
          <xsl:value-of select="Version" />
        </td>
      </tr>
      <tr>
        <th colspan="2">Date</th>
        <td>
          <xsl:value-of select="Date" />
        </td>
      </tr>
      <tr>
        <th colspan="2">Time</th>
        <td>
          <xsl:value-of select="Time" />
        </td>
      </tr>
      <xsl:apply-templates select="Patient" />
      <tr>
        <th colspan="2">Comment</th>
        <td>
          <xsl:value-of select="Comment" />
        </td>
      </tr>
      <xsl:if test="count(VD)!=0">
        <tr>
          <th colspan="2">Vertex Distance</th>
          <td>
            <xsl:value-of select="VD" />
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="count(WorkingDistance)!=0">
        <tr>
          <th colspan="2">Working Distance</th>
          <td>
            <xsl:value-of select="WorkingDistance" />
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="count(ARDiopterStep)!=0">
        <tr>
          <th colspan="2">AR Diopter Step</th>
          <td>
            <xsl:value-of select="ARDiopterStep" />
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="count(KMDiopterStep)!=0">
        <tr>
          <th colspan="2">KM Diopter Step</th>
          <td>
            <xsl:value-of select="KMDiopterStep" />
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="count(ACCDiopterStep)!=0">
        <tr>
          <th colspan="2">ACC Diopter Step</th>
          <td>
            <xsl:value-of select="ACCDiopterStep" />
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="count(AxisStep)!=0">
        <tr>
          <th colspan="2">Axis Step</th>
          <td>
            <xsl:value-of select="AxisStep" />
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="count(CylinderMode)!=0">
        <tr>
          <th colspan="2">Cylinder Mode</th>
          <td>
            <xsl:value-of select="CylinderMode" />
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="count(RefractiveIndex)!=0">
        <tr>
          <th colspan="2">Refractive Index</th>
          <td>
            <xsl:value-of select="RefractiveIndex" />
          </td>
        </tr>
      </xsl:if>
    </table>
    <br />
    <table width="600" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <th width="300">
          <xsl:if test="count(R)!=0">
            <a name="Right">
              <h2 align="center">Right Eye</h2>
            </a>
          </xsl:if>
        </th>
        <th width="300">
          <xsl:if test="count(L)!=0">
            <a name="Left">
              <h2 align="center">Left Eye</h2>
            </a>
          </xsl:if>
        </th>
      </tr>
      <tr>
        <td style="vertical-align:top">
          <xsl:apply-templates select="R" mode="R_AR" />
        </td>
        <td style="vertical-align:top">
          <xsl:apply-templates select="L" mode="L_AR" />
        </td>
      </tr>
      <tr>
        <td style="vertical-align:top">
          <xsl:apply-templates select="R" mode="R_VA" />
        </td>
        <td style="vertical-align:top">
          <xsl:apply-templates select="L" mode="L_VA" />
        </td>
      </tr>
      <tr>
        <td style="vertical-align:top">
          <xsl:apply-templates select="R" mode="R_SR" />
        </td>
        <td style="vertical-align:top">
          <xsl:apply-templates select="L" mode="L_SR" />
        </td>
      </tr>
      <tr>
        <td style="vertical-align:top">
          <xsl:apply-templates select="R" mode="R_LM" />
        </td>
        <td style="vertical-align:top">
          <xsl:apply-templates select="L" mode="L_LM" />
        </td>
      </tr>
      <tr>
        <td style="vertical-align:top">
          <xsl:apply-templates select="R" mode="R_KM" />
        </td>
        <td style="vertical-align:top">
          <xsl:apply-templates select="L" mode="L_KM" />
        </td>
      </tr>
      <tr>
        <td style="vertical-align:top">
          <xsl:apply-templates select="R" mode="R_CS" />
        </td>
        <td style="vertical-align:top">
          <xsl:apply-templates select="L" mode="L_CS" />
        </td>
      </tr>
      <tr>
        <td style="vertical-align:top">
          <xsl:apply-templates select="R" mode="R_PS" />
        </td>
        <td style="vertical-align:top">
          <xsl:apply-templates select="L" mode="L_PS" />
        </td>
      </tr>      
      <tr>
        <td style="vertical-align:top">
          <xsl:apply-templates select="R" mode="R_AC" />
        </td>
        <td style="vertical-align:top">
          <xsl:apply-templates select="L" mode="L_AC" />
        </td>
      </tr>
      <tr>
        <td style="vertical-align:top">
          <xsl:apply-templates select="R" mode="R_RI" />
        </td>
        <td style="vertical-align:top">
          <xsl:apply-templates select="L" mode="L_RI" />
        </td>
      </tr>
      <tr>
        <td style="vertical-align:top">
          <xsl:apply-templates select="R" mode="R_CL" />
        </td>
        <td style="vertical-align:top">
          <xsl:apply-templates select="L" mode="L_CL" />
        </td>
      </tr>
      <tr>
        <td style="vertical-align:top">
          <xsl:apply-templates select="R" mode="R_NT" />
        </td>
        <td style="vertical-align:top">
          <xsl:apply-templates select="L" mode="L_NT" />
        </td>
      </tr>
      <tr>
        <td style="vertical-align:top">
          <xsl:apply-templates select="R" mode="R_PACHY" />
        </td>
        <td style="vertical-align:top">
          <xsl:apply-templates select="L" mode="L_PACHY" />
        </td>
      </tr>
    </table>
    <xsl:if test="count(PD)!=0">
      <table border="1" width="600" align="center">
        <colgroup>
          <col style="background:#E0E0E0" />
        </colgroup>
        <tr style="background:silver">
          <th>Pupillary Distance</th>
          <th>Far PD</th>
          <th>Right PD</th>
          <th>Left PD</th>
          <th>Near PD</th>
        </tr>
        <xsl:apply-templates select="PD/PDList" />
      </table>
      <br />
    </xsl:if>
  </xsl:template>
  <xsl:template match="Patient">
    <tr>
      <th rowspan="2">Patient</th>
      <th>No.</th>
      <td>
        <xsl:value-of select="No." />
      </td>
    </tr>
    <tr>
      <th>ID</th>
      <td>
        <xsl:value-of select="ID" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="R" mode="R_AR">
    <xsl:apply-templates select="AR" />
  </xsl:template>
  <xsl:template match="L" mode="L_AR">
    <xsl:apply-templates select="AR" />
  </xsl:template>
  <xsl:template match="R" mode="R_VA">
    <xsl:apply-templates select="VA" />
  </xsl:template>
  <xsl:template match="L" mode="L_VA">
    <xsl:apply-templates select="VA" />
  </xsl:template>
  <xsl:template match="R" mode="R_SR">
    <xsl:apply-templates select="SR" />
  </xsl:template>
  <xsl:template match="L" mode="L_SR">
    <xsl:apply-templates select="SR" />
  </xsl:template>
  <xsl:template match="R" mode="R_LM">
    <xsl:apply-templates select="LM" />
  </xsl:template>
  <xsl:template match="L" mode="L_LM">
    <xsl:apply-templates select="LM" />
  </xsl:template>
  <xsl:template match="R" mode="R_KM">
    <xsl:apply-templates select="KM" />
  </xsl:template>
  <xsl:template match="L" mode="L_KM">
    <xsl:apply-templates select="KM" />
  </xsl:template>
  <xsl:template match="R" mode="R_AC">
    <xsl:apply-templates select="AC" />
  </xsl:template>
  <xsl:template match="L" mode="L_AC">
    <xsl:apply-templates select="AC" />
  </xsl:template>
  <xsl:template match="R" mode="R_RI">
    <xsl:apply-templates select="RI" />
  </xsl:template>
  <xsl:template match="L" mode="L_RI">
    <xsl:apply-templates select="RI" />
  </xsl:template>
  <xsl:template match="R" mode="R_CS">
    <xsl:apply-templates select="CS" />
  </xsl:template>
  <xsl:template match="L" mode="L_CS">
    <xsl:apply-templates select="CS" />
  </xsl:template>
  <xsl:template match="R" mode="R_PS">
    <xsl:apply-templates select="PS" />
  </xsl:template>
  <xsl:template match="L" mode="L_PS">
    <xsl:apply-templates select="PS" />
  </xsl:template>
  <xsl:template match="R" mode="R_CL">
    <xsl:apply-templates select="CLSelect" />
  </xsl:template>
  <xsl:template match="L" mode="L_CL">
    <xsl:apply-templates select="CLSelect" />
  </xsl:template>
  <xsl:template match="R" mode="R_NT">
    <xsl:apply-templates select="NT" />
  </xsl:template>
  <xsl:template match="L" mode="L_NT">
    <xsl:apply-templates select="NT" />
  </xsl:template>
  <xsl:template match="R" mode="R_PACHY">
    <xsl:apply-templates select="PACHY" />
  </xsl:template>
  <xsl:template match="L" mode="L_PACHY">
    <xsl:apply-templates select="PACHY" />
  </xsl:template>

  <xsl:template match="CS">
    <table border="1" width="300" align="center">
      <colgroup>
        <col style="background:#E0E0E0" />
      </colgroup>
      <tr style="background:silver">
        <th>Corneal</th>
        <th colspan="2">Size</th>
      </tr>
      <xsl:apply-templates select="CSList" />
    </table>
    <br />
  </xsl:template>
  <xsl:template match="CSList">
    <tr>
      <th>
        <xsl:value-of select="@No" />
      </th>
      <td colspan="2">
        <xsl:value-of select="Size" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="PS">
    <table border="1" width="300" align="center">
      <colgroup>
        <col style="background:#E0E0E0" />
      </colgroup>
      <tr style="background:silver">
        <th>Pupil</th>
        <th>Size</th>
        <th>Lamp</th>
      </tr>
      <xsl:apply-templates select="PSList" />
    </table>
    <br />
  </xsl:template>
  <xsl:template match="PSList">
    <tr>
      <th>
        <xsl:value-of select="@No" />
      </th>
      <td>
        <xsl:value-of select="Size" />
      </td>
      <td>
        <xsl:value-of select="Lamp" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="AR">
    <table border="1" width="300" align="center">
      <colgroup>
        <col style="background:#E0E0E0" />
      </colgroup>
      <tr style="background:silver">
        <th>AR</th>
        <th>Sph</th>
        <th>Cyl</th>
        <th>Axis</th>
        <th>
          <br />
        </th>
        <th>C</th>
        <th>SE</th>
      </tr>
      <xsl:apply-templates select="ARList" />
      <xsl:apply-templates select="ARMedian" />
      <xsl:apply-templates select="TrialLens" />
      <xsl:apply-templates select="ContactLens" />
      <xsl:apply-templates select="ARPeriData" />
      <xsl:apply-templates select="ARPeriDiff" />
      <xsl:if test="count(RingImage)!=0">
	<tr>
	<th colspan="7" style="background:silver" align="center">Ring Image</th>
	</tr>
        <tr>
          <td colspan="7" style="background:white">
            <a target="_blank">
              <xsl:attribute name="href">
                <xsl:value-of select="concat('../JPG/', RingImage)" />
              </xsl:attribute>
              <img border="0" width="150" alt="Ring image">
                <xsl:attribute name="src">
                  <xsl:value-of select="concat('../JPG/', RingImage)" />
                </xsl:attribute>
              </img>
            </a>
          </td>
        </tr>
        <tr>
          <td colspan="7" style="background:white;font-size:8pt">
            <a title="Ring image" target="_blank">
              <xsl:attribute name="href">
                <xsl:value-of select="concat('../JPG/', RingImage)" />
              </xsl:attribute>
              <pre>
                <xsl:value-of select="RingImage" />
              </pre>
            </a>
          </td>
        </tr>
      </xsl:if>
    </table>
    <br />
  </xsl:template>

  <xsl:template match="ARList">
    <tr>
      <th>
        <xsl:value-of select="@No" />
      </th>
      <xsl:if test="count(Error)!=0">
        <td colspan="6" style="background:white">
          <xsl:value-of select="Error" /> Error</td>
      </xsl:if>
      <xsl:if test="count(Error)=0">
        <td style="background:white">
          <xsl:value-of select="Sphere" />
        </td>
        <td>
          <xsl:value-of select="Cylinder" />
        </td>
        <td>
          <xsl:value-of select="Axis" />
        </td>
        <td>
          <xsl:if test="count(CataractMode)!=0">*</xsl:if>
        </td>
        <td>
          <xsl:value-of select="ConfidenceIndex" />
        </td>
        <td>
          <xsl:value-of select="SE" />
        </td>
      </xsl:if>
    </tr>
  </xsl:template>
  <xsl:template match="TrialLens">
    <tr>
      <th style="background:#E0E0E0">TL</th>
      <td style="background:white">
        <xsl:value-of select="Sphere" />
      </td>
      <td>
        <xsl:value-of select="Cylinder" />
      </td>
      <td>
        <xsl:value-of select="Axis" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="ContactLens">
    <tr>
      <th style="background:#E0E0E0">CL</th>
      <td style="background:white">
        <xsl:value-of select="Sphere" />
      </td>
      <td>
        <xsl:value-of select="Cylinder" />
      </td>
      <td>
        <xsl:value-of select="Axis" />
      </td>
      <td />
      <td />
      <td>
        <xsl:value-of select="SE" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="ContactLens">
    <tr>
      <th style="background:#E0E0E0">CL</th>
      <td style="background:white">
        <xsl:value-of select="Sphere" />
      </td>
      <td>
        <xsl:value-of select="Cylinder" />
      </td>
      <td>
        <xsl:value-of select="Axis" />
      </td>
      <td />
      <td />
      <td>
        <xsl:value-of select="SE" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="ARPeriData">
    <tr>
      <th style="background:#E0E0E0">Data</th>
      <td style="background:white">
        <xsl:value-of select="Sphere" />
      </td>
      <td>
        <xsl:value-of select="Cylinder" />
      </td>
      <td>
        <xsl:value-of select="Axis" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="ARPeriDiff">
    <tr>
      <th style="background:#E0E0E0">Diff</th>
      <td style="background:white">
        <xsl:value-of select="Sphere" />
      </td>
      <td>
        <xsl:value-of select="Cylinder" />
      </td>
      <td>
        <xsl:value-of select="Axis" />
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="ARMedian">
    <tr>
      <th style="background:#E0E0E0">M</th>
      <td style="background:white">
        <xsl:value-of select="Sphere" />
      </td>
      <td>
        <xsl:value-of select="Cylinder" />
      </td>
      <td>
        <xsl:value-of select="Axis" />
      </td>
      <td />
      <td />
      <td>
        <xsl:value-of select="SE" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="VA">
    <table border="1" width="300" align="center">
      <colgroup>
        <col style="background:#E0E0E0" />
      </colgroup>
      <tr style="background:silver">
        <th>VA</th>
        <th colspan="3">Visual Acuity</th>
      </tr>
      <xsl:if test="count(UCVA)!=0">
        <tr>
          <th>UCVA</th>
          <td colspan="3">
            <xsl:value-of select="UCVA" />
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="count(BCVA)!=0">
        <tr>
          <th>BCVA</th>
          <td colspan="3">
            <xsl:value-of select="BCVA" />
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="count(LVA)!=0">
        <tr>
          <th>LVA</th>
          <td colspan="3">
            <xsl:value-of select="LVA" />
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="count(GVA)!=0">
        <tr>
          <th>GVA</th>
          <td colspan="3">
            <xsl:value-of select="GVA" />
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="count(NVA)!=0">
        <tr>
          <th>NVA</th>
          <td>
            <xsl:value-of select="NVA" />
          </td>
          <xsl:if test="count(WorkingDistance)!=0">
            <th style="background:#E0E0E0">WD</th>
            <td>
              <xsl:value-of select="WorkingDistance" />
            </td>
          </xsl:if>
        </tr>
      </xsl:if>
      <xsl:if test="count(NVA)=0">
        <xsl:if test="count(WorkingDistance)!=0">
          <tr>
            <td style="background:#FFFFFF" />
            <th style="background:#E0E0E0">WD</th>
            <td>
              <xsl:value-of select="WorkingDistance" />
            </td>
          </tr>
        </xsl:if>
      </xsl:if>
    </table>
    <br />
  </xsl:template>
  <xsl:template match="SR">
    <table border="1" width="300" align="center">
      <colgroup>
        <col style="background:#E0E0E0" />
      </colgroup>
      <tr style="background:silver">
        <th>SR</th>
        <th>Sph</th>
        <th>Cyl</th>
        <th>Axis</th>
        <th>SE</th>
      </tr>
      <tr>
        <th>1</th>
        <td>
          <xsl:value-of select="Sphere" />
        </td>
        <td>
          <xsl:value-of select="Cylinder" />
        </td>
        <td>
          <xsl:value-of select="Axis" />
        </td>
        <td>
          <xsl:value-of select="SE" />
        </td>
      </tr>
      <xsl:if test="count(ADD)!=0">
        <tr>
          <th>ADD</th>
          <td>
            <xsl:value-of select="ADD" />
          </td>
          <xsl:if test="count(WorkingDistance)!=0">
            <th style="background:#E0E0E0">WD</th>
            <td colspan="2">
              <xsl:value-of select="WorkingDistance" />
            </td>
          </xsl:if>
        </tr>
      </xsl:if>
      <xsl:if test="count(ADD)=0">
        <xsl:if test="count(WorkingDistance)!=0">
          <tr>
            <td style="background:#FFFFFF" />
            <td />
            <th style="background:#E0E0E0">WD</th>
            <td colspan="2">
              <xsl:value-of select="WorkingDistance" />
            </td>
          </tr>
        </xsl:if>
      </xsl:if>
    </table>
    <br />
  </xsl:template>
  <xsl:template match="LM">
    <table border="1" width="300" align="center">
      <colgroup>
        <col style="background:#E0E0E0" />
      </colgroup>
      <tr style="background:silver">
        <th>LM</th>
        <th>Sph</th>
        <th>Cyl</th>
        <th>Axis</th>
      </tr>
      <tr>
        <th>1</th>
        <td>
          <xsl:value-of select="Sphere" />
        </td>
        <td>
          <xsl:value-of select="Cylinder" />
        </td>
        <td>
          <xsl:value-of select="Axis" />
        </td>
      </tr>
      <xsl:if test="count(ADD)!=0 or count(ADD2)!=0">
        <tr>
          <th>ADD</th>
          <td>
            <xsl:value-of select="ADD" />
          </td>
          <td>
            <xsl:value-of select="ADD2" />
          </td>
        </tr>
      </xsl:if>
    </table>
    <br />
  </xsl:template>
  <xsl:template match="KM">
    <table border="1" width="300" align="center">
      <colgroup>
        <col span="2" style="background:#E0E0E0" />
      </colgroup>
      <tr style="background:silver">
        <th colspan="2">KM <xsl:value-of select="@condition" /></th>
        <th>mm</th>
        <th>Diopter</th>
        <th>Axis</th>
      </tr>
      <xsl:apply-templates select="KMList" />
      <xsl:apply-templates select="KMMedian" />
      <xsl:if test="count(KMImage)!=0">
	<tr>
	<th colspan="4" style="background:silver" align="center">KM Image</th>
	</tr>
        <tr>
          <td colspan="4" style="background:white">
            <a target="_blank">
              <xsl:attribute name="href">
                <xsl:value-of select="concat('../JPG/', KMImage)" />
              </xsl:attribute>
              <img border="0" width="150" alt="KM Image">
                <xsl:attribute name="src">
                  <xsl:value-of select="concat('../JPG/', KMImage)" />
                </xsl:attribute>
              </img>
            </a>
          </td>
        </tr>
        <tr>
          <td colspan="4" style="background:white;font-size:8pt">
            <a title="KM image" target="_blank">
              <xsl:attribute name="href">
                <xsl:value-of select="concat('../JPG/', KMImage)" />
              </xsl:attribute>
              <pre>
                <xsl:value-of select="KMImage" />
              </pre>
            </a>
          </td>
        </tr>
      </xsl:if>
    </table>
    <br />
    <xsl:apply-templates select="Sagittal" />
    <xsl:apply-templates select="Peripheral" />
  </xsl:template>
  <xsl:template match="Peripheral">
    <table border="1" width="300" align="center">
      <colgroup>
        <col span="2" style="background:#E0E0E0" />
      </colgroup>
      <tr style="background:silver">
        <th colspan="2">KM Peripheral</th>
        <th>mm</th>
        <th>Diopter</th>
        <th>Axis</th>
      </tr>
      <xsl:apply-templates select="KMList" />
      <xsl:apply-templates select="KMMedian" />
    </table>
    <br />
  </xsl:template>
  <xsl:template match="KMList">
    <tr>
      <th rowspan="4">
        <xsl:value-of select="@No" />
      </th>
      <th>R1</th>
      <xsl:apply-templates select="R1" />
    </tr>
    <tr>
      <th>R2</th>
      <xsl:apply-templates select="R2" />
    </tr>
    <tr>
      <th style="background:#E0E0E0">Avg</th>
      <xsl:apply-templates select="Average" />
    </tr>
    <tr>
      <th>Cyl</th>
      <xsl:apply-templates select="KMCylinder" />
    </tr>
  </xsl:template>
  <xsl:template match="KMMedian">
    <tr>
      <th rowspan="4">Median</th>
      <th>R1</th>
      <xsl:apply-templates select="R1" />
    </tr>
    <tr>
      <th>R2</th>
      <xsl:apply-templates select="R2" />
    </tr>
    <tr>
      <th>Avg</th>
      <xsl:apply-templates select="Average" />
    </tr>
    <tr>
      <th>Cyl</th>
      <xsl:apply-templates select="KMCylinder" />
    </tr>
  </xsl:template>
  <xsl:template name="KMR">
    <td>
      <xsl:value-of select="Radius" />
    </td>
    <td>
      <xsl:value-of select="Power" />
    </td>
    <td>
      <xsl:value-of select="Axis" />
    </td>
  </xsl:template>
  <xsl:template match="R1">
    <xsl:call-template name="KMR" />
  </xsl:template>
  <xsl:template match="R2">
    <xsl:call-template name="KMR" />
  </xsl:template>
  <xsl:template match="Average">
    <td>
      <xsl:value-of select="Radius" />
    </td>
    <td>
      <xsl:value-of select="Power" />
    </td>
  </xsl:template>
  <xsl:template match="KMCylinder">
    <td />
    <td>
      <xsl:value-of select="Power" />
    </td>
    <td>
      <xsl:value-of select="Axis" />
    </td>
  </xsl:template>
  <xsl:template match="Sagittal">
    <table border="1" width="300" align="center">
      <tr style="background:silver">
        <th colspan="7">Sagittal</th>
      </tr>
      <tr>
        <th colspan="2" style="background:#E0E0E0">Fixation Angle</th>
        <td colspan="2">
          <xsl:value-of select="FixationAngle" />
        </td>
      </tr>
      <tr>
        <th colspan="2" style="background:#E0E0E0">Sagittal Axis</th>
        <td colspan="2">
          <xsl:value-of select="SagittalAxis" />
        </td>
      </tr>
      <xsl:call-template name="SagiData" />
      <xsl:apply-templates select="Topometry" />
      <xsl:apply-templates select="Eccentricity" />
    </table>
    <br />
  </xsl:template>
  <xsl:template name="SagiData">
    <tr style="background:#E0E0E0">
      <th>SUP</th>
      <th>INF</th>
      <th>TEM</th>
      <th>NAS</th>
    </tr>
    <tr>
      <td>
        <xsl:value-of select="SUP" />
      </td>
      <td>
        <xsl:value-of select="INF" />
      </td>
      <td>
        <xsl:value-of select="TEM" />
      </td>
      <td>
        <xsl:value-of select="NAS" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="Topometry">
    <tr />
    <tr />
    <tr style="background:silver">
      <th colspan="7">Topometry</th>
    </tr>
    <xsl:call-template name="SagiData" />
    <tr style="background:#E0E0E0">
      <th>Rh</th>
      <th>Rv</th>
      <th>Ro</th>
    </tr>
    <tr>
      <td>
        <xsl:value-of select="Rh" />
      </td>
      <td>
        <xsl:value-of select="Rv" />
      </td>
      <td>
        <xsl:value-of select="Ro" />
      </td>
    </tr>
    <tr style="background:#E0E0E0">
      <th>ASTc</th>
      <th>dRo</th>
      <th>ASTp</th>
      <th>dAST</th>
    </tr>
    <tr>
      <td>
        <xsl:value-of select="ASTc" />
      </td>
      <td>
        <xsl:value-of select="dRo" />
      </td>
      <td>
        <xsl:value-of select="ASTp" />
      </td>
      <td>
        <xsl:value-of select="dAST" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="Eccentricity">
    <tr />
    <tr />
    <tr style="background:silver">
      <th colspan="7">Eccentricity</th>
    </tr>
    <xsl:call-template name="SagiData" />
    <tr style="background:#E0E0E0">
      <th>eh</th>
      <th>ev</th>
      <th>E</th>
    </tr>
    <tr>
      <td>
        <xsl:value-of select="eh" />
      </td>
      <td>
        <xsl:value-of select="ev" />
      </td>
      <td>
        <xsl:value-of select="E" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="AC">
    <table border="1" width="300" align="center">
      <colgroup>
        <col style="background:#E0E0E0" />
      </colgroup>
      <tr style="background:silver">
        <th colspan="7">Accommodation</th>
      </tr>
      <xsl:if test="count(Sphere)!=0">
        <tr>
          <th colspan="3">Sphere</th>
          <td colspan="4">
            <xsl:value-of select="Sphere" />
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="count(MaxPS)!=0">
	<tr>
	  <th colspan="3">Max PS</th>
	  <td colspan="4">
	    <xsl:value-of select="MaxPS" />
	  </td>
	</tr>
      </xsl:if>
      <xsl:if test="count(MinPS)!=0">
	<tr>
	  <th colspan="3">Min PS</th>
	  <td colspan="4">
	    <xsl:value-of select="MinPS" />
	  </td>
	</tr>
      </xsl:if>
      <xsl:if test="count(AccImage)!=0">
	<tr>
	<th colspan="4" style="background:silver" align="center">Acc Image</th>
	</tr>
        <tr>
          <td colspan="4" style="background:white">
            <a target="_blank">
              <xsl:attribute name="href">
                <xsl:value-of select="concat('../JPG/', AccImage)" />
              </xsl:attribute>
              <img border="0" width="150" alt="Retro image">
                <xsl:attribute name="src">
                  <xsl:value-of select="concat('../JPG/', AccImage)" />
                </xsl:attribute>
              </img>
            </a>
          </td>
        </tr>
        <tr>
          <td colspan="4" style="background:white;font-size:8pt">
            <a title="Retro image" target="_blank">
              <xsl:attribute name="href">
                <xsl:value-of select="concat('../JPG/', AccImage)" />
              </xsl:attribute>
              <pre>
                <xsl:value-of select="AccImage" />
              </pre>
            </a>
          </td>
        </tr>
      </xsl:if>

    </table>
    <br />
  </xsl:template>
  <xsl:template match="RI">
    <table border="1" width="300" align="center">
      <colgroup>
        <col style="background:#E0E0E0" />
      </colgroup>
      <tr style="background:silver">
        <th colspan="7">Retro Illumination</th>
      </tr>
      <xsl:if test="count(COIH)!=0">
	<tr>
	  <th colspan="3">COI.H</th>
	  <td colspan="4">
	    <xsl:value-of select="COIH" />
	  </td>
	</tr>
      </xsl:if>
      <xsl:if test="count(COIA)!=0">
	<tr>
	  <th colspan="3">COI.A</th>
	  <td colspan="4">
	    <xsl:value-of select="COIA" />
	  </td>
	</tr>
      </xsl:if>
      <xsl:if test="count(POI)!=0">
	<tr>
	  <th colspan="3">POI</th>
	  <td colspan="4">
	    <xsl:value-of select="POI" />
	  </td>
	</tr>
      </xsl:if>

      <xsl:if test="count(RetroImage)!=0">
	<tr>
	<th colspan="7" style="background:silver" align="center">Retro Image</th>
	</tr>
        <tr>
          <td colspan="7" style="background:white">
            <a target="_blank">
              <xsl:attribute name="href">
                <xsl:value-of select="concat('../JPG/', RetroImage)" />
              </xsl:attribute>
              <img border="0" width="150" alt="Retro image">
                <xsl:attribute name="src">
                  <xsl:value-of select="concat('../JPG/', RetroImage)" />
                </xsl:attribute>
              </img>
            </a>
          </td>
        </tr>
        <tr>
          <td colspan="7" style="background:white;font-size:8pt">
            <a title="Retro image" target="_blank">
              <xsl:attribute name="href">
                <xsl:value-of select="concat('../JPG/', RetroImage)" />
              </xsl:attribute>
              <pre>
                <xsl:value-of select="RetroImage" />
              </pre>
            </a>
          </td>
        </tr>
      </xsl:if>
    </table>
    <br />
  </xsl:template>



  <xsl:template match="CLSelect">
    <table border="1" width="300" align="center">
      <colgroup>
        <col style="background:#E0E0E0" />
      </colgroup>
      <tr style="background:silver">
        <th>CL Select</th>
        <th>Size</th>
        <th>Base Curve</th>
      </tr>
      <xsl:apply-templates select="CLList" />
    </table>
    <br />
  </xsl:template>
  <xsl:template match="CLList">
    <tr />
    <tr>
      <th>Maker</th>
      <td colspan="2">
        <xsl:value-of select="Maker" />
      </td>
    </tr>
    <tr>
      <th>Brand</th>
      <td colspan="2">
        <xsl:value-of select="Brand" />
      </td>
    </tr>
    <xsl:apply-templates select="CLDataList" />
  </xsl:template>
  <xsl:template match="CLDataList">
    <tr>
      <td style="background:white" />
      <td>
        <xsl:value-of select="Size" />
      </td>
      <td>
        <xsl:value-of select="BaseCurve" />
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="NT">
    <table border="1" width="300" align="center">
      <colgroup>
        <col style="background:#E0E0E0" />
      </colgroup>
      <tr style="background:silver">
        <th colspan="2">NT</th>
        <th>mmHg</th>
        <th>kPa</th>
        <th>LowConf</th>
      </tr>
      <xsl:apply-templates select="NTList" />
      <xsl:apply-templates select="NTAverage" />
      <xsl:apply-templates select="CorrectedIOP" />
    </table>
    <br />
  </xsl:template>
  <xsl:template match="NTList">
    <tr>
      <th colspan="2">
        <xsl:value-of select="@No" />
      </th>
      <td>
        <xsl:value-of select="mmHg" />
      </td>
      <td>
        <xsl:value-of select="kPa" />
      </td>
      <xsl:if test="count(LowConfidenceLevel)!=0">
        <td>*<xsl:value-of select="LowConfidenceLevel" />
        </td>
      </xsl:if>
    </tr>
  </xsl:template>
  <xsl:template match="NTAverage">
    <tr>
      <th colspan="2">Average</th>
      <xsl:if test="count(Error)!=0">
        <td colspan="3">
          <xsl:value-of select="Error" /> Error</td>
      </xsl:if>
      <xsl:if test="count(Error)=0">
        <td>
          <xsl:value-of select="mmHg" />
        </td>
        <td>
          <xsl:value-of select="kPa" />
        </td>
      </xsl:if>
    </tr>
  </xsl:template>
  <xsl:template match="CorrectedIOP">
    <xsl:if test="count(CCT)!=0">
      <tr>
        <th colspan="2">
            	Measured IOP
        </th>
        <td>
          <xsl:value-of select="Measured/mmHg" />
        </td>
        <td>
          <xsl:value-of select="Measured/kPa" />
        </td>
      </tr>
      <tr>
        <th colspan="2">
            	Corrected IOP
        </th>
        <td>
          <xsl:value-of select="Corrected/mmHg" />
        </td>
        <td>
          <xsl:value-of select="Corrected/kPa" />
        </td>
      </tr>
      <tr>
        <th rowspan="3" width="20">
        </th>
        <th style="background:#E0E0E0">
            	Param1
        </th>
        <td colspan="3">
          <xsl:value-of select="Param1" />
        </td>
      </tr>
      <tr>
        <th style="background:#E0E0E0">
            	Param2
        </th>
        <td colspan="3">
          <xsl:value-of select="Param2" />
        </td>
      </tr>
      <tr>
        <th style="background:#E0E0E0">
            	CCT
        </th>
        <td colspan="3">
          <xsl:value-of select="CCT" />
        </td>
      </tr>
    </xsl:if>
  </xsl:template>
  <xsl:template match="PACHY">
    <table border="1" width="300" align="center">
      <colgroup>
        <col style="background:#E0E0E0" />
      </colgroup>
      <tr style="background:silver">
        <th>Pachy</th>
        <th>Thickness</th>
        <th>LowConf</th>
      </tr>
      <xsl:apply-templates select="PACHYList" />
      <xsl:apply-templates select="PACHYAverage" />
      <xsl:if test="count(PACHYImage)!=0">
        <tr>
          <td colspan="4" style="background:white">
            <a target="_blank">
              <xsl:attribute name="href">
                <xsl:value-of select="concat('../JPG/', PACHYImage)" />
              </xsl:attribute>
              <img border="0" width="150" alt="image">
                <xsl:attribute name="src">
                  <xsl:value-of select="concat('../JPG/', PACHYImage)" />
                </xsl:attribute>
              </img>
            </a>
          </td>
        </tr>
        <tr>
          <td colspan="7" style="background:white;font-size:8pt">
            <a title="image" target="_blank">
              <xsl:attribute name="href">
                <xsl:value-of select="concat('../JPG/', PACHYImage)" />
              </xsl:attribute>
              <pre>
                <xsl:value-of select="PACHYImage" />
              </pre>
            </a>
          </td>
        </tr>
      </xsl:if>
    </table>
    <br />
  </xsl:template>
  <xsl:template match="PACHYList">
    <tr>
      <th>
        <xsl:value-of select="@No" />
      </th>
      <td>
        <xsl:value-of select="Thickness" />
      </td>
      <xsl:if test="count(LowConfidenceLevel)!=0">
        <td>*<xsl:value-of select="LowConfidenceLevel" />
        </td>
      </xsl:if>
    </tr>
  </xsl:template>
  <xsl:template match="PACHYAverage">
    <tr>
      <th>Average</th>
      <xsl:if test="count(Error)!=0">
        <td colspan="4">
          <xsl:value-of select="Error" /> Error</td>
      </xsl:if>
      <xsl:if test="count(Error)=0">
        <td>
          <xsl:value-of select="Thickness" />
        </td>
      </xsl:if>
    </tr>
  </xsl:template>
  <xsl:template match="PD/PDList">
    <tr>
      <th>
        <xsl:value-of select="@No" />
      </th>
      <td>
        <xsl:value-of select="FarPD" />
      </td>
      <td>
        <xsl:value-of select="RPD" />
      </td>
      <td>
        <xsl:value-of select="LPD" />
      </td>
      <td>
        <xsl:value-of select="NearPD" />
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
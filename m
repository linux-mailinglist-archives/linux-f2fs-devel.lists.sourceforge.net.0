Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E3A93AFC1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jul 2024 12:21:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWZ7t-0007IR-6M;
	Wed, 24 Jul 2024 10:21:41 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1sWZ7s-0007IK-BT
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 10:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8H8uOA80LCcAeLWbw0mMEJimoYhNaWRIFK+pZQ0pxk4=; b=A40dI1nvM2+c1D+lnFFafHR0vf
 2xEYCeqhTkXPwelUfiSKMmIhT1NTFCHe90lYgPe1Eejng30Dr7WFW24EV6q+ezbqyouYVBbkMBAOg
 WYtzBXqF6fpTuo7z4iGRptfKbEdiJwwV+Yua51tZ1KMrJ6r/Pihc87XViII94UPbVKIg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8H8uOA80LCcAeLWbw0mMEJimoYhNaWRIFK+pZQ0pxk4=; b=E
 UIbUUK2kOCw0GU7UzMYn+J5BHHuQQxwqNFlR4Z9OmePESasgsT++SgUi0NQIf3/KHhMqQq+wA+l6N
 0nzni4V9h1tL2azdSh176Dm+57RjZk4I9WRZn7EStsRX8j42EhcCEOwhAABxrJufruOoqOzyFDWHP
 7TDrDK7YMurvyM+c=;
Received: from mail-psaapc01on2053.outbound.protection.outlook.com
 ([40.107.255.53] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWZ7r-00061F-KW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 10:21:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYNJgeVcER8eNWnX+Uf4MNXSIy3hptYDRTFmN5pqfG/vqmpmSpCD7LIPtdE5ak8EQjlyqHc/e/HHCm36v469WekA7SXtFoVNule4ziJXHQvNVrhJdMOu8xHxZZWxxWaUAq1OeuXRLq64lP9e3cLQVar8yzD4bjlVtJErqo0+2W1phj3l7+b06TWwV2UkRWgziRAjpbH7hG6ajOyswSp+pHu11+v4tEaxmQtYgL8oLCkcJ+ArZ/XVN7Wm5XEcd6pNvDQBpSQ5Q9hqvaz73s2YWQuXrhHCca3cMlTH9T7+s6Wvr55s0QBO5hjfdZxYJKOpH2NaIAP32FG4ciC5/WaJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8H8uOA80LCcAeLWbw0mMEJimoYhNaWRIFK+pZQ0pxk4=;
 b=BatltojdeQfmNudI3R2FfWbIwwlToZI57a29cp2pDEDDIToQ4B0+cd/Xo6/rtNHihEHkRBNK/DQOVbUPNy3MIZMBFLEsdkFOd4pySWWgKU6f/Wm87xfoMs600pcRchqwDO9ASILIOLBhwxAzwjHjDENdC+wD8wpzjRHC+SRRwrg+urLB+JYixAtTvKWbjQgLd4aEWstFgLt9b8BNdMLLrPrgnPESSXMLDmEpmMyQA/EGssCG/Cp2GBUBgplzhvVaLSf1IIHNvXrUGx2tvPTPkVO2W9xQakzIjlt2CDGJT0B36YYPaBi++nEYfR/b8gzjqlIeMuwZ1dzuSuUYWfDrzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8H8uOA80LCcAeLWbw0mMEJimoYhNaWRIFK+pZQ0pxk4=;
 b=JYVsgCpnBzdBnY8q27SR8FI+AhC2rOMXuAQP++7uZSltBtn/RNiI2OmbbIyVHiVHEDBT1YmWqV8bdKL/rGsdeRnfszZNime94tb3qqO00I04ao77CqzhzHj5wBHbaKnKFT/PwYxmW6VfYR9FMP0x/pxJ96yLiF5N1cyufPwUmepVRav5rPMflBjuIm7JhYNtJCiJjHUwEV1a+nP77NZ+dFZ+OMxEJBOergKw9n3aDK6KdXTq8HH3/21J1q5oAfvRLz42FjGr7wItDK/TVD0sp39zoN7E6Q2jFvaGL0kILsUvFvHeVN6qQh9PU0eBotDmVsLHbBQWJoKKAF4qHIufWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by JH0PR06MB6656.apcprd06.prod.outlook.com (2603:1096:990:2f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 24 Jul
 2024 10:21:20 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%5]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 10:21:20 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Wed, 24 Jul 2024 04:35:43 -0600
Message-Id: <20240724103543.2666271-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|JH0PR06MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: 45f78ff4-c22d-47ad-0ca4-08dcabca5ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M7dAwzeintYITDaG+qqKj/rF9/LzyJXAJckb76t2tgspKFXg1uGnxY4CtFr+?=
 =?us-ascii?Q?tT222f5bRNiaWQAE6pDDXsk+o4Sl0xJJK4J+fxe9F8dWl9o/9sscHNb6H0Mn?=
 =?us-ascii?Q?FUeKUzkoEew5sO2VJxCf6h1FyPXd8DUcJ0nQLvEN/4Rnz6YWX6UIE4vjBQFT?=
 =?us-ascii?Q?GxOpoPJpxhdJ4ziiDgDarmc8HObZeoavvPP2qHs1QOEGQqKdviUxFbvCzWyO?=
 =?us-ascii?Q?RkcyQc2eIdKz+5Y0izAzSFTc2Dq77dpVcMRB4UfvMb08mnObJoKKYxkmXxng?=
 =?us-ascii?Q?UGX95wCV+SEFw54zpuCd18VsNzOaC1q4IVz94dv15slX5nCgcm/iC2agbtKV?=
 =?us-ascii?Q?d0nCBTQTBsJqll/t8M0IZVTDZQsOVf94lsQGFmPenCff54GBNZBquTkFgz1Z?=
 =?us-ascii?Q?vvWigkRSKXNDgd6Om4sBwW66IdhhKWexMPiju46dESt/37ZTMJRI7IJhZgI1?=
 =?us-ascii?Q?FrYnm5uAxYkyUySqf8O8YKjr3sehCUdpcGBwlZ53hmG76t35xuqF0MtyfowD?=
 =?us-ascii?Q?0GYww7mixY3GNY+1/YK6KobPSvpE4eV14dVjdtQCjSICmwnfEceHX0S+x3pc?=
 =?us-ascii?Q?wm6iQfbcJNpMflK7mwfBVnZn+keahwayyW8dpQo4BZz8UkGqHX7NRZ6rWrsR?=
 =?us-ascii?Q?WxZLOKSIaPqVr82DNz7Yd7AbMOprLuUUnKUc0N3jYg36BbvRTcwc1ORU85Qb?=
 =?us-ascii?Q?6jnS+FLmPw9sNMEe1jR2VqjxW44ylfg52lMff5BnGNgxVvoyDFUG/Az605Xo?=
 =?us-ascii?Q?VrArpXOblpKUV52ywuR5ptz+BrxXvYJLHPtevlpHqHzvQSSYHa6IvybFHbFY?=
 =?us-ascii?Q?YEMjxpwugZ2RYuik7Um/hVj+LkdOVMnoehepwqOv3ICqSs7ZYYgDKpanrExP?=
 =?us-ascii?Q?t7cFUV+yePgPQurudvtREwjX30etlL92w2uIJzuDd/glcbNDqOOcwE3hLkXe?=
 =?us-ascii?Q?L4O/mO1CbZyQ7wKMfmfQ88zmsQx/KIiqwfVbkkKuiSM9SrLVC6qszZVKkCCY?=
 =?us-ascii?Q?liJn2RODCw3fi67Q5yPvA+6XnssJMGLFQC0LRz+lGCLE7MW5Voq/vgDzhqyj?=
 =?us-ascii?Q?r6B8P4UnT8bQ0CthFnpXesXqzQ8Ae4d4W0XwWfVg9GZ1YXSPRhG5ISI30/Vr?=
 =?us-ascii?Q?oaFeujjKqEP1XC08ctrOSd+5v8kBjjbTbSLCiz4k70s5Av9u/RDjUN80a4vl?=
 =?us-ascii?Q?f8s9YVKeu5yUxyWSDftI8s00i8SCYm1DEQln3zCkZzAq96YAVwvbqZP7/d1S?=
 =?us-ascii?Q?gQkju5P9VPaUkQueh2XXLxvC4gFP/ULiQM6ys3LaMBY/q/dCgvP7/5ASiISt?=
 =?us-ascii?Q?DJfFavBAB+rMSGE7relNbKiQ6bK7EtvDdm+d18Alm2XSFEyDVRWBqDaigwDe?=
 =?us-ascii?Q?tVc4PwyPwES0XBKvdT1fkCBQkoK2JrO9c06SjHiwTll6+c+dow=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rnJNKH+a74OAVt8WK6fiT34Vi/sHoJe21i6HcT32RcATgVTKGEU2OAs+z6Hx?=
 =?us-ascii?Q?8OX7+LxjQDu3PxOBcL2TQUm5XRpgWwU8DeJkm3znPf95oCCRDQ6tKMwYPdfq?=
 =?us-ascii?Q?c5VfFvKDnbUv4hQ/JUoVeir9cjun0k7Olgl7Rxykvlw5NPjVJhe6DHoOLy2b?=
 =?us-ascii?Q?8dSV91LljLXwFkYIa3MkSffo07C+LvGGARUlJDeeWKEpuEdVrp1F38P1fOcd?=
 =?us-ascii?Q?PiNLHyZpxV6kbQ3jyiEkQ5q0wyfj7Gm4Ew+Z8z/LZ8vVFnTTvAN9yEmJD3QP?=
 =?us-ascii?Q?IcBwAFfYSv+AzcGwY/QHZx6rbRnijmTvc5kBolLwU2Gavjy2gmz1b1oO79f/?=
 =?us-ascii?Q?rE9ToRjXNc0OPPXymiRAmsZpkhYccJ/InKOxPs0un9CyqMcZrMKs+0iNgHlz?=
 =?us-ascii?Q?+aFircBKr+3mQh605YH0zSk8btXyF65NL2sJWFOQK47U5BJ8X5YMEA7odkVD?=
 =?us-ascii?Q?AVkhsXj7ea8Adnme+GQXxwbttSGXimGnuQ2ykhLGFP6sUKEurCSSH2vQ1fkH?=
 =?us-ascii?Q?KbAlkmQuTiOab/+ol2ptJysOP4J1zuaNxOoHX6o30rXmzXCXfqBrXB8QYK7G?=
 =?us-ascii?Q?qAbPwKIvd4ijy7kQC3OhdK0CoXUHim4ZJ6SiDrWH+VtS5rLQYWGusI13gguA?=
 =?us-ascii?Q?06W1wbCuEo3mUaTfgIvvL9gWXWHiMXoHE0HPl4wvnPHYVcoVUnEf7bajk+IQ?=
 =?us-ascii?Q?l3OwwWlY8Vfio8w6qYVNGRbmtksMekoZhQ+TKME1A0lRXskwopkLoKCzvM7s?=
 =?us-ascii?Q?cIFBIzRp1Y8O8+Sz4XdJ19B4aUyKAW+tNlRTVeF1H/s3pxMqlUrXx2wve/Yg?=
 =?us-ascii?Q?QWKZx8x8Vd2Q3F3aBIht8QvLMPAwh896F6o7wE/adbknd+8ed3qSu0e+RhUC?=
 =?us-ascii?Q?6zGGpQNpNaF+1gT1pCIWN8IkrgRv3DTv97HX8l+H3B7mV+ssu8QkpLHOggyG?=
 =?us-ascii?Q?Pnodvo4HjCP79fBf74AoIa315RdmJJLkSDGJZ7JFkSAXf9W6xfhTDtrrKYD7?=
 =?us-ascii?Q?iqjMtIyGPKfKmIYsW8wTomBMo1E1xSLMQZUhEQc/JLT8GK58Oo46hN51PJVL?=
 =?us-ascii?Q?P7hVd2g3nTF5+p3f0nAk+x1yVJnhd5UGe3Al4kNINsik/c3VWbYDz6d/a44B?=
 =?us-ascii?Q?bvAm3JhSFuP3x21Ab/O11I5H1Y6ZrYAffXCsbkINOVIbyKwL+FA/LlMGtf93?=
 =?us-ascii?Q?7IFpiT4uXnhj4DtuXpZyB/fku82CxuPXnCcGlsdwnZjIbAnn02zoOF3aj98f?=
 =?us-ascii?Q?f7EmtJxZTzihB/Q4rReAS3b8VMU3F9RCMVXDZJs3H0g7pBFaXdOowYEoFKNe?=
 =?us-ascii?Q?9dMeheIOh9q1/0btNAAe3yfmurdAapufjRuVPElYWhQO9LR0ywrDz7npM7iE?=
 =?us-ascii?Q?hpCfUDQOzywgpEmV8+Z+opPHq4TeXZ8mJm324FwBu8Hhmv3x424NopuNOBF1?=
 =?us-ascii?Q?/A2qZaAQkz3vMa7Kf7ybxemHyTGrOOksVOVezywoxme9iSqtRcFzvPRcj7L0?=
 =?us-ascii?Q?1VIjJpfrv1FrjsDXivbt2pbn8umeVjvrmSU+DF6XEX5ppfazecFwC8mq7V5K?=
 =?us-ascii?Q?ICcu6qdLua2fa9IHuFw9Igg5wIRWv74xxzhrVyAs?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f78ff4-c22d-47ad-0ca4-08dcabca5ca0
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 10:21:20.6929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IG200Up6kQihgTrwF2OepcCtuNzyxfNQQyFDe04Zgzg/f5EHX7u2Pk4clz31qfrPfjaO4f5E2FiIPllGESvjQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6656
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The cp_ver of node footer is useful when analyzing data
 corruption
 issues. Signed-off-by: Wu Bo <bo.wu@vivo.com> --- fsck/dump.c | 33
 ++++++++++++++++++
 1 file changed, 18 insertions(+), 15 deletions(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.53 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.53 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [40.107.255.53 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sWZ7r-00061F-KW
Subject: [f2fs-dev] [PATCH] dump.f2fs: add checkpoint version to dump_nat
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, linux-kernel@vger.kernel.org,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The cp_ver of node footer is useful when analyzing data corruption
issues.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fsck/dump.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index 8d5613e..ca38101 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -21,7 +21,7 @@
 #endif
 #include <locale.h>
 
-#define BUF_SZ	80
+#define BUF_SZ	256
 
 /* current extent info */
 struct extent_info dump_extent;
@@ -38,6 +38,7 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
 {
 	struct f2fs_nat_block *nat_block;
 	struct f2fs_node *node_block;
+	struct node_footer *footer;
 	nid_t nid;
 	pgoff_t block_addr;
 	char buf[BUF_SZ];
@@ -47,6 +48,7 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
 	ASSERT(nat_block);
 	node_block = (struct f2fs_node *)calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node_block);
+	footer = F2FS_NODE_FOOTER(node_block);
 
 	fd = open("dump_nat", O_CREAT|O_WRONLY|O_TRUNC, 0666);
 	ASSERT(fd >= 0);
@@ -54,6 +56,7 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
 	for (nid = start_nat; nid < end_nat; nid++) {
 		struct f2fs_nat_entry raw_nat;
 		struct node_info ni;
+		int len;
 		if(nid == 0 || nid == F2FS_NODE_INO(sbi) ||
 					nid == F2FS_META_INO(sbi))
 			continue;
@@ -66,15 +69,15 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
 			ret = dev_read_block(node_block, ni.blk_addr);
 			ASSERT(ret >= 0);
 			if (ni.blk_addr != 0x0) {
-				memset(buf, 0, BUF_SZ);
-				snprintf(buf, BUF_SZ,
+				len = snprintf(buf, BUF_SZ,
 					"nid:%5u\tino:%5u\toffset:%5u"
-					"\tblkaddr:%10u\tpack:%d\n",
+					"\tblkaddr:%10u\tpack:%d"
+					"\tcp_ver:0x%08x\n",
 					ni.nid, ni.ino,
-					le32_to_cpu(F2FS_NODE_FOOTER(node_block)->flag) >>
-						OFFSET_BIT_SHIFT,
-					ni.blk_addr, pack);
-				ret = write(fd, buf, strlen(buf));
+					le32_to_cpu(footer->flag) >> OFFSET_BIT_SHIFT,
+					ni.blk_addr, pack,
+					(uint32_t)le64_to_cpu(footer->cp_ver));
+				ret = write(fd, buf, len);
 				ASSERT(ret >= 0);
 			}
 		} else {
@@ -87,15 +90,15 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
 
 			ret = dev_read_block(node_block, ni.blk_addr);
 			ASSERT(ret >= 0);
-			memset(buf, 0, BUF_SZ);
-			snprintf(buf, BUF_SZ,
+			len = snprintf(buf, BUF_SZ,
 				"nid:%5u\tino:%5u\toffset:%5u"
-				"\tblkaddr:%10u\tpack:%d\n",
+				"\tblkaddr:%10u\tpack:%d"
+				"\tcp_ver:0x%08x\n",
 				ni.nid, ni.ino,
-				le32_to_cpu(F2FS_NODE_FOOTER(node_block)->flag) >>
-					OFFSET_BIT_SHIFT,
-				ni.blk_addr, pack);
-			ret = write(fd, buf, strlen(buf));
+				le32_to_cpu(footer->flag) >> OFFSET_BIT_SHIFT,
+				ni.blk_addr, pack,
+				(uint32_t)le64_to_cpu(footer->cp_ver));
+			ret = write(fd, buf, len);
 			ASSERT(ret >= 0);
 		}
 	}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

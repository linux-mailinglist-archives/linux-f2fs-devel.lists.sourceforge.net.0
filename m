Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEB69748CF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 05:43:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soEGi-0005jC-Rm;
	Wed, 11 Sep 2024 03:43:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1soEGe-0005iq-U4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:43:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zV/wxBoWCpRDMX0E9pav3c5V0+kf6YRvt/E5k66a+Hw=; b=UPGO77s5mQph01ZVD/3T0rkupJ
 1KAlpW/iyZB52dQa8tnNitS70Ph/dn6/c+hDM1cu4bpqu/XSK1/i+O7azCJVbfk/DyVSJw6aFtGoN
 Y6KpZtDP4mpt9SliHfO4blP0pg9cHgLjhtt9qDco1pHfzf7JZLawqlBlQqCN4QV7UMm0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zV/wxBoWCpRDMX0E9pav3c5V0+kf6YRvt/E5k66a+Hw=; b=FNh+qIDtSMpAQaJvjsMFXzKjA/
 PDiq0WE+p8otMcV6WH+GOhUVa0GIZGCUEBX+uXqa3+vBDHzDVyiU1W2qLGRUl7L9aYWbH92Kb2Yod
 oc7pkZ1rCVkbb8rW+eWA64hheGnyBdi1I2lx89E/dgNh6zaSwPNkTvknHglmqhihhSp8=;
Received: from mail-psaapc01on2082.outbound.protection.outlook.com
 ([40.107.255.82] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soEGe-0000Nz-5S for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:43:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+b5xOUs/5XQocYYzM5uAz//ua+J5MOYZc6TlCuBM6s5fIJajy0X4phmPNqZtCYdudZXbGELbyaI3SSc7w4xFlhck4/j/jjHY2LqaZm5smFslDQ40YRmf+whabxu9lDQ5yFu/GnNsX81W+6M4wpv3vfIu3MVZGK2EzgOTLVpkTaacxeoJQHafBAjx7CZW1I3Rg7k6vUJeGjK1OJye8iZFxYiSVXdAiVcBbdDyqd6RLS4DB9QSNHt85cqr4Puj3QulggcGh9vmGKDI4UNPJS09up0qd+tZOhDKlCFT/dPrmZcFDcEZwzyjx0Y0+Ve9FDupiqJxwAvY7/cCQLi8977WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV/wxBoWCpRDMX0E9pav3c5V0+kf6YRvt/E5k66a+Hw=;
 b=sL+JWr7A5cpD+rOGEidH28O39XMfEr4EMzyibE9eZXNEMGdkZBFbMOJRa77z5vXD3ztJl5Gq9Lv8OKRSkfs8R/kXo1Kc7AIrFJZiU1JulhWBj0CkblDVodVzu+718MHJl4C6jjYKUggNG3zCx0Pcj0ttBvLY2qbPU+zm+E9EprmNf+hHAUwci4/OKlQWToLkCStl4P0lBr8+OSKWiYGh7Por0iVNfQzCqXIJw40kGTEPHN3+ecCCQ0Cj9qN4VobHt+O4cA2SH1hdB9VCt4QIMmmw/cq67wRd8EHEBc8EJ/lMfmr2f6oEDRwXvMl9vZs/B5rsDySehX6qTjnmklIHGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV/wxBoWCpRDMX0E9pav3c5V0+kf6YRvt/E5k66a+Hw=;
 b=L+uDI7CnyUL8jdgiwfGLg+hKnlfKEAEPUYIHLn8PF77vKqOUgMGctrL9wL1HYf0nd1TpTuIdIiIIEnMNwT6M8mxVoXenIodjz4zlGGlBTr1/p/MKXS0bbXJOEz7Hb2Z+xlxOAO11wZ1CzbsPouKEUp9ciAyvLkjMQk/5wMe4vC+2x03f7/3YnxwEaF+kPMjmB68tBHrB/Ein1O4pjK1d5pXqUj8moon7n7JpL3WzOueWMbApJSqo9IwzfW9wJJjDzljVkVKKPq1uK1x998HRmhcNPRxJ6X2VR1dVkY9YC2c6N9zMirvpg06V1o7EvX/vNCQpLQdd3VXzv3a8FHq0wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by JH0PR06MB6917.apcprd06.prod.outlook.com (2603:1096:990:67::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 03:43:35 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 03:43:35 +0000
To: linux-kernel@vger.kernel.org
Date: Tue, 10 Sep 2024 21:57:17 -0600
Message-Id: <e010cbd19a2aadf8d152e43867b9bad98567624b.1726024116.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1726024116.git.bo.wu@vivo.com>
References: <cover.1726024116.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|JH0PR06MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: c8505183-3bfb-42cf-2784-08dcd213ea11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yLtzmSq2G1IeBkYrVwcs9Pegz+dmRCu/LJknhNkEktrPhu0N+pTD5g9lQ6PJ?=
 =?us-ascii?Q?m5jOHW7FFezIBAeE5pJNyiyJusraJAMgKPzVdLZPKffCsCOF6nMpGZu34UVf?=
 =?us-ascii?Q?n+b9jS3lhNKyPBhRDTg0WqN1QbZpNdHIgclgvheEh7fImppAztJqoCpMiu0L?=
 =?us-ascii?Q?1/45vRs5rYcQwysYGwSmCbdfTcCyxGQpWkbPF1TqddmJ4HHbodlOgNfEtJGo?=
 =?us-ascii?Q?5fIHu79VqdkF38qe3So5hd7EsTUGbq5gsLLXo0PR3K25ITYrwLvsKZ2mL7Xr?=
 =?us-ascii?Q?ekxqjM0dln5RSTmL8LHKqzSdZhOf5QSJH2gdnUPyl1Bs8plRoinVobZmQvO9?=
 =?us-ascii?Q?jT1fQERrOVZzcXwLGRmPxgwloLwgEzNHDzTmqMrA5/rweTZX+NGIM6hYvbjM?=
 =?us-ascii?Q?wkX16jdsnbhS8bHb3gZ/75kGqmqfo1v39cdybyMSZZmQf8SHZgL0MFKFh44q?=
 =?us-ascii?Q?X04v+IwweQmStsOJxEmtpnWksmJaJfzKtdPosbF+nNqezJQXGCamlSbafkTD?=
 =?us-ascii?Q?r7ecERNn7AVOx1+U1wpCHi2O+JTF4i6A07PgHDrM5LsGOxf9uyiBsfjJ9lMt?=
 =?us-ascii?Q?RJ7oV1yJz53ogNzPGqrap1Gu57oVMzDr1sSpgNf/+L1Dsc+ExuV1Yz7vprSK?=
 =?us-ascii?Q?W41h5+Qib9R+NvJcHHTVcvNCcbEQGd90l4R0xcYrHX5qWDMhpAuZVhziPfKq?=
 =?us-ascii?Q?D8Uvk4ouhy37g2FJ2QhR5nV4SZ9t1UHucR+s9x0WLAtQxpVkmlbpFETNgdnS?=
 =?us-ascii?Q?WGg3cxammJ9n9d17UngnqYwIuC3kf8M9oH2//PXSBlDZnVylFh6rUwDCLdik?=
 =?us-ascii?Q?uShnvie09y9+XNswdZgJ1ACckhYEhSbtxMe9WgXrBxv5gywojhbDcwfotRIz?=
 =?us-ascii?Q?QOX8geF6MBkvVGSNUM0MjUyD9rSE4IwQ5owuBucu5t0nlHl0ETVS5uanqujW?=
 =?us-ascii?Q?zeu9U8k0bh+sSCjSxtwnXaXC8wJ9HeO1ovqQc6/cV2895O0Rb1fHwjvroHSw?=
 =?us-ascii?Q?5gNe1ERevjdH8oVdTBIqmBBn2YfhLqFUQb6k4UF+BdVfJSVioH0VZ4Dtfn7G?=
 =?us-ascii?Q?Vy66YZLu1MfNVA6Tla0iTD7J1Kl4e6cjKFMGd3bZ/DXyfoKgYtpVaxkPW/S8?=
 =?us-ascii?Q?pjbV6qxA45q5q7C/+b+zawWTRiBR+Eg+xgkvlD2IBzyyk7Qxr7VDEF6KaL31?=
 =?us-ascii?Q?T6vVDlLjyzGOLVQeRl6eUTfPOcJczsOFImXzaJizwa5NhevsP58SxR1p6P/V?=
 =?us-ascii?Q?DqIESPTyMWTr+4LIFPY4zKk3viX072wzJ+hlaGSrX/YhlgyCrThkjGMOrLuS?=
 =?us-ascii?Q?mb/gbAQZp75p0znjsN9+JIebcEtH7gnfOBJJVcabhEF2MT+wWVxDnZvKATuO?=
 =?us-ascii?Q?ZjJJI5PGqDPjeF8LWOtDOwOTlSY6xHD8dUCwZAc3OSLPl6wxCw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d5VS0CcjORqSCPjnC82nRv6k0pf+dCtKBXsQat9Z5ilIAr+AkCOA3aeVwo4N?=
 =?us-ascii?Q?CTASaN+yDQt4s+OGR+YwTTDAI3Ws6q5QMjR2MBeSYl2g58A1FduB8YbbO3N6?=
 =?us-ascii?Q?/f/Xf5+zSz3qJUrgxNrOZ7FrS8shpl/Gq+5QY0tWuZqcQtQWmSKRMvs2qbEK?=
 =?us-ascii?Q?6Yr280xJCqDshVGjza6BAHaQxj5R9mroArNuAwd6F9gJtK51apEokkzaCZkx?=
 =?us-ascii?Q?3RLW58La/t0Quo/7Ngtds/+sgCqfBLcp6G5gOkfCKxtHh6BsRnIYe5sKVGKR?=
 =?us-ascii?Q?SStEzphh54ti5eMgVE4ORx0Uz1rTANYhvmdRDMMOJpxeE3QzpUG0lgnCpe8Y?=
 =?us-ascii?Q?mAgC0zh1T+PsZa+DNsixVs7LBiat/zmLog716NdwUFu9kqodONJGEG4W1+Qj?=
 =?us-ascii?Q?KFORDvAem6K6i0K/MPCwslju5ApLhBoS5JYlwBhVaOW3S7RtVxrAQ8/jnFjT?=
 =?us-ascii?Q?CpFG6D9oag12U8rpLIlNQ1NiQBA4DUqiNRJAU/CQT/ZT/+PoqLXqdktua5bq?=
 =?us-ascii?Q?ya+v2Q/IKE6PxcrFJFiIq46lC4MnEuJ75f3uuOhvdafmUsR+59GS8zTndCES?=
 =?us-ascii?Q?5pRxU0OdohLDQluw05nbcKx4es3Kz3bxaDRCPwXvSHLuxL9r6vsmxZEcnPw5?=
 =?us-ascii?Q?5W61t2nroxfsdL6SCWbdzWqzTGG+o6zcNg2SM86VJ7Yw7DfDWxXiTy+/10Nx?=
 =?us-ascii?Q?MFIis29szLwf/RdT7RYxmk0awGJY0t3KeC58odKbQBLOyYYLztAn6iaoKHd0?=
 =?us-ascii?Q?GZVJF353MG3Z3czO4RDuw+M54asNpwe77RG3++8c2GO0aC/5rlqxS9SqSy/0?=
 =?us-ascii?Q?0ahZ/Ui2MF+CYRduXpwJVtephqTNHzfzjn3e+QpPz+jqebqFtnYxCts/1Z0q?=
 =?us-ascii?Q?zjiIVfOMBTwapv7m0Unj5LkF3SvrZuxP123p4sDrwG6gBRQA8RRu2+9dmW8y?=
 =?us-ascii?Q?+aMqylPHjUXGuAvkOixG87b2S+nxSv2R6Q/orFz2fjsNq5ZqWNGOlYhrymOs?=
 =?us-ascii?Q?BUaqPu5lhcCwVrkyOONlYaOzCIcDFDG7QWtzGCMLqYNVfzZQwYWr/GHzwFSS?=
 =?us-ascii?Q?Hoaln/99n306ANhbyI69S4GCI8UT3YKBr70BKWtgEQN+z7kxIXXMO3lYiPrm?=
 =?us-ascii?Q?uaJAAZ/PO3YwHjFCnFmmOGOz6AxqRAqTDQK4nOIRvfqgJ8gTDVI7SJ5B6gcJ?=
 =?us-ascii?Q?SoCOrJn6hCbI6c3xiWJ2z8OLBA7bUdpNlX9b3vFYFnRh5W3HtFswXzm9Hrz7?=
 =?us-ascii?Q?VOpYxsZEErs6edMlfUFDtFjYtmMJQLGsMhulLn54aM/ECzmp/LxAiy+CcVXz?=
 =?us-ascii?Q?qAdRz25WyCl4DFhv8NUFBKVI36YiU2MC2KBmnKhfw96TFw0BYBO2wuRTa4T3?=
 =?us-ascii?Q?zo4JC6bMUyjVAwwR8oEYXrAheHC9E+597f1y6fpaW4MSM7fb5SkYFwZgVDbj?=
 =?us-ascii?Q?pG5HxijqOvYBn/zKF3rxe1Z4cpaDmj1YbFT45Pr6nxI1a8ApPUoR2EYHfolK?=
 =?us-ascii?Q?mOSGV0/opfmn1R6CK//tpGOjkhFaHE/ih0HV7nUo75Ot67TzJuQEzdA/s3HJ?=
 =?us-ascii?Q?vWgLoxEAxUBwwJ88iKofb2aFKNATG5YAs6bT1FEm?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8505183-3bfb-42cf-2784-08dcd213ea11
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 03:43:35.4207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKB/AfMEfvK0ms7zGAkZg0jKJkw1hU3vxiLKINQFZJ7YyBxpH0AwOTh73UNqSfrYpJH6r3eQSrvxtKp/BeGv7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6917
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Expand the inline data read & fiemap to support inline tail.
 Signed-off-by: Wu Bo <bo.wu@vivo.com> --- fs/f2fs/data.c | 31
 ++++++++++++++++++++++++++++++-
 fs/f2fs/inline.c | 26 ++++++++++++ 2 files changed, 42 insertions(+), 15
 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.82 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.82 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1soEGe-0000Nz-5S
Subject: [f2fs-dev] [PATCH v2 04/13] f2fs: implement inline tail read &
 fiemap
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
Cc: Wu Bo <wubo.oduw@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Expand the inline data read & fiemap to support inline tail.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/data.c   | 31 ++++++++++++++++++++++++++++++-
 fs/f2fs/inline.c | 26 ++++++++++++--------------
 2 files changed, 42 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index cd13b5703228..476325a26d4e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1922,9 +1922,11 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	u64 logical = 0, phys = 0, size = 0;
 	u32 flags = 0;
 	int ret = 0;
-	bool compr_cluster = false, compr_appended;
+	bool compr_cluster = false, compr_appended, inline_tail = false;
 	unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
 	unsigned int count_in_cluster = 0;
+	loff_t i_size = i_size_read(inode);
+	pgoff_t end_index = i_size >> PAGE_SHIFT;
 	loff_t maxbytes;
 
 	if (fieinfo->fi_flags & FIEMAP_FLAG_CACHE) {
@@ -1983,6 +1985,16 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 
 	/* HOLE */
 	if (!compr_cluster && !(map.m_flags & F2FS_MAP_FLAGS)) {
+		/*
+		 * There is a reserved space between address array and inline
+		 * data. So it must meet this hole state before inline data.
+		 */
+		if (f2fs_has_inline_tail(inode) && start_blk == end_index
+				&& f2fs_exist_data(inode)) {
+			inline_tail = true;
+			goto fill_extent;
+		}
+
 		start_blk = next_pgofs;
 
 		if (blks_to_bytes(inode, start_blk) < blks_to_bytes(inode,
@@ -2000,6 +2012,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		goto skip_fill;
 	}
 
+fill_extent:
 	if (size) {
 		flags |= FIEMAP_EXTENT_MERGED;
 		if (IS_ENCRYPTED(inode))
@@ -2013,6 +2026,13 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		size = 0;
 	}
 
+	if (inline_tail) {
+		start = blks_to_bytes(inode, start_blk);
+		ret = f2fs_inline_data_fiemap(inode, fieinfo, start, len);
+		if (ret != -EAGAIN)
+			goto out;
+	}
+
 	if (start_blk > last_blk)
 		goto out;
 
@@ -2377,6 +2397,8 @@ static int f2fs_mpage_readpages(struct inode *inode,
 #endif
 	unsigned nr_pages = rac ? readahead_count(rac) : 1;
 	unsigned max_nr_pages = nr_pages;
+	loff_t i_size = i_size_read(inode);
+	pgoff_t end_index = i_size >> PAGE_SHIFT;
 	pgoff_t index;
 	int ret = 0;
 
@@ -2397,6 +2419,12 @@ static int f2fs_mpage_readpages(struct inode *inode,
 
 		index = folio_index(folio);
 
+		if (f2fs_has_inline_tail(inode) && index == end_index &&
+				f2fs_exist_data(inode)) {
+			ret = f2fs_read_inline_data(inode, folio);
+			goto out;
+		}
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		if (!f2fs_compressed_file(inode))
 			goto read_single_page;
@@ -2462,6 +2490,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 		}
 #endif
 	}
+out:
 	if (bio)
 		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
 	return ret;
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 2e63e9389fd7..30b18053e784 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -86,8 +86,6 @@ void f2fs_do_read_inline_data(struct folio *folio, struct page *ipage)
 	if (folio_test_uptodate(folio))
 		return;
 
-	f2fs_bug_on(F2FS_I_SB(inode), folio_index(folio));
-
 	folio_zero_segment(folio, MAX_INLINE_DATA(inode), folio_size(folio));
 
 	/* Copy the whole inline data block */
@@ -126,15 +124,12 @@ int f2fs_read_inline_data(struct inode *inode, struct folio *folio)
 		return PTR_ERR(ipage);
 	}
 
-	if (!f2fs_has_inline_data(inode)) {
+	if (!f2fs_has_inline_data(inode) && !f2fs_has_inline_tail(inode)) {
 		f2fs_put_page(ipage, 1);
 		return -EAGAIN;
 	}
 
-	if (folio_index(folio))
-		folio_zero_segment(folio, 0, folio_size(folio));
-	else
-		f2fs_do_read_inline_data(folio, ipage);
+	f2fs_do_read_inline_data(folio, ipage);
 
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
@@ -814,7 +809,7 @@ int f2fs_read_inline_dir(struct file *file, struct dir_context *ctx,
 int f2fs_inline_data_fiemap(struct inode *inode,
 		struct fiemap_extent_info *fieinfo, __u64 start, __u64 len)
 {
-	__u64 byteaddr, ilen;
+	__u64 byteaddr, ilen, offset;
 	__u32 flags = FIEMAP_EXTENT_DATA_INLINE | FIEMAP_EXTENT_NOT_ALIGNED |
 		FIEMAP_EXTENT_LAST;
 	struct node_info ni;
@@ -826,7 +821,8 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 		return PTR_ERR(ipage);
 
 	if ((S_ISREG(inode->i_mode) || S_ISLNK(inode->i_mode)) &&
-				!f2fs_has_inline_data(inode)) {
+				!f2fs_has_inline_data(inode) &&
+				!f2fs_has_inline_tail(inode)) {
 		err = -EAGAIN;
 		goto out;
 	}
@@ -836,12 +832,14 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 		goto out;
 	}
 
-	ilen = min_t(size_t, MAX_INLINE_DATA(inode), i_size_read(inode));
-	if (start >= ilen)
+	ilen = min_t(size_t, MAX_INLINE_DATA(inode),
+			i_size_read(inode) & (PAGE_SIZE - 1));
+	offset = start & (PAGE_SIZE - 1);
+	if (offset >= ilen)
 		goto out;
-	if (start + len < ilen)
-		ilen = start + len;
-	ilen -= start;
+	if (offset + len < ilen)
+		ilen = offset + len;
+	ilen -= offset;
 
 	err = f2fs_get_node_info(F2FS_I_SB(inode), inode->i_ino, &ni, false);
 	if (err)
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

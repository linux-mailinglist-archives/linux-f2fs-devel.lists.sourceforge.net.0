Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BD3969803
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 10:57:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slPLU-0007Ri-GM;
	Tue, 03 Sep 2024 08:57:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1slPLJ-0007NZ-Rb
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cbAYiYW42KdJTqSuWfOstLknlNwHmM+iHowcLx3rDog=; b=gfguWTKa6AvSjmFkAZw30ApDt0
 l5uuhK2GAAoWDJmP8r67iBwMea+4fMo2ifZodNxcy9UJ7bfy1uCYb0mWoqV/ep9moz5TgE2eC/f4p
 3rdK7XeEJkwH8WiGj0sh3lQud0PsJvgJeO+/0OiEunFy1EVH/TZ6bpCo7XEqu7+EuZZ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cbAYiYW42KdJTqSuWfOstLknlNwHmM+iHowcLx3rDog=; b=PmLTi03Hlk1uc6j/WAcUYnEe1t
 xgpubP+GvB5lg6ussxNBq7f+/6MhIlIDipitLiO6V6bGdWItlQTdFfyc8j748o4MQxa9RkDfIh2y+
 BTs1FJi0bZT6s11rNLAP207TNRPJ5XrN7G1mynyWPghKfiFobF9qJALFWFidLx4cOKMQ=;
Received: from mail-psaapc01on2067.outbound.protection.outlook.com
 ([40.107.255.67] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slPLK-0001ZA-0F for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:56:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SLNYvWdzs5Q9i/xkS2R6KL4f4ZPwBWYqyuCp2Ut6VElbpovE6+07xYFr9okAC+DzamZ7xnIepbiTDKe1q0AGxqvsuDsHH4xPqwMQfoM0/EkwaL33tLZ+sDJT3UoMZFA9f1pz3vC4wtmsbizJHbMbuuSdO6DD07FCUoimS4s136ga2kMOX30GmB4YliR4ihGtt5/oeW+Me8JdZd4xiLW134k1A/hw75kTZKL6Z9A7oGXk74FFK+5qEETEm5ydHER8bdB9MPzJUpgXqC4FXWyvlOXiMGrUUdegPgxwSmPkqKHpIaB+gFRMgf2YbSM838KnR/H5y/DqY16M1hjkgg2fkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbAYiYW42KdJTqSuWfOstLknlNwHmM+iHowcLx3rDog=;
 b=LyJE3qIExjDnFPKiilSDAF84485s8Nk9bIL6RdPBKjisqo54qcmClyfE8uebHMuaFa5KR4FGA4pOd4aXj75uiVmp4eJMTdHlRBLxnJx4n7biI//H3aZ7pB8Lrk0NufO6LExQC8OrNyPVpPWPKF6EPBGFAr8OiVnb+y1naWKyRh6q5RE+FnBdHhGXkIv7eSgeq+oHjhoZczuZagh9xeQBjuOejQeTfYJoAssIX6d+tohKYtalRTqvVRXr7HwjPn2Awwh/3/sHFkL5CExXAtyi27t7UKyg5HJMHVSiIgo2Fr2HuN9pPeFOdb1pkzpgu70GdE4KFAi9AQVNhRaDz8QOoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbAYiYW42KdJTqSuWfOstLknlNwHmM+iHowcLx3rDog=;
 b=mHUkp5t0ccoDnhW5I+lllFVU5ucuzKrdynPU90FgdxvqFonBaJ3FfLBnCBWBltC/6DgASY/em9w6C/N6AFajC8UnmocYIaJy2Ga6GfMHApNVXhWkFkVQ5zYPWF/OqdJzDuumdT7lqkVch4nkzbRui+guMykeFrFlV3i8tuP8RzcDCYpXjsj90Rcz1T0CWuWeX1hVSZAEN7WAbSfS2g6sgQrA3qGS42Mx4FDN8loYfbWg4Ms4DqFE+F2IrV2yJDBnb2rf4vqdchGbubFEzWuWCfxmg7MdpxfB4J/exXIpOiCEXOWNsWTfjnJewPTZTYLcrVbWofmgBFwCzLV8AedM1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by KL1PR0601MB5536.apcprd06.prod.outlook.com (2603:1096:820:bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:40:53 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:40:53 +0000
To: linux-kernel@vger.kernel.org
Date: Tue,  3 Sep 2024 02:54:50 -0600
Message-Id: <99802996a3f4a0c2d89c79ec17be94e9c62ff8b6.1725334811.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1725334811.git.bo.wu@vivo.com>
References: <cover.1725334811.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|KL1PR0601MB5536:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a036e1-d5e5-4348-ee76-08dccbf41f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kPE636QvGLMjWMxvJ88pIlDX3uR1YzQdPJfjYhp41DzUdmbsvL1Y5/hCLKHL?=
 =?us-ascii?Q?Si4DJA+/5AASyxHGyl9pks0zzms9CQhDH2eNqEjLmFfswWECxtop8e/K+2bo?=
 =?us-ascii?Q?olwfWJmIfGkeNMnQ8XyTI/OiPz9tLb88P/J/bu7tjUx+Rfs+ofrspFjT/Ll5?=
 =?us-ascii?Q?ZDAoedo9kDfVNTDIRKRnIo2zsd5nlnYpKWMu1JRkpxvjiKOeki9tj0ItqUlz?=
 =?us-ascii?Q?QZhn0goZtUfgqRneHzzMjcivzR03GW/MGmVUmTJ9trXfM8Nrt3FjY71S0T1E?=
 =?us-ascii?Q?4dCoV+0mjWRjrKitUP24mYZII0m7Qz6qzrbdDotOnZc1ZzGru/UEuy97LOnR?=
 =?us-ascii?Q?h5H/XwNzHNzqgLgpbnDHuQlHNVpbdocjqiUnPwT3XN+iVVIJYw+drsalP1mE?=
 =?us-ascii?Q?svalUIWhUehYGl3ACwCYrBb1Lyo/q7z8Hc8z5L7lk9Y70sc3uVVtOX5pMe1C?=
 =?us-ascii?Q?mx/CZyfvZuNw3y6T6vwKmVaPDBj41oXA7FTIQQvsNWS1OWp3kaa2UT6sliZD?=
 =?us-ascii?Q?DZmjWRJoxaVS1wWNet2PH3fZTDGiGGK6VjBUicie+vLGMD2ko7j0bAB7/qJ3?=
 =?us-ascii?Q?461/ADg9HDF3nSO7VWErx7Su0Ce8a5bhh7Ngata2Ztt4D2H+8VAc9IfvLrtF?=
 =?us-ascii?Q?NJKDojGTFXak7uRrACu9uRTCSZmA7x9lSRtnEP4/MWCIDIcOcDPHPaPhaa4i?=
 =?us-ascii?Q?dHSPRpNxsmOyNEj8/+ZvGkKiUz++ZnAndsd0SSP+Eq0ALu52pwfG+z3PpkPh?=
 =?us-ascii?Q?dYDecUKOM0dH4lhLqQVmAKDt9TLi10ODPKTXozn6psFvUSWCpf/Z6afu8WR8?=
 =?us-ascii?Q?LY0pPDG9vfbXfoe+jp3QhDJE53e5jH8w0IZw80oaaWWZV3eabqxGYY8+6Fnh?=
 =?us-ascii?Q?KwiF5/PmtHiUj1cUy+GBa7z8PPDGg7b5vvx0WN1QmmYFHNYdeOpxAbqPIDub?=
 =?us-ascii?Q?y/DLe+SIXswGzMXzXEnvkGg9arPzLyPoc4fERQJek3CQ0Cvr1y8AJgCi5V9m?=
 =?us-ascii?Q?Id80gXo6JbXHYDYo9KXHvBmZuc3krkkZYbFh9ugJzz+HIsYEHeq1cflPDHzw?=
 =?us-ascii?Q?8qa9Op2M96+FJRG2tAZvLs/akOEpdBeV9DIAnSphBdmtC5fOXkWfJWNfO80h?=
 =?us-ascii?Q?eNJjjSIGRxNxEhtK8NgjCzHwTE1DUqHQCnFWczlVJFZZAWwfBTPeqsk48O7F?=
 =?us-ascii?Q?BZNjTK2RRtSTTYXjx/gAFdCMsvQO0L20ItfGohM19dJBSgI4vSvoy+rmVy16?=
 =?us-ascii?Q?qU2Ocy1YXXLj5JBQoxKpHJW8fdfIcrhlimvOYJs6s1lumsfAvhuuRdiQPxX4?=
 =?us-ascii?Q?YO5XbUVDLq/3XjpoApuiEJgdV/+h/uh526mCz1CLZdj6SO/RJQ8cj4QemNio?=
 =?us-ascii?Q?bu/j8CidcYNVzyafVTLzeIRKuHcFCWbbiYejmBwT2VzTNt9q/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YBAQveSXN1QuUhs23v3+7NNGpiNiPFrcOKW6OVKAhiQAcRNDqPzMJuZmzJUU?=
 =?us-ascii?Q?DwJ+jsTJtWliS8n8Yt4tx1ACAJ4jIKKXZdWJ6x5TG5U/xwsSwn/G22NrD25M?=
 =?us-ascii?Q?KUMmQNXJmCoKupxG1GcItu+XB5ioT4Gdsrqz7LL4XW4MZdXDEhk0NP76ErvV?=
 =?us-ascii?Q?1O+lYtjqBLIYfmmpxgn/0s98mxOL8nSONvjk2PNpzPhWSEZdiDTJ+qSFTVX6?=
 =?us-ascii?Q?ypBjvofkWrK9D1ad0cRaocrJLG+CO0/sw2F40zIlJQ34sDJ0W4vVQ70gp5rw?=
 =?us-ascii?Q?Y6ovxExzVUFptmM3/9TDPhEvHAfre+0kh/VrBkyGkFFU9KDKVAqRqyj9g8jy?=
 =?us-ascii?Q?KYOzXVATrZLBxJ4zU4LSoYj+fBesWMept99OGPEEqzaWxlamNfT+NoEyoH7N?=
 =?us-ascii?Q?t7zDf1Z5sC4Z06sKpvSXwIuuFG6YIbhf5ohL+Daly/8rN6S/LbwjpgvzFpA+?=
 =?us-ascii?Q?DxXcKZw5eN/2A9fM+0Cddz8iIcQBfGpx9IXVYjQtx7PVN6cWKQ1mtpFL0wou?=
 =?us-ascii?Q?nHuQ6TFY5QaZd3SZvYe9Tkfn3wohLEPw15jGKdxZgN0MAz3jwq51/vqIx25o?=
 =?us-ascii?Q?Ri1DHBZHDoDoAHOHaaMPXYi4y3Kjg8p4AmrmGlq5JG7jvTFTNBEMfUblIakc?=
 =?us-ascii?Q?oPvMiA91qIXmM8NYTJ+c9+ZkBifb0g4h4LuKYBwPrGxaRQdRgV5uxQE6e9jo?=
 =?us-ascii?Q?edAorL/I/EpFoyvIpk1O8RHg9ct72Hh8Svr7XHwoWCiWVy+IsxE2g4efVbCK?=
 =?us-ascii?Q?YtEoxp7VmxEChXcgSF9fuptMHzGxyeGmxYtpALpngfOMR5kVlDqMI5AFccGC?=
 =?us-ascii?Q?i7Iawg9DyHttHapQjpQ1iW7Nr3NCYcvf8/AAIk0iUuuPk4y7VXqdR03alzNQ?=
 =?us-ascii?Q?IHldKTpCMC3tES0SS5njyy25DpXMosGZND7MrrlLQtm8RJCgbc7INHUMvo4W?=
 =?us-ascii?Q?V1UDsCUh8OPQodSdA86I/ZcpXRMCKkpfK/dqZb4RnspEOn0wWZ+6oOSU8UYJ?=
 =?us-ascii?Q?lsXa2iuVtBcuykMvunrjCMYZMqbKWK46i5fz8+NQgDMdeBGlM4K4q37j/qx4?=
 =?us-ascii?Q?GPJLYxMRUwR44x2s/oGhnnOp75/awHIGUOXsrsuVvcYEqFyDO7A4WhzNIdzG?=
 =?us-ascii?Q?GgTon3YUL3LAyyrPyS5dM15HQcgH39vhsnhfcnLRY9xN18Z0KjPV6vyEzJ5d?=
 =?us-ascii?Q?tN7bYrw2TuMC7YP4hICXrbWwg08E8oYHIw3oU/8ooc1FAQqK+h3XRPnK4hxF?=
 =?us-ascii?Q?RD3MskNMKfvATQKAus2csOXJTtHfNMUIjmnfe4pmvJ5ZMcXJnlufslSrJvtL?=
 =?us-ascii?Q?P/Los8WpniCW+Ty7nSc2lx/JoHkKpuSZGd95DW2Kw/zwLeLDjOAOh5NYYR9r?=
 =?us-ascii?Q?T/a4LpNlYASFz8waIcU74TzAD2ttEnb6d3iDyPrHR/WxU8qWDtD//5oPybxR?=
 =?us-ascii?Q?wCO5WUsm7WmmzQvIoECF+ldJyFZibEHvJSWEFJsbj9E4T8Nlidiq47NsB7qB?=
 =?us-ascii?Q?et4VxoFXL9q3L6mN+JVSJ4oLxWKu0mLCYOozZ7qNMSZiVYEWtWVvIXQhvktZ?=
 =?us-ascii?Q?qpJ57IU+wTSvh6Cp215Dlqo4pgfgAYGjsjMbn8+y?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a036e1-d5e5-4348-ee76-08dccbf41f24
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:40:53.6740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2R+OGMIPFY3hd6NYOTZ2HPdGhEqBnoriz/fkF7xzPrigj0yif4GRa0I7XkLANc//DfqUJaVzVvRbuGA0xYRpsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5536
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If there is no data inline, the address table should not be
 truncate, in case there may be reserved address info. Signed-off-by: Wu Bo
 <bo.wu@vivo.com> --- fs/f2fs/inline.c | 3 ++- 1 file changed, 2 insertions(+), 
 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.67 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slPLK-0001ZA-0F
Subject: [f2fs-dev] [PATCH 06/13] f2fs: fix address info has been truncated
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

If there is no data inline, the address table should not be truncate,
in case there may be reserved address info.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/inline.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 30b18053e784..a542956d618a 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -224,7 +224,8 @@ int f2fs_clear_inline_tail(struct inode *inode, bool force)
 	if (IS_ERR(ipage))
 		return PTR_ERR(ipage);
 
-	f2fs_truncate_inline_inode(inode, ipage, 0);
+	if (f2fs_exist_data(inode))
+		f2fs_truncate_inline_inode(inode, ipage, 0);
 	clear_page_private_inline(ipage);
 
 	if (force || end_index >= COMPACT_ADDRS_PER_INODE)
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

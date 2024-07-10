Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E969992C7D6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jul 2024 03:19:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRLzM-0000S6-Au;
	Wed, 10 Jul 2024 01:19:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1sRLzK-0000Rx-38
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 01:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g4QD2basy0BOPGPoM4t8O1QZNDxdgZ/jxcqW/JuibGs=; b=OB3X5Q+bNm/9tFoaZyXJroHB9b
 FogYizlVTMKJtsH7YsZ486LDr8lgZ6YN79PSWAAZrHQXCfaJ2Od/bTxhDFYzE8BW4BINijCSVmzzN
 WR0pzOqaCuULhADOJnq3VZqegn27lSPD2g1kQguRfyBQLgAop3rh+ZJV27qZVilpHtW4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=g4QD2basy0BOPGPoM4t8O1QZNDxdgZ/jxcqW/JuibGs=; b=X
 Sb9F7G2sOAPZntwfs9lA9NE7n6EuZS+Hmqnc+0vtGFbsw7/5vclD13/ss9UrMzS2WBRArsE2cN5Tn
 ZBDjptxsfoXj+yzsznM2zizpmF6nqyzEI3Dfmn1cN+QDG3KrnPLZHV4vAmtFx4dCcPY9TWMKUZVWp
 s71J6e7fW5UF3ijY=;
Received: from mail-tyzapc01on2079.outbound.protection.outlook.com
 ([40.107.117.79] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRLzL-0004qO-6V for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 01:19:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cs0mQ0+9THylIQMXpaBkbnquKabGbqmdc7VHQRH/2wqeGzt75jGtEFjgNnm0EvlZKowjQAj+JJ3q6Dh36nIm8b4SFtS8uLYba2sq0r1effWSnN79lzqXcqTdvGzKuGULBkpg6jKiWI2TXgDOg0P1uNJJM1PyO5u53uUe5dhTgF7guqlY5hPAY4rdtLnK0EgMjh+DiYcnj45H1vexVjgt27P87MTwKD/3wsfcccBZu6D8eJRGyV8dZgbhhhYQyxuiK8WcIf/zjEhengO2lLJroh80JEJlP2y8BJcdHgmz4wJYIAjVMT1uUHxWm2l8PKo33wZ6X1GrwA4K/5P8p+yfiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4QD2basy0BOPGPoM4t8O1QZNDxdgZ/jxcqW/JuibGs=;
 b=m1jkwwUhCR4+84EsaB0mtXmpmyAVjd02qI+e+Zi8bQTfZ58NTQC3AICPIPdogCd3s+Y6NiPmJRqHGcOmlJEiimvwa8VvMAcYDQcIK34jT5zcuTeBoCSu5yUJM9k6J8iSWa5Y6YMiKOUhreMCN/5xHgfQ2gtqsvtnfHretufyE1r36gBnQjaec+BzC9UQ4Oe6peA9D0jdD+DsS8WDXP+y4aNPTNlnO84uGlS76BgE2MEm0rzO0Sgcsxef/vhOtLMJfmyeF5I/FrXUwqZsFfGWTNzk/FtDS46fmP5beEC1Ideu8nl1oLasU5fF0mzmPzBs2Roy3AIOciBMb2b700VXKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4QD2basy0BOPGPoM4t8O1QZNDxdgZ/jxcqW/JuibGs=;
 b=TH+JlTxjW7iGzLz+8HAYm0f+UUPKupCKZCKjELEt5TmORrUXW3IwosRAgsK0lX32oAHGDIxP5yWX/dQS2L5fNKQKhMEAA4e5utIjlwXo50B+IaPZz8AhJZBe+w/P2oWw7mRL1nsp8TQkKzLhs4b/YzT9FFRdLTlZ87aak3G4TAz9VgskunWuZcDbTj/rQ+ZuoRqqL6QlJDpvHnOefPSILTQuwQBbN4As8V9z+zZ82FDIiJo3PU3LTOtyZOgNNn9bi8751BcabkIAwyNHsrdWsN0DaMp6bdHMvZ0YgNQ5eIMHpLgwHNj3U5v66WvyJfvZhrEy5SDCloRqRUOzc7k7dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by JH0PR06MB6889.apcprd06.prod.outlook.com (2603:1096:990:46::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 01:19:02 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%5]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 01:19:02 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  9 Jul 2024 19:33:02 -0600
Message-Id: <cover.1720515215.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|JH0PR06MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a8a0f3-9e6b-405a-7c38-08dca07e4859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HIL/2HSLyRZ1TMqDm0nAVtZ9jssSXIIBg87FCBwyn5Hsu7VBu4XBYoVvcli7?=
 =?us-ascii?Q?vGgLWPqJOJ4QNgQ0EHbG+a73mZjSt7+NF2rL+nzqgScYnMtePqA5RIi4QNjg?=
 =?us-ascii?Q?4PM3eXnUcSCSdNQ9VcQ1wyt7rdfRNOhv7mZnksZAOZDZ0PTkh6YVWFrq9NEZ?=
 =?us-ascii?Q?bpRxyjzxWCi3ksKe1ZL94pJYCSd22doKsThTXPcsfeCOMILnuD5osnsyYaAE?=
 =?us-ascii?Q?ANjUd7CpSAe6t7r9wW55EkKANUmBAcPoTolE6g3EXzINQw5mbJdDtOvlNecR?=
 =?us-ascii?Q?2nOOkNekkHbLAvN7do75+eeUYBmFLjHvNv/gdfxeVHdvvJGNknFvdCpcvscW?=
 =?us-ascii?Q?owbE4im3AU+LgfIieSwt94JyZoI4hAxGfgXA8XngIEnO+R6dQIIujqSVk3c5?=
 =?us-ascii?Q?ZX3ae5imAcr6CVtIuhPcoMla8SjfHN5J0z5T1VFBgWfXUMpL2neq8N6IpTVO?=
 =?us-ascii?Q?NTdpFJT3W3I7pb09EjEA68RxM7bc+Y+jTtxkBA5jAH9tPQ1D5MGEq7wnYC8X?=
 =?us-ascii?Q?2QQb30VMNJ4kI5/UkdAhUQQwnMTMuzSeUsjTWL/ZLe9Ge9+x1YPSRf5ZIGrT?=
 =?us-ascii?Q?AVY92/vkLNXGRNs2wgu/zH94e4SoeAFpxfKkZBCoDM33SnOrpix1gBhPIhsK?=
 =?us-ascii?Q?FMSM0O7uHDyIlf7qqJiDIASqT7cu3uBpRYjiO2+QydJWV6I9qnUeSoLgtkvP?=
 =?us-ascii?Q?7GtafQbR8+w4w26MThC9FOdjuD73gjn776W5hcShQebBOJpTxlk9yQ1SUOak?=
 =?us-ascii?Q?RVq1ZzgnJrkn9CWb7cm0/+21ai3hQv/z7ivyjFWOY4B5jOreKqVWFffsR7jl?=
 =?us-ascii?Q?ebiL80HmgFCiI2y9vNiYhN+3PL2MYwyHqks9GiB6BLNhKmQNvP4pU2f6Sp0q?=
 =?us-ascii?Q?q7PP+CT0Nqif1B/ojjsJLED0X7C6q21imKzmuRbrbBRwFdOlhQtcdfTAs0u7?=
 =?us-ascii?Q?odhxOIuHMSj6aLagTrlIzBI4vumljZeq92yTlIGzaxx/Okspz1oLN/71k2+N?=
 =?us-ascii?Q?FbFWsbrzNomfP3uR7AwUVNqOypYOqgRZOM5uyFtasbMpVoeE4xJuJMGkTVaj?=
 =?us-ascii?Q?wDc9ChEF1kpVugqMeLXbIXEErrLOc0wgMeIAOzS+OPraskVkXEreBz/bDLKM?=
 =?us-ascii?Q?DV0kW/lyyReV6pBBx7YJ+Zl8zg4LMzd/XaR5oVsgXRcVmsEWBxJQPv86EKYh?=
 =?us-ascii?Q?PbB00b8ene1BsDycgBe5oo3t1oE1afvNHABHl0rLHRLCJiZHq6Ep5T8rYVVa?=
 =?us-ascii?Q?rP1e3drRCC7DMUl8Xrq4UoibBgUmuQFr7kt+/3O3plUKubtCbadW/3Rpu4Xh?=
 =?us-ascii?Q?ls2xMGgMEJpLXoecb/LHlSbB5uZm7ro/E+0m8ugw0SbXNIwNxD5AEApPqilr?=
 =?us-ascii?Q?pyAzIXdMRG3EB+6FVj2C/UhHySiNlL+MdzPOWM3al9+xyVN9dA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ndAaIKo2IM/1l9RIkDQvE951JqqeJCrdoKh81k5HvOWi+PaR7jUCU9rkZ7NL?=
 =?us-ascii?Q?4KxdmNWGnSLGwtu3VTnSUkqL+dEs3RbavfHDJ4rXhBQXojydHgJJef2wU/OC?=
 =?us-ascii?Q?3UsXRM7TvC1KPAHPyYIdJt9sLDuYW7m4+dUbR8qSv/ysYb69lEqHj/ZP4sDw?=
 =?us-ascii?Q?Zfb/ddWDPKZ+8zN/VdqHot6bwqJHzwnl42cgjIinkvro4kABQ8UfPvX7Y1Mt?=
 =?us-ascii?Q?uXyWCq3UP5QfiAqFnRB3S3MVG+iYRKEW1QGYmjmi61gi7PGVJm8pm+Ij5P/4?=
 =?us-ascii?Q?1Cm47TOvj6conPnqPsoBG+jKYgJ8alfdrC6GaLl4UeimkUyn+VuXO2AfE8z8?=
 =?us-ascii?Q?Q+YxGXt9dzZ4XEPzb/g4f1gaII/8M6/emIkYj0Q+l9oWPH/vjkMXC++qMbhY?=
 =?us-ascii?Q?UrwlFbTRRdkisQ5P8qrLdWvhRGk43PYevffUGMOl8HTNtTqkZ7ErWCOqwzR8?=
 =?us-ascii?Q?rmje4x9MqcrSQyLL6YcqxW5erm8X5crrgBpP3tnpkkGLyQs83ts/ylI8x1s0?=
 =?us-ascii?Q?dbALUTU4brprkNiV065/kW+5kP+Bocf6cHOGRiUnAnFwdEVfapxF185oMT65?=
 =?us-ascii?Q?RTD7M5idv2c+i/5ME5/JIT9NehBKohgAj8nLRp6k2/hHiCEFHEUCD2yHpTGy?=
 =?us-ascii?Q?/cwGqVjJXMvpZ/zWktVPOoFI8stpbHNfxFOF9WrTiWaCkG2hc7cRCmQOTcYL?=
 =?us-ascii?Q?xKmrkxz+KW13Nigc3tNo/4zq4enJxj24VQ3JuBaVzxP8sFqy/jCQ8DINIUtw?=
 =?us-ascii?Q?rcKXesAl74rQSUKdaSPG0ANCeG/0udHqQd9vDl89Vd/VWKUPOkxBWQkNfox1?=
 =?us-ascii?Q?7M0cJ/TwyUTvK95l8K+ighfOfmzc60n+OE/teFK0WOUQmVKGGQJevjvq+LZp?=
 =?us-ascii?Q?MHoLfrAt6IFqbVPEL2cVQCw12YdItZpOa4gizPFHKfq0VkcW3+AdB1xvfNRz?=
 =?us-ascii?Q?PR2dxJvGsDN8XxFiQaVRRuaDwiQtoqHZ2tgAj3Qo4X/O/oaP92UKxXN1yOU5?=
 =?us-ascii?Q?PJ8YNHET+j0wcuOtHFkik+7P7FfsGkv/JEwhLXE4pF/I2oMkduF6hmZTjsKo?=
 =?us-ascii?Q?cqZ2e8MhnVKXTX4Iv5tXZjFvRu5ZTk7xvbqDaoYhegvxZDOo07e0d5LPuJTT?=
 =?us-ascii?Q?DiTXoGYCoI0R9/tVo0H5Y2MbrW90r+lPX1AXlon1PF7Y/gfYrm4DGKYShaU3?=
 =?us-ascii?Q?4wGRHssDG3yTCQV6MUTZQ25+w4LuatIOZjMEJnrHIdpkoC94M+bd1oKgSC7U?=
 =?us-ascii?Q?nt/bG8zHoi98bjc7eI+G4KYulrYX/awBrLLNMTZqvcfFHTqVPoV5B4Twg5HM?=
 =?us-ascii?Q?WszJis807Pc16mAz93mKnCsvmNu9vnIawOHAQTDaPckPArZ4DgR/RqjhaEtJ?=
 =?us-ascii?Q?WxeRwwpTgjGh/ZVYS7sI8Y1nCRLoDqTH4DaPE6aKInLb8zU+65YIOtz+Dmfl?=
 =?us-ascii?Q?KR3VVrGYg+2GgsnelqLYkrLIhEs37FuJ/RXhcEFqCKMwP3BB08XspjQ1Cu6q?=
 =?us-ascii?Q?8DZBWrCn1NLAvOmAKRqxtyGMHjYeylfYh80OnM+hoOPCpEVySwcIxFUKrJaC?=
 =?us-ascii?Q?fiNGggLaYl2FXOWOVv4fOr8i1Xgu4nb4fOjE4Yeb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a8a0f3-9e6b-405a-7c38-08dca07e4859
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 01:19:02.2522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fiVaXRvCaSZoDq8T8ljENINnoUpJwAC8KoIm+ZVsWOzk039jN4ZrnQSolnT/MhtntA+7sCLU4ATbV+6oo8ttQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6889
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The inode in F2FS occupies an entire 4k block. For many small
 files,
 this means they consume much more space than their actual size. Therefore, 
 there is significant potential to better utilize the ino [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
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
 [40.107.117.79 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.79 listed in sa-accredit.habeas.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.79 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sRLzL-0004qO-6V
Subject: [f2fs-dev] [RFC PATCH 0/5] Add inline tail support
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

The inode in F2FS occupies an entire 4k block. For many small files, this means
they consume much more space than their actual size. Therefore, there is
significant potential to better utilize the inode block space.

Currently, F2FS has two features to make use of the inode block space: inline
data and inline xattr.

Inline data stores file which size is smaller then 3.5k in inode block. However,
for slightly larger small files, there still have much waste.
For example, a 5k file requires 3 blocks, totaling 12k of space, which is
more than twice the size of the file itself!

Additionally, the end of a file often does not occupy an entire block. If we can
store the end of the file data within the inode block, we can save an entire
block for the file. This is particularly important for small files.

In fact, the current inline data is a special case of inline tail, and
inline tail is an extension of inline data.

To verify the benefits of inline tail, I have developed these preliminary codes.
To make it simple, inline tail only on small files(<64k). And the layout of
an inode block is following:

| inode block     | 4096 |     inline tail enable    |
| --------------- | ---- | --------------------------|
| inode info      | 360  |                           |
| --------------- | ---- | --------------------------|
|                 |      | extra info         | 0~36 |
|                 |      | **compact_addr[16] | 64   |
| addr table[923] | 3692 | reserved           | 4    |
|                 |      | **tail data        |      |
|                 |      | inline_xattr       | 200  |
| --------------- | ---- | --------------------------|
| nid table[5]    | 20   |
| node footer     | 24   |

I tested inline tail by copying the source code of Linux 6.9.7. The storage
space was reduced by approximately 8%. Additionally, due to the reduced IO, the
copy time also reduced by around 10%.

Wu Bo (5):
  f2fs: add inline tail mount option
  f2fs: add inline tail disk layout definition
  f2fs: implement inline tail write & truncate
  f2fs: implement inline tail read & fiemap
  f2fs: set inline tail flag when create inode

 fs/f2fs/data.c   | 61 ++++++++++++++++++++++++++++++++++++++++++++-
 fs/f2fs/f2fs.h   | 44 ++++++++++++++++++++++++++++++++-
 fs/f2fs/file.c   | 10 ++++++++
 fs/f2fs/inline.c | 64 ++++++++++++++++++++++++++++++++----------------
 fs/f2fs/inode.c  |  6 +++++
 fs/f2fs/namei.c  |  3 +++
 fs/f2fs/node.c   |  6 ++++-
 fs/f2fs/super.c  | 15 ++++++++++++
 8 files changed, 185 insertions(+), 24 deletions(-)

-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

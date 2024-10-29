Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6409B49A0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:27:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5lJi-0004Ye-5h;
	Tue, 29 Oct 2024 12:27:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5lJg-0004YS-9D
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QDrVWM65ulXAwBxar46vr6bYD3hp2d0htbqKM2Ajfio=; b=QAYwfYgyJv2+EuMCTFAgdlwgma
 NS2S1JWhTDS3BQg3ynbD20Q5PGDyVY0LQT7CN627W56gsuyaSb6rkynwGHGt4FgdQjPhEHXrO0PHJ
 OAVhucUZ1uTWq7a4f2hEAvNKNTHQ+wZDtMx5LGNhX8I+IHviQ96G/orWwy/o+erg+ISc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QDrVWM65ulXAwBxar46vr6bYD3hp2d0htbqKM2Ajfio=; b=N3jDbMD+rDlIAbpv9J3UvHza/l
 2V0cRIh5ORPsAZa/CLA/r9R2ggaNagtczgl8qPaU9n5msWt1pHVRdZNXe/hJkeYf3nsmHzqvW8QnV
 xwzNntCH/5ht0nLawdSZx2D0pYZJ2zsswooU3bItpHL7STFdElZRj4xC0bhR3FwsqgIU=;
Received: from mail-koreacentralazon11013046.outbound.protection.outlook.com
 ([40.107.44.46] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5lJf-0000dg-HM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:27:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvoDSjbHRVP3QPVvbxfXsfe2R2OWYScSU8QSo9OgBxbV0CVGQpxDBWlNWOB5tsm2E4QWdx4bA0sPf/9cizNyw4eZQKNLI0Q+z5Ip8KuN8kFYY6ppOik4cJznAdKFpkisRJhe97Rj7vKTdsHDLicV5JOIoJPxLPm5yDJZO9w65km83xWdmtdicX240u/Y6HtS2Z9wgZDVdpomDx/4BAJxARi9AdZeOjGwzprAxKSIm1Q3DD2VC1B4SWCFM+Fb2Un1fTP2K8+q/I4mUcbkxRKwikwKr1sfOTQ1/fGuzL7Vzv7nuUc3axF7wcrJZ4tXobhIs5b0/oXePmrz2TpHx0Iiog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDrVWM65ulXAwBxar46vr6bYD3hp2d0htbqKM2Ajfio=;
 b=Ls9lZqatTVwre7IkkQEDkRWmy5e1fwVEpRXuyc3aauAqSkWUuU7Iz1ARqIOnVUYf2lQjvjPsfDOYb1qu8tJHvaDRkLwLfsjGo5pq0xaX9FKuhO4ktQcWw5D9Pd8ApXUvmMtHDxssHalzu3FpRxNoFH7hKylADC6PAR8oYgYs2ITsE0tR4X2n+HiAW/QRkjNweJiKPqGEzU3D6D01ECtQug53RgaIgKDJwzRhk+n/QxrlWUltcHhJJwciPcHXV3epnZUSvHSDoXzt4jHj7x7m6b0cxDYo17vAdjrxp/Bg0S2AWxraseWFhpWDhb/zF5gpi3euLf03ETerrwerdXuDzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDrVWM65ulXAwBxar46vr6bYD3hp2d0htbqKM2Ajfio=;
 b=gbP+PN+6vzEKp8CjRm01cezXhF7ZosCSSdqhgi0i0AmRhu9P5edkiMxBp2omapYQvrEC68kqk1oB/tep0qHaaryeqaqXkulnPqF4d5ECIkoqffAl5y9lrVhp+EQKKwF6dZa8abcXcH2ZfTFaLOmv7vt9pAWULSmXWsqBaLBv4gY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB6982.apcprd02.prod.outlook.com (2603:1096:405:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 12:11:45 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:45 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:47 +0800
Message-Id: <20241029120956.4186731-16-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: ae81b346-51a7-472d-04be-08dcf812db70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0IAoBEXSft3l8zH/ENU9lj8hRiowYCUXBNrtgVkFIqGUDxn3yJNCMXmld/64?=
 =?us-ascii?Q?Drg+f8BAqeMp+nCpzumw0H4wNiJ9fVnEeNx9eqnOP+JXIP75ghxdlvjFzJO/?=
 =?us-ascii?Q?CL3fbgo2+ONhqQqLHvYv3D0QCxJUDLbfLrVt+04G9PwkocO+k2Wf9nOUmLIJ?=
 =?us-ascii?Q?izCcdcK0bnxT/ndN3n7h1eawsQJ7SMSCt65bp9Q7z2nqNDrgiVQ3kLN6txQ2?=
 =?us-ascii?Q?2Wqrs8IeA+yx8b++5jINk1KQIQm0gOPG+RiAH0T/0uXLTcSIWPyGD2YGdeo6?=
 =?us-ascii?Q?+wj1bwgiqBAUSCPIVgSWjg3mlJjbWwQDSTGayilMW/pI5TOm6oY/tMq/uPc2?=
 =?us-ascii?Q?NVgkf64ctbYcff0FzoMpqROi0Yt2TgL7FUQtrOWtOheZpLWkNYeCQNmXS6Md?=
 =?us-ascii?Q?ZdLvhmt2Ko9bXNvzBx5xrVyfd9pWSJpfKrBp8dm3UFybJ+RFvgm6wMrtmInT?=
 =?us-ascii?Q?cQ9O5Yrndht8MlKjrdTPic5RnfXoKHRJSS5pGRK3mh73BQasKY/ukshr7wIE?=
 =?us-ascii?Q?TWo45snIjzYqN/734QyKQ68mi2LqnuZGRlJOEoUgrbyREQjQlCFFBP8xIhMq?=
 =?us-ascii?Q?015/xuJHwt2J18yPFqf4k8DFE3fAiDFb5HkUj2Nb5p1srabaMW6CWZ7fK27H?=
 =?us-ascii?Q?wqB0vg/fqwd2onJFXNp442l+bT0246WsUQgfub1pYwMkBwcSHNdEAwCvImkj?=
 =?us-ascii?Q?2xUVdJT1Vsnc+sSMIGILEhW0h6Oa+and2wQeEFJXc/tq45inGEuT20j/D4pg?=
 =?us-ascii?Q?I+c1sdLb8gjv9kUNNrJYaSQnvELiy+4vAWsRYNppPCBsRp3LViL16B2gZBOS?=
 =?us-ascii?Q?C1dZpVICD3D5Se9RLPkCZGn2S4alLsz2prq0TXhlZ7knIbnQ/SpvZE5B/N3D?=
 =?us-ascii?Q?pTWGqcNa5wK6N5J4N995+q4p7N3uFrrmYJW1/ABOXM5PMpmU9MxaVnP7TaUZ?=
 =?us-ascii?Q?QD/q3UyWGmGQ6oKMsXVMtYhWt4EZ6Ow0g1AifTRyhKgbKH4gyWh4rwTDc3Rv?=
 =?us-ascii?Q?hhzEHWNZoPKd7adY2Y/B8q0ghecifnzI1zEgOegrbfmaNZrJ556pBbKJRLCQ?=
 =?us-ascii?Q?TWToMWNrVI10r1vObMenI6CXqGAXd/rLYDcdr7Gykty3XpsTmHEyukKBiQd9?=
 =?us-ascii?Q?kPZdfln+gkXJd0N3l9m/xpW36O4ixtneYirCsCVSMjEckt/hxa8nijVrU/I8?=
 =?us-ascii?Q?Hg+fxPqPkmMm9M72DFO8vRODxKF5g8XCuVeT5irF9rBSgQXIfd4s6Z/tEDww?=
 =?us-ascii?Q?iPWyWlNIDzXFPI0x27+MKVB9LCTPpRcporZ7S2tsscGaNUonaNCNuPwC4uIM?=
 =?us-ascii?Q?fYD7Kt+6aNxwm5HFOPxIIt+jHWX8ZauJ+kd0LtNTDWk4NK2zfbOb97LpFgPG?=
 =?us-ascii?Q?bmEJhTo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8EtDqQ3pCOlUV6ARHNoVe/Nh3l2n+t7w0syi/qlVKlYdOlUarbgf9JA+Wc2B?=
 =?us-ascii?Q?AwwTOonfv+VYlk7Hw7kiGM88TuBeqvDwmpd6KfNtbtJttfR+tTqjBGhAc1KK?=
 =?us-ascii?Q?hwr4ob8vrgNBASHgl1/71V4tTXW10UNSc++l69kI0zeBqaLy3ErS92Ti6k4+?=
 =?us-ascii?Q?Eaj2R+6crIRmgOOJLdKwaexBwBR8RYL3ZB6/9D4qohYxu//27XbLMnUGl0p+?=
 =?us-ascii?Q?jT01kbIbC6JcFb5AhTrpY+3DJ0cBMgofskJJtsGGYe+lc0JqBUzx+vb1v1vv?=
 =?us-ascii?Q?uC4gciwCvxO6d6Ee7b5Mk++H46URAm8DasvLlCFYgsICmml1hsGzCWnmpiIv?=
 =?us-ascii?Q?dHiuASIObBH21PZUFe3A+VNwDO+Q/N4KHIr6v2GMXk9ZnOQ7+rLa8M4qvJTP?=
 =?us-ascii?Q?4JpRRHRHgXWTBS2SiEBO/tBCCUysBK7jfakKqEqOQ9y43gFmSTpth79VTicM?=
 =?us-ascii?Q?2JQxHgH/is/eVUc+b7+yYJK2U3JxsJABlduUMs1qfI1CyO6vOsNccgNGXBKp?=
 =?us-ascii?Q?s6h0rQcHc3yKL7Ef6T37ndXtAtJWq2TOfPkIo5/ahqnAQn1GpTlDfhUgOfmn?=
 =?us-ascii?Q?rI5m2eIoE3skkTS0ShFxVfxQPwqoEF5nBE8MCrAWKPD/z/EyJmF5k2yQ0u9H?=
 =?us-ascii?Q?DNTD8z8o7LMNye84cWd7oP4loskFp6gpz4mpSHGzNTwrBDmA6hiWUaM661B4?=
 =?us-ascii?Q?A7FlndRGHvTHCgldKilJjpQJe1nv6NjW+//Gz4iXp/f9tsS3caQzoFTYznQY?=
 =?us-ascii?Q?NLrSfggAf1VqDfWIQEJyzYN6qHpWv0uwnlLr+pDgKVW1Rccq1lwtoggqO9O8?=
 =?us-ascii?Q?thqtxZu7k8W0TOHtTrd2tTXCqICPorN453kTDHMGvCKR/xQ70kwczifUTn6V?=
 =?us-ascii?Q?BbDcDiYzUCEstprJ0/jNykVTkZGgcxtCjoBnarSJ282aLQtKHjZycqNW9AOE?=
 =?us-ascii?Q?t8YOjDyTt+zSFZ8TpSelvt0wEvRffgxtidHLgRVtsoeaQAzBu/KGg+cHsudr?=
 =?us-ascii?Q?5bcEuvkMEIUnlwvvuQaYDuqjjLXIQGKb7IO76MM1n0BRsvgqPzzSI9/EdEqq?=
 =?us-ascii?Q?BhVPe06NXhLB6U1Lc11E8pRQKcIclDGJ/kYt24TSz4J/e7qUuzyV5bAIgmZ1?=
 =?us-ascii?Q?V7UeJguMu8BGQ9P9Ik/1gzUXISRJHaNt+1Y49hc6MCbV52VIy39ypNWHHO1O?=
 =?us-ascii?Q?2Es0eUS/jzNCgnLuxM4FA4LR+KJ/zGZdb6if68S9Bk5tnSp99wOBnOthEcJE?=
 =?us-ascii?Q?cNzOC8h7Lpis3eu0NDSATGxyjpWqeWSdpUh+mQuSs0pfG31eSMX4/1Jy3NW1?=
 =?us-ascii?Q?hI8prtflHNdZKLQ3mOFAFIbXH3gPQYXCDSxQlVut0QykY2DVn6ILgFO1+YMx?=
 =?us-ascii?Q?4Rr4FpVRALD7nACgJti1tctf0UVVI5/7suqFfutAgFFEFugM4aApdtTi+SR6?=
 =?us-ascii?Q?7ZIfqqrxY4f1/5xdvbkWWRQ7aycpszzOs6TmQVY1IqtYDnOzths25VPzMZXv?=
 =?us-ascii?Q?c+v1GiFk8nh4Xl0K5e04F513+XeXkQDXHc8WPsXK+reNnUrH35E+WSTSVNzm?=
 =?us-ascii?Q?l/J9GLTTpV3R9jqLhuY1jyI20Dw6KVZ2EhYxSFkU?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae81b346-51a7-472d-04be-08dcf812db70
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:45.6083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8HYrCN/kSeu/weimtyA7srwNfDJgbe69kTTxKwqte6z3x1Dd9NI2+vENvSVTdqhAQl82ubGsuV7S/kYVZ3plg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6982
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 tests/f_sit_bad_vblocks/README
 | 5 ++++ tests/f_sit_bad_vblocks/expect.in | 34 +++++++++++++++++++++++
 tests/f_sit_bad_vblocks/script | 45 ++++++++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.46 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5lJf-0000dg-HM
Subject: [f2fs-dev] [RFC PATCH 15/24] tests: add fsck testcase of fixing sit
 entry vblocks
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 tests/f_sit_bad_vblocks/README    |  5 ++++
 tests/f_sit_bad_vblocks/expect.in | 34 +++++++++++++++++++++++
 tests/f_sit_bad_vblocks/script    | 45 +++++++++++++++++++++++++++++++
 3 files changed, 84 insertions(+)
 create mode 100644 tests/f_sit_bad_vblocks/README
 create mode 100644 tests/f_sit_bad_vblocks/expect.in
 create mode 100644 tests/f_sit_bad_vblocks/script

diff --git a/tests/f_sit_bad_vblocks/README b/tests/f_sit_bad_vblocks/README
new file mode 100644
index 000000000000..f0cad7e7e319
--- /dev/null
+++ b/tests/f_sit_bad_vblocks/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. mount f2fs and create a regular file and write data
+3. get a block address by dumping the inode
+4. inject vblocks in the sit entry of the blkaddr by subtracting 1
+5. fsck fixed the vblocks
diff --git a/tests/f_sit_bad_vblocks/expect.in b/tests/f_sit_bad_vblocks/expect.in
new file mode 100644
index 000000000000..880af341d65a
--- /dev/null
+++ b/tests/f_sit_bad_vblocks/expect.in
@@ -0,0 +1,34 @@
+Info: Force to fix corruption
+[ASSERT] (check_block_count:x)  --> Wrong SIT valid blocks: segno=_SEGNO_, 511 vs. 512
+Info: checkpoint state = x :  nat_bits crc compacted_summary unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Fail]
+Info: Duplicate valid checkpoint to mirror position x -> x
+Info: Write valid nat_bits in checkpoint
+Info: fix_checkpoint() cur_cp:x
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+
diff --git a/tests/f_sit_bad_vblocks/script b/tests/f_sit_bad_vblocks/script
new file mode 100644
index 000000000000..500d100d2c0d
--- /dev/null
+++ b/tests/f_sit_bad_vblocks/script
@@ -0,0 +1,45 @@
+#!/bin/sh
+
+DESC="sit entry with invalid vblocks"
+
+. $TOPDIR/tests/helpers
+
+cleanup pre > $LOG 2>&1
+make_f2fs >> $LOG 2>&1
+
+mkdir $TESTDIR/mntdir
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot mount f2fs image"
+	exit
+fi
+dd if=/dev/zero of=$TESTDIR/mntdir/testfile bs=4K count=513 status=none
+ino=`stat -c "%i" $TESTDIR/mntdir/testfile`
+safe_umount $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot umount f2fs image"
+	exit
+fi
+rm -rf $TESTDIR/mntdir
+
+$DUMP $DUMP_OPTS -i $ino $META >> $LOG 2>&1
+blkaddr=`$DUMP $DUMP_OPTS -i $ino $META | grep "\[0x100\]" | sed 's/i_addr\[0x100\].*: \([0-9]*\)\]$/\1/g'`
+echo "ino:$ino blkaddr:$blkaddr" >> $LOG
+
+SIT_VBLOCKS_SHIFT=10
+SIT_VBLOCKS_MASK=$(((1 << $SIT_VBLOCKS_SHIFT) - 1))
+val=`$INJECT --dry-run --sit 1 --blk $blkaddr --mb vblocks $META | grep "inject sit entry vblocks" | awk '{print $(NF-2)}'`
+vblocks=$(($val & $SIT_VBLOCKS_MASK))
+val=$(($vblocks - 1))
+
+$INJECT --sit 1 --blk $blkaddr --mb vblocks --val $val $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -f $META > $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+cat $OUT >> $LOG
+
+segno=`get_segno $blkaddr`
+SEGNO=`printf "0x%x" $segno`
+sed "s/_SEGNO_/$SEGNO/g" $TESTDIR/expect.in > $TESTDIR/expect
+
+check_result
+cleanup post >> $LOG 2>&1
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

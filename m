Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 648749B4939
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:11:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5l4e-00040N-VG;
	Tue, 29 Oct 2024 12:11:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5l4d-00040G-K4
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=drDBWrwXRY8LtJNpl+46/BUfyZ5jgzrP9OsYImnymO0=; b=dATsQ2dwE/i/b7fPLNzFQ8Owv8
 A8oIAfS3Ebl45p5FPVuw/KJrxjJV5Xrkr747P6DupEanV7lkQgLA7YbPMiwFi8mNWGhC47moLSfzh
 GedhDZj9gdyiMe1yVOZgeQY3Ezxh1cQlyiPfgCFtC0hEq6H55lMRc0rJEpj+n2wpfx0I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=drDBWrwXRY8LtJNpl+46/BUfyZ5jgzrP9OsYImnymO0=; b=dSHkfIrB4mC/O+xiQ/nthwfGGo
 lqQ7NRYz9Ywa8AlIXIOrHq4mcZqmQYUB8ER16YielESJd55S3RtFWuy2mCgn+Zq7A4EDtkI0gMted
 YOm7zMvyH8n1slU/0M5aF40eGQlmDdIL8+QILkwN+c64/R3HPn4c48iWc6mh6p+2+D3g=;
Received: from mail-psaapc01on2084.outbound.protection.outlook.com
 ([40.107.255.84] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5l4b-0007Qb-J2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuqwTraBTpzdTWdU7Lysl42f0X6pupiKnyJtZsm2CTRyvsly13YTVo/qgvnUwarLxi/URFLtCcgLgCu4e2mnqEa41U9nelGXGn1PWnrsnNBiE/r9ESf4o/a00X6SyIS+MTJsivOzhG91R3MQyjfftfdpFc34RTqIOINxaQGSq7BdLK2tDLzEISGS9iq4fivB2aA9uMRJT0CitgsMsHoF3cMtGhfqIdNad3Tj/807kCWbOJDfLhm4FkEmXKb3ehgmnFAUM4d8ZkqjAkzCbUapO/9SJSgmHT+ekQJYsqnuK4hsBYh7HFyBHVJzdBjIVlqs2FyRU+a/hy/ORwAwLCI3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drDBWrwXRY8LtJNpl+46/BUfyZ5jgzrP9OsYImnymO0=;
 b=CM5oUBPfxi5vG6L5A8TyRCKPBBp8M7aoFGdffQmomSaeqtRB9B8Noakc+DHB6HISH8vawDSASDe9sB0QHseJzzLqCd2ZKBeX9l2ojTdrdzhJ7VfOIcuYWLaJt92TyKLXW9PpMMulwP4D6bL5f7dinDzD70v1voqC5IOxbQpTOzlaP5Hch11tSnyOyUpdecW6P4lwKCjsamYdXWD/m0J55rOEPF4h8zVOyxjgFAiiqqW8Hd7NzuvH0yTsqvu4nPMJTcsBEwKInR1yX5IjdOoFl2hyBDwCmU/QStUWVOU+wQ9+jF1Yjm3I+HSOgf9YKPUBTfhE/Oq8savCYOvqNQD1Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drDBWrwXRY8LtJNpl+46/BUfyZ5jgzrP9OsYImnymO0=;
 b=LJ0Hs8wzFvaZpx9QleV3Ov2w7AqQ5MkH0EEkOUp21DaX0H9T9SDALMeq3+zdEkwRHTL7BD96T9ueuUPbwI3PE/AEFDTvQaKLaeSHCac6/W8iQtmVDOEi7oKZ/MXwhvT3L4em0YLIFZgSzZvkX1hrsZcvRSuxWSyT11BFtXuifUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB7326.apcprd02.prod.outlook.com (2603:1096:101:1f4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 12:11:30 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:29 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:34 +0800
Message-Id: <20241029120956.4186731-3-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc2b2d1-b5e4-4c87-6692-08dcf812d201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?31ui0+d1XIWSc0X9LraG5m0Yj10wEmluGuEq1Zse/7aGEVqMK11tHy5o2cq3?=
 =?us-ascii?Q?Pm0pdEgDsKF37m7HDJSUR8sty6spn9V6Gyxyjx4WbcL2bUp/Z/n0l1+KojCb?=
 =?us-ascii?Q?yzz3/dD6vU9+I8w+gMgiipSSvqtPQ3h6FAA3LWWsUJfsyFWN/5cSqTUbGU1r?=
 =?us-ascii?Q?mN2b6Mw1qVG1XPQUaq4fkI/jFZ8VQhgZ3w8GYPWsdXdz1hD/X45DUJGvO0lD?=
 =?us-ascii?Q?sp3L9eR0O7+ydeP2kI/ICim4UChpKBRcdHQRSpfcoDBVlDYZPIX8ijjsokKd?=
 =?us-ascii?Q?kKjmruksnJHghRsbkh87lZNoQRm+ziBYrmuh1ss1dOQ3B0dyY3gTNYgRDSeB?=
 =?us-ascii?Q?dbmI5g4nhWptr9CovRLycemLm3lhuF267vqDQEZsB5GzQbf02Ep/OwVntKxN?=
 =?us-ascii?Q?WUBkKLP2N3JeAhFRZzDreH/npba7PULtqe7A0SjduqR5BOu75XofVncjqb8P?=
 =?us-ascii?Q?zY/WoicyDbn9oxJG6fqkRa6yqtf4KQPXM/mECiRjP3knSjd3hlBJr2YswjxB?=
 =?us-ascii?Q?jng7QzhgkqyXHYAc7EA4h/rq8TeygLrWCrhvHcM/2hEy1B9zyXY9eXUE0gQi?=
 =?us-ascii?Q?v6L62G+AexSEh4hck+YbFohsAZJWIGrrVQu31ZvZfjoR/0CZ8/VBuQHNMwOp?=
 =?us-ascii?Q?c1BPXgCYJwgsIiL3Iw6xvlpJpd4pD7YfB9xu4czgNA0iqe/mx6hevmHobkye?=
 =?us-ascii?Q?7Vy8IgvNX+iVCKNHqK/HclUrbcol7h9A7HjAodQpzl+AMB2Emqao2Z5R/uxz?=
 =?us-ascii?Q?H+8bAPIVcl0eeeLjB5q/+uIG1EExb+5CBiath9noWrXCJjiBeJ0bOjPIzGRm?=
 =?us-ascii?Q?IIKb/nXrpK4WZ3IF9Q5Cw84QWn8m2aibLRH6/1/t5cE3pI/H0sUx3ZyLuzCm?=
 =?us-ascii?Q?2Vin8pqlW0Rpmg/dNBSTQYITlTx6M1S3feJSa/uUq5UkefG8BCtCA4fyHiA5?=
 =?us-ascii?Q?DJsi/Ljc4JlPu7VM0Bet9VOROqal/UzGsWvUrlwIQnmBq2Xb686CWvvAa8Yq?=
 =?us-ascii?Q?flCo29Z/mVmNFjDz76g/xRC96UqNvF5E+bRqjk8FWR/7aKLSbqX+ZW9qSctK?=
 =?us-ascii?Q?BkE7ORT48bYX8vUyMIt/Jx9h8KcJGJTLC2683HIKnIxnDiLR0O2rzg2qNQ4L?=
 =?us-ascii?Q?svaK3iCiubF2t9vW6B6Diik4Yeqc/PQQ/NM10VGKxyoR8c1lpyTV+0xsnZzs?=
 =?us-ascii?Q?R2+kmgxQ3HVmQ/hadouMNE5rXE5jMKATw3Co3RQdW+0FNa60kHR4t+SNd0Q7?=
 =?us-ascii?Q?3s4u3nzAu9gHC4rfVr306I6RfncA6mFjV57+SIyiuySYr+qE0XS5Z12g8Z31?=
 =?us-ascii?Q?hyKtLhQwPQ9xgcb55XvI8AViYSB3f9kn1lL7Avi4xsDfGX+yONNVWxMbbGck?=
 =?us-ascii?Q?fWuTdRA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2kNi8rrJtgfa1VezZ7vgRl3hZ6+zRcZKo1TO95wOUzIJCnEBdraeody1N2FC?=
 =?us-ascii?Q?+b2SqX/WlNAuDwBZ03wucp7CqGGQzNK1iJV+9PTEuBcafvwaFrW1BM4en/88?=
 =?us-ascii?Q?fgdsuNHr2Zneii5A/6rVGKdPwcIaC2qV+wMFoAFNTnl3jMvx8FlRSLUgZ3r0?=
 =?us-ascii?Q?5JhmJJj8PSs7zjs3av7RFtkaBIZld96BPQjvicLB1//y2/b0mjY6SdLhWOGL?=
 =?us-ascii?Q?Y7vTeMynRN9MzqAJmw9ttpND7SdzHGjmU7X98VGOlwJobpQl6nK+bKAg1k7E?=
 =?us-ascii?Q?wWQAihXn9RxwFOanm+/MorMNzYaOxYNElKQWTaAqDUPkHUmFqEW01F0JEQPx?=
 =?us-ascii?Q?45oLj7GuT0Z9F0jrttp4RTKvDdgu0+sxDJ7szx5rBpflYpEAXQQUEFYoGZpd?=
 =?us-ascii?Q?sBztmCwe9nLs2+VNJ2poIpYKZ1MHa0LUWj6BH4mXB0RHP/uLu2bWrWsMqpJz?=
 =?us-ascii?Q?uoi6+RBTXrZZmGL3Q45Vtj0RVtjcZUG6y9R32nyt9o7Swid1iSIycvfljA3w?=
 =?us-ascii?Q?Rfp7zrPYGcl7htPjN0ndFPXC8aXGT91vZaXNOjcH/12aCT16GwyCHBvCKbNx?=
 =?us-ascii?Q?3R8lrN/2mLUHTGz3ejO53iXglr0fzzHkfgU6PU54j6qwkBAaN54XOjHUleZU?=
 =?us-ascii?Q?KQbwqryKWn/42hcKI2ZAqejL2kB5I6lejlmyf0qZPlC66JwSDqRAeZ4H1VFD?=
 =?us-ascii?Q?QyacPCStpeQ0gHY0M+5Vy5evNU8oi0lY/J4dN6UJsfr3kxmEru+qZOYAVUAd?=
 =?us-ascii?Q?A17nm26g2g39YnpjEwPTaHpOb78c0VBwl6KiEEFmDM3xZEdEuc4FecQdRgOq?=
 =?us-ascii?Q?1CNWMOiEoJD3SRzpr6ptE9swwaAnqsWA1MszlICCsACKcoeS1J12ZwjtL9YE?=
 =?us-ascii?Q?Fe0f7K+ynHb/hvstpPNSQGE/Ndof8rFhhKIONGbA0Tf6zk6LpJGCr0LcH/ht?=
 =?us-ascii?Q?5z9fdkcpx3gfSqkeEJWUIOBT7gs3s1P2yGFz04TL3d1opZmjMGU1UioksZBt?=
 =?us-ascii?Q?g5pZgzryEDHtZBmBxwvenstMr1F81oDlfDemI9l1GK/ppC5Crnma9VG7iauO?=
 =?us-ascii?Q?hoFxatS8gxdsNN8qAe1Z0X8OW1/nCw4TLuD8p2hlaeCJ5ECKNb49Xd5gsSFY?=
 =?us-ascii?Q?OGsxHz5hEmDPXWPZNiav4cqOcRfCvauJCnz3r2WL7FgR81WNrFAQ3CWADsyE?=
 =?us-ascii?Q?rOiJ5UkVGOhLO56Md++qDsm+hSeEYQrsqahPZK/V9QlO72lIfKJ+H2AQtO5d?=
 =?us-ascii?Q?cptoIp9jX7ntSiqMsWAXsFXwwz4MvtthpRdKGo/6W42zYlPq4JNK5bgbOFzP?=
 =?us-ascii?Q?hKDqnPHyW1U9BgQRE2p6mihVjHUshiLvBb0IqqraU0UP+0YaFVHnW710WbJ1?=
 =?us-ascii?Q?kVEWKwlyOhIkUTCGS0FfzofT8ZDEpBRxbfiV19lLAc/R6htLSapDPK59c6Qv?=
 =?us-ascii?Q?htxb5oMa9b4vVy8QAFA0QQjh/7ovsjlzU/j+jKor3ifexN+esyxSFjhQ8Eaw?=
 =?us-ascii?Q?RQycuWw3Z5CDFPF69XTGPsVPiKxrczqQWYSxN+7to51f/WbRn5ezBo9zi1Yx?=
 =?us-ascii?Q?YQr04SYVH6VZNPduZjYYhqbi68NRt0YBNcJ+COP2?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc2b2d1-b5e4-4c87-6692-08dcf812d201
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:29.8334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyPd8B5AdQFHLLwtaZLLGAYG2chny4cUD4Ywi1fUTu1rr1yxxDrCvJGUffhTAraKFk6CS64hP/6IJ+9XvylVXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7326
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 fsck/mount.c | 6 ++++++ 1 file changed,
 6 insertions(+) diff --git a/fsck/mount.c b/fsck/mount.c
 index a189ba73e4bf..a09a974fc810 100644 --- a/fsck/mount.c +++ b/fsck/mount.c
 @@ -560,6 +560,7 @@ printout: void print_ckpt_info(struct f2fs_sb_info *sbi)
 { st [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.84 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.84 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5l4b-0007Qb-J2
Subject: [f2fs-dev] [RFC PATCH 02/24] dump.f2fs: print checkpoint crc
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
 fsck/mount.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index a189ba73e4bf..a09a974fc810 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -560,6 +560,7 @@ printout:
 void print_ckpt_info(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
+	uint32_t crc;
 
 	if (c.layout)
 		goto printout;
@@ -613,6 +614,11 @@ printout:
 	DISP_u64(cp, elapsed_time);
 
 	DISP_u32(cp, sit_nat_version_bitmap[0]);
+	crc = f2fs_checkpoint_chksum(cp);
+	if (c.layout)
+		printf("%-30s %u\n", "crc", crc);
+	else
+		printf("%-30s" "\t\t[0x%8x : %u]\n", "crc", crc, crc);
 	printf("\n\n");
 }
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

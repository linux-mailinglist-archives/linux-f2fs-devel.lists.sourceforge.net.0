Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6A183D451
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jan 2024 07:42:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTFuY-0003AE-GB;
	Fri, 26 Jan 2024 06:41:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <xirui.zhang@vivo.com>) id 1rTFuV-0003A4-W6
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 06:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=klYo/5e+mzk3nE8dRXmvmN8vjjZ/ZJXVlBfXoRT/AtM=; b=eQqdLKAZ7xxdwGH2wtshgD7r76
 MmA+znxCwJ9elMJSjGL+TLUp2/vynK1KnpxLR3dEAUu04HrAvBoItXQEvcNIygV2ru8Z/6Yg1sRAK
 X6/yqJt2RJ1p/by1WJT4K8c/CF2k1vquU/EvKyRDmeLXZn6SLj4IDdaM+Tc6bG/ktJQs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=klYo/5e+mzk3nE8dRXmvmN8vjjZ/ZJXVlBfXoRT/AtM=; b=j
 1liZBrVBumtN0M2pP3a1DIHQ6ClPkw1xehgvOqyE+B124LXnVju+5PkpfeGSSUooDdm3LnB77vt1Q
 tokA961g329q6WDnYSCQCDAHTw2KMxY261FTdjWp5QAqGQZeTX5C+HRBZF3/qKi2uX02FaRbA45Jq
 JK1aZU+o2WtHUSWc=;
Received: from mail-sgaapc01on2098.outbound.protection.outlook.com
 ([40.107.215.98] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rTFuP-0003bY-Fr for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 06:41:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IeWlPNyQGZrLP4DbqHPj3BRi2xLsLJFyvBM0SBrKGO7xE2sY4tDdveeSSNDb4V3PnC2B1634o3JkFeiWo2feSsQ7JXzitxhpeFVHfmYDs3w8Ujok93ZNwrL+Rwaik7tB4Rj0zogxgiZhMQhmuzA3KUbbO5jRMJBAJqjAa8/LNHLwZRWkBfFvwh4shpLurPLg+HvCXlYSiKG25uFXn4ep/UHRRslrWvuv9ZUkSn6YAE3cE3EJ1a+MKet5lPubSp4qXARMiY6n707B39VwXRy4ci+59mzVFsOFyJRcribVeFXT5WS4/u9Uz64EJCK+rmVs16do7HjbZ/ojNITVvtZD2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klYo/5e+mzk3nE8dRXmvmN8vjjZ/ZJXVlBfXoRT/AtM=;
 b=G694IYxsqcysDNTHUlhDQ7jyvJjQYEgOdjtZaKnMk2AKo3c1p/PNZdnDP7HTzyanOAMnqnOT2izormBEcyI0btCspAArtyoeGh2V01skK3C3tge1Gh6jOGfK4FOZ9ahBFvOPsLnV5M6RT3XzSqNgaQ26su0Z2w9zTCI160cEmJukS9VSVlx2kG7t5lY2z+DBxBZgi8cbEakxqrHJschXu0ijJrMed4JccW9isocC5J1Xxoe1+9l/JA2v1f4AMER+kHxYLC+Gukki1q7Kr5XtP2K2ZTkgUr/NOSutWzp8wLHmJkpSPN4mESAW/YmHB4QTzi7KdYaDIAmzKpj0vVCmoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klYo/5e+mzk3nE8dRXmvmN8vjjZ/ZJXVlBfXoRT/AtM=;
 b=EPMgW8MgoP4aNwbVbVBa+EJ5mkzJxI+arvXOB9qw4NX4lvvQq/E1Mspj2CDxVIq89moyxFsP/lvwLvODfZmLFEKr7PoJFta0jbuub7dm+knK8LebDM/TtIngwqP20AUVtMncAadZj6TOGuEPAFrw0oUGZ83PurvEE3aKqiFFsw464xluHbYLc2ea1Fb4dvJEU1b2GXDNIjY28P36T8rUrNJWK8Zi5jamSC6a1PUHqN1ALllwhU0lAaCE2PRKBfYPlYuqfviFetpYKUJl7us2Rhne+YLQWW1iKBiDktkqCAnXh6Roz8hX/lIKtHk2lxgqjcysWdJrUB6ZeAMy22P4BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5178.apcprd06.prod.outlook.com (2603:1096:400:1f7::12)
 by PUZPR06MB5572.apcprd06.prod.outlook.com (2603:1096:301:e9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Fri, 26 Jan
 2024 06:26:31 +0000
Received: from TYZPR06MB5178.apcprd06.prod.outlook.com
 ([fe80::c24e:98ad:6b31:b435]) by TYZPR06MB5178.apcprd06.prod.outlook.com
 ([fe80::c24e:98ad:6b31:b435%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 06:26:31 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 25 Jan 2024 23:37:23 -0700
Message-Id: <20240126063723.2926123-1-xirui.zhang@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::15)
 To TYZPR06MB5178.apcprd06.prod.outlook.com
 (2603:1096:400:1f7::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5178:EE_|PUZPR06MB5572:EE_
X-MS-Office365-Filtering-Correlation-Id: 362b7845-3cae-4a16-8a61-08dc1e37bc41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FRE5CkVA6ZxxS+25SRf5dXE/Gy/KPvoBfrRu87ZlTrHTU+cGayrK0xX7FfZsXc6RLt+ENlM1wRv1hmb8ELFdglswQ0mK0Nqy6+sxQQz3swiuBB4aAovOQ+nY3juL4cpxTii3ig0ChWqpE1ZmnCQToiV6Ksi3L0BrSUEySlg5kONFjiJevEZnc6p0AFk8Fe1MKUVZXD8TyfYkwK7OkGC6Ik11jX4lphfWmhkPnRXRghppg+CBst7qlMyrTXwdPbe9slCTHVXiissY4BPkY9O0XgHSHoAJcS2xXrmZ8WpsfdpaAuXBdqqm1WU5+ui+sAIU7oqNAcLZIDjzvsFgAocuHWDiheZjMGRbRLlm7iAi81qTnKhDL+sm5CGkd3ihUEL+FB8XlQxHNi9eyDegl4TPqiy13Xoy2AYoSL26ctsx+CIms94nFafyUDb+mRPdn9s3hIDW+T81yB6aiQyJ5BljVOWoqdYXuTGPjuUhhaDJsRxCx8+tobBt9PkovDxHf4/NhAPoolf6/8tsRU876S10+LI/n/171sPKcbFSf4FcZ52pwPh2ugu7I17ZOnSsNelFmD/BiY0oCJctcNm1BL6nxv9acHt26LyM+CberonU8jgTTqBhA5+DDeu1dc5A5kd5TsKOpcd/0ytLgGLmWPT9wQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5178.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(38350700005)(5660300002)(83380400001)(8676002)(6512007)(66946007)(52116002)(66476007)(6506007)(6486002)(66556008)(107886003)(6666004)(1076003)(2616005)(316002)(8936002)(478600001)(26005)(4326008)(38100700002)(4744005)(86362001)(41300700001)(2906002)(36756003)(43062008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yCHYo47z3mGpteUWIMYlpkHi9GCxJRCKnosW9MaZJm99XOvn/TXHJcG4liMl?=
 =?us-ascii?Q?32iF1/8D4GrMs8fOkL024uDYMD64aJEst7x7B5r1JIGot9GQ0Y6vXa+NnBOy?=
 =?us-ascii?Q?CgVZ0YTXaXk5b61+K4dBWd9GZI9P2ijIBi2HnEMOWJPW/344x+O25JwnVZQn?=
 =?us-ascii?Q?urFb6vUn3T2oGqlnesQSr83uaSxrbe4Yasu78/3lRE6wUIkbK+w9d9k7uhQp?=
 =?us-ascii?Q?CbCcCAwvoSm/ONTcwkoSZhwJV1kZJI7bmMd++0Dyph/4s7d7o3Rgbuw4M0tP?=
 =?us-ascii?Q?gLczzYRzhiMd3pLyVMemoLmcES30Q7x9bPdjvMtwvEcrIWFUuYx6WVL3MhWb?=
 =?us-ascii?Q?7aKXzUCc0c0yAH28fx9dQxoMHaCGZXsmY7Ec/rvct39c70L3Hf6C7H4JnRL5?=
 =?us-ascii?Q?nWJcbf8O9aOoLVMPyEQycSAHv1kGGASn226iSwNCOi0xMZXG6dLMFxDHj6Wb?=
 =?us-ascii?Q?/tXm9OEcDeWDJt30gZn/ebf1YqROqXQx7JoEdg7O64pkgxhR3VkZKIQOqq0+?=
 =?us-ascii?Q?erpg9W9t9fE2xNM6DgIusRyFngKMudjR4GKjwaMuiWL9LY4SFIjA3v0+Fqip?=
 =?us-ascii?Q?2lq2Ndfh7+rq3ZnwKPh8KfUgeYBT8pL8RskBoREJl68tKvfi4u6mF5Hg70MV?=
 =?us-ascii?Q?PCjiumqmvShn5VvPRoFUUGT3y9JgEX0UsF4z/DoXSDLV8AJHY1BqUKne4GKn?=
 =?us-ascii?Q?zy3tqyfe4cb6ltQZePF110Cq5SVmQvKTDDgpJ6uop+67rcwpcj9fngOGQ23G?=
 =?us-ascii?Q?1RJ73++wNAyP8WTeSBj7Hvw0OG01zInbq2XjXVUF8qnWUhOIj1vf3gz7Md3i?=
 =?us-ascii?Q?jfJ3FmmSm5hYl2hyS1+StsKA3jWrfjEqre1iU7AkeJOf90C+p3MbWl3bw4oa?=
 =?us-ascii?Q?DouZfQ4LbBrFwVBUWo+jJ3U7eC0WJIStSJCVTfIifDokxYX6JuFsWBehKQCl?=
 =?us-ascii?Q?M4qGiBiUACXa6FAW8m3HSrTD2qiMzHwkeGsIiO5tcUgzwwAjresZUQNpwRZT?=
 =?us-ascii?Q?qhpDmiuj98G+TUpSWTISUZWM4NtY6IFr97LI8OYxpQgH3BlHHqib6lrq8v6/?=
 =?us-ascii?Q?vuI87yXOji5THIDcQEYpZ14TYnw015/0siLv8WTQJPtRkXltjMngok5LqhUB?=
 =?us-ascii?Q?nZKYcVzmT9Xf0HpmWEVUZqMxEjFs4/NX2mU5XGc5dGHXnKb1u2WDyJ8pVIoi?=
 =?us-ascii?Q?vZmb8VRyb1tZvyfzfEDaDFzqzztjR8z4lhyejxnUmXUIO7b3AdG5m7CjMZeF?=
 =?us-ascii?Q?C8gzCpsFUUlZMrtaR/L6EPTdaUl5jdYoGgGudqODmlI9xHd3+OTqxd0na155?=
 =?us-ascii?Q?gtaEmLrtovCETNVgHhDJWXrWHDPyZ9QhXJjz7w8aZjePA1nulKrSKHE0hWX6?=
 =?us-ascii?Q?PyR9vNz1Y3Ao4DD41Hb5VX6mxaD7DHMMxpwfzlm4mXFGerKrtkf4RYV9J4kY?=
 =?us-ascii?Q?rGPnYmlxyIuH60DyyB5uN5rmQ/YrymBP6564tr26hMaqncf0q/6et+icr1gd?=
 =?us-ascii?Q?uCPuNn/YZATGf/aOcb3dMAGVuItZbGRMJLEcOSZKwj9zlmPJyNmO6s8QVbsM?=
 =?us-ascii?Q?5U9BQ+LzDaQFcJnAvBdst1em+C7vbahyV34CUjk3?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 362b7845-3cae-4a16-8a61-08dc1e37bc41
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5178.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 06:26:31.2554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ld/AFD6I3Wb3wEnpD6vekkCSbx28M1gmMjp8XiREY9PnRx3tQBMFcfJZeu63kkGWPEd09BZ3h+9xapTI+D5hnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5572
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In sparse mode we just read or write to a sparse file not
 a block device so no need to check device mount state in sparse mode.
 Signed-off-by:
 zhangxirui <xirui.zhang@vivo.com> --- lib/libf2fs.c | 4 ++++ 1 file changed,
 4 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.98 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.98 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rTFuP-0003bY-Fr
Subject: [f2fs-dev] [PATCH] f2fs-tools: skip check device mount state in
 sparse mode
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
From: zhangxirui via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: zhangxirui <xirui.zhang@vivo.com>
Cc: zhangxirui <xirui.zhang@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In sparse mode we just read or write to a sparse file not a block device
so no need to check device mount state in sparse mode.

Signed-off-by: zhangxirui <xirui.zhang@vivo.com>
---
 lib/libf2fs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 2451201..5315de2 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -830,6 +830,10 @@ int f2fs_devs_are_umounted(void)
 {
 	int i;
 
+	/*no need to check device mount state in sparse mode*/
+	if (c.sparse_mode)
+		return 0;
+
 	for (i = 0; i < c.ndevs; i++)
 		if (f2fs_dev_is_umounted((char *)c.devices[i].path))
 			return -1;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

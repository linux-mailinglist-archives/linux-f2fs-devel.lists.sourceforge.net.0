Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F3944BA62
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Nov 2021 03:37:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mkdUV-0000UP-N6; Wed, 10 Nov 2021 02:37:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mkdUU-0000UJ-Np
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Nov 2021 02:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cxIhdUSp8tVsJlQyPNWKIAsGC0z2qhp+L+tRbxSwhLc=; b=ajvWayIrUjBl9YG4O/3g3TjjFd
 IIIGLN4Fr9tV7/57xEuV5ZleEheoVeaTVoWJfVqc9C5vSjvpwZNPKnQXjNxjN5/0G9Jjp3Mfveu/g
 9jQ1HlBDWYSR1Ey4RqI1f2WszRTPwxa9jTBk+EjSHDVvQEQZReo5/98tiPTZ4lh+9AH4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cxIhdUSp8tVsJlQyPNWKIAsGC0z2qhp+L+tRbxSwhLc=; b=G
 k/JcR9cMki5g9G7MRfhvgnr7YipPjNo/MGurJjBgseWdOmfVaU3yMCcfP0ZeH0tQNgz11iLA7ce88
 1mY0xzBGwa1MLP7HCPu0lbj/FGf1QJHKLCQN9dEQwDnaEx7p3T5JZC3J/QtJe45mOMeoCG9Zykot6
 EbUAaUpTviVIZZZo=;
Received: from mail-eopbgr1320098.outbound.protection.outlook.com
 ([40.107.132.98] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mkdUS-007wwM-V8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Nov 2021 02:37:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VL5KOZbW+EgnyRgzGT3fkU1Dz2MIuvjI3VfmOtSSeV/J+ujFb3juFywfXNtkZhsePYbULiHLaGW0GspitVlKKTo04dthAy3oEmdRNy0V1hZ+8ulwslOWl2u2dhPN/6JlFPp2Ux0Xk4GAf4y67ONUaz4aNLU5TB6/AURrmc6JsO9LM6TEJ2T4GApVQ9z1ZStoMUqEexP4tIy5Y6gshvdlzvWLPZRTDdilFGx+S05/EVe++PnrDAeAS4R+YryvBN2pbEkUZZEY+Op9EjrY+VT069peVDec34e6dkQtrFF21WMQkO3bOW3TSNvo8dEqPCvhilT6lXWHKQ0l44XSxt8CUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxIhdUSp8tVsJlQyPNWKIAsGC0z2qhp+L+tRbxSwhLc=;
 b=ivJTVOCklWpOB5VZ4wnsXTrCtJyxKQ/sL+d65ZdJQTcW/ac5iHg0vnljFeezltU1L45V4pVJJmP2btJc5FI1njb+dBUTQGGRz/eleEgcMYa1L2kdgbZKnYJJGAW7/8oss8+TXhoiNhWyzKvUA75LqDyxvimjKzXZNbV4NW26NRRFfwHibhJuYTzNBphkOnAcTaTs6TAM36uUIpZt/8mTAoAPz6gTKclk0YZyre5GAAYduHj6fcJmRy5i0nfldulhAdDWe+NdNlKZJfzyiBjXPCqIx4tolFLpyNq4OiyRbolgiDrULk3V2IMXrVtxpof8wsSWqt46vZ+DraEalW2FbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxIhdUSp8tVsJlQyPNWKIAsGC0z2qhp+L+tRbxSwhLc=;
 b=gcH2xy30OPoPR0vqMWbvkt79eN5RjnuFS+VenRov9KVKb/bkEY9jmtAhJAWqBT5+kHbNkFpyX1NtpQEuy+sLAiiM0e2umLLyfEtV78+XsrXze4vWz+mi7GjeS0HC0KV9/R2Ezf8cQbd8TUCuuHU2fcJhzFJleSR6t/2vPq/mbKY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3781.apcprd06.prod.outlook.com (2603:1096:820:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Wed, 10 Nov
 2021 02:37:21 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%5]) with mapi id 15.20.4690.016; Wed, 10 Nov 2021
 02:37:21 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 10 Nov 2021 10:37:13 +0800
Message-Id: <20211110023713.5632-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK2PR06CA0012.apcprd06.prod.outlook.com (2603:1096:202:2e::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4690.15 via Frontend Transport; Wed, 10 Nov 2021 02:37:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47508c1d-e90d-4d04-56e6-08d9a3f30523
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3781:
X-Microsoft-Antispam-PRVS: <KL1PR0601MB37811A06F741318A7FE69057BB939@KL1PR0601MB3781.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n9szGQVkC2Ged2eQZ/bKrDGoVepIjVvbjyx4bEiM0kBLqa7GroKl2eeNYyOOOS4zxOxGpczkFINgIAkT2nYJlh75BCAmOGhRBMqYyQN/hBRAy/WPPP6FAZ7Lfz1kPc1a8/Qgv42D3ZRaac6zp/iMwOoj2eRRp6jkNYDLs9TrEJnTpVzjulNzsc6G6BUrO6S/0zPC8TXDUf0dVCLmAsdMnIm+jKajF6PO1Y9zGoFDeDQATsrSlCxKo8LbEse7TgZ+CeAI9seFpC+Tvb7Nc2g6A35MQ/DLyB5zztt+7fDWYKjr4BHQsOBbx8DeA8Q2U/l079vbCsmkmzHKpEQfxq/poT5vvp54atVzF+RB29G7XqYITWnuhIrKwudmd2i7r77yKSfSV5Ii+bIz3d12/H2HPfyULMjrGMIuZWiv+7Pp1y/Jmq3at48v/seYQauTcD/Qi1xbU2HyPzqSBGQsq/BnyJfWDhRkQitBORlJZFFVENn/Hf4NQUZabn6hD2j0S2NSFFzaHaBnWr4x5eIx4xDvk52OxUHHRdeKPHZ5cP9697FkkvWEtzLYj+n0jtZ+9sHL0lp6e4zFzxhNAo0IOpz7T1ZOyVEWOJcf/t1qjyzwfbf8czRkeuNtdPI38tD8/XoXuwytNSO3WLiNuJ2s3IcM18V7oZj5LX7CGn4creVks2DUEjyjDeWXeWk9BoG+KP9sqicIWbTaFjpEY3PO46dqs0F9qICIVXH54enzvP2yNq4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(6666004)(6486002)(316002)(8936002)(6506007)(5660300002)(8676002)(86362001)(38350700002)(66476007)(66556008)(4326008)(38100700002)(1076003)(508600001)(66946007)(6512007)(956004)(2616005)(2906002)(107886003)(36756003)(83380400001)(186003)(26005)(4730100017);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0Zsahk1AsiCFzomajXKzgpbEUPCXHpXZwlbDzlrUT2RkchvITOI1GdWySFrH?=
 =?us-ascii?Q?sEaNyVTcagJwd30glWIWZtlkzXSnP0Y+F8Anj8vbuiIetGFbsPfX45KtpPtk?=
 =?us-ascii?Q?EIbwEVNTseQ4th3h8WslCoLZpxbImoG/PJl5U/fTrf6kUmvP5pvy9B/Ln/Rr?=
 =?us-ascii?Q?3WTSuXvszG5IWTW45tqaGStM+WEHdWpXpPGxMbm5xsonZAcwzqC9vkMxDZ7s?=
 =?us-ascii?Q?nJ2Jm92mUK0zLy3aQMWF6pf1Xe7+BF2qIXF5iCZTjaLmX7WVEPGBCvMuTCGf?=
 =?us-ascii?Q?82RlFHNYcrgrU+CM5cOLPQ6RfM5/RUyWcF7I7h2BMwWFNna1ETOr7wMDnLU2?=
 =?us-ascii?Q?0LCWf870LP/MAQMXr/GsCsbQjij2VddXKSJgfGiJPik4DoTmnolpqEmMly+o?=
 =?us-ascii?Q?fQTmmb/Hz2hh9/HtBWysrByq7DmdCeUSuXQkonYmXRWVifK8Ko7AxnnhqBPD?=
 =?us-ascii?Q?PRG3YzeSmbOUdVCLV1bQC5zCpZZoxEFmVWF/tnKd/BP+BiXnSpJIGyYc4J2l?=
 =?us-ascii?Q?9pzJc36KSxN8j7gGFlZMLk9gziZ/x0BWRe1VUemVmFqHVoCmewcNlLFpK3NF?=
 =?us-ascii?Q?in6R2UMfSBf2c5/nK6Amsoz6ywD6Ktor3OkB8vb//JZEYA0mtAVUk5Ji4JTy?=
 =?us-ascii?Q?gzVqE5PLi4UwbC2bRADl873u7WZqhnHPXTM+gUk9bA2bBJ/4L6eqhPcsIrjG?=
 =?us-ascii?Q?/dPvMkJkCC2T58VrFF55isRkFRrhIWKCWcPzagkSJZoe30uNwD+/eToV7DHx?=
 =?us-ascii?Q?ALQSYu1KQJwk31QqKnQ6d2We+nMWC79pmsxdDQei/oOVpOXWiJkDFBOICFcD?=
 =?us-ascii?Q?BBLYOUX3D5PHvz9zLu3+uYMv+kEkiCyKFbXh0666X/mZlhv7ifOlNtqvonck?=
 =?us-ascii?Q?iAdqOXd0geMmceUQTJG+mEzZxoLvMci2n53oSsTq1l1/zY2qUgrM62qhFUu7?=
 =?us-ascii?Q?yYDeAVQ9z+snmdb5/8NWrGSmk0ACxUpjCsNQaOQSjUtUpQ9tsxjWr/AGdFYS?=
 =?us-ascii?Q?biA3kRA/KMh4u6rh9RCu0MmYtDmniYQ8lP0CNRsLj+Wkc8wY7LtcygpNPNwU?=
 =?us-ascii?Q?9cWp08Lm2gufbWAvMhYs172X86gdtJ5afiDQuv/EndQxBApUKGbA60ZLivwd?=
 =?us-ascii?Q?TJWMVmPvJ6cMBEpHhGtK8LE8/c36PP1hTT3YbXw9dDIVLqpnvVLYsKPjWFUp?=
 =?us-ascii?Q?RNrfGqnP+eQohpzBdaEW03dH+oau+SGq9Zbv/G0Vi7Zv+GpRChHShKJciHUx?=
 =?us-ascii?Q?D6Gwnwkst2q5w80FVfhVAc5h4UFZIb7wxrGkg565cIZqC+23PLg4ZneI4yps?=
 =?us-ascii?Q?pqHTo1NZTaxtz7r8UnX6XbR7fRUpGZO34sI3mT08uAJ5RgqZpHcAY44w9+HH?=
 =?us-ascii?Q?BJkvx+VJsWysVEVPYArR1diw+Wifg+zeW4G3j2lWpCwfyXfDUNrDYcjSdwCg?=
 =?us-ascii?Q?EU1cu3upN8RuHJ/l3px2+P7duaU26Q2vq/P5wtY4Sqxaqf1NYZbyVfoRZ8bx?=
 =?us-ascii?Q?K16aF/HAiuMsXe/PDQE8JzQFF36jKkuqZYV0sSX6Mfm/+mlFetWhPgBG/U/a?=
 =?us-ascii?Q?9uLvILTa/vO+M4T0s1nCQCpUEH8DVBei5t5jkW84SgsFXjKjC2kJZ8JG05vB?=
 =?us-ascii?Q?NouJCXsjjxccEwpQ6gOSY5U=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47508c1d-e90d-4d04-56e6-08d9a3f30523
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 02:37:20.9582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzpQX0Xh0kFbqNKdiT+LHsGkWawP0MPAXROmCCO4OKikH1vD0IVeEY2dgVRII2oPg5tDkXQZ1tQaQdm+TvJ9DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3781
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Don't alloc new page pointers array to replace old, just use
 old, introduce valid_nr_cpages to indicate valid number of page pointers
 in array, try to reduce one page array alloc and free when write c [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.132.98 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.132.98 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mkdUS-007wwM-V8
Subject: [f2fs-dev] [PATCH v3] f2fs: compress: reduce one page array alloc
 and free when write compressed page
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Don't alloc new page pointers array to replace old, just use old, introduce
valid_nr_cpages to indicate valid number of page pointers in array, try to
reduce one page array alloc and free when write compress page.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/compress.c | 32 ++++++++++----------------------
 fs/f2fs/data.c     |  1 +
 fs/f2fs/f2fs.h     |  1 +
 3 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 9b663eaf4805..c383010f3cb0 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -153,6 +153,7 @@ void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse)
 	cc->rpages = NULL;
 	cc->nr_rpages = 0;
 	cc->nr_cpages = 0;
+	cc->valid_nr_cpages = 0;
 	if (!reuse)
 		cc->cluster_idx = NULL_CLUSTER;
 }
@@ -619,7 +620,6 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	const struct f2fs_compress_ops *cops =
 				f2fs_cops[fi->i_compress_algorithm];
 	unsigned int max_len, new_nr_cpages;
-	struct page **new_cpages;
 	u32 chksum = 0;
 	int i, ret;
 
@@ -634,6 +634,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 
 	max_len = COMPRESS_HEADER_SIZE + cc->clen;
 	cc->nr_cpages = DIV_ROUND_UP(max_len, PAGE_SIZE);
+	cc->valid_nr_cpages = cc->nr_cpages;
 
 	cc->cpages = page_array_alloc(cc->inode, cc->nr_cpages);
 	if (!cc->cpages) {
@@ -684,13 +685,6 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 
 	new_nr_cpages = DIV_ROUND_UP(cc->clen + COMPRESS_HEADER_SIZE, PAGE_SIZE);
 
-	/* Now we're going to cut unnecessary tail pages */
-	new_cpages = page_array_alloc(cc->inode, new_nr_cpages);
-	if (!new_cpages) {
-		ret = -ENOMEM;
-		goto out_vunmap_cbuf;
-	}
-
 	/* zero out any unused part of the last page */
 	memset(&cc->cbuf->cdata[cc->clen], 0,
 			(new_nr_cpages * PAGE_SIZE) -
@@ -700,10 +694,8 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	vm_unmap_ram(cc->rbuf, cc->cluster_size);
 
 	for (i = 0; i < cc->nr_cpages; i++) {
-		if (i < new_nr_cpages) {
-			new_cpages[i] = cc->cpages[i];
+		if (i < new_nr_cpages)
 			continue;
-		}
 		f2fs_compress_free_page(cc->cpages[i]);
 		cc->cpages[i] = NULL;
 	}
@@ -711,9 +703,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	if (cops->destroy_compress_ctx)
 		cops->destroy_compress_ctx(cc);
 
-	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
-	cc->cpages = new_cpages;
-	cc->nr_cpages = new_nr_cpages;
+	cc->valid_nr_cpages = new_nr_cpages;
 
 	trace_f2fs_compress_pages_end(cc->inode, cc->cluster_idx,
 							cc->clen, ret);
@@ -1288,14 +1278,14 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 	cic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
 	cic->inode = inode;
-	atomic_set(&cic->pending_pages, cc->nr_cpages);
+	atomic_set(&cic->pending_pages, cc->valid_nr_cpages);
 	cic->rpages = page_array_alloc(cc->inode, cc->cluster_size);
 	if (!cic->rpages)
 		goto out_put_cic;
 
 	cic->nr_rpages = cc->cluster_size;
 
-	for (i = 0; i < cc->nr_cpages; i++) {
+	for (i = 0; i < cc->valid_nr_cpages; i++) {
 		f2fs_set_compressed_page(cc->cpages[i], inode,
 					cc->rpages[i + 1]->index, cic);
 		fio.compressed_page = cc->cpages[i];
@@ -1340,7 +1330,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		if (fio.compr_blocks && __is_valid_data_blkaddr(blkaddr))
 			fio.compr_blocks++;
 
-		if (i > cc->nr_cpages) {
+		if (i > cc->valid_nr_cpages) {
 			if (__is_valid_data_blkaddr(blkaddr)) {
 				f2fs_invalidate_blocks(sbi, blkaddr);
 				f2fs_update_data_blkaddr(&dn, NEW_ADDR);
@@ -1365,8 +1355,8 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 	if (fio.compr_blocks)
 		f2fs_i_compr_blocks_update(inode, fio.compr_blocks - 1, false);
-	f2fs_i_compr_blocks_update(inode, cc->nr_cpages, true);
-	add_compr_block_stat(inode, cc->nr_cpages);
+	f2fs_i_compr_blocks_update(inode, cc->valid_nr_cpages, true);
+	add_compr_block_stat(inode, cc->valid_nr_cpages);
 
 	set_inode_flag(cc->inode, FI_APPEND_WRITE);
 	if (cc->cluster_idx == 0)
@@ -1404,9 +1394,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	else
 		f2fs_unlock_op(sbi);
 out_free:
-	for (i = 0; i < cc->nr_cpages; i++) {
-		if (!cc->cpages[i])
-			continue;
+	for (i = 0; i < cc->valid_nr_cpages; i++) {
 		f2fs_compress_free_page(cc->cpages[i]);
 		cc->cpages[i] = NULL;
 	}
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f4fd6c246c9a..4ddc0ba0f2c0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2934,6 +2934,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 		.rpages = NULL,
 		.nr_rpages = 0,
 		.cpages = NULL,
+		.valid_nr_cpages = 0,
 		.rbuf = NULL,
 		.cbuf = NULL,
 		.rlen = PAGE_SIZE * F2FS_I(inode)->i_cluster_size,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 039a229e11c9..acb587f054db 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1481,6 +1481,7 @@ struct compress_ctx {
 	unsigned int nr_rpages;		/* total page number in rpages */
 	struct page **cpages;		/* pages store compressed data in cluster */
 	unsigned int nr_cpages;		/* total page number in cpages */
+	unsigned int valid_nr_cpages;	/* valid page number in cpages */
 	void *rbuf;			/* virtual mapped address on rpages */
 	struct compress_data *cbuf;	/* virtual mapped address on cpages */
 	size_t rlen;			/* valid data length in rbuf */
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

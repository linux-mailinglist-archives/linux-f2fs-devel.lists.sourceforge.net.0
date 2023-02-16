Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C02969931E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Feb 2023 12:30:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pScSc-0004cb-4p;
	Thu, 16 Feb 2023 11:29:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pScSS-0004YV-JY
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 11:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TdfpifIYhOKer8hj1DCVVWwHr82z5vBdasMIEGH4r68=; b=cXLGzL7B5Z4NRNO71cqDFQWhPS
 3lbfWy9MOoizGAi9IQp63Bcanm+vU6LHxy8A8IEwLnBc3yYkDB1MyIw+Rovr0T102i4l7nWu8xLsB
 LJenUSuZ8onLAyBfl7mWyWtsrQg2JROyOtjT6JxRDKirq0saQ+THnrqnOeQt7XD+cQ7w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TdfpifIYhOKer8hj1DCVVWwHr82z5vBdasMIEGH4r68=; b=R
 GqLQJrEt8kc8sMwMc3gEuK6+9JsxsxK1nzUcB+O8DF9pxMZj+XViyeNNK5HKh/0St7lAlaHd8OF8N
 0nFg7I7vyGbr791cv3Co9Fu98P5ZnmVBxa4b/uRFHIhFkNQ6J6cZyKq0e+OrbtyrZqlkwYAb9tzcd
 kHgDhOi6lLZ4fs94=;
Received: from mail-psaapc01on2139.outbound.protection.outlook.com
 ([40.107.255.139] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pScSJ-0003NY-JT for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 11:29:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8u0Sjk7emYZBpyaXc3HJNXH6hnZNFwDfZkALFj17lI5lvxQDmNixbql1KHN0FOia/sTxkJ5NABg2qZja08XpAu5Gf6KvvmnzV6Vr0rfepq/0gLVh5j902HVVxCkI8+++FQWcVjh/JpXiFeL4ijUCKpLzTScfODacLWLlcXxsz9Vh/LgGL8lDGRpSJf+KvfGW8TqZeBPOa/k0VRiUE11WVDOhUF2XgPtsxNibL2APe/eNoBmCWFjJJho6H+yBRfm4phjsXi+M572tNnCFCeaNUM/MIPkg+b81WPxZcPpBWP5oFT/9NkaInJGuzYtwYFRp8oYHvnanycKOd50gtyKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdfpifIYhOKer8hj1DCVVWwHr82z5vBdasMIEGH4r68=;
 b=hDg+OMx53o/y+keUGBaNjf191Jxu2JoAn1RDplVyaVPULn2E7y5sqvvADtIkDkFeMaQQv+9e70vfJS8465MeCBJogzcZNHqGES0ZIQOx8Gw3wox2DGH2bvf2ZEbLP5EOZ0aoERBySjG81ElWM2ah5PxBVaHnMBYIK4JT+EAQ9rKIgqBUzTjmP6mBHlmzOBWvswBAO8JVi8uFEpD/loeRPQJObIFUUNIXJO7s74Y9rfn4rh01YV6qfEppGA6L/mkJpIlO0XkYEPx9Jiti26cPbRpOu9/p/J8ui7iJFR2tT8hLKX317RfzFNZOmW8PFenRkqEh8+hcNhD/yl91Z6HBbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdfpifIYhOKer8hj1DCVVWwHr82z5vBdasMIEGH4r68=;
 b=n9fNPSX0WKMQC0yoZUU2Go2zCWVE7D0R9XjtOzJWB7tPvBHSzFDGonDEmBXkP6NjgFzk24rF2quwahIhWQgEiv4xuKj/MobjlzewKKuDf91C46E/+ogNV1cMuC29KisxsuR4fCHOs7Hn781wXkFR+ID2kRv7WfM02LvDyMnOvi6lmroA3rpZRtjsZt8iJCYcZQ7tA/NpbWkZ5fZtw5Lg8i3ouk/pQfzsoko4VThg0rbYzU+2+ORi4xNCGlZWcrRFOuA4YincPKr9CmoS6cSrTvPFgBWk9E90UxfZnGLlESYrCQIfJ7dgoWnqZ9H+oiRSf9boIPOUoKjPjpyI4Ec2cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by KL1PR0601MB4418.apcprd06.prod.outlook.com (2603:1096:820:7a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Thu, 16 Feb
 2023 11:29:28 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190%3]) with mapi id 15.20.6111.009; Thu, 16 Feb 2023
 11:29:27 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 16 Feb 2023 19:29:15 +0800
Message-Id: <20230216112915.43036-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR01CA0122.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::26) To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|KL1PR0601MB4418:EE_
X-MS-Office365-Filtering-Correlation-Id: b95808e1-5f1f-4dbd-53b4-08db1011101a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dqi0CezHV+rqZWacyM6uXWIj+KCjdMr6g8GPMrtDQUf4i4lMey0t+WJOJkWDGV8CpK9vPQYZWBi1EXxr9KlzkNYnWT/LhAA4b6SfrZ8/D0+gAd/9uYIhcPUhIpYdjYBBHVgLnMC5DhpEftBBGH3BqlBzj3loTVg7qoAQvQcgs9et7Pto/JmM+R7gZsRnn/Ay0Mfh+7JjkOQQR9Ri/clZbNB0x2Q6M1zfWHYHtoTCHS9FxZE6ce3vVzShEDuwuhhajxQD1sOFD1fbaRjT26Q6WYF/VH+XgG8kucBlz8V/lsU7Oa1unJ6tWwPC6COXJe2UAIEqBR6I+MTid9lHLqOuYEj0noe6gR62HtC27jld1Z9A42V4uO3DJhQtUnNjrYnqDytWWZkJ0yXEjeiOMcAbNdnjKRG6MP0etY2oj9c0XKUKd873PUO9LpzgJxy+HVVYPbFYhh+shlUPAe9bwoIxN7LtcLFOfRoUy49+WO1jFCHApUIfm6DMWJ1U63D1C7YgPaAU9NBYgocCCf9ZoWKTkStTrJGfMudZ2hapKOKShlb0MAsW4DDDn6WuxSQ6vDpWslBaCmRNYh355gCMPOXneqWhln4yS+oQsImn8VY9PjJwTm/AdlP29YfEdt5MZWU9P0x7gqoA8ejY2kvbc7JEeiSe6ImX//w4KewIGhjgHp9H8bOEjDeLoUeKGh9FPUdyNLlqj8MdF2gJrmeN/Re+xA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5275.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(451199018)(41300700001)(8936002)(52116002)(30864003)(6486002)(478600001)(316002)(5660300002)(4326008)(66946007)(66556008)(66476007)(8676002)(2906002)(36756003)(38350700002)(38100700002)(83380400001)(26005)(2616005)(186003)(6512007)(6506007)(1076003)(6666004)(86362001)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cRZbpGHykYdpOuEkt6mUg9zM/+Ice2VVErRcrCesWMZ4NagKwTzUROaJH9cN?=
 =?us-ascii?Q?XDnkamJvV4JgPco0QhSB1hHQQeBNYi4U74+ky+Wb/fPP9+LTrnW9iFB1Kx0I?=
 =?us-ascii?Q?t3kWtw2M9k60j0iOM8pf4SAkPEJMVdZA9fzhcjetIVdQJkcqYqiCU6386/dT?=
 =?us-ascii?Q?n3TJcvb3w+2UYRSoUjoXEn0ZY4lge3CzMxA8x0R6eHowWwKZ5KBe9Fffysi0?=
 =?us-ascii?Q?mFRA5mYLDET+45X1UZDnafB4FezKScKjgXjw/8mUN+atWJJaDOYqrdE/IMoU?=
 =?us-ascii?Q?R9pv9RgueiFHA6i1Twxn/QBadHbSq7TfR+u4aEmsVRyzA5ae3D3ke6x0aMUe?=
 =?us-ascii?Q?KR03pWCqcVDGOyPN9NFYdsvFJI6gLHLIQvPt89MPgn432RUgKC8eOVg5JywZ?=
 =?us-ascii?Q?0D+yRHIgIeUl+4SmUJjKEvYnaqE9tR6ZkVt+O4YGvF8VGZdUQrwjqiN7+Yi6?=
 =?us-ascii?Q?3b4OR3MY7n5yfjL7IOfLf1Pf85isM6Nk8V0S0D0hyIVq3BclEZX0M9oXdYFn?=
 =?us-ascii?Q?PdWJgmmq4JjA0qRPOeXIe/MkbB08X36d87ne/uzy2WFFVmYdAsaKFGS8H9JC?=
 =?us-ascii?Q?UCZcEmviYLwBG3KmE+tZxrIctpFZz87vu1bQ1+vmM9TgYXjfWGvqzVnLBEXJ?=
 =?us-ascii?Q?9asmWNvpP/3NX7mGDS+0S9q+0D3+d91eOU1tphjONTlW7If2gwIVsN87wOqw?=
 =?us-ascii?Q?uWXFZ/Q7WPyGXXrsmu54ZkqkTyK+v8uHtKaZpA43lg06jErpA/UfIqjQA2bF?=
 =?us-ascii?Q?5yesABb/30akSM48/hvkP0r0VvcDqbISYIv9iPukqV2huAifyrSGO2nTqBC4?=
 =?us-ascii?Q?Z8GAtamzZZWyMRBzWTzxlmsWyYvsddb57empT2OkoVGZgu0ShRmQjyPds2bT?=
 =?us-ascii?Q?4JqKq0qqVGtdTpGdXkIMEB53S7HoSGyC4fvWvGGXcWdlDCMsKP2m1omgIvh7?=
 =?us-ascii?Q?4f5lj0jAIuFRR8DUzhrhzx8GckHTIxDXfqI17nl+I+Tju6MH6V7axzIze5ra?=
 =?us-ascii?Q?o36ccWrU8erVcHX/wzvptRcpR0YM6/ci52SpfScqLrYptg+kCOuibDg9mkpD?=
 =?us-ascii?Q?FvcbO+BZjB+X/zHTaTH4j2fPH01Svbfx24uRmtMqKL3lTz+zl5LjMCo+WOMG?=
 =?us-ascii?Q?Uf+d5XN6Q4xwPRMaQkOZ1ZOaAi8EbEOs5IuWO7+QF0tczebG5mW1T13QAtxh?=
 =?us-ascii?Q?aGgf/1ST2mDGlqOAS5gUgDgUPop8+NPCS4Fi1E1iqxq/9htVoX/DCrnRhaZJ?=
 =?us-ascii?Q?/Kyat3/AahfGnu/3IGguMozodd+gokdlEfEzM487mKcaBGMndrQAzFK8yfHU?=
 =?us-ascii?Q?MzEpF2i85mSdH4WpOJgTJlfauAstu4D51r0ybGxvNTyKdfWzTcauW5i1h8Zj?=
 =?us-ascii?Q?9pymwNg3qJGszo29SAuoamWP0PVJQMUnMZv63dLzTENQ0LFTZ2ZCTdC5CR42?=
 =?us-ascii?Q?CpSzQ8LLedibxCYMJ15rlXxlfuCODl0mlEdvbHgRzU8jHB+eCjpW+UyORvq1?=
 =?us-ascii?Q?ZfFKyI62VgQTB7amXQxOG+j/1wIkdEehE5ofugAZ62mn7exKEsddjjsKB0vz?=
 =?us-ascii?Q?H9oXLcvnxr0XWS0rdoMMwFw1142nsriMnridf2sT?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95808e1-5f1f-4dbd-53b4-08db1011101a
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 11:29:27.5737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUUrB/BuCwERZOW83464FKorTF1C1jXM0pX/Kg3YRZsovZqyYTA9SnmvXvEVascUEIwBx3BDhhL7tWPx9lUlaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4418
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In this patch,
 it adds to account discard latency. Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- fs/f2fs/data.c | 2 +- fs/f2fs/f2fs.h |
 1 + fs/f2fs/iostat.c | 83 +++++++++++++++++++++ fs/f2fs/iostat.h | 49
 +++++++++++ fs [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.139 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.139 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pScSJ-0003NY-JT
Subject: [f2fs-dev] [PATCH] f2fs: add iostat latency statistics support for
 discard
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In this patch, it adds to account discard latency.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/data.c              |  2 +-
 fs/f2fs/f2fs.h              |  1 +
 fs/f2fs/iostat.c            | 83 +++++++++++++++++++++----------------
 fs/f2fs/iostat.h            | 49 +++++++++++-----------
 fs/f2fs/segment.c           |  8 +++-
 include/trace/events/f2fs.h | 68 ++++++++++++++++--------------
 6 files changed, 118 insertions(+), 93 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 28e09682b056..b67c0b41ee13 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2312,7 +2312,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		if (bio_add_page(bio, page, blocksize, 0) < blocksize)
 			goto submit_and_realloc;
 
-		ctx = get_post_read_ctx(bio);
+		ctx = get_bio_iostat_private(bio);
 		ctx->enabled_steps |= STEP_DECOMPRESS;
 		refcount_inc(&dic->refcnt);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 21596e0266ba..29e973f67c3c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1131,6 +1131,7 @@ enum page_type {
 	META_FLUSH,
 	IPU,		/* the below types are used by tracepoints only. */
 	OPU,
+	DISCARD,	/* used by iostat */
 };
 
 enum temp_type {
diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index 3d5bfb1ad585..304235b4f543 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -86,23 +86,21 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 
 static inline void __record_iostat_latency(struct f2fs_sb_info *sbi)
 {
-	int io, idx;
-	struct f2fs_iostat_latency iostat_lat[MAX_IO_TYPE][NR_PAGE_TYPE];
+	struct f2fs_iostat_latency iostat_lat[MAX_LAT_TYPE];
 	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
+	unsigned int lat_type;
 	unsigned long flags;
 
 	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
-	for (idx = 0; idx < MAX_IO_TYPE; idx++) {
-		for (io = 0; io < NR_PAGE_TYPE; io++) {
-			iostat_lat[idx][io].peak_lat =
-			   jiffies_to_msecs(io_lat->peak_lat[idx][io]);
-			iostat_lat[idx][io].cnt = io_lat->bio_cnt[idx][io];
-			iostat_lat[idx][io].avg_lat = iostat_lat[idx][io].cnt ?
-			   jiffies_to_msecs(io_lat->sum_lat[idx][io]) / iostat_lat[idx][io].cnt : 0;
-			io_lat->sum_lat[idx][io] = 0;
-			io_lat->peak_lat[idx][io] = 0;
-			io_lat->bio_cnt[idx][io] = 0;
-		}
+	for (lat_type = 0; lat_type < MAX_LAT_TYPE; lat_type++) {
+		iostat_lat[lat_type].peak_lat =
+		   jiffies_to_msecs(io_lat->peak_lat[lat_type]);
+		iostat_lat[lat_type].cnt = io_lat->bio_cnt[lat_type];
+		iostat_lat[lat_type].avg_lat = iostat_lat[lat_type].cnt ?
+		   jiffies_to_msecs(io_lat->sum_lat[lat_type]) / iostat_lat[lat_type].cnt : 0;
+		io_lat->sum_lat[lat_type] = 0;
+		io_lat->peak_lat[lat_type] = 0;
+		io_lat->bio_cnt[lat_type] = 0;
 	}
 	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
 
@@ -208,62 +206,75 @@ void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
 	f2fs_record_iostat(sbi);
 }
 
-static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
-				enum iostat_lat_type lat_type)
+static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx)
 {
-	unsigned long ts_diff;
-	unsigned int page_type = iostat_ctx->type;
 	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
 	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
+	unsigned int lat_type = iostat_ctx->lat_type;
+	unsigned long ts_diff;
 	unsigned long flags;
 
 	if (!sbi->iostat_enable)
 		return;
 
-	ts_diff = jiffies - iostat_ctx->submit_ts;
-	if (page_type == META_FLUSH) {
-		page_type = META;
-	} else if (page_type >= NR_PAGE_TYPE) {
-		f2fs_warn(sbi, "%s: %d over NR_PAGE_TYPE", __func__, page_type);
+	if (lat_type >= MAX_LAT_TYPE) {
+		f2fs_warn(sbi, "%s: %d over MAX_LAT_TYPE", __func__, lat_type);
 		return;
 	}
+	ts_diff = jiffies - iostat_ctx->submit_ts;
 
 	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
-	io_lat->sum_lat[lat_type][page_type] += ts_diff;
-	io_lat->bio_cnt[lat_type][page_type]++;
-	if (ts_diff > io_lat->peak_lat[lat_type][page_type])
-		io_lat->peak_lat[lat_type][page_type] = ts_diff;
+	io_lat->sum_lat[lat_type] += ts_diff;
+	io_lat->bio_cnt[lat_type]++;
+	if (ts_diff > io_lat->peak_lat[lat_type])
+		io_lat->peak_lat[lat_type] = ts_diff;
 	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
 }
 
 void iostat_update_and_unbind_ctx(struct bio *bio)
+{
+	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
+
+	if (op_is_write(bio_op(bio)) && !op_is_discard(bio_op(bio)))
+		bio->bi_private = iostat_ctx->sbi;
+	else
+		bio->bi_private = iostat_ctx->iostat_private;
+
+	__update_iostat_latency(iostat_ctx);
+	mempool_free(iostat_ctx, bio_iostat_ctx_pool);
+}
+
+void iostat_update_submit_ctx(struct bio *bio, enum page_type type)
 {
 	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
 	enum iostat_lat_type lat_type;
 
-	if (op_is_write(bio_op(bio))) {
+	iostat_ctx->submit_ts = jiffies;
+
+	if (type == DISCARD) {
+		lat_type = DISCARD_LAT;
+	} else if (op_is_write(bio_op(bio))) {
 		lat_type = bio->bi_opf & REQ_SYNC ?
-				WRITE_SYNC_IO : WRITE_ASYNC_IO;
-		bio->bi_private = iostat_ctx->sbi;
+				WRITE_SYNC_DATA_LAT : WRITE_ASYNC_DATA_LAT;
+		lat_type += type;
 	} else {
-		lat_type = READ_IO;
-		bio->bi_private = iostat_ctx->post_read_ctx;
+		lat_type = READ_DATA_LAT;
+		lat_type += type;
 	}
 
-	__update_iostat_latency(iostat_ctx, lat_type);
-	mempool_free(iostat_ctx, bio_iostat_ctx_pool);
+	iostat_ctx->lat_type = lat_type;
 }
 
 void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
-		struct bio *bio, struct bio_post_read_ctx *ctx)
+		struct bio *bio, void *private)
 {
 	struct bio_iostat_ctx *iostat_ctx;
 	/* Due to the mempool, this never fails. */
 	iostat_ctx = mempool_alloc(bio_iostat_ctx_pool, GFP_NOFS);
 	iostat_ctx->sbi = sbi;
 	iostat_ctx->submit_ts = 0;
-	iostat_ctx->type = 0;
-	iostat_ctx->post_read_ctx = ctx;
+	iostat_ctx->lat_type = 0;
+	iostat_ctx->iostat_private = private;
 	bio->bi_private = iostat_ctx;
 }
 
diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
index eb99d05cf272..824d5a23bc19 100644
--- a/fs/f2fs/iostat.h
+++ b/fs/f2fs/iostat.h
@@ -6,17 +6,24 @@
 #ifndef __F2FS_IOSTAT_H__
 #define __F2FS_IOSTAT_H__
 
+#ifdef CONFIG_F2FS_IOSTAT
+
 struct bio_post_read_ctx;
 
 enum iostat_lat_type {
-	READ_IO = 0,
-	WRITE_SYNC_IO,
-	WRITE_ASYNC_IO,
-	MAX_IO_TYPE,
+	READ_DATA_LAT = 0,
+	READ_NODE_LAT,
+	READ_META_LAT,
+	WRITE_SYNC_DATA_LAT,
+	WRITE_SYNC_NODE_LAT,
+	WRITE_SYNC_META_LAT,
+	WRITE_ASYNC_DATA_LAT,
+	WRITE_ASYNC_NODE_LAT,
+	WRITE_ASYNC_META_LAT,
+	DISCARD_LAT,
+	MAX_LAT_TYPE,
 };
 
-#ifdef CONFIG_F2FS_IOSTAT
-
 #define NUM_PREALLOC_IOSTAT_CTXS	128
 #define DEFAULT_IOSTAT_PERIOD_MS	3000
 #define MIN_IOSTAT_PERIOD_MS		100
@@ -24,9 +31,9 @@ enum iostat_lat_type {
 #define MAX_IOSTAT_PERIOD_MS		8640000
 
 struct iostat_lat_info {
-	unsigned long sum_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* sum of io latencies */
-	unsigned long peak_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* peak io latency */
-	unsigned int bio_cnt[MAX_IO_TYPE][NR_PAGE_TYPE];	/* bio count */
+	unsigned long sum_lat[MAX_LAT_TYPE];	/* sum of io latencies */
+	unsigned long peak_lat[MAX_LAT_TYPE];	/* peak io latency */
+	unsigned int bio_cnt[MAX_LAT_TYPE];	/* bio count */
 };
 
 extern int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
@@ -38,29 +45,21 @@ extern void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
 struct bio_iostat_ctx {
 	struct f2fs_sb_info *sbi;
 	unsigned long submit_ts;
-	enum page_type type;
-	struct bio_post_read_ctx *post_read_ctx;
+	enum iostat_lat_type lat_type;
+	void *iostat_private;
 };
 
-static inline void iostat_update_submit_ctx(struct bio *bio,
-			enum page_type type)
-{
-	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
-
-	iostat_ctx->submit_ts = jiffies;
-	iostat_ctx->type = type;
-}
-
-static inline struct bio_post_read_ctx *get_post_read_ctx(struct bio *bio)
+static inline struct bio_post_read_ctx *get_bio_iostat_private(struct bio *bio)
 {
 	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
 
-	return iostat_ctx->post_read_ctx;
+	return iostat_ctx->iostat_private;
 }
 
+extern void iostat_update_submit_ctx(struct bio *bio, enum page_type type);
 extern void iostat_update_and_unbind_ctx(struct bio *bio);
 extern void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
-		struct bio *bio, struct bio_post_read_ctx *ctx);
+		struct bio *bio, void *private);
 extern int f2fs_init_iostat_processing(void);
 extern void f2fs_destroy_iostat_processing(void);
 extern int f2fs_init_iostat(struct f2fs_sb_info *sbi);
@@ -70,10 +69,10 @@ static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *in
 		enum iostat_type type, unsigned long long io_bytes) {}
 static inline void iostat_update_and_unbind_ctx(struct bio *bio) {}
 static inline void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
-		struct bio *bio, struct bio_post_read_ctx *ctx) {}
+		struct bio *bio, void *private) {}
 static inline void iostat_update_submit_ctx(struct bio *bio,
 		enum page_type type) {}
-static inline struct bio_post_read_ctx *get_post_read_ctx(struct bio *bio)
+static inline struct bio_post_read_ctx *get_bio_iostat_private(struct bio *bio)
 {
 	return bio->bi_private;
 }
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 227e25836173..9a6c45a62e8b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1012,9 +1012,12 @@ static void __remove_discard_cmd(struct f2fs_sb_info *sbi,
 
 static void f2fs_submit_discard_endio(struct bio *bio)
 {
-	struct discard_cmd *dc = (struct discard_cmd *)bio->bi_private;
+	struct discard_cmd *dc;
 	unsigned long flags;
 
+	iostat_update_and_unbind_ctx(bio);
+	dc = bio->bi_private;
+
 	spin_lock_irqsave(&dc->lock, flags);
 	if (!dc->error)
 		dc->error = blk_status_to_errno(bio->bi_status);
@@ -1188,6 +1191,9 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 		bio->bi_private = dc;
 		bio->bi_end_io = f2fs_submit_discard_endio;
 		bio->bi_opf |= flag;
+
+		iostat_alloc_and_bind_ctx(sbi, bio, dc);
+		iostat_update_submit_ctx(bio, DISCARD);
 		submit_bio(bio);
 
 		atomic_inc(&dcc->issued_discard);
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 1322d34a5dfc..a0b115cf505c 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -2045,7 +2045,7 @@ struct f2fs_iostat_latency {
 
 TRACE_EVENT(f2fs_iostat_latency,
 
-	TP_PROTO(struct f2fs_sb_info *sbi, struct f2fs_iostat_latency (*iostat_lat)[NR_PAGE_TYPE]),
+	TP_PROTO(struct f2fs_sb_info *sbi, struct f2fs_iostat_latency *iostat_lat),
 
 	TP_ARGS(sbi, iostat_lat),
 
@@ -2078,37 +2078,43 @@ TRACE_EVENT(f2fs_iostat_latency,
 		__field(unsigned int,	m_wr_as_peak)
 		__field(unsigned int,	m_wr_as_avg)
 		__field(unsigned int,	m_wr_as_cnt)
+		__field(unsigned int,	discard_peak)
+		__field(unsigned int,	discard_avg)
+		__field(unsigned int,	discard_cnt)
 	),
 
 	TP_fast_assign(
 		__entry->dev		= sbi->sb->s_dev;
-		__entry->d_rd_peak	= iostat_lat[READ_IO][DATA].peak_lat;
-		__entry->d_rd_avg	= iostat_lat[READ_IO][DATA].avg_lat;
-		__entry->d_rd_cnt	= iostat_lat[READ_IO][DATA].cnt;
-		__entry->n_rd_peak	= iostat_lat[READ_IO][NODE].peak_lat;
-		__entry->n_rd_avg	= iostat_lat[READ_IO][NODE].avg_lat;
-		__entry->n_rd_cnt	= iostat_lat[READ_IO][NODE].cnt;
-		__entry->m_rd_peak	= iostat_lat[READ_IO][META].peak_lat;
-		__entry->m_rd_avg	= iostat_lat[READ_IO][META].avg_lat;
-		__entry->m_rd_cnt	= iostat_lat[READ_IO][META].cnt;
-		__entry->d_wr_s_peak	= iostat_lat[WRITE_SYNC_IO][DATA].peak_lat;
-		__entry->d_wr_s_avg	= iostat_lat[WRITE_SYNC_IO][DATA].avg_lat;
-		__entry->d_wr_s_cnt	= iostat_lat[WRITE_SYNC_IO][DATA].cnt;
-		__entry->n_wr_s_peak	= iostat_lat[WRITE_SYNC_IO][NODE].peak_lat;
-		__entry->n_wr_s_avg	= iostat_lat[WRITE_SYNC_IO][NODE].avg_lat;
-		__entry->n_wr_s_cnt	= iostat_lat[WRITE_SYNC_IO][NODE].cnt;
-		__entry->m_wr_s_peak	= iostat_lat[WRITE_SYNC_IO][META].peak_lat;
-		__entry->m_wr_s_avg	= iostat_lat[WRITE_SYNC_IO][META].avg_lat;
-		__entry->m_wr_s_cnt	= iostat_lat[WRITE_SYNC_IO][META].cnt;
-		__entry->d_wr_as_peak	= iostat_lat[WRITE_ASYNC_IO][DATA].peak_lat;
-		__entry->d_wr_as_avg	= iostat_lat[WRITE_ASYNC_IO][DATA].avg_lat;
-		__entry->d_wr_as_cnt	= iostat_lat[WRITE_ASYNC_IO][DATA].cnt;
-		__entry->n_wr_as_peak	= iostat_lat[WRITE_ASYNC_IO][NODE].peak_lat;
-		__entry->n_wr_as_avg	= iostat_lat[WRITE_ASYNC_IO][NODE].avg_lat;
-		__entry->n_wr_as_cnt	= iostat_lat[WRITE_ASYNC_IO][NODE].cnt;
-		__entry->m_wr_as_peak	= iostat_lat[WRITE_ASYNC_IO][META].peak_lat;
-		__entry->m_wr_as_avg	= iostat_lat[WRITE_ASYNC_IO][META].avg_lat;
-		__entry->m_wr_as_cnt	= iostat_lat[WRITE_ASYNC_IO][META].cnt;
+		__entry->d_rd_peak	= iostat_lat[READ_DATA_LAT].peak_lat;
+		__entry->d_rd_avg	= iostat_lat[READ_DATA_LAT].avg_lat;
+		__entry->d_rd_cnt	= iostat_lat[READ_DATA_LAT].cnt;
+		__entry->n_rd_peak	= iostat_lat[READ_NODE_LAT].peak_lat;
+		__entry->n_rd_avg	= iostat_lat[READ_NODE_LAT].avg_lat;
+		__entry->n_rd_cnt	= iostat_lat[READ_NODE_LAT].cnt;
+		__entry->m_rd_peak	= iostat_lat[READ_META_LAT].peak_lat;
+		__entry->m_rd_avg	= iostat_lat[READ_META_LAT].avg_lat;
+		__entry->m_rd_cnt	= iostat_lat[READ_META_LAT].cnt;
+		__entry->d_wr_s_peak	= iostat_lat[WRITE_SYNC_DATA_LAT].peak_lat;
+		__entry->d_wr_s_avg	= iostat_lat[WRITE_SYNC_DATA_LAT].avg_lat;
+		__entry->d_wr_s_cnt	= iostat_lat[WRITE_SYNC_DATA_LAT].cnt;
+		__entry->n_wr_s_peak	= iostat_lat[WRITE_SYNC_NODE_LAT].peak_lat;
+		__entry->n_wr_s_avg	= iostat_lat[WRITE_SYNC_NODE_LAT].avg_lat;
+		__entry->n_wr_s_cnt	= iostat_lat[WRITE_SYNC_NODE_LAT].cnt;
+		__entry->m_wr_s_peak	= iostat_lat[WRITE_SYNC_META_LAT].peak_lat;
+		__entry->m_wr_s_avg	= iostat_lat[WRITE_SYNC_META_LAT].avg_lat;
+		__entry->m_wr_s_cnt	= iostat_lat[WRITE_SYNC_META_LAT].cnt;
+		__entry->d_wr_as_peak	= iostat_lat[WRITE_ASYNC_DATA_LAT].peak_lat;
+		__entry->d_wr_as_avg	= iostat_lat[WRITE_ASYNC_DATA_LAT].avg_lat;
+		__entry->d_wr_as_cnt	= iostat_lat[WRITE_ASYNC_DATA_LAT].cnt;
+		__entry->n_wr_as_peak	= iostat_lat[WRITE_ASYNC_NODE_LAT].peak_lat;
+		__entry->n_wr_as_avg	= iostat_lat[WRITE_ASYNC_NODE_LAT].avg_lat;
+		__entry->n_wr_as_cnt	= iostat_lat[WRITE_ASYNC_NODE_LAT].cnt;
+		__entry->m_wr_as_peak	= iostat_lat[WRITE_ASYNC_META_LAT].peak_lat;
+		__entry->m_wr_as_avg	= iostat_lat[WRITE_ASYNC_META_LAT].avg_lat;
+		__entry->m_wr_as_cnt	= iostat_lat[WRITE_ASYNC_META_LAT].cnt;
+		__entry->discard_peak	= iostat_lat[DISCARD_LAT].peak_lat;
+		__entry->discard_avg	= iostat_lat[DISCARD_LAT].avg_lat;
+		__entry->discard_cnt	= iostat_lat[DISCARD_LAT].cnt;
 	),
 
 	TP_printk("dev = (%d,%d), "
@@ -2116,7 +2122,8 @@ TRACE_EVENT(f2fs_iostat_latency,
 		"rd_data [%u/%u/%u], rd_node [%u/%u/%u], rd_meta [%u/%u/%u], "
 		"wr_sync_data [%u/%u/%u], wr_sync_node [%u/%u/%u], "
 		"wr_sync_meta [%u/%u/%u], wr_async_data [%u/%u/%u], "
-		"wr_async_node [%u/%u/%u], wr_async_meta [%u/%u/%u]",
+		"wr_async_node [%u/%u/%u], wr_async_meta [%u/%u/%u], "
+		"discard [%u/%u/%u]",
 		show_dev(__entry->dev),
 		__entry->d_rd_peak, __entry->d_rd_avg, __entry->d_rd_cnt,
 		__entry->n_rd_peak, __entry->n_rd_avg, __entry->n_rd_cnt,
@@ -2126,7 +2133,8 @@ TRACE_EVENT(f2fs_iostat_latency,
 		__entry->m_wr_s_peak, __entry->m_wr_s_avg, __entry->m_wr_s_cnt,
 		__entry->d_wr_as_peak, __entry->d_wr_as_avg, __entry->d_wr_as_cnt,
 		__entry->n_wr_as_peak, __entry->n_wr_as_avg, __entry->n_wr_as_cnt,
-		__entry->m_wr_as_peak, __entry->m_wr_as_avg, __entry->m_wr_as_cnt)
+		__entry->m_wr_as_peak, __entry->m_wr_as_avg, __entry->m_wr_as_cnt,
+		__entry->discard_peak, __entry->discard_avg, __entry->discard_cnt)
 );
 #endif
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

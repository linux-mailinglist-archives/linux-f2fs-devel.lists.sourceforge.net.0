Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBC051E588
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 May 2022 10:17:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nnFdF-0003Zx-Lb; Sat, 07 May 2022 08:17:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1nnFdC-0003ZZ-A6
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 May 2022 08:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vYGlHgf/qWcOR+v7PTMGzy9j065XQFtTZ6NDsIFpIp8=; b=VsbsZMbca/Fyr1c9rNf0+8LMAJ
 l9sP83A0vDvsgT58pOiQpMN90Q4ccqPfD7NuO/+ftKMdgbGzr0XSXq6Zn4CmwtQ4HQZ27VcYY2ER6
 BNUuVR95a0SGIsK2NmuWgyol+N3/c4XswVgqKX0ko0wBFw4atwD89Tcs7cHG+kBuOPFY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vYGlHgf/qWcOR+v7PTMGzy9j065XQFtTZ6NDsIFpIp8=; b=HCCKk/D4u/zRUBegM7Og/9S8kq
 GEHwlD39HnZCjXoicLXe9ax0Gu7wPYNiR5WxJw2ogyUlDWjerpcyViaftVtGbh2qRktSb41VAG4kO
 DsUpCTTq2E4OpL9HhakXwebvQ3QnaD/lkOPwcNJYakp+UfoQyMKeGNpaxWl0mu6SOld0=;
Received: from mail-psaapc01on2131.outbound.protection.outlook.com
 ([40.107.255.131] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nnFdA-0003r9-1x
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 May 2022 08:17:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgCM+8QAmRF0VzsAu3W0oh9QUFEqiKSTJoaEmeAkfRlBAqUZoStskOP2SHOjzf6+nBVTXQKvYRDb7a8jQThaZKdWi6ftX2LhpgqVgCoorGye5P/XdzEOifY2tBH1E6+tTc+we0KOTTPsnA6AcHFrWkV9lTqX41k7afUcIxghJsGlDRN9q6w4knOa1H8tmA0slalCHWSgDapRrWkFqJ32sBoqGVFqmQHuS+g6qctfqPYkaIKfiXlR9g6OALBcXEhdDIhIk5dSbU6oBNPFfkVmEk9lvc8RQPvfsRm9MDhotwTNRuU7+VO0QW1ZGKhrlfT38Po8SfaA43FAIfYXxTRYxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYGlHgf/qWcOR+v7PTMGzy9j065XQFtTZ6NDsIFpIp8=;
 b=DsnPPLZMt4QiXeTHx88THYYJMVKlIgKn1xOZp6akcWk+WmylqW7AsKMXfMwU80IYbdyRx83h0jbknuFoA3S1ruQcPpdxTOz5ehl0JJSWR3iIpLC0FHne5ZNhGuE4ac7nWL0aU17EMPdYKqg4PscxtOwzwqaCb0/1/W4TopaqsX5LzqULTMOWMWkZ3piStnUzgTnW+laSRTziDp943AVf/x+IUikQyBg4n67XN+hMiEzo//KKnRg/QSN6nR+BKDqms9dHcrHvvpGxjTsFGcwyBBdAOb52XXBb9iRVmPw81Qe75LejwuC3rpUheE/ifL9ikLKABoP2SpfpZykf9oiU4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYGlHgf/qWcOR+v7PTMGzy9j065XQFtTZ6NDsIFpIp8=;
 b=iyQZJYnC8RR4O2JKrHU1n6ZGfoNc9sQJiNluMEn0GtcrONXDABFlY1NnCp6smDs8GFR9BDXh/6nfxsJD5XfGHf9o2m2CLc9SmSobAbrmTtpX2WWWI5lYk5auS3BXBmTFs7Z0VPoGFBEzGinZZkZK9Wk/Zx+SGpxZ6UNMVe1Gydw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by PS2PR06MB2917.apcprd06.prod.outlook.com (2603:1096:300:52::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Sat, 7 May
 2022 08:17:22 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fc26:a0b5:8bfd:7c02]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fc26:a0b5:8bfd:7c02%7]) with mapi id 15.20.5227.021; Sat, 7 May 2022
 08:17:22 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat,  7 May 2022 16:17:09 +0800
Message-Id: <20220507081710.117162-3-changfengnan@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507081710.117162-1-changfengnan@vivo.com>
References: <20220507081710.117162-1-changfengnan@vivo.com>
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 550e5168-cb25-4625-e1c4-08da300202b5
X-MS-TrafficTypeDiagnostic: PS2PR06MB2917:EE_
X-Microsoft-Antispam-PRVS: <PS2PR06MB291705E977D28A4E45DEC0E5BBC49@PS2PR06MB2917.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e0SM5tKqYGVfDmclTKMkdj3vsswDB0KNz4QJ9X68/osIyAtobFK/AM0L9GIeaIjvIfGfhzWgz+RlyAPdMY1VtuvTzFXsEIwkcgfL9GmkfuA4wpvhItjIcrA0JdlpiPibUG9B0UBWG59HRjGu5ZQ7AC2ZQGGL4LjjWuxtRk7ixpyPHumsyg5W5yq/P3nkxBeU1xP2s4B/M4dAVmbXEmpjn0vMkdRc/zFa98+Ee/mfz7YB3heOuYSMqsxwsjYb6Otwyts9U6lGyv+uyOU94s+nig0NKT1CqY/O887yRzhu1i4m61fg4XZQtigTdIQDSG3I6I6TwJNNMD5VU2qD/NmOd9bX3M2lb9YLuHcIVW4DsjdXMrd+6UuAkJLmqSRJyr+H0W+OCFW+7qCPcwgLmSYawdJB6gVRbyjdUws1F3TvN3DJuwq699x+C6CwZcB5KikzlRHAqU12K2RjX+xSynvSFC+HYXPLjNR/v3GoCFhM+IORCx3veShHSvL+KbMpgjBnWLr97usHfRiUG+R1vA1cQbO5Z5+EsQ74vH+I76SjcFRUyWkn0LPkiSJlQK1ghv+imYtdLvF0Ii4/eqWQQvK/DUH4w5IEeWdfjDctrc4tlxfzQV7DiwTE/aeGXestjQnxszCcGFp5CleLmXtiRYCSjfLI7N8bClI5HTOVrBNgqCVv9fW746V2gNGXKINUKScHUGH6Tc5qgR9Nz7tWYwSHIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(6486002)(107886003)(83380400001)(66946007)(1076003)(8676002)(66556008)(508600001)(4326008)(8936002)(66476007)(6506007)(186003)(316002)(36756003)(38100700002)(38350700002)(2616005)(6666004)(5660300002)(2906002)(26005)(6512007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V1rADH0zNpHtCYjo3gevfmV4RWf3dyHN0AXE6XxvKiPrkr76S9IDDXcKg0Ys?=
 =?us-ascii?Q?LRN+KSbKKRvgpjtkvp2uLHk9VUvHT7GkNB3SUna9zS/SNDjbMDxE1YKVI1kH?=
 =?us-ascii?Q?cPiu0IIiwgecB+MfUaQTvQlY7xhmI3TqsRfzmvdsc7nKh+ZLLCZVA0F2/1zC?=
 =?us-ascii?Q?CdqaBQgfWlxrCdO1wf/bwlm32cFUxW4K9YPNxAsp/a1/BHFy+zdeuv6y8rM9?=
 =?us-ascii?Q?DFOtdW4CvxIvvD+6B55rv6gv3Vuhx9r15/4xiubRjqFI5V2Jwh/PMiG5QGPm?=
 =?us-ascii?Q?9oG4O235eGtKV2C4fj88qyQyQrp6QS/iSgLT3oYn0vo11xmHqzD1MmAVm4Ad?=
 =?us-ascii?Q?vCT97hi6lHyu1roQ2XlpKql6QkO8S+PW5+9BM8Lnu9jnI0NBxYFygxzS1INk?=
 =?us-ascii?Q?DeGZdwAO73KU/lLiXROdDTBWzYys5VGPf4C+EdkxafBUKuF7P45sgXTz2n5f?=
 =?us-ascii?Q?1l/neM+yIQ9d+50pavuBaMnreVqrAV7V9Pi0K7fkpl507k7pW6K6pfvEUciA?=
 =?us-ascii?Q?oaYcuAH04LB+zvhdYPjEhYpEqYcGbtUM0EEI2HNzV4v8uhInswSNm+eaQQct?=
 =?us-ascii?Q?KEeyiAjZ/2lhnIiSbGQNe7qtNGZfRhNhw8YcG4Fh/hcuKI49NI/WsIYtYCsl?=
 =?us-ascii?Q?yUJTBLrpu/khDIH218kFyHuYtRKdINzDEyt6E5gs624ZMTPj6rRB9ZMeCsH8?=
 =?us-ascii?Q?bMlrAGsP2DDFHu65zQWZYHuOxY/aKH/FygfVI3pMGIoApkBRdJcfywCmc6SH?=
 =?us-ascii?Q?ABH4uNf2Gg0FBGcXttS4xhWqZmvZAE7bnjuKsf7W6gINsUGzb+4yo6OoIzlq?=
 =?us-ascii?Q?RNV7EINJSaGtYQzrGGFiBUanARv7Ox2v9p0Z7QjJg+9FKhO1QuzXe4MAeMvl?=
 =?us-ascii?Q?6Bip1tQE7oz9ACqbUYhRDA9u6gHiRdgFfzjLtXH5hClRd308jDHHz6pbsN20?=
 =?us-ascii?Q?QZnqhmGNBZcDYqhCRmk0VgDE1bsrjgm+6K9ULOFr6mfzkKWdDbg18ZDTyEx8?=
 =?us-ascii?Q?aQFT8Sn8FzpAeuqJIedJl8dY+WJ2fTrc/3eKZ/UhNbUbyFR5MOWtbXlOWlRb?=
 =?us-ascii?Q?TmC/KtT4+mHnsxkylM4TeDmQKxmXvljYbboSadzPk3f+jEfGWc3He80U70sM?=
 =?us-ascii?Q?aCjo6mVhMB4ZQXyoq5kovAV6nJ0V6FpCuxCRZ1Q9VWLNgWaCjsw1xd/KP2FR?=
 =?us-ascii?Q?zK1xuEbtWPJYioqrC+51pH/ovXFos/xnivfeORgLl++RVQMMgS3OtCgK7iRo?=
 =?us-ascii?Q?HvFiZj+OU8aZhl+Y+x/r6u7qiLN+5/HG0o9KONggf8sdUE7YDYoC7WSyW86P?=
 =?us-ascii?Q?NUu04QgaP+UCRytn7aovXvIOg28MgVL4Mk/GqhxrTVZz5o/sQWc6Q6WXiBz6?=
 =?us-ascii?Q?ElOjOXdosmVkVH8nM1jGKtDZj5TDTeeTOy71szzVU4pFWzPrhivE4F7BUAWB?=
 =?us-ascii?Q?aRXwEGRM5q/WNg0zqdQO7MK9QdWL/mm+O0/6W+BWm4UYPrMsPQMlR1HTIdz+?=
 =?us-ascii?Q?iy+ohNk9uM2npge5+oz2luDKPqr9I83iZvq51OSbz2xmPKCfQyU9EPHxLDo7?=
 =?us-ascii?Q?kSeUX/7BnKnNPubwaYzO98iFTiCIClzDsN9ZTIfgusz14rdxPcBCg3ySGMxH?=
 =?us-ascii?Q?lFcHgOCvuKR6SAhswxioCNN8ne2EYNMwaMfqSoh7naxYBr4lsivDPuDpaTlI?=
 =?us-ascii?Q?hdt01gbJQMVDlObJMVMS46t5AGXYhX35p3OBoP3uvIFEOgV2pDsf/jDvARTl?=
 =?us-ascii?Q?XA9AVeXeKQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 550e5168-cb25-4625-e1c4-08da300202b5
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2022 08:17:22.1439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqehygvtCMWPgAmkgGl1Xz6EbrTSaFwjneqOF8dirUyVrGE7oo17qJlGkfn3N/oNDxVEH0Z0qCnm7JnDV8Q/Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR06MB2917
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Since pvec have 15 pages, it not a multiple of 4, when write
 compressed pages, write in 64K as a unit, it will call pagevec_lookup_range_tag
 agagin, sometimes this will take a lot of time. Use onstack [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.131 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.131 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1nnFdA-0003r9-1x
Subject: [f2fs-dev] [PATCH v2 2/3] f2fs: use onstack pages instead of pvec
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
From: Fengnan Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Fengnan Chang <changfengnan@vivo.com>
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since pvec have 15 pages, it not a multiple of 4, when write compressed
pages, write in 64K as a unit, it will call pagevec_lookup_range_tag
agagin, sometimes this will take a lot of time.
Use onstack pages instead of pvec to mitigate this problem.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/compress.c |  8 ++++----
 fs/f2fs/data.c     | 16 +++++++---------
 fs/f2fs/f2fs.h     |  4 +++-
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index fd28844aa53f..d18a65292b69 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -871,7 +871,7 @@ bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index)
 	return is_page_in_cluster(cc, index);
 }
 
-bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct pagevec *pvec,
+bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct page **pages,
 				int index, int nr_pages, bool uptodate)
 {
 	unsigned long pgidx;
@@ -883,12 +883,12 @@ bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct pagevec *pvec,
 	if (nr_pages - index < cc->cluster_size)
 		return false;
 
-	pgidx = pvec->pages[index]->index;
+	pgidx = pages[index]->index;
 
 	for (i = 0; i < cc->cluster_size; i++) {
-		if (pvec->pages[index + i]->index != pgidx + i)
+		if (pages[index + i]->index != pgidx + i)
 			return false;
-		if (uptodate && !PageUptodate(pvec->pages[index + i]))
+		if (uptodate && !PageUptodate(pages[index + i]))
 			return false;
 	}
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 77af65838a7c..0ae7819b085d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2872,7 +2872,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 {
 	int ret = 0;
 	int done = 0, retry = 0;
-	struct pagevec pvec;
+	struct page *pages[F2FS_ONSTACK_PAGES];
 	struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
 	struct bio *bio = NULL;
 	sector_t last_block;
@@ -2903,8 +2903,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	int submitted = 0;
 	int i;
 
-	pagevec_init(&pvec);
-
 	if (get_dirty_pages(mapping->host) <=
 				SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
 		set_inode_flag(mapping->host, FI_HOT_DATA);
@@ -2930,13 +2928,13 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 		tag_pages_for_writeback(mapping, index, end);
 	done_index = index;
 	while (!done && !retry && (index <= end)) {
-		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
-				tag);
+		nr_pages = find_get_pages_range_tag(mapping, &index, end,
+				tag, F2FS_ONSTACK_PAGES, pages);
 		if (nr_pages == 0)
 			break;
 
 		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+			struct page *page = pages[i];
 			bool need_readd;
 readd:
 			need_readd = false;
@@ -2968,7 +2966,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 					goto lock_page;
 
 				if (f2fs_all_cluster_page_ready(&cc,
-					&pvec, i, nr_pages, true)) {
+					pages, i, nr_pages, true)) {
 					goto lock_page;
 				}
 
@@ -2983,7 +2981,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 					(!f2fs_compress_write_end(inode,
 						fsdata, page->index, 1) ||
 					 !f2fs_all_cluster_page_ready(&cc,
-						&pvec, i, nr_pages, false))) {
+						pages, i, nr_pages, false))) {
 					retry = 1;
 					break;
 				}
@@ -3073,7 +3071,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 			if (need_readd)
 				goto readd;
 		}
-		pagevec_release(&pvec);
+		release_pages(pages, nr_pages);
 		cond_resched();
 	}
 #ifdef CONFIG_F2FS_FS_COMPRESSION
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5a33f2d4aee8..d9c2795dd34d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -597,6 +597,8 @@ enum {
 #define RECOVERY_MAX_RA_BLOCKS		BIO_MAX_VECS
 #define RECOVERY_MIN_RA_BLOCKS		1
 
+#define F2FS_ONSTACK_PAGES	16	/* nr of onstack pages */
+
 struct rb_entry {
 	struct rb_node rb_node;		/* rb node located in rb-tree */
 	union {
@@ -4177,7 +4179,7 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
 							block_t blkaddr);
 bool f2fs_cluster_is_empty(struct compress_ctx *cc);
 bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
-bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct pagevec *pvec,
+bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct page **pages,
 				int index, int nr_pages, bool uptodate);
 bool f2fs_sanity_check_cluster(struct dnode_of_data *dn);
 void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

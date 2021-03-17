Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B354E33EB7E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Mar 2021 09:29:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+HZLkIidcbt3ZPfWm2UWsL9OnOQKa5tMrmoki3r/3xo=; b=Zf6m3YHnOd4ndr+0iEKwG3frHo
	uSNNDyaKWbYfY81LpDHK6wnCUGpK67tpQ+F9BJu0NipMaE5Yq5UKquT5IA60mojlDDdy6x4ZSm4Au
	MENjqmZh1IkLsqKFy0OpI3ys360KCreVAc1htyqes+DX04hFz7Z9W6ennxWtADCJQlZo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lMRYX-0006nY-5Q; Wed, 17 Mar 2021 08:29:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <guoweichao@oppo.com>) id 1lMRYV-0006nQ-Hv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Mar 2021 08:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XYdwrNhQwJ1NgF9PE3c+ZGqVVgrHFIIkoVfAjY0VWvs=; b=AuzFsXdR10DlVBmWdaA7YDRytd
 58kttUFgBTsogouCnFfQYxjGmygGytGUwEqEQlm0pVOgx8VDzAtN0TPSLsldYb5rFuhdooqTWy8BQ
 Qs0jcsnXmyPQ+zLpdiRYJn30RHQGSR9HaqhS5OQgq6FHVLMuGFrCYXDHC/gQeQqmhxss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XYdwrNhQwJ1NgF9PE3c+ZGqVVgrHFIIkoVfAjY0VWvs=; b=W
 70yJuP7Yui7YcPnnJp0TeI4Eatbw9+hlaJTKyDL3k5aR9jQ2nu9ExqrBnIx1vuOzmcxQOmIa04xEm
 IG+/wYFqy3CA0kpeiRWz9j5niyEW0Xad2Z/g9Sxbwdfd5HKK226pjypeOz6ZXaxAcBV0rJnFS9CFz
 NMZlysuziC2/MA1I=;
Received: from mail-eopbgr1320043.outbound.protection.outlook.com
 ([40.107.132.43] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lMRYQ-009mLi-DL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Mar 2021 08:29:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8CAUm/CjfKal0QFbZQmTknXxS75XBpFT23NMsYZLSwTM3A+Tg/zmYejzs7w7YkUeo9qkupMa8/hhqUcu/xiUCjxZewwLWPN6VLS2PgmEPflsN7hXZFHYexpLYV+NdERqoUbdlMjyLdqAsQd7pf8BXunEWBcYgcO2S2l1wV7+dEuCkxWrAgOceWekZfXhNM18xnFgPhsZf+kCNYFObqKZVZ9C5xIQgQPKZi5G0Z4r+CtZSp7mOZPCAYxMIXF684aZxmWvyq3XttrCpBKfRZSWCGfak3x6z+kY4GZ1tWqs7V1mvmMukLgXub/ekMjK1Emx9POyX9bJeEFPouwH+w1SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYdwrNhQwJ1NgF9PE3c+ZGqVVgrHFIIkoVfAjY0VWvs=;
 b=mB/JhfixIg0qel7xFo3lk8c5mEJqUo4b9UQ3PkyCIGwu2+tE3+ovSS6BalVs612WLsuAygjBVf5fc9RVi4iI+aVd7SZRYnzTgrr2UZdzE1/i1thr+HDEjad1dv3PAG3fgJPdrVINq7tULyQd3LVaRbYzi3VrkEo96SwcmqTV6S7DURdOz7b8j6bQjmG3/CLFBZtPptJaPf6bbr8W9Fc09RkpuM/0NyFsmqQn0g5JxhhPplp0i6yfvvdMnqrsSioJ6ZcDWNCKNv1YyQR+ClpZxCsuuhyKQdhreDYCcKDehdOvWQpjk6k8QoghBU7fnBqKqgI0roM5X7QrV+o3SNcaRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYdwrNhQwJ1NgF9PE3c+ZGqVVgrHFIIkoVfAjY0VWvs=;
 b=HmOV2boRZUwi2ZlKWG172dnLPX17H23eOGPO8hjUpgnqqfAzWVgr7AgEK6C+XxRa7RSJc/4kCER2s2Izh7xTGMz2Xx//NI1r7LlEKNCtNFSWMbar+F7ENKf7n5x5dOYkc/4wWqW47qoOKOPS4XcQEJmDbXaHV1FK4sr6lgxIrU0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oppo.com;
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com (2603:1096:203:6e::12)
 by HK0PR02MB2689.apcprd02.prod.outlook.com (2603:1096:203:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 08:29:12 +0000
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::9cfd:51dc:bd7:62d2]) by HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::9cfd:51dc:bd7:62d2%2]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 08:29:12 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 17 Mar 2021 16:28:48 +0800
Message-Id: <1615969728-21161-1-git-send-email-guoweichao@oppo.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [58.255.79.104]
X-ClientProxiedBy: HK2PR02CA0160.apcprd02.prod.outlook.com
 (2603:1096:201:1f::20) To HK0PR02MB2690.apcprd02.prod.outlook.com
 (2603:1096:203:6e::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from N80263842.adc.com (58.255.79.104) by
 HK2PR02CA0160.apcprd02.prod.outlook.com (2603:1096:201:1f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 08:29:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69ea4dff-e0a4-4a32-f3f5-08d8e91ebe21
X-MS-TrafficTypeDiagnostic: HK0PR02MB2689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK0PR02MB26890582C213DB2F5783C868B66A9@HK0PR02MB2689.apcprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l/lbukA2/JpnN6bs+BMbzfCVRR7ZLZbMK0ohtNp3HwwUofRKhLdj4/TlXJov55TBGBsI5QOX0nYFcgEqRE4VZ+RFoRuR1gQX8v2oH/ugyIci+bDlE3Ry0UlajFzDXjQUcoFFiKOXuNRezIZQT3ryf0F4jAAKF4bU9AXNaIALsY8es2yjpOMKO9pY9tJrJYNBFnZlEg0JoldswP1T+7gv7Et1Qt5nQ1/RvuvqZkzJ+tXFfbsscKNtTBF9mmm0Ff5yvC6yWKXb2ibzK4bzOlKmk2pyUPgQk12X4HRcJmXlozlu/J4Rs7Dl2YS5PZsbSgMYputm8DgpLsGT0gYoD7OCYgszehry0z/smTbBtWzGXEO25ENMSEtSPTcG6oErYqVNENApd/LHoXJYdq/tSBD1qeD9RNQ3WTtnBTyGk8/wVbdTDDxxjpkxF1Bogbb1sOo288qLXee6wm76XRV2wyXBkvrAq1yLi57Qur7AQ8LPD4LvHL2gVTB7yzv3Sj4Vg+9rUeRfskIbdeEyh9JgWKHBY+HeihBhn5S4chMorbK1eaM5/JpSpNeKlBWaRp6wione1nlAKNwy8C/5avN0cjIExNnfbfu84mRaXMrirzH5yrk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR02MB2690.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6512007)(2906002)(83380400001)(52116002)(66556008)(8936002)(26005)(54906003)(107886003)(16526019)(186003)(2616005)(498600001)(6506007)(5660300002)(86362001)(66946007)(956004)(36756003)(6486002)(8676002)(4326008)(6666004)(66476007)(11606007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?iqNe2lf/7MdpnKK0KARDBDz7FIdMaYQGzi2A3poDV79dHMxrUmaTllZk0ep2?=
 =?us-ascii?Q?ktfylF7Lm0YlpfJxEUesgy1mCLWOPzR13p4mo2VfzGhESJhULKwPqkfSHQPA?=
 =?us-ascii?Q?DhR/mP8XpHpwuwpMVtIbzYhHRz9V+hrl6O4euMTyEMkM+caWu/NOP3ZgXXob?=
 =?us-ascii?Q?G1Yf2p1wydA+0823PoitLJFBoTg04exBm6hGqC8ChVRNlgQw7slzcdEi+jBk?=
 =?us-ascii?Q?vCQ1bhKuM8zH0bOQrPL1ngHi1WcpcIsZT8qUh34sAag7slOpYxAASQ8/AaJe?=
 =?us-ascii?Q?ge/PgUw0gFt8yseJ9bYPxJtRfXZdvKlwBAb9mXQicF+y7bm1ZAzK6gGNWTtq?=
 =?us-ascii?Q?/7tbqyKs0s6bHDOkLk5Oq3mtvdoiByC9/Wy5tqhnjlb2LeQRSUpSxAnWm9eF?=
 =?us-ascii?Q?UGm2DAio/DXGLXGqmdBmnQPDJeAddXPKN1F4V+m4WLMR+ZEtktrhP8fuzUL8?=
 =?us-ascii?Q?bHN0Mqohq2oMxQGCipQEz11USeP7W0oDjaDAWDrLoFKeWzHsQba49WAF+wQ9?=
 =?us-ascii?Q?vjCy7t0pMjl0gWqLftWl1Xp3ODBXoMPD70cIXB2VekU60LsrmmCFn2n9TOr5?=
 =?us-ascii?Q?EywXDdNcGsC5QZtO1HsoWn2QG2igvaj5rEY9lP1S4y1tf+tP5TRI8ZlsxQsP?=
 =?us-ascii?Q?UUPPTwYB1MDqK35zWiNgH9Pah1FEnsN8AN11js8ufGX1G3WNjxzhFs/Ur/bQ?=
 =?us-ascii?Q?XYlM/Xsg+6xa2ShhOHwF9oYswFV4eVFn630Im0yMGKie/wmFtnTCmLSLw/z1?=
 =?us-ascii?Q?SFCgftJKpUC7bu3k3yPM7YjFqHCZ06yB7JwKoQ/EidBg71V/R3L+HHHUSYuZ?=
 =?us-ascii?Q?IeQz4xtETPTtSeuG8s0jgtp5NYUAnLqSlJWuJO7zB0COfrZFyYI0UeF6pD6H?=
 =?us-ascii?Q?RZ5SHWd4K6R7UprY4iRgXeU3H/yPZFuv5t0Qadr9mlNgIJpOzRnvpt/fGN4+?=
 =?us-ascii?Q?QldKOxhPgZsLZiWU974JIQGqk6iiBLluxbkTokbuyrjNi5ETPcM0s1oda+av?=
 =?us-ascii?Q?wzUe56jmo0b+hqp8aMiVLdVFiC0CUIGVDnlOGddCPk0o+2ozbmEpCuSL1YEo?=
 =?us-ascii?Q?UwycZ6t5BhqegqKWGELT5naAaCU9bDC51oLsvGeI7xwT5lvsII6OgDyHgwMf?=
 =?us-ascii?Q?G238iWEK5y/JiPA0mENU6ljbXNi/J6kNPkaRnPejIzpvbIJ0qkHZFgYy3onw?=
 =?us-ascii?Q?SOArx7AC1QxVA7HHRWVVWGaKti3TOusvIOcAbF2wc/07kNces7+cCo3JvAQR?=
 =?us-ascii?Q?RTm8rmAVjEArgIXJYBYROMAGqkhTSY5OD4XqwrmaXh2bDB4mTQ9OjUtlnlTK?=
 =?us-ascii?Q?PiQM4OnxDMI4vMId5Uh+ettr?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ea4dff-e0a4-4a32-f3f5-08d8e91ebe21
X-MS-Exchange-CrossTenant-AuthSource: HK0PR02MB2690.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 08:29:12.3940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAOA3oV0YLRZOWumquN8Zhe55bJ8boY3+AbNAB1kAXsBeEs6YIbqE3bn+SxdI8SkixuvNYrcW0MWbZEinxUmZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR02MB2689
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.132.43 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1lMRYQ-009mLi-DL
Subject: [f2fs-dev] [PATCH] f2fs: do not use AT_SSR mode in FG_GC & high
 urgent BG_GC
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
From: Weichao Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Weichao Guo <guoweichao@oppo.com>
Cc: fh@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

AT_SSR mode is introduced by age threshold based GC for better
hot/cold data seperation and avoiding free segment cost. However,
LFS write mode is preferred in the scenario of foreground or high
urgent GC, which should be finished ASAP. Let's only use AT_SSR
in background GC and not high urgent GC modes.

Signed-off-by: Weichao Guo <guoweichao@oppo.com>
Signed-off-by: Huang Jianan <huangjianan@oppo.com>
---
 fs/f2fs/gc.c      | 3 ++-
 fs/f2fs/segment.c | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 86ba8ed..0f2c34f 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1120,7 +1120,8 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	block_t newaddr;
 	int err = 0;
 	bool lfs_mode = f2fs_lfs_mode(fio.sbi);
-	int type = fio.sbi->am.atgc_enabled ?
+	int type = fio.sbi->am.atgc_enabled && gc_type == BG_GC &&
+				fio.sbi->gc_mode != GC_URGENT_HIGH ?
 				CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;
 
 	/* do not read out */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 32b915e..81be3e9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3264,7 +3264,9 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 		struct inode *inode = fio->page->mapping->host;
 
 		if (is_cold_data(fio->page)) {
-			if (fio->sbi->am.atgc_enabled)
+			if (fio->sbi->am.atgc_enabled &&
+				fio->io_type == FS_DATA_IO &&
+				fio->sbi->gc_mode != GC_URGENT_HIGH)
 				return CURSEG_ALL_DATA_ATGC;
 			else
 				return CURSEG_COLD_DATA;
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

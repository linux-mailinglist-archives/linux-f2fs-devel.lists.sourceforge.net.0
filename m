Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 684D3658D0F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Dec 2022 14:19:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pAsoF-0005qY-1Z;
	Thu, 29 Dec 2022 13:18:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pAsoD-0005qR-Em
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Dec 2022 13:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vLHFAf1XttxSt9ghXD68pSsg+bCXzuLXkWO0voWGoMY=; b=AqSuMxN91GtMnvU78kK4Gw/+9X
 5o+BhQsPcaoXwPXDADe51eHdhvPSojsTAf4BdDHyzNg7n52saJzCx7GYdAL/3fuxpaLlt+jhr16OA
 g0puH9RcfnClQcdaFrOxGXSxOM0d9slkwmGux8cK14F7QvTOD4J1KbC5VU1dFJtNM0yw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vLHFAf1XttxSt9ghXD68pSsg+bCXzuLXkWO0voWGoMY=; b=R
 BvP7nH0Uz3BH4QKhthxJWJHMVcDa1CrK9pRPLwEvVMxjLj9aZdTRhx/gwvhRWoQcZlPUFLO0W9IUi
 0rurWmCgsApjkNNkJiPuCo4K4dECgWankQcm0w/Rd7Sg3e/IOVHFVHlybA00272KU5YOATcEmC5NK
 jdmqeip2cx31+kcQ=;
Received: from mail-sgaapc01on2119.outbound.protection.outlook.com
 ([40.107.215.119] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pAso4-00GDn1-C5 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Dec 2022 13:18:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLJFhQowTU00zPrX6I4E7X7Ls0saa2FtP4rOdmn6pu3UCUC8dMgA+W2Gkakq4+ABASkd655Airnib/Z479bh/SAPn7Y+DonNsIh25lzlvkvcOieCCYqNk99VT7mQMoBfgg8jMJvsAq5AaJVgNKqxWPuelV5JrPAdShWtsk6bcWXrNrvlwbHIHCPBwVHZ3ndTAS1BGVyjUi5TIocRgN/j5hikpClebAMEaJ7FDQ5zkpQMzxDG9JGmTEfwo0kRsgS7xCHpvBV65vbON03VWn2cORofmPWy2Y+867CXaz5mb2FF7VJ0kMYcXzgn4xXdSTqDGOJ6F9qDg4To8rgVUum4yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLHFAf1XttxSt9ghXD68pSsg+bCXzuLXkWO0voWGoMY=;
 b=F/ZVquJm5yKEO8vyMUZFI4ilhgOGsj3b7y7JMgsH9wLx50QTYnLVeLOjfNKOmOWlGpPcB47t4TbsH+d/ZoggBPdA9X0kiLJ5BjZCkhd2QvmBnuejNAqXnhEM0pQl5txEM5xnKt0jvsljtT3fXArq5jevOV2az9xrRA82kRu3WVdYjTwkBLqCZGUZTWLfjiVUwegLM16Zs2FBXIh4FmqP6hvMeuN1tcpSobFti8fgxgCgJfWxSp+/zgWWezB13ZzFrN8k7CmPerCd6j2c7rf4XFtCF5XRqnNlzvFon1wHoSzXdOuOGrzEhqoO3toi1hGUyKkzTjtgXyFPM9LFVj6AQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLHFAf1XttxSt9ghXD68pSsg+bCXzuLXkWO0voWGoMY=;
 b=gBGfC89u4qFX1lzfgFpZqCPZBCcwplhDKjsmWlRVE/MxL2gpBR1aThc8myYXLYVyRq0fEPiAdztPRtAJ/CKS7eMm/1OdHIG7vcFNCJYmOZrbwZIoyKupG0qg6j72Cf57It8iNipPNjI/oNyp1CbKv4tou6wkUS4n0lkVwwsSITMEXz8wSyxORKGAl7r0lv9PwVv2SmWSu4JoFttYIGqm16Km+ES6xBwO33XPv1NjJ6MPJHIpyUgWwM7ZHj7DrjtLCm1pyU/tS/lz3PqhYDWBBzijzxuxn/ixaOiQrXdgWas38PrO4j70BiaaynSLszccjwmv6C/C2e2NtcmDRShAkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB3904.apcprd06.prod.outlook.com (2603:1096:400:4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Thu, 29 Dec
 2022 13:18:38 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::7969:5a45:8509:7d80]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::7969:5a45:8509:7d80%5]) with mapi id 15.20.5944.018; Thu, 29 Dec 2022
 13:18:38 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 29 Dec 2022 21:18:28 +0800
Message-Id: <20221229131828.59116-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:54::21) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB3904:EE_
X-MS-Office365-Filtering-Correlation-Id: abd11bd2-8955-435d-a88a-08dae99f3256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QYOSCOSbkioYauzwW/R0igx4oQ6luQiMyOeB3omJ5Z1swlr6hFbQvZLyXIie4dKie/jESoweuqqXQ2taOErPiCPGA4rqqOVzsE0E8F/c/cMlSrKYkryp6FKs9V+rADC62FMmtfLRLdcFkAUWa4OU3Yd2xaRZxolvqqnv0TfKsDksZjtwU6RaFQvYAf55qyOnqjBeGNhfLQ19WVA9gZt+4gqpMdtUw6OAPCMNcC2kCZGUS4La50G647bszNUgzZWZrILE4qGYvGaGjicgbk70mAhTrJjnJNs6PoD0G5Zx5keSTX41BKZOIU+gFfw1xNZE/WN3KOuphYaLZVfJK91ksEnpxw1yufbxMRYd16zggP5siS0F+HMGJiJyKlUTbJNBn6kLTo9hEOc6uog+h9YJpFppSTIGMBibogle3jhvVaw4EuddLPJwiXVaFgF6j7VqeLUKBiW+ih5ATR1HbarlsYdN4h4G/+WJ5BobcTyHy/au5BLNwJRvXI8KpnYp7gfS68mnySlK5WjNiRAJZ73MfLcsUo5jlz4Az1PU/ozEje2wiUOtN5sX+i8V/b7FseTVAt6uc5peiOOKZUVkQkrFjCmZ483dDt/9Poo8UHrHi0N4L+I0yCK1vyZeaOQSu99+LDFt8lg6cf/9RVImJAg+OEivBGhjw56S02NBxfM0fu05aJ5PJ3vkqOctVI/tYhbM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39850400004)(136003)(346002)(376002)(451199015)(66946007)(66556008)(66476007)(5660300002)(8936002)(8676002)(41300700001)(52116002)(36756003)(6486002)(478600001)(4326008)(107886003)(316002)(6666004)(2906002)(6512007)(6506007)(1076003)(2616005)(26005)(186003)(86362001)(83380400001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?txvsJ/k7NK5hvDt1ml17BVw+AGpY0A7Lrc1ffsyLLFrsUuckecFYJP49cJN7?=
 =?us-ascii?Q?Hf2NIRG8rh580X4f0L5XEeEqCh+RN/QlS33jEYGAiUlVDm7s7NtMDkInn8ff?=
 =?us-ascii?Q?923ftQIPaXn4RaODxtte7b7amkfmB0QadNi84RJwHUh2hcN7kG5AEgJVXYxp?=
 =?us-ascii?Q?XRq0pfrjfmr/nUEl+CAALPKKqu7jpZcSP8Fmg43T1Qhb1aAH9uPcNWnxjdsT?=
 =?us-ascii?Q?WD1XUjA4E6guDqgXoCAahJj4TBtM3Rr9ZhBtrJ7kHXUexZ0JIDYa4JtQ8pma?=
 =?us-ascii?Q?LwIpS/QT0yWAaZ28312CAw+3Wuju0n5TYAiRZF8uHNdjJ0kwoxsX35mKAau9?=
 =?us-ascii?Q?PPSNRNqN4LPX5wYOKcWwRpU2icrJYkppJxAad8m+XjpzRdfOiJEwMV0e2bN5?=
 =?us-ascii?Q?GLfhbAfn4hytS7gGynBPAue8zI10wLfB/p0/JWdXebSN39K7hSb6JUi2jOWL?=
 =?us-ascii?Q?qMPXnT5y1fafXVooG3nMcd7fKSwVBOOseRnXzz/Kcy58x+QazfYAQ1awApQJ?=
 =?us-ascii?Q?Rke2CZsC2Hzgtt0IOEZ+aXFd/luAPXcrAmkAx1IG/lamawiIS150WtqO2SvF?=
 =?us-ascii?Q?GR3L6k5bCcVhcD6R9Ui16IMm5+P9HbrLd4fnxeK/9t9kCtxH7G/lsGf8epAb?=
 =?us-ascii?Q?1y4eulONAfgo5G492sNnGrcuxOXCim548nluTlvd+ijd/lhIc0JHdgguEZjE?=
 =?us-ascii?Q?eN4OvFGIhYVhjmw2RSQtZtm9UXjOJz28omYlLNEmuvaOH3koTei6Vnh/9x72?=
 =?us-ascii?Q?5tOmZMQpMq6mYmBh3gIAHtfkM8E9qj06hfUF1UeEE1mx/TUjb4KBlGfuJk6h?=
 =?us-ascii?Q?MFFuCeR2GisD0SXBqtK1aBS149W6C9SshiWb6yGVZT6IWczjaDDsAI+JZAbk?=
 =?us-ascii?Q?94vAyiOc+frljD2vZZQox8l/ImAxJyY/A3kLYj+v/jApq5bHgrE+BOXlDmlo?=
 =?us-ascii?Q?o0cS1fgVD2+wRBj7nkknkAsD+QadUEdO/mgEm2+DA5QIm7nfuULhpvaFHBIS?=
 =?us-ascii?Q?AtE1hUkXxRljYG1L8J17DKw73CuOYsYTXd5FEmCSm4GqWbK2mN+PtQ3to0rC?=
 =?us-ascii?Q?u0KxmfjKlGmPHQeJZCHMvZhqeMs3qXkh6AaTyTk+xUMsGriIg40+VEx+/dch?=
 =?us-ascii?Q?G0NrAPWK2Wln+zk6Y9ZEN6d4vw/0e4tVUIbnSws9+YKnMzThutSRf7NOqtrv?=
 =?us-ascii?Q?G0MrLCmvwVYOm73dTjyXn1sTczDv00mhcHLL59IS45WPA9WgzjVfmXCYC8ym?=
 =?us-ascii?Q?GN7/hGRlNF9IV1OTTF5Suc5CbCRemjYuI5b8+pYFTnQ8dxIiGEVA94QrEBwi?=
 =?us-ascii?Q?0cS5v0pMY7uuSQksSEzwyozTapKb4Xhh5iNaAl48xEe16GTQdawKF/YNLpPa?=
 =?us-ascii?Q?XM7uu4rFmQbqZojOvD+GUvXHuf8gPtb7aFkwgKDmWpkQy2GpnuNdPTTMUx3b?=
 =?us-ascii?Q?vfte1dk4qWx1rOcl31boOLSmm7rTjq4Cqeby1tCxLv1nwN1sYD93nTsOMpui?=
 =?us-ascii?Q?PSloxT3y68mTA/i/qNBvpgghtKVzHKuV9ij3G6DG3lFNdVg/PINxBUdFBZy7?=
 =?us-ascii?Q?pugZFXzcltnjWDHpHnFyso22VClHXtvcOxkXczwx?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abd11bd2-8955-435d-a88a-08dae99f3256
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2022 13:18:38.1364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPko4YJEak2E72dm7bml0UB2HQi87/nsf6pDEpzvUCLcUZ9HZ0u+mxLy0Hs26KGjYUiYv4wHOdJedOw4FZRAww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB3904
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_init_compress_mempool() only initializes the memory pool
 during the f2fs module init phase. Let's mark it as __init like any other
 function. Signed-off-by: Yangtao Li <frank.li@vivo.com> --- fs/f2fs/compress.c
 | 2 +- fs/f2fs/f2fs.h | 4 ++-- 2 files changed, 3 insertions(+), 3 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.119 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.119 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pAso4-00GDn1-C5
Subject: [f2fs-dev] [PATCH] f2fs: mark f2fs_init_compress_mempool w/ __init
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

f2fs_init_compress_mempool() only initializes the memory pool during
the f2fs module init phase. Let's mark it as __init like any other
function.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/compress.c | 2 +-
 fs/f2fs/f2fs.h     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 2532f369cb10..c2cedff18827 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -564,7 +564,7 @@ module_param(num_compress_pages, uint, 0444);
 MODULE_PARM_DESC(num_compress_pages,
 		"Number of intermediate compress pages to preallocate");
 
-int f2fs_init_compress_mempool(void)
+int __init f2fs_init_compress_mempool(void)
 {
 	compress_page_pool = mempool_create_page_pool(num_compress_pages, 0);
 	return compress_page_pool ? 0 : -ENOMEM;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e8953c3dc81a..7367b0521f77 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4259,7 +4259,7 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
 int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock);
 void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
 bool f2fs_is_compress_backend_ready(struct inode *inode);
-int f2fs_init_compress_mempool(void);
+int __init f2fs_init_compress_mempool(void);
 void f2fs_destroy_compress_mempool(void);
 void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task);
 void f2fs_end_read_compressed_page(struct page *page, bool failed,
@@ -4328,7 +4328,7 @@ static inline struct page *f2fs_compress_control_page(struct page *page)
 	WARN_ON_ONCE(1);
 	return ERR_PTR(-EINVAL);
 }
-static inline int f2fs_init_compress_mempool(void) { return 0; }
+static inline int __init f2fs_init_compress_mempool(void) { return 0; }
 static inline void f2fs_destroy_compress_mempool(void) { }
 static inline void f2fs_decompress_cluster(struct decompress_io_ctx *dic,
 				bool in_task) { }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

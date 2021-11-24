Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FDE45B6F8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Nov 2021 09:55:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mpo42-0004os-H3; Wed, 24 Nov 2021 08:55:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mpo3y-0004ok-Pq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Nov 2021 08:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OQ67bKrTlsn36L3HjXm2ge5YVhLoAD84bp2acp1ws1M=; b=FH032ZpAkks2r/scjuR9eOK0M7
 nydxyEC1Ei14aBqn3QZMLSwKDKllYK8zdwtiOx2O3GCUxPZwlq2DiizsINm+PWauKkEn9jlRQUGt9
 hf+wfBTd/jFoMi3A898pOYZ3nNm536ahmt8t9LYUhrtd7jFCgjDhNgyGvhDC0yn/7UDA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OQ67bKrTlsn36L3HjXm2ge5YVhLoAD84bp2acp1ws1M=; b=ArbhNTJofDM7WDYdP+8HHwo2Qn
 j5CmK4a7jxyky6h15QJ24sJErTyKcd0BRWyO0u8qOfXZnKZPGqGqHkkyyrzZGBbBtFntQ08NBRt7e
 p7Moj86Dwd5wxrmOZ887/KjBbdTlmEEj058j+VjjErImR6wYo7x8Vi8LFQyraAAa5cB4=;
Received: from mail-psaapc01on2095.outbound.protection.outlook.com
 ([40.107.255.95] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mpo3r-0079CM-Eh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Nov 2021 08:55:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMnFbnrtpZp9y2o9/+JhhvUd1w7r03E6HxY/kF8aP6gBSukhgIKSYw+7GmX4HSYuFvvu3wpUvsxhRVShz7CBF7ECgfAUlV++og75pW4gG6A/aEFtDNhqOlm3/iE28+Eop2T5pvL6cNIrWopP7eFAaG30jZGzfdpLGjiQh7o8WxqAtP9sUUVHZQjV9dZigRjSL78gTgjX5TCvvvoD08svnKGQnm0z0FiBpiCbRzHzbaa4jvOTR3aO8MzCzfTtAg7jTI/J0Pn2AktetzU6v4Wjo7fYk3PVk07dI5Wxs77z9kHYEOxZLwcdhJeVTdwuqG3hjsitzCOZGou0G1d/RfhlgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQ67bKrTlsn36L3HjXm2ge5YVhLoAD84bp2acp1ws1M=;
 b=dJOXgiT8a4k1iJmST/lSUkKCaiFMTPsvqgo3aNfTyfuf9Y0y5YsvLYRROOsvGBtgHcUJu1zZOvaxwEuq/FDN7S8Zg5ddwO9txzMDnqjmxZWhwHwJ6G2oJn4YdqBG2kiaKh8wN2up206UQGgbp/1V8031y8ycfocQFh2jBUa1zbXqw3ssIeq0ZSJagnHw51aZIgaBw52haeXtAtUrkBc+eV8WTBUvHtIAkBmG+wurLGYLinvACe6SQYfS60tLEElQ4lOnHlhk0xEv3d9FNBA7NO3hLXP06jvl+ma/KOXuvGONH+XIaz2dL6ADid9zQLppkLoL7hPtRueOs63W1R1CKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQ67bKrTlsn36L3HjXm2ge5YVhLoAD84bp2acp1ws1M=;
 b=U2RfTQlnxapvdJHMrTXHBTk2ahOicbx/36zmilkVRDTeWgMZF4eNZSBRPaGl67r1ys+hTB+qgUTUSZHGSw8y9zfT8bbw0/mkQFaEjqs8zhhr2TZLrg76bekSGVyijbNmnIujwd6kqGsOo36xGXej3/l3eidRTa57xtHuCGbRj9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4014.apcprd06.prod.outlook.com (2603:1096:400:7::14)
 by TYZPR06MB4368.apcprd06.prod.outlook.com (2603:1096:400:8c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 08:39:40 +0000
Received: from TYZPR06MB4014.apcprd06.prod.outlook.com
 ([fe80::3c35:1800:9c1f:265d]) by TYZPR06MB4014.apcprd06.prod.outlook.com
 ([fe80::3c35:1800:9c1f:265d%5]) with mapi id 15.20.4734.020; Wed, 24 Nov 2021
 08:39:40 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 24 Nov 2021 16:39:29 +0800
Message-Id: <20211124083929.259433-2-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211124083929.259433-1-changfengnan@vivo.com>
References: <20211124083929.259433-1-changfengnan@vivo.com>
X-ClientProxiedBy: SG2PR01CA0155.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::35) To TYZPR06MB4014.apcprd06.prod.outlook.com
 (2603:1096:400:7::14)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 SG2PR01CA0155.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4713.19 via Frontend
 Transport; Wed, 24 Nov 2021 08:39:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7da01638-edd8-4e88-56d8-08d9af25f46c
X-MS-TrafficTypeDiagnostic: TYZPR06MB4368:
X-Microsoft-Antispam-PRVS: <TYZPR06MB4368510A220DC53917845C59BB619@TYZPR06MB4368.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2eBcSnQVGViRM974aBIxxsBkovCKpQLLP1jXtzHrmZkd8fB6qtPtrS1Tjs8f2MM58y9gYnfdgzOZMOYsSDL8orUcpsnZ/Yhq8F4PaV3BMLWcaXXT23k+1TBXjw1FiunNdc5Brzo1SQf+uS93ToKLcup8V/db9lWBEcAoLRMo41RziwYFc8MS6Zb5vu2QE9oK4mfv+5vEKtp/4wPHEV3LGl13UGMYbeTkmzu6nuFzsb/rWVRBJ0Ohl/YlJ3JG0vy+314L+d1zu8zMug9iC5ErY39oTvRuKPXlKDTaIswus4Afo7fQLuoUaHiTqzDoDj5OSrag6xmqDLgG7tyIiWHMppabS+eHeznaaRWw29fJ3GyPZkSWCmVikZ7lIwy/7EAO5neo25UHHC8dIQHjmVwZttsNvEu283IMw2QMuXz86BaBf4EMkDfdQllZONmsWNFzEdNJzhze5w2ctD+hIHiJnT1O7g/o356GrOS4fopOmZJuETF8+/FtmpcshK62fJVnq+plajJeRyokBumUNhEijs3mKh0/EzPJnLlsLaAeYsp273YCNo3ndx1d0XyXGmQhTDALcMUZ0E5mbvcd5jMT2JTxPLuei1ODMyIC6EFu5J7wg5H5BxEoLh1bmPZb+sqRlZM70wf0qivhtJdTVCtAa67cljxHKShg/HvJcvZwrGoX7NBmHUHHPaqLyfajPM3DpDO5piOT8y2BVW0x3lqPEm+Nh/j/vfO8HBz4aYLLK9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4014.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(6506007)(66946007)(86362001)(6666004)(36756003)(8676002)(4326008)(1076003)(2906002)(83380400001)(6486002)(508600001)(5660300002)(38100700002)(38350700002)(26005)(186003)(316002)(2616005)(956004)(6512007)(66556008)(66476007)(52116002)(107886003)(182500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fWb+LK2xf03JQzO/4uUW+VGarMd7nnLtOlRUWQTlHMcO1Q/O8jrzVwFCwVw7?=
 =?us-ascii?Q?JuMyYT+C6fb+kdiVV/MZpqs2KPgBMPGpGyFriYecy0Y2dvH0pF3r6tkLvMdt?=
 =?us-ascii?Q?1EUDK8QvCJIDnYsQNpURYyT67Qp9c0s1ngN2o3n3hbGpAG6pSIjIHJ8iJHk/?=
 =?us-ascii?Q?6k9n26cmxKfHbMKtH+w4vLpv21x76DQldGaRId+TzqV6bTJh3VlgxMKkob06?=
 =?us-ascii?Q?WuWONzovaHOx+ePhrDrrKAP9ARKWV27IiMEQ2KPn8+ehRGo3c+sBDQO4Uusc?=
 =?us-ascii?Q?gqH4SelFCYNsTMp9AVVZkHqVggJjJlxeOxMX2Pez1C19J/LZWtuWYdcYttoU?=
 =?us-ascii?Q?5JuCMw9Se/Fi6pm2LFNcg9hlojMr6Y/1WDSUyUbofzYA8ZKg+97cJw9yyB5R?=
 =?us-ascii?Q?lIlh0iORhvTCwWa8YlUi2K4rJaDxitETZR91sI9ba+6bhnmM86mvbSsUAtTI?=
 =?us-ascii?Q?BnUlfljZTy5D/cVfeVe35u0397BYP9aSv9abPt6GsDjgDRJnEIKUTs+0G2sd?=
 =?us-ascii?Q?8dbkhGtPLRttQdv5uK95BJpauMhGGx9/87ngvh7Ma5Z1nzi/uD6aO/US0pkp?=
 =?us-ascii?Q?8RlPZjRCMGFTkdcw8VaotCH9amqjgh38awILIcsKofEIpXMeO5RYLDtBCY5n?=
 =?us-ascii?Q?7O1Kl1NdEdRP+US2+Tgnfvw2hJ8c5t3gbTnyPuWQWVB/VFK1QtetvevTbPcw?=
 =?us-ascii?Q?VKIzyhPGzPHWpWg+XTEdjgSKWCxJaa035jE5dDf3W/50yBNjNsnBznXMnWHq?=
 =?us-ascii?Q?9YAxEmJhPLxgcvWNYCPLOt2eMV+pcohzOJrEVjNiZmwR5C0BVKgjhn8vb9sF?=
 =?us-ascii?Q?xsh+b29IPJMVubEGyCZLlI+YE4goyIWMjG2N7YPXb+ZZvx5vPEXwHGFwjgWR?=
 =?us-ascii?Q?MbNWpxihVKPIN9D+x9IVMQbIZ2QLI67QdYSvebiJP7PBBwZ12lm8/woQ+AJv?=
 =?us-ascii?Q?sEQSvD7p06S9hKXU8MYtWJpLbEIpjx8SZrLcWND4ujGJI8qa7Wxqyma9ScjU?=
 =?us-ascii?Q?bwV5pHj9HgESoNEukpo75sQ8BHiXEcLsBrOYcw454L6JfP9xStDk4ZOH/isr?=
 =?us-ascii?Q?gFN9Qq0aXw2tCRLznt+f2zSE1gS3MFfQJjRonqEreI0bPuOOCujLFcOv0ZeX?=
 =?us-ascii?Q?L6XMfyb9l5yVeatg2JYvSYJwuMhgjSgHg5dfcWOle63e+YgxhzXghxIuJFrc?=
 =?us-ascii?Q?SJHmRmdaLgJ6CfleJq0ZbLnvWb+YG9Qn9lxIU8tuscX6LUrigWKekX+vIbCg?=
 =?us-ascii?Q?89j2EKFs9fZozPZf2ReDT5x3WC4bsqIy0Hf/LGz2u+t5y4s7IOd3mKbtVjwS?=
 =?us-ascii?Q?xMU4XO4gs6r/3k0YFD4nvCWpmNnJtk3SIma7t1tEaebhvnIT6Ocd1l285upt?=
 =?us-ascii?Q?KI2tw4YwBw61zgkqhD4pr0AkA5P3IVPWXXN5wlsbAs3Hc1wGN6rUBJsxF/0I?=
 =?us-ascii?Q?95Ox7ikE9hNulGibFWfYw2y41hiO7uUq3bI1FuA+og2ogMDmB8hqzuatDrXw?=
 =?us-ascii?Q?mDCifUj8ikgQEumuFtBvS0rO9/mtq5g3a7TyhTDW+Wyrr0Yam2Siarg9R5cv?=
 =?us-ascii?Q?lZHd37zb+r1+rgGrQV1mJw8btoHVHEAr4BacdiPD4tBbd4WIzQscDpaownzL?=
 =?us-ascii?Q?f4bZmKIwep8R3w6eBb+GqY4=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da01638-edd8-4e88-56d8-08d9af25f46c
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4014.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 08:39:40.0720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9k20ojWZdw4HX2vvjjICUDSCdigzhgWYamlIPn4PRLdpuQqZ5zOGFY+Ta4xtD1JXNf3tn4JKMwjjkuuCU49CGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4368
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Previously, compressed page cache drop when clean page cache,
 but POSIX_FADV_DONTNEED can't clean compressed page cache, this commit try
 to support it. Signed-off-by: Fengnan Chang <changfengnan@vivo.com> ---
 fs/f2fs/compress.c
 | 10 ++++++++-- fs/f2fs/f2fs.h | 7 ++++--- 2 files changed, 12 insertions(+), 
 5 deletions(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.95 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mpo3r-0079CM-Eh
Subject: [f2fs-dev] [PATCH 2/2] f2fs: support POSIX_FADV_DONTNEED drop
 compressed page cache
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

Previously, compressed page cache drop when clean page cache, but
POSIX_FADV_DONTNEED can't clean compressed page cache, this commit
try to support it.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/compress.c | 10 ++++++++--
 fs/f2fs/f2fs.h     |  7 ++++---
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index fb9e5149af5d..7ec5e3c2590b 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -842,7 +842,7 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
 		WRITE_ONCE(dic->failed, true);
 	else if (blkaddr)
 		f2fs_cache_compressed_page(sbi, page,
-					dic->inode->i_ino, blkaddr);
+					dic, blkaddr);
 
 	if (atomic_dec_and_test(&dic->remaining_pages))
 		f2fs_decompress_cluster(dic);
@@ -1659,6 +1659,7 @@ static void f2fs_put_dic(struct decompress_io_ctx *dic)
 static void __f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed)
 {
 	int i;
+	nid_t ino = dic->inode->i_ino;
 
 	for (i = 0; i < dic->cluster_size; i++) {
 		struct page *rpage = dic->rpages[i];
@@ -1666,6 +1667,9 @@ static void __f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed)
 		if (!rpage)
 			continue;
 
+		if (dic->cpage_cached)
+			set_page_private_data(rpage, ino);
+
 		/* PG_error was set if verity failed. */
 		if (failed || PageError(rpage)) {
 			ClearPageUptodate(rpage);
@@ -1772,10 +1776,11 @@ void f2fs_invalidate_compress_page(struct f2fs_sb_info *sbi, block_t blkaddr)
 }
 
 void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
-						nid_t ino, block_t blkaddr)
+				struct decompress_io_ctx *dic, block_t blkaddr)
 {
 	struct page *cpage;
 	int ret;
+	nid_t ino = dic->inode->i_ino;
 
 	if (!test_opt(sbi, COMPRESS_CACHE))
 		return;
@@ -1804,6 +1809,7 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
 	}
 
 	set_page_private_data(cpage, ino);
+	dic->cpage_cached = true;
 
 	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE_READ))
 		goto out;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ac6dda6c4c5a..128190b0c737 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1551,6 +1551,7 @@ struct decompress_io_ctx {
 	 */
 	refcount_t refcnt;
 
+	bool cpage_cached;		/* indicate cpages cached in compress mapping*/
 	bool failed;			/* IO error occurred before decompression? */
 	bool need_verity;		/* need fs-verity verification after decompression? */
 	void *private;			/* payload buffer for specified decompression algorithm */
@@ -4085,7 +4086,7 @@ void f2fs_destroy_compress_cache(void);
 struct address_space *COMPRESS_MAPPING(struct f2fs_sb_info *sbi);
 void f2fs_invalidate_compress_page(struct f2fs_sb_info *sbi, block_t blkaddr);
 void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
-						nid_t ino, block_t blkaddr);
+				struct decompress_io_ctx *dic, block_t blkaddr);
 bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
 								block_t blkaddr);
 void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino);
@@ -4137,8 +4138,8 @@ static inline int __init f2fs_init_compress_cache(void) { return 0; }
 static inline void f2fs_destroy_compress_cache(void) { }
 static inline void f2fs_invalidate_compress_page(struct f2fs_sb_info *sbi,
 				block_t blkaddr) { }
-static inline void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi,
-				struct page *page, nid_t ino, block_t blkaddr) { }
+static inline void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
+				struct decompress_io_ctx *dic, block_t blkaddr) { }
 static inline bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi,
 				struct page *page, block_t blkaddr) { return false; }
 static inline void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi,
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

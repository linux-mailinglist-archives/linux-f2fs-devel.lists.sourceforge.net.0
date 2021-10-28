Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E470743DFF5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Oct 2021 13:25:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mg3Wn-0007nR-Mc; Thu, 28 Oct 2021 11:25:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mg3Wl-0007n1-Bv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Oct 2021 11:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qumHznNtT5BNMAIJGqt9wSOKQCnrOcxOZ8GHXr056qw=; b=AAvjjPvHJSmk/ODsuoKCfXFwRo
 eMk3saWrt0oqNDKlbSS/blU36s9eM8A1DwkXVeEVrQlgDPzmnT4/6iyK/MOVssQF3o9sqhaYoJdB2
 46cDO8UTexz5I8dU3U4tX3zBQyybSe2DwtyabUIVjgQaYzm8aUW3tMkGtSWQAk4JMvaA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qumHznNtT5BNMAIJGqt9wSOKQCnrOcxOZ8GHXr056qw=; b=P
 lbwGwmyzkhwNztbcDCd7LNyjwVRT3fwB62KBoemAfG4ie7aiShUbuQi+nMst5i8zlKrfG9yfE2MfE
 iFHZbiIFW1VOfveOnoFBCh8tu0/qKugNhj4ZzVOEYD9OJDNMZtVCn1AjGZ/CTnqXdniB92FnM9nCp
 ZJmqw+K5A8hforLY=;
Received: from mail-eopbgr1300129.outbound.protection.outlook.com
 ([40.107.130.129] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mg3Wc-003RJ0-Ew
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Oct 2021 11:24:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=am8Vd3n8vsvQMkGiFXj8KkZrZ2G9xVwBnZU3iuIj8N7VHbpw9AncHMrQmZ4F3U23pyuYuVHWBOD+n8ZlRp1evCjZPbkjlapJ21YN6MHfcahz8gZxq9ihTLZhByb4jP7PVp1w07Nx1PWL/4WIvnJ7q09837ZsjZbAk4y+QO2a6Q2/E35G1lHyeyZvaeH2ypTmgT4spcCFJg9Rogz0ZfuzVOOhs1ljWNzL60ia7Ci/fBS66++oAP5MxqYlLytdYSl5JnnvbolvjVgsG2b3HFPhWXTiooK3pwdtv2geJHyt+qWJlGHzkuYOi3qMhFLOkPcvKzW/TUqukAbCkFqu9imQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qumHznNtT5BNMAIJGqt9wSOKQCnrOcxOZ8GHXr056qw=;
 b=ASKCJQYAYLaeSJaN+crMrGxFx9bO3dm/BHFNJYLW2gdF46zl1+5UcxM4fDyfYyJ1TLWpRcwBHgakBKDgWOVpDJv2hKu2g1Un4GJD8tJK3ru+pyhzmnhdtiLVi0Ek3SGfe45kELnx7DnPkDVKu6aTobwKPcD3LI+9oZeuGEyvZCtjitz1gii3xDZRJylZJd1jlDcgRbm1M491lFMCZUIPg5QYoMcTZbCvlTn0gXwNKwRyF8v6rEzhZsVhMbNgb0AOx/+5KLnVUh2Ux9xtXU4yTxKdK28MUEh+TQjpAvBLR9NtFj4KH8lSz4CLidiRIRT9iPbRuniL/xTGPe+tJx0x2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qumHznNtT5BNMAIJGqt9wSOKQCnrOcxOZ8GHXr056qw=;
 b=RpxLc45uEzW6IJEXDIPCOcIhlrrtf/kqU87yb8nwWCQdnYincklwiNvQzq7hKSlDs616n7eL13PH9CH1SAsEZ5tHiBnCsdwdanHGlEWfVdP0rJCId6SkhxIWraHJU++pr+YFoT/1y9dgwc+mgWhc/X75nmT/EkKI0NCHvm+GfOA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3671.apcprd06.prod.outlook.com (2603:1096:820:19::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 28 Oct
 2021 11:24:42 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%7]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 11:24:42 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 28 Oct 2021 19:24:33 +0800
Message-Id: <20211028112433.23879-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK2PR04CA0043.apcprd04.prod.outlook.com
 (2603:1096:202:14::11) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK2PR04CA0043.apcprd04.prod.outlook.com (2603:1096:202:14::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4649.15 via Frontend Transport; Thu, 28 Oct 2021 11:24:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37dfb22f-c168-49ab-6609-08d99a0589ac
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3671:
X-Microsoft-Antispam-PRVS: <KL1PR0601MB367137EBC520C2B34FF2016ABB869@KL1PR0601MB3671.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IRmMQz9sABWtAD89G/emBw0HfFOO2v95VumkCLQ7+BWgnUJTjHNuDVIpnZnSbm/lb26LX8ePORLHJnVylSK9X/Z06FB2kR871CqGkJ+6iPNW7QYC0B0HHdOIPKhMpE8CuXrV+i8xNMOnTVFt6f8ONpHgigxxmKlQsGhc963dmQHRAcUMckKvoYwafPZ7p8DkKRkXoE6jUGc8ZkZoyOl4jkgWJLwwJVmx90wQm+3VHYXQLFutQT8qsos/wqAf1HVc7OvMuxJ37YqbAxLfAzK5RmuCcGtCIF25z2603JjyaVMgG2RLBXldzHRlmkHUdZQZGKEKMfLkuWYBxe2T+pHHvQQzJPNFB7/PAhc1ticu9t/lASY2J+hKaaLQ6eA/qBTS5xLOL2maOf1HS1TH6hyIijoNSMxl1igj4Ca1/fzQ2in7wKeiDYmVqstAmisxt8irqEOZtYsZYYa2JCXMybn/9+CFLMfwyAKszThY1ouYvA3IOdXjr3Z+upDc2H/eQX0b3J4zWZpN4WKEG9EqHrqvh94nkdqwmLC9OBs05rNCyAfRzDcyDvqS1Qq7ACMe8fMKp1xGzT4xKJ5H7jtRgbQionVJBkdR10k9AtW4hxKzBEgU3VjgNtW5Mra1LiW5Q2FkDGh6LDciE6WJROhJ3lIBWuFNRvmf12lSTtCuqiozgfljddk+MZxFTaf0fIevvkqDAEgSta+VB6zX2S/e+TaI3Q8py6HWIRhAbvvBaOlpK/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(26005)(5660300002)(66946007)(66556008)(38350700002)(66476007)(186003)(86362001)(8676002)(36756003)(83380400001)(38100700002)(8936002)(508600001)(107886003)(6512007)(6666004)(1076003)(2906002)(4326008)(316002)(52116002)(6486002)(956004)(2616005)(4730100017);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hii9U4WCnnE/LdHpthS6LylLzb00b1E//jFwc8chS6YLXkcP1vh6q8OlsXce?=
 =?us-ascii?Q?2kZRP+3kzss0uU/ipFZ4x7V3GY5jLDw0q+uf+i5aDQm84XnFQ5awU/uCM8GV?=
 =?us-ascii?Q?0g7LarsN+HQbyqSB3D83uhqYzu4MALRAV0zWqSwVmNWUqE/G2vdS5zVAzKF8?=
 =?us-ascii?Q?N3mZJFJmCvGUHQLO0qYioGHQjEHyfj36cP1DLrZnNhG3WQOsmHt4v4nU+1AT?=
 =?us-ascii?Q?aTyC+jkq8Atecdfodpdwsm5PMf2nHfh0UhkI3JuSLJfitpBvqfEsXUQ3ID0v?=
 =?us-ascii?Q?UxY65+jbZjQNH+Bueg+jluh0MpBrBH1ZoyVOMgZRFDsljZ0o8P3w1cibRHqL?=
 =?us-ascii?Q?BdLAEblVcOa/3AbV9Bw7nutm1EQLH9QDu5EUjcHPrSHuZMo+ALtRaPdkuO+i?=
 =?us-ascii?Q?ArR1MnQszpqprRbw1b5KdkMALbwA/oM/9yWiPGurA89DNWDQMLWb8sVSUCst?=
 =?us-ascii?Q?agN+cDaxJ2oAP/Bm8yauPIE5Dr+eRjOmilZ7ijbsVCwPCPdaMbGaY0UXrCks?=
 =?us-ascii?Q?+zitRLOW5GNzgQ9zcOyX5m9jRLpLMjDET9MghwbdgE9FGn9RkymFTBDMpueb?=
 =?us-ascii?Q?8t9kgEq+jW0FWMHSSQd/fFpEZegG/TTx2R/Cl/sBruAanWmy77l5SvUJfI1+?=
 =?us-ascii?Q?xj2DdhiHSQXFTs1PgEn4sqz54dlg49TVA81cxOK8B2qip6+GDG8ojkR2/uI4?=
 =?us-ascii?Q?RHPm7eG1zS2pVSoUkvAcBcpIBRPnLGbbIMy2ESIGns14YXk5w32lN0rEOBqE?=
 =?us-ascii?Q?hRHiH1hl8LtLP7HyxQpu2o61bIb2P7I9GLV6WYp1pQNOhwHjgbAuxcU5pRn8?=
 =?us-ascii?Q?+6GwGLxlzOEfrngoOnqf8JSMBlywjxMEElsCuX497eF8dDyMqCszOWJ7SzpL?=
 =?us-ascii?Q?vjRr7/uMgvM7GfDvAJH/VSnGVqSq/rx6Rz8MJUzEjoxgicb2T6Lc94b2P0J3?=
 =?us-ascii?Q?ZROZopXkvJ+/2VY6DUEA8RPmmMBeoAwvltJqEPefUqmwlZYAxWaDU0aJvvcY?=
 =?us-ascii?Q?0qpysNJx1aU20p0noz8nSF5gtRLzBYwrkU+HbaxFAHSO2HqMc0+dQxBtY2VW?=
 =?us-ascii?Q?yRTMFrEJCs/yusBOzOHFeBXp91jtXUjasWgC1DAx9wRRCyVOxvWbFIzven4I?=
 =?us-ascii?Q?OAdM/1ZBt/W82lezAgF1iFz00xRpUbZtq3dFCM7F1+ezAPW6xoamZ0In6Yel?=
 =?us-ascii?Q?8+EBGNGs44SaqznHQA+oxsjuZhlM6nfAj6J75WdMO+bsZ2NxmriurwtJMgMp?=
 =?us-ascii?Q?L6SaarzrPSs2ddshMbfAVVrpVZ7tlwM1OewZ0T4yIfPRUNTY5QPHgy5LkDpu?=
 =?us-ascii?Q?SWqHeAzpUiNvqbmFr5Vx7Zq7DmoWf1delgk0yT8NXPToye8Plo8XZpEtw35m?=
 =?us-ascii?Q?bgXBzQPmRE2Ms/8z06Btd3wWUFJDWjKs9fUG6QWcemUgQQZwFmlttgCbyqBG?=
 =?us-ascii?Q?Smsq03866ZeXvlEsmrA4vm+icYvP+M9APEaNhqoXTN/mtGUKhkU+X+a0x1YA?=
 =?us-ascii?Q?EEjqqpmFX2gRQ+u0aWT5Wb3jOQBu1ovfUJHRSuYIc5bWYgvNe9bAWoZd2G1f?=
 =?us-ascii?Q?aCgDEXwTq4tpKEUwPyoD7+F2vwNchv0HxjBDdzDnRGeET52loExx2rMKz7Pj?=
 =?us-ascii?Q?aq8Ms5/V+xwzBh130hY/0hg=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37dfb22f-c168-49ab-6609-08d99a0589ac
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 11:24:42.6221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oO5PDTi7m00BaDlOhsKHOk/hrIJq9pg8mob3CFIoa+IBibEM+xGxaLvsw4yxLUKKS38BPnbK1Yp7YD+8Ex6fpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3671
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add "f2fs_lzo_compress_private" and
 "f2fs_lz4_compress_private"
 slab cache, to speed up memory allocation when init compress ctx. No slab
 cache is added to zstd as the private data for zstd is related [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.130.129 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.129 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mg3Wc-003RJ0-Ew
Subject: [f2fs-dev] [RFC PATCH] f2fs:compress: introduce compress private
 data slab cache
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
Cc: Fengnan Chang <changfengnan@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add "f2fs_lzo_compress_private" and "f2fs_lz4_compress_private" slab
cache, to speed up memory allocation when init compress ctx.
No slab cache is added to zstd as the private data for zstd is related to
mount option, and too big.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/compress.c | 45 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 7588e4e817b8..4a8a4858d358 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -171,10 +171,11 @@ void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page)
 }
 
 #ifdef CONFIG_F2FS_FS_LZO
+static struct kmem_cache *lzo_compress_private_slab;
 static int lzo_init_compress_ctx(struct compress_ctx *cc)
 {
-	cc->private = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
-				LZO1X_MEM_COMPRESS, GFP_NOFS);
+	cc->private = f2fs_kmem_cache_alloc(lzo_compress_private_slab,
+			GFP_F2FS_ZERO, false, F2FS_I_SB(cc->inode));
 	if (!cc->private)
 		return -ENOMEM;
 
@@ -184,7 +185,7 @@ static int lzo_init_compress_ctx(struct compress_ctx *cc)
 
 static void lzo_destroy_compress_ctx(struct compress_ctx *cc)
 {
-	kvfree(cc->private);
+	kmem_cache_free(lzo_compress_private_slab, cc->private);
 	cc->private = NULL;
 }
 
@@ -234,6 +235,7 @@ static const struct f2fs_compress_ops f2fs_lzo_ops = {
 #endif
 
 #ifdef CONFIG_F2FS_FS_LZ4
+static struct kmem_cache *lz4_compress_private_slab;
 static int lz4_init_compress_ctx(struct compress_ctx *cc)
 {
 	unsigned int size = LZ4_MEM_COMPRESS;
@@ -243,7 +245,8 @@ static int lz4_init_compress_ctx(struct compress_ctx *cc)
 		size = LZ4HC_MEM_COMPRESS;
 #endif
 
-	cc->private = f2fs_kvmalloc(F2FS_I_SB(cc->inode), size, GFP_NOFS);
+	cc->private = f2fs_kmem_cache_alloc(lz4_compress_private_slab,
+			GFP_F2FS_ZERO, false, F2FS_I_SB(cc->inode));
 	if (!cc->private)
 		return -ENOMEM;
 
@@ -258,7 +261,7 @@ static int lz4_init_compress_ctx(struct compress_ctx *cc)
 
 static void lz4_destroy_compress_ctx(struct compress_ctx *cc)
 {
-	kvfree(cc->private);
+	kmem_cache_free(lz4_compress_private_slab, cc->private);
 	cc->private = NULL;
 }
 
@@ -1944,6 +1947,32 @@ void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi)
 {
 	kmem_cache_destroy(sbi->page_array_slab);
 }
+static int __init f2fs_init_compress_private_cache(void)
+{
+#ifdef CONFIG_F2FS_FS_LZ4
+	lz4_compress_private_slab = f2fs_kmem_cache_create("f2fs_lz4_compress_private",
+					LZ4_MEM_COMPRESS);
+	if (!lz4_compress_private_slab)
+		return -ENOMEM;
+#endif
+#ifdef CONFIG_F2FS_FS_LZO
+	lzo_compress_private_slab = f2fs_kmem_cache_create("f2fs_lzo_compress_private",
+					LZO1X_MEM_COMPRESS);
+	if (!lzo_compress_private_slab)
+		return -ENOMEM;
+#endif
+	return 0;
+}
+
+static void f2fs_destroy_compress_private_cache(void)
+{
+#ifdef CONFIG_F2FS_FS_LZ4
+	kmem_cache_destroy(lz4_compress_private_slab);
+#endif
+#ifdef CONFIG_F2FS_FS_LZO
+	kmem_cache_destroy(lzo_compress_private_slab);
+#endif
+}
 
 static int __init f2fs_init_cic_cache(void)
 {
@@ -1983,7 +2012,12 @@ int __init f2fs_init_compress_cache(void)
 	err = f2fs_init_dic_cache();
 	if (err)
 		goto free_cic;
+	err = f2fs_init_compress_private_cache();
+	if (err)
+		goto free_dic;
 	return 0;
+free_dic:
+	f2fs_destroy_dic_cache();
 free_cic:
 	f2fs_destroy_cic_cache();
 out:
@@ -1994,4 +2028,5 @@ void f2fs_destroy_compress_cache(void)
 {
 	f2fs_destroy_dic_cache();
 	f2fs_destroy_cic_cache();
+	f2fs_destroy_compress_private_cache();
 }
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

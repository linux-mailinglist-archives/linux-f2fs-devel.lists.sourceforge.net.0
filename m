Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF2C943F42
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Aug 2024 03:36:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sZKjs-0003ZC-Uj;
	Thu, 01 Aug 2024 01:36:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1sZKjr-0003Z0-Qn
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Aug 2024 01:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p89/ke6veiUyQwPrRMNiA7OsGqADKpNqrPFrAzRK0Ko=; b=iVFB9srS0kQ2CueZFoXvRBFPD+
 ensbElcZuwokitqYRGSUjHT4bq+DEXq2acAHBuhxURgdJ9sE9Sr7tRypKnX01DmTCy4/jtyqykJNz
 7pqShVmNt1dXiuhJ73p7czePjrmld2R9lu0hNUNZNqUj51X8Xb7kz5wFIAIBO7+B9kYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=p89/ke6veiUyQwPrRMNiA7OsGqADKpNqrPFrAzRK0Ko=; b=S
 uuJyBVPMVBN2Ly2rsA/O9jarz4ROSM0ty0WYlSJbMvtNS5qx4P/IKNz4hxTC019W61lpG5mPSTau0
 xy+2xSlN6uqLSzCF/uYaZGg/qbSa2gh4YKLXGYkcHlZggrjoWPhYWu2kWdy9aoyuex1on+xQczwEE
 D1Q/gQib+JUncWt4=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sZKjq-00070p-81 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Aug 2024 01:36:19 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 4711YTAU036418;
 Thu, 1 Aug 2024 09:34:29 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4WZBDz2gzhz2M40TH;
 Thu,  1 Aug 2024 09:28:35 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Thu, 1 Aug 2024 09:34:26 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 1 Aug 2024 09:33:51 +0800
Message-ID: <1722476031-22106-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 4711YTAU036418
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use F2FS_BYTES_TO_BLK(bytes) and F2FS_BLK_TO_BYTES(blk) for
 cleanup Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com> ---
 fs/f2fs/checkpoint.c
 | 2 +- fs/f2fs/debug.c | 2 +- fs/f2fs/file.c | 6 +++--- fs/f2fs/node.c |
 4 ++-- fs/f2fs/super.c | 2 +- include/linux/f2fs_fs. [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [222.66.158.135 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1sZKjq-00070p-81
Subject: [f2fs-dev] [PATCH] f2fs: clean up val{>>,<<}F2FS_BLKSIZE_BITS
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use F2FS_BYTES_TO_BLK(bytes) and F2FS_BLK_TO_BYTES(blk) for cleanup

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/checkpoint.c    | 2 +-
 fs/f2fs/debug.c         | 2 +-
 fs/f2fs/file.c          | 6 +++---
 fs/f2fs/node.c          | 4 ++--
 fs/f2fs/super.c         | 2 +-
 include/linux/f2fs_fs.h | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index bdd9632..f3d22b8 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1551,7 +1551,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		blk = start_blk + BLKS_PER_SEG(sbi) - nm_i->nat_bits_blocks;
 		for (i = 0; i < nm_i->nat_bits_blocks; i++)
 			f2fs_update_meta_page(sbi, nm_i->nat_bits +
-					(i << F2FS_BLKSIZE_BITS), blk + i);
+					F2FS_BLK_TO_BYTES(i), blk + i);
 	}
 
 	/* write out checkpoint buffer at block 0 */
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 8b0e1e7..546b8ba 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -275,7 +275,7 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
 	/* build nm */
 	si->base_mem += sizeof(struct f2fs_nm_info);
 	si->base_mem += __bitmap_size(sbi, NAT_BITMAP);
-	si->base_mem += (NM_I(sbi)->nat_bits_blocks << F2FS_BLKSIZE_BITS);
+	si->base_mem += F2FS_BLK_TO_BYTES(NM_I(sbi)->nat_bits_blocks);
 	si->base_mem += NM_I(sbi)->nat_blocks *
 				f2fs_bitmap_size(NAT_ENTRY_PER_BLOCK);
 	si->base_mem += NM_I(sbi)->nat_blocks / 8;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 41ef3ad..7709aed 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2984,9 +2984,9 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	}
 
 	f2fs_lock_op(sbi);
-	ret = __exchange_data_block(src, dst, pos_in >> F2FS_BLKSIZE_BITS,
-				pos_out >> F2FS_BLKSIZE_BITS,
-				len >> F2FS_BLKSIZE_BITS, false);
+	ret = __exchange_data_block(src, dst, F2FS_BYTES_TO_BLK(pos_in),
+				F2FS_BYTES_TO_BLK(pos_out),
+				F2FS_BYTES_TO_BLK(len), false);
 
 	if (!ret) {
 		if (dst_max_i_size)
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 2fe182f..9e7a6e2 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -3166,7 +3166,7 @@ static int __get_nat_bitmaps(struct f2fs_sb_info *sbi)
 
 	nm_i->nat_bits_blocks = F2FS_BLK_ALIGN((nat_bits_bytes << 1) + 8);
 	nm_i->nat_bits = f2fs_kvzalloc(sbi,
-			nm_i->nat_bits_blocks << F2FS_BLKSIZE_BITS, GFP_KERNEL);
+			F2FS_BLK_TO_BYTES(nm_i->nat_bits_blocks), GFP_KERNEL);
 	if (!nm_i->nat_bits)
 		return -ENOMEM;
 
@@ -3185,7 +3185,7 @@ static int __get_nat_bitmaps(struct f2fs_sb_info *sbi)
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
-		memcpy(nm_i->nat_bits + (i << F2FS_BLKSIZE_BITS),
+		memcpy(nm_i->nat_bits + F2FS_BLK_TO_BYTES(i),
 					page_address(page), F2FS_BLKSIZE);
 		f2fs_put_page(page, 1);
 	}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 4d2f3bb..977f038 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3317,7 +3317,7 @@ loff_t max_file_blocks(struct inode *inode)
 	 * fit within U32_MAX + 1 data units.
 	 */
 
-	result = min(result, (((loff_t)U32_MAX + 1) * 4096) >> F2FS_BLKSIZE_BITS);
+	result = min(result, F2FS_BYTES_TO_BLK(((loff_t)U32_MAX + 1) * 4096));
 
 	return result;
 }
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 01bee2b..f17f89a 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -19,7 +19,6 @@
 #define F2FS_BLKSIZE_BITS		PAGE_SHIFT /* bits for F2FS_BLKSIZE */
 #define F2FS_MAX_EXTENSION		64	/* # of extension entries */
 #define F2FS_EXTENSION_LEN		8	/* max size of extension */
-#define F2FS_BLK_ALIGN(x)	(((x) + F2FS_BLKSIZE - 1) >> F2FS_BLKSIZE_BITS)
 
 #define NULL_ADDR		((block_t)0)	/* used as block_t addresses */
 #define NEW_ADDR		((block_t)-1)	/* used as block_t addresses */
@@ -28,6 +27,7 @@
 #define F2FS_BYTES_TO_BLK(bytes)	((bytes) >> F2FS_BLKSIZE_BITS)
 #define F2FS_BLK_TO_BYTES(blk)		((blk) << F2FS_BLKSIZE_BITS)
 #define F2FS_BLK_END_BYTES(blk)		(F2FS_BLK_TO_BYTES(blk + 1) - 1)
+#define F2FS_BLK_ALIGN(x)			(F2FS_BYTES_TO_BLK((x) + F2FS_BLKSIZE - 1))
 
 /* 0, 1(node nid), 2(meta nid) are reserved node id */
 #define F2FS_RESERVED_NODE_NUM		3
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

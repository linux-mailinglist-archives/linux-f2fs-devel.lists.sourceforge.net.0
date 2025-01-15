Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD84A1191A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jan 2025 06:40:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tXw8f-0002UR-TH;
	Wed, 15 Jan 2025 05:40:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yi.Sun@unisoc.com>) id 1tXw8d-0002UB-W9
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Jan 2025 05:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DE/wmiR415TuyckHXZML5Ap4HudH2t45yx+zSV7vs6o=; b=ZXUjuAW+6mk0jiPgiXtYLspyMr
 C49l6dpIwcMnrL6kXfdla0iWUPiZNhv5jrbYdfRr27sTHo12Po70Uv5wDYhLf4ZIMBp/j0Oy1wZdH
 8eGAh43ZQIcpXcfvxraXmsTxBj3dg1s1zEZXiCNvKwmMRes1Riw/Wzg1aIgDl4nYBINE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DE/wmiR415TuyckHXZML5Ap4HudH2t45yx+zSV7vs6o=; b=i
 hL0Vgs9uhouLMPTe3h5mJzXIBEGj0KFebc/e2vY7HYK5EE2eVaPYL6FmiRX/30R+z1Puzi81yUjex
 lW+5BMbnev5dIQb7OGVZhmMsRVwWxbTTKUn3SYiMlyi2/vxXAPs6EbXjExjb16fM9StOC0pGecoTz
 Rh4mUlNMIhzMDjS8=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tXw8c-0000NI-Md for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Jan 2025 05:40:23 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 50F5dpFl086005;
 Wed, 15 Jan 2025 13:39:51 +0800 (+08)
 (envelope-from Yi.Sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4YXvr84Tsmz2NhqqX;
 Wed, 15 Jan 2025 13:36:40 +0800 (CST)
Received: from tj10379pcu1.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 15 Jan 2025 13:39:49 +0800
From: Yi Sun <yi.sun@unisoc.com>
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Wed, 15 Jan 2025 13:39:43 +0800
Message-ID: <20250115053943.2450661-1-yi.sun@unisoc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 50F5dpFl086005
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Function f2fs_invalidate_blocks() can process consecutive
 blocks at a time, so f2fs_truncate_data_blocks_range() is optimized to use
 the new functionality of f2fs_invalidate_blocks(). Add two variables @blkstart
 and @blklen, @blkstart records the first address of the consecutive blocks,
 and @blkstart records the number of consecutive blocks. 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1tXw8c-0000NI-Md
Subject: [f2fs-dev] [PATCH v5] f2fs: Optimize
 f2fs_truncate_data_blocks_range()
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
Cc: Ke.Wang@unisoc.com, yi.sun@unisoc.com, linux-kernel@vger.kernel.org,
 zhiguo.niu@unisoc.com, linux-f2fs-devel@lists.sourceforge.net,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Function f2fs_invalidate_blocks() can process consecutive
blocks at a time, so f2fs_truncate_data_blocks_range() is
optimized to use the new functionality of
f2fs_invalidate_blocks().

Add two variables @blkstart and @blklen, @blkstart records
the first address of the consecutive blocks, and @blkstart
records the number of consecutive blocks.

Signed-off-by: Yi Sun <yi.sun@unisoc.com>
---
 fs/f2fs/file.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c43d64898d8b..00fcac45f1bb 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -621,8 +621,11 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 	int cluster_index = 0, valid_blocks = 0;
 	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
 	bool released = !atomic_read(&F2FS_I(dn->inode)->i_compr_blocks);
+	block_t blkstart;
+	int blklen = 0;
 
 	addr = get_dnode_addr(dn->inode, dn->node_page) + ofs;
+	blkstart = le32_to_cpu(*addr);
 
 	/* Assumption: truncation starts with cluster */
 	for (; count > 0; count--, addr++, dn->ofs_in_node++, cluster_index++) {
@@ -638,26 +641,44 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 		}
 
 		if (blkaddr == NULL_ADDR)
-			continue;
+			goto next;
 
 		f2fs_set_data_blkaddr(dn, NULL_ADDR);
 
 		if (__is_valid_data_blkaddr(blkaddr)) {
 			if (time_to_inject(sbi, FAULT_BLKADDR_CONSISTENCE))
-				continue;
+				goto next;
 			if (!f2fs_is_valid_blkaddr_raw(sbi, blkaddr,
 						DATA_GENERIC_ENHANCE))
-				continue;
+				goto next;
 			if (compressed_cluster)
 				valid_blocks++;
 		}
 
-		f2fs_invalidate_blocks(sbi, blkaddr, 1);
+		if (blkstart + blklen == blkaddr) {
+			blklen++;
+		} else {
+			f2fs_invalidate_blocks(sbi, blkstart, blklen);
+			blkstart = blkaddr;
+			blklen = 1;
+		}
 
 		if (!released || blkaddr != COMPRESS_ADDR)
 			nr_free++;
+
+		continue;
+
+next:
+		if (blklen)
+			f2fs_invalidate_blocks(sbi, blkstart, blklen);
+
+		blkstart = le32_to_cpu(*(addr + 1));
+		blklen = 0;
 	}
 
+	if (blklen)
+		f2fs_invalidate_blocks(sbi, blkstart, blklen);
+
 	if (compressed_cluster)
 		f2fs_i_compr_blocks_update(dn->inode, valid_blocks, false);
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

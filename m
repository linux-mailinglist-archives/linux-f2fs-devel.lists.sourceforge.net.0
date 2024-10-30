Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 932189B6029
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2024 11:32:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t6600-0001l9-4T;
	Wed, 30 Oct 2024 10:32:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yi.Sun@unisoc.com>) id 1t65zz-0001l1-4v
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Oct 2024 10:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Rh8hupcxMqyA3aMeVVAfcYFLb7LmjLB/Hs3tFFixzI=; b=FZEtWS4jWbfAOPmpen63Ew0mQW
 S9vnuA+wC7f/x/HC+m62MbQKO6NS7G4gt19zUEJHsKtqTBcH+oe13YhX2YeTmVukxu+P8s5Kjc4dJ
 pNEwv+y3cWp7JQvV3QUNcu9iPqhAGrJYTuJa5MVC/pTXEX0Q7j3PnBrV47A3whSWQe2w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7Rh8hupcxMqyA3aMeVVAfcYFLb7LmjLB/Hs3tFFixzI=; b=hmA9K/wNW3WGbi7lm/xq56PF3q
 9yEtT+n08LVqTHdRaOS5KQhRtXGluAOY8+NpSM5zNwMkcrLDjPJJda8plLeOmEY1OHuDTdRi5KkUR
 oxv4ErUx+JDHY+WnhnAHneiEH81npVrMWTC7xcy9gT0yMfPymDgOWzG5Hs1k83AW3lTQ=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t65zx-0002EF-GI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Oct 2024 10:32:22 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 49UAViG8026981;
 Wed, 30 Oct 2024 18:31:44 +0800 (+08)
 (envelope-from Yi.Sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Xdk1R4B4cz2KSK4X;
 Wed, 30 Oct 2024 18:31:07 +0800 (CST)
Received: from tj10379pcu1.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 30 Oct 2024 18:31:43 +0800
From: Yi Sun <yi.sun@unisoc.com>
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Wed, 30 Oct 2024 18:31:36 +0800
Message-ID: <20241030103136.2874140-6-yi.sun@unisoc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030103136.2874140-1-yi.sun@unisoc.com>
References: <20241030103136.2874140-1-yi.sun@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 49UAViG8026981
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Function f2fs_invalidate_blocks() can process continuous
 blocks
 at a time, so f2fs_truncate_data_blocks_range() is optimized to use the new
 functionality of f2fs_invalidate_blocks(). Signed-off-by: Yi Sun
 <yi.sun@unisoc.com>
 --- fs/f2fs/file.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 4 deletions(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1t65zx-0002EF-GI
Subject: [f2fs-dev] [PATCH v2 5/5] f2fs: Optimize
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, sunyibuaa@gmail.com, yi.sun@unisoc.com,
 hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Function f2fs_invalidate_blocks() can process continuous
blocks at a time, so f2fs_truncate_data_blocks_range() is
optimized to use the new functionality of
f2fs_invalidate_blocks().

Signed-off-by: Yi Sun <yi.sun@unisoc.com>
---
 fs/f2fs/file.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 13594bb502d1..3dbabe6be8e6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -612,6 +612,15 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 	return finish_preallocate_blocks(inode);
 }
 
+static bool check_curr_block_is_consecutive(struct f2fs_sb_info *sbi,
+					block_t curr, block_t end)
+{
+	if (curr - end == 1 || curr == end)
+		return true;
+	else
+		return false;
+}
+
 void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
@@ -621,8 +630,27 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 	int cluster_index = 0, valid_blocks = 0;
 	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
 	bool released = !atomic_read(&F2FS_I(dn->inode)->i_compr_blocks);
+	/*
+	 * Temporary record location.
+	 * When the current block and @blkaddr_end can be processed
+	 * together, update the value of @blkaddr_end.
+	 * When it is detected that current block is not continues with
+	 * @blkaddr_end, it is necessary to process continues blocks
+	 * range [blkaddr_start, blkaddr_end].
+	 */
+	block_t blkaddr_start, blkaddr_end;
+	/*.
+	 * To avoid processing various invalid data blocks.
+	 * Because @blkaddr_start and @blkaddr_end may be assigned
+	 * NULL_ADDR or invalid data blocks, @last_valid is used to
+	 * record this situation.
+	 */
+	bool last_valid = false;
+	/* Process the last block separately? */
+	bool last_one = true;
 
 	addr = get_dnode_addr(dn->inode, dn->node_page) + ofs;
+	blkaddr_start = blkaddr_end = le32_to_cpu(*addr);
 
 	/* Assumption: truncation starts with cluster */
 	for (; count > 0; count--, addr++, dn->ofs_in_node++, cluster_index++) {
@@ -638,24 +666,60 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
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
+
+		if (check_curr_block_is_consecutive(sbi, blkaddr, blkaddr_end)) {
+			/*
+			 * The current block @blkaddr is continuous with
+			 * @blkaddr_end, so @blkaddr_end is updated.
+			 * And the f2fs_invalidate_blocks() is skipped
+			 * until @blkaddr that cannot be processed
+			 * together is encountered.
+			 */
+			blkaddr_end = blkaddr;
+			if (count == 1)
+				last_one = false;
+			else
+				goto skip_invalid;
+		}
+
+		f2fs_invalidate_blocks(sbi, blkaddr_start,
+					blkaddr_end - blkaddr_start + 1);
+		blkaddr_start = blkaddr_end = blkaddr;
+
+		if (count == 1 && last_one)
+			f2fs_invalidate_blocks(sbi, blkaddr, 1);
+
+skip_invalid:
+		last_valid = true;
 
 		if (!released || blkaddr != COMPRESS_ADDR)
 			nr_free++;
+
+		continue;
+
+next:
+		/* If consecutive blocks have been recorded, we need to process them. */
+		if (last_valid == true)
+			f2fs_invalidate_blocks(sbi, blkaddr_start,
+					blkaddr_end - blkaddr_start + 1);
+
+		blkaddr_start = blkaddr_end = le32_to_cpu(*(addr + 1));
+		last_valid = false;
+
 	}
 
 	if (compressed_cluster)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

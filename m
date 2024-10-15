Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9436199DCF5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2024 05:44:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0YTa-0003ct-4Z;
	Tue, 15 Oct 2024 03:44:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t0YTX-0003cl-Jk
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 03:43:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oVXrHamex21gJM8ygygk8adihv2ubooHfyL2wLVmitE=; b=Tvkjq2xmRA0FZkDXEjBv0EQnQN
 HFGxX0WEpJf6qgYayxlxpz8mhGLqh48ssSHmKfgiGKf8dJFkaenNHXd5Bxana3qZR+ataqw4wt9Wo
 OF5HG8IemU3Gm4vbpviZqyX83AlcRrb4JdmCya3Z6KC/r9qFtqbWb4xOFYJF1qAnr3UI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oVXrHamex21gJM8ygygk8adihv2ubooHfyL2wLVmitE=; b=F
 eU+SeL2vSkYCNpas5UzxNy0jnoC+F0heVToiLlYRB1HussOgssnioUOGcFAr7N8US8v21d3mXPnin
 mAGJMwrzNKpFvh6mvSSKCgHfOuj4PBySwfTt+w0cs3C5hKVF0YxuQVIQDwqnWHFuRBKMjRdnCG4Ek
 X9u3DcetZaZdneYg=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0YTW-0007B3-7F for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 03:43:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7D0F6A40B46;
 Tue, 15 Oct 2024 03:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358C4C4CEC7;
 Tue, 15 Oct 2024 03:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728963826;
 bh=MjCUBiWnp9PMS4F87LZ3PySPrHGyFoBvs6QlesZy16M=;
 h=From:To:Cc:Subject:Date:From;
 b=sM3IzIhwsVrUavZoQV0F6rbspUDHCJnAElwhgYn0Tbzvg7H8J8YMbKnoDhb2nQwsp
 t2as3W/T8hMqyF6nMRbe1oiYIHG5eE8diW3snDygg7JlS1u3Md1hppclS4yLX5DIBf
 i15xfXpOpYi69Rj64hHGFXUymLI4AG+w52Nu+OA/6JX95NI1rQ8xMzTzJb+6lKjfGg
 I5GcF57mfL2KNFj7N4s9DedmCvdbOF4MCd59N5TLILwpDzdCUrSYp+mWU9Gwjzkux1
 yxILwgIbyq1Mit6M44qQQZcfFVEPsRyNizc7Zp5+UeZvivrdAw+Jxj5BPWTuuttQ3h
 qyhU0OF1SaxuQ==
To: jaegeuk@kernel.org
Date: Tue, 15 Oct 2024 11:43:39 +0800
Message-Id: <20241015034339.3244676-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It will trigger system panic w/ testcase in [1]: [ cut here
 ] kernel BUG at fs/f2fs/segment.c:2752! RIP: 0010:new_curseg+0xc81/0x2110
 Call Trace: f2fs_allocate_data_block+0x1c91/0x4540 do_write_page+0x163/0xdf0
 f2fs_outplace_ [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t0YTW-0007B3-7F
Subject: [f2fs-dev] [PATCH] f2fs: fix to account dirty data in
 __get_secs_required()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It will trigger system panic w/ testcase in [1]:

------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.c:2752!
RIP: 0010:new_curseg+0xc81/0x2110
Call Trace:
 f2fs_allocate_data_block+0x1c91/0x4540
 do_write_page+0x163/0xdf0
 f2fs_outplace_write_data+0x1aa/0x340
 f2fs_do_write_data_page+0x797/0x2280
 f2fs_write_single_data_page+0x16cd/0x2190
 f2fs_write_cache_pages+0x994/0x1c80
 f2fs_write_data_pages+0x9cc/0xea0
 do_writepages+0x194/0x7a0
 filemap_fdatawrite_wbc+0x12b/0x1a0
 __filemap_fdatawrite_range+0xbb/0xf0
 file_write_and_wait_range+0xa1/0x110
 f2fs_do_sync_file+0x26f/0x1c50
 f2fs_sync_file+0x12b/0x1d0
 vfs_fsync_range+0xfa/0x230
 do_fsync+0x3d/0x80
 __x64_sys_fsync+0x37/0x50
 x64_sys_call+0x1e88/0x20d0
 do_syscall_64+0x4b/0x110
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

The root cause is if checkpoint_disabling and lfs_mode are both on,
it will trigger OPU for all overwritten data, it may cost more free
segment than expected, so f2fs must account those data correctly to
calculate cosumed free segments later, and return ENOSPC earlier to
avoid run out of free segment during block allocation.

[1] https://lore.kernel.org/fstests/20241015025106.3203676-1-chao@kernel.org/

Fixes: 4354994f097d ("f2fs: checkpoint disabling")
Cc: Daniel Rosenberg <drosen@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.h | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index e9cc73093417..55a01da6c4be 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -561,18 +561,21 @@ static inline int reserved_sections(struct f2fs_sb_info *sbi)
 }
 
 static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
-			unsigned int node_blocks, unsigned int dent_blocks)
+			unsigned int node_blocks, unsigned int data_blocks,
+			unsigned int dent_blocks)
 {
 
-	unsigned segno, left_blocks;
+	unsigned int segno, left_blocks, blocks;
 	int i;
 
-	/* check current node sections in the worst case. */
-	for (i = CURSEG_HOT_NODE; i <= CURSEG_COLD_NODE; i++) {
+	/* check current data/node sections in the worst case. */
+	for (i = CURSEG_HOT_DATA; i < NR_PERSISTENT_LOG; i++) {
 		segno = CURSEG_I(sbi, i)->segno;
 		left_blocks = CAP_BLKS_PER_SEC(sbi) -
 				get_ckpt_valid_blocks(sbi, segno, true);
-		if (node_blocks > left_blocks)
+
+		blocks = i <= CURSEG_COLD_DATA ? data_blocks : node_blocks;
+		if (blocks > left_blocks)
 			return false;
 	}
 
@@ -586,8 +589,9 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
 }
 
 /*
- * calculate needed sections for dirty node/dentry
- * and call has_curseg_enough_space
+ * calculate needed sections for dirty node/dentry and call
+ * has_curseg_enough_space, please note that, it needs to account
+ * dirty data as well in lfs mode when checkpoint is disabled.
  */
 static inline void __get_secs_required(struct f2fs_sb_info *sbi,
 		unsigned int *lower_p, unsigned int *upper_p, bool *curseg_p)
@@ -596,19 +600,30 @@ static inline void __get_secs_required(struct f2fs_sb_info *sbi,
 					get_pages(sbi, F2FS_DIRTY_DENTS) +
 					get_pages(sbi, F2FS_DIRTY_IMETA);
 	unsigned int total_dent_blocks = get_pages(sbi, F2FS_DIRTY_DENTS);
+	unsigned int total_data_blocks = 0;
 	unsigned int node_secs = total_node_blocks / CAP_BLKS_PER_SEC(sbi);
 	unsigned int dent_secs = total_dent_blocks / CAP_BLKS_PER_SEC(sbi);
+	unsigned int data_secs = 0;
 	unsigned int node_blocks = total_node_blocks % CAP_BLKS_PER_SEC(sbi);
 	unsigned int dent_blocks = total_dent_blocks % CAP_BLKS_PER_SEC(sbi);
+	unsigned int data_blocks = 0;
+
+	if (f2fs_lfs_mode(sbi) &&
+		unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
+		total_data_blocks = get_pages(sbi, F2FS_DIRTY_DATA);
+		data_secs = total_data_blocks / CAP_BLKS_PER_SEC(sbi);
+		data_blocks = total_data_blocks % CAP_BLKS_PER_SEC(sbi);
+	}
 
 	if (lower_p)
-		*lower_p = node_secs + dent_secs;
+		*lower_p = node_secs + dent_secs + data_secs;
 	if (upper_p)
 		*upper_p = node_secs + dent_secs +
-			(node_blocks ? 1 : 0) + (dent_blocks ? 1 : 0);
+			(node_blocks ? 1 : 0) + (dent_blocks ? 1 : 0) +
+			(data_blocks ? 1 : 0);
 	if (curseg_p)
 		*curseg_p = has_curseg_enough_space(sbi,
-				node_blocks, dent_blocks);
+				node_blocks, data_blocks, dent_blocks);
 }
 
 static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

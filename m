Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B96265F3AD3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Oct 2022 02:50:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ofW8n-0000wp-If;
	Tue, 04 Oct 2022 00:50:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ofW8l-0000wf-M2
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Oct 2022 00:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ka25M/F8fqLRSO8o9iRg5YooNwDwv0NrEY6oZ+ZvCs8=; b=k72N/4CXlXu8p8chJ/haE6Pr8S
 3NVBlLuRTuC9x2xrxiiHxJS51YODpvJ5Q0g+G8C+fyrdTcZkIknv0qlSBqsRkuS+nC4X6IMj+q9et
 c5nP9jeE6Hj9mOg4c7l/Sp3cOVhxkg/N+6OfxBJg6P/Q4k6DQFplyjaJgP7ywDnKeMxY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ka25M/F8fqLRSO8o9iRg5YooNwDwv0NrEY6oZ+ZvCs8=; b=C
 uezPS8qIMzB3Z3GAt3p1pySZzuBJtqNF+AhwLxrakXXKj0K9H6Ph5TXdb3FwbqNOYz1WNhmYObx5s
 MKoZi9EPiWd2mNgsoBPz4F00OUxBaqp+ssDD1Gr4STI2YdeHQwA742qOYKC6NoE4IXSAkahzwULTs
 8pkhniTxVjTE/+Fo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ofW8w-00Bj38-Km for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Oct 2022 00:50:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6DFF861155;
 Tue,  4 Oct 2022 00:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B6EC433D6;
 Tue,  4 Oct 2022 00:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664844631;
 bh=TDnPq3DH3zk8jSB6ZZZuMRwdj/qsTT1hPUt6JdaiCyE=;
 h=From:To:Cc:Subject:Date:From;
 b=Y9g+eqwLI7GCV9FcUeWeoV2zC/eLaoK5KS20kRuOdIH98vVGobAcOaNPTllMj2jhv
 8zVdfjFN3m0KVJ5V3InE9X7amglCZVBzkW9qFZrquyOa2kyzsmeBJsDqFI33gZfcUC
 rmMFryJJ/PInDa8yxBKpVWtDI8jEgT8m9axuXdK9qNVZUpRl7wG4cTufFrBGRd+F8d
 OOHufKrOttJBX6CJYrrtWzFlg9xRvoCcswh1e8I49tKOaT01oqN933B4J1j0AoB6ct
 67YCYBMpU9ZIxVkVtoW6wuNNlzQvUbdRPg68tvhH0dVB3LAy++obHMtm9bXrbFMSK4
 vV9faRvtOg+hQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue,  4 Oct 2022 08:50:24 +0800
Message-Id: <20221004005024.955383-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao.yu@oppo.com> In order to check count of
 opened swapfile inodes. Signed-off-by: Chao Yu <chao.yu@oppo.com> --- v2:
 - fix to initialize swapfile_inode in f2fs_build_stats(). fs/f2fs/data.c
 | 2 ++ fs/f2fs/debug.c | 4 ++++ fs/f2fs/f2fs.h | 9 ++++++++- 3 files changed, 
 [...] Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ofW8w-00Bj38-Km
Subject: [f2fs-dev] [PATCH v2] f2fs: account swapfile inodes
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao.yu@oppo.com>

In order to check count of opened swapfile inodes.

Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
v2:
- fix to initialize swapfile_inode in f2fs_build_stats().
 fs/f2fs/data.c  | 2 ++
 fs/f2fs/debug.c | 4 ++++
 fs/f2fs/f2fs.h  | 9 ++++++++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0869fbbb5516..66f34cd559c6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3970,6 +3970,7 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
 	if (ret < 0)
 		return ret;
 
+	stat_inc_swapfile_inode(inode);
 	set_inode_flag(inode, FI_PIN_FILE);
 	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
 	return ret;
@@ -3979,6 +3980,7 @@ static void f2fs_swap_deactivate(struct file *file)
 {
 	struct inode *inode = file_inode(file);
 
+	stat_dec_swapfile_inode(inode);
 	clear_inode_flag(inode, FI_PIN_FILE);
 }
 #else
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index c01471573977..0c06488143f9 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -135,6 +135,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->inline_inode = atomic_read(&sbi->inline_inode);
 	si->inline_dir = atomic_read(&sbi->inline_dir);
 	si->compr_inode = atomic_read(&sbi->compr_inode);
+	si->swapfile_inode = atomic_read(&sbi->swapfile_inode);
 	si->compr_blocks = atomic64_read(&sbi->compr_blocks);
 	si->append = sbi->im[APPEND_INO].ino_num;
 	si->update = sbi->im[UPDATE_INO].ino_num;
@@ -385,6 +386,8 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->inline_dir);
 		seq_printf(s, "  - Compressed Inode: %u, Blocks: %llu\n",
 			   si->compr_inode, si->compr_blocks);
+		seq_printf(s, "  - Swapfile Inode: %u\n",
+			   si->swapfile_inode);
 		seq_printf(s, "  - Orphan/Append/Update Inode: %u, %u, %u\n",
 			   si->orphans, si->append, si->update);
 		seq_printf(s, "\nMain area: %d segs, %d secs %d zones\n",
@@ -607,6 +610,7 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 	atomic_set(&sbi->inline_dir, 0);
 	atomic_set(&sbi->compr_inode, 0);
 	atomic64_set(&sbi->compr_blocks, 0);
+	atomic_set(&sbi->atomic_files, 0);
 	atomic_set(&sbi->inplace_count, 0);
 	for (i = META_CP; i < META_MAX; i++)
 		atomic_set(&sbi->meta_count[i], 0);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 088c3d1574b8..408d8034ed74 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1765,6 +1765,7 @@ struct f2fs_sb_info {
 	atomic_t inline_dir;			/* # of inline_dentry inodes */
 	atomic_t compr_inode;			/* # of compressed inodes */
 	atomic64_t compr_blocks;		/* # of compressed blocks */
+	atomic_t swapfile_inode;		/* # of swapfile inodes */
 	atomic_t max_aw_cnt;			/* max # of atomic writes */
 	unsigned int io_skip_bggc;		/* skip background gc for in-flight IO */
 	unsigned int other_skip_bggc;		/* skip background gc for other reasons */
@@ -3863,7 +3864,7 @@ struct f2fs_stat_info {
 	int nr_issued_ckpt, nr_total_ckpt, nr_queued_ckpt;
 	unsigned int cur_ckpt_time, peak_ckpt_time;
 	int inline_xattr, inline_inode, inline_dir, append, update, orphans;
-	int compr_inode;
+	int compr_inode, swapfile_inode;
 	unsigned long long compr_blocks;
 	int aw_cnt, max_aw_cnt;
 	unsigned int valid_count, valid_node_count, valid_inode_count, discard_blks;
@@ -3952,6 +3953,10 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 		(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_blocks))
 #define stat_sub_compr_blocks(inode, blocks)				\
 		(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_blocks))
+#define stat_inc_swapfile_inode(inode)					\
+		(atomic_inc(&F2FS_I_SB(inode)->swapfile_inode))
+#define stat_dec_swapfile_inode(inode)					\
+		(atomic_dec(&F2FS_I_SB(inode)->swapfile_inode))
 #define stat_inc_meta_count(sbi, blkaddr)				\
 	do {								\
 		if (blkaddr < SIT_I(sbi)->sit_base_addr)		\
@@ -4036,6 +4041,8 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 #define stat_dec_compr_inode(inode)			do { } while (0)
 #define stat_add_compr_blocks(inode, blocks)		do { } while (0)
 #define stat_sub_compr_blocks(inode, blocks)		do { } while (0)
+#define stat_inc_swapfile_inode(inode)			do { } while (0)
+#define stat_dec_swapfile_inode(inode)			do { } while (0)
 #define stat_update_max_atomic_write(inode)		do { } while (0)
 #define stat_inc_meta_count(sbi, blkaddr)		do { } while (0)
 #define stat_inc_seg_type(sbi, curseg)			do { } while (0)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

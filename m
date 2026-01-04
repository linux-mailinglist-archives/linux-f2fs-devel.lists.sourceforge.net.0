Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEC6CF0816
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 04 Jan 2026 03:08:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lgG9kcSBVgPCw6z/QwmvehvKGERIFBm+ab/SaiH2yU=; b=bo6ERVALczq1ZYFF3KbZAVVJRH
	qMxmHUQNg80gIZ6gsPf/+SBCPRwrkZ2aAluTt+VMh9GkZEfwSJdrIYPUGtmuxQJDLjOxLPQG5agla
	kbtzVeQFHAO0bpWXLIZ982HqPL/RRrYCcI1Bf82Ad2DE3p/SWpLfJSkaBW+7W0edD7TE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcDXU-0001nw-NF;
	Sun, 04 Jan 2026 02:08:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vcDXT-0001no-9b
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RupHG8PIy0EFfc0iCHfldv7JeCEoDr6FuhdQi8Cp1og=; b=mv6T0NcVGbeFCCTLz8dgqsvn32
 /ESPxNti0A7tcXjDtdz4FZwP7eJFNCOZoWXCuIlPyjlsLVYbZKZDpV0z27o9Y4bTVFXdGgrQOBM4M
 RrkEl2qplvyobKUfPn9ogAOx/5ZAi3KxazxUoFaUddsM8Fbs/UXvz556BOYlN4TE+9T0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RupHG8PIy0EFfc0iCHfldv7JeCEoDr6FuhdQi8Cp1og=; b=PV/gRurroAR/nt7tCzdea7PwK8
 XRYOOr2mPA0pyeNKMLcoffL3/vz32dVr+mrm15k/NGaHIN7B8kDABSVxIa7yPgZODaCLdA0uCrAKm
 Gg3S8BgRzA5ko5AwY01Z0ighX5jLukbkTWTs6jF5jY1BbOryNejQ/4j0SOJF2vXe2AA4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcDXR-0005nR-EQ for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ACAEA60128
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  4 Jan 2026 02:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C358C16AAE;
 Sun,  4 Jan 2026 02:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767492487;
 bh=0X6lhw3se4jOlrqvzO8GE5zYqlQ5mAOtb/r3/YHXqaQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZOSeTuEnPAt1vW6MNu/QTY8iv8Tl80aVeMIcU6oc8jjtSFK4rziAMgchu6xfXMXD2
 Ty5V0iQzT63A9QShTlBcXMBvIL+aPLDioMtHO5oW0uRv4qJ1vGUdVVKgLagML5+xko
 2a8eVzhwzPckuves4G3TlIR/Q0AUKcTxWbp9tKs02NTIX36PuL18Y7UF8tAmPD6z/L
 gnlv+QKQ7RzisAuMW/1HPnUK/hV6csEI5d+L3o1++f6OJlL3nph7iVSDcHnxh+y20T
 J79G1Lqi2baydvaDdsZuySAgxG+gBwQSp2rS7sp4bPmhlzEpkv6bnq9C3yE9/18x+0
 fm8Euw7ncvGYg==
To: jaegeuk@kernel.org
Date: Sun,  4 Jan 2026 10:07:18 +0800
Message-ID: <20260104020729.1064529-3-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
In-Reply-To: <20260104020729.1064529-1-chao@kernel.org>
References: <20260104020729.1064529-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Use f2fs_{down,
 up}_read_trace for cp_rwsem to trace lock elapsed
 time. Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/checkpoint.c |
 28 ++++++++++++++++ fs/f2fs/compress.c | 12 ++++--- fs/f2fs/data.c | 47
 ++++++++++++++++ fs/f2fs/f2fs.h | 33 +++--------- [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vcDXR-0005nR-EQ
Subject: [f2fs-dev] [PATCH 03/14] f2fs: trace elapsed time for cp_rwsem lock
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use f2fs_{down,up}_read_trace for cp_rwsem to trace lock elapsed time.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c        | 28 ++++++++++++++++
 fs/f2fs/compress.c          | 12 ++++---
 fs/f2fs/data.c              | 47 ++++++++++++++++-----------
 fs/f2fs/f2fs.h              | 33 +++----------------
 fs/f2fs/file.c              | 65 ++++++++++++++++++++++---------------
 fs/f2fs/gc.c                |  5 +--
 fs/f2fs/inline.c            | 10 +++---
 fs/f2fs/inode.c             | 10 +++---
 fs/f2fs/namei.c             | 65 +++++++++++++++++++++----------------
 fs/f2fs/segment.c           | 10 +++---
 fs/f2fs/super.c             |  7 ++--
 fs/f2fs/xattr.c             |  5 +--
 include/trace/events/f2fs.h |  2 +-
 13 files changed, 173 insertions(+), 126 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 61bcf227d8ca..dfd54cba1b35 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -127,6 +127,34 @@ void f2fs_up_write_trace(struct f2fs_rwsem *sem, struct f2fs_lock_context *lc)
 	trace_lock_elapsed_time_end(sem, lc, true);
 }
 
+void f2fs_lock_op(struct f2fs_sb_info *sbi, struct f2fs_lock_context *lc)
+{
+	f2fs_down_read_trace(&sbi->cp_rwsem, lc);
+}
+
+int f2fs_trylock_op(struct f2fs_sb_info *sbi, struct f2fs_lock_context *lc)
+{
+	if (time_to_inject(sbi, FAULT_LOCK_OP))
+		return 0;
+
+	return f2fs_down_read_trylock_trace(&sbi->cp_rwsem, lc);
+}
+
+void f2fs_unlock_op(struct f2fs_sb_info *sbi, struct f2fs_lock_context *lc)
+{
+	f2fs_up_read_trace(&sbi->cp_rwsem, lc);
+}
+
+static inline void f2fs_lock_all(struct f2fs_sb_info *sbi)
+{
+	f2fs_down_write(&sbi->cp_rwsem);
+}
+
+static inline void f2fs_unlock_all(struct f2fs_sb_info *sbi)
+{
+	f2fs_up_write(&sbi->cp_rwsem);
+}
+
 #define DEFAULT_CHECKPOINT_IOPRIO (IOPRIO_PRIO_VALUE(IOPRIO_CLASS_RT, 3))
 
 static struct kmem_cache *ino_entry_slab;
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 7b68bf22989d..3155d30b2448 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1290,6 +1290,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	struct dnode_of_data dn;
 	struct node_info ni;
 	struct compress_io_ctx *cic;
+	struct f2fs_lock_context lc;
 	pgoff_t start_idx = start_idx_of_cluster(cc);
 	unsigned int last_index = cc->cluster_size - 1;
 	loff_t psize;
@@ -1309,7 +1310,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		 * the below discard race condition.
 		 */
 		f2fs_down_read(&sbi->node_write);
-	} else if (!f2fs_trylock_op(sbi)) {
+	} else if (!f2fs_trylock_op(sbi, &lc)) {
 		goto out_free;
 	}
 
@@ -1435,7 +1436,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	if (quota_inode)
 		f2fs_up_read(&sbi->node_write);
 	else
-		f2fs_unlock_op(sbi);
+		f2fs_unlock_op(sbi, &lc);
 
 	spin_lock(&fi->i_size_lock);
 	if (fi->last_disk_size < psize)
@@ -1464,7 +1465,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	if (quota_inode)
 		f2fs_up_read(&sbi->node_write);
 	else
-		f2fs_unlock_op(sbi);
+		f2fs_unlock_op(sbi, &lc);
 out_free:
 	for (i = 0; i < cc->valid_nr_cpages; i++) {
 		f2fs_compress_free_page(cc->cpages[i]);
@@ -1511,6 +1512,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 {
 	struct address_space *mapping = cc->inode->i_mapping;
 	struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
+	struct f2fs_lock_context lc;
 	int submitted, compr_blocks, i;
 	int ret = 0;
 
@@ -1529,7 +1531,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 
 	/* overwrite compressed cluster w/ normal cluster */
 	if (compr_blocks > 0)
-		f2fs_lock_op(sbi);
+		f2fs_lock_op(sbi, &lc);
 
 	for (i = 0; i < cc->cluster_size; i++) {
 		struct folio *folio;
@@ -1585,7 +1587,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 
 out:
 	if (compr_blocks > 0)
-		f2fs_unlock_op(sbi);
+		f2fs_unlock_op(sbi, &lc);
 
 	f2fs_balance_fs(sbi, true);
 	return ret;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 471e52c6c1e0..73fcafbc8191 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1466,34 +1466,39 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 	return 0;
 }
 
-static void f2fs_map_lock(struct f2fs_sb_info *sbi, int flag)
+static void f2fs_map_lock(struct f2fs_sb_info *sbi,
+				struct f2fs_lock_context *lc,
+				int flag)
 {
 	f2fs_down_read(&sbi->cp_enable_rwsem);
 	if (flag == F2FS_GET_BLOCK_PRE_AIO)
 		f2fs_down_read(&sbi->node_change);
 	else
-		f2fs_lock_op(sbi);
+		f2fs_lock_op(sbi, lc);
 }
 
-static void f2fs_map_unlock(struct f2fs_sb_info *sbi, int flag)
+static void f2fs_map_unlock(struct f2fs_sb_info *sbi,
+				struct f2fs_lock_context *lc,
+				int flag)
 {
 	if (flag == F2FS_GET_BLOCK_PRE_AIO)
 		f2fs_up_read(&sbi->node_change);
 	else
-		f2fs_unlock_op(sbi);
+		f2fs_unlock_op(sbi, lc);
 	f2fs_up_read(&sbi->cp_enable_rwsem);
 }
 
 int f2fs_get_block_locked(struct dnode_of_data *dn, pgoff_t index)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
+	struct f2fs_lock_context lc;
 	int err = 0;
 
-	f2fs_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO);
+	f2fs_map_lock(sbi, &lc, F2FS_GET_BLOCK_PRE_AIO);
 	if (!f2fs_lookup_read_extent_cache_block(dn->inode, index,
 						&dn->data_blkaddr))
 		err = f2fs_reserve_block(dn, index);
-	f2fs_map_unlock(sbi, F2FS_GET_BLOCK_PRE_AIO);
+	f2fs_map_unlock(sbi, &lc, F2FS_GET_BLOCK_PRE_AIO);
 
 	return err;
 }
@@ -1584,6 +1589,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	unsigned int maxblocks = map->m_len;
 	struct dnode_of_data dn;
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_lock_context lc;
 	int mode = map->m_may_create ? ALLOC_NODE : LOOKUP_NODE;
 	pgoff_t pgofs, end_offset, end;
 	int err = 0, ofs = 1;
@@ -1622,7 +1628,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	if (map->m_may_create) {
 		if (f2fs_lfs_mode(sbi))
 			f2fs_balance_fs(sbi, true);
-		f2fs_map_lock(sbi, flag);
+		f2fs_map_lock(sbi, &lc, flag);
 	}
 
 	/* When reading holes, we need its node page */
@@ -1788,7 +1794,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	f2fs_put_dnode(&dn);
 
 	if (map->m_may_create) {
-		f2fs_map_unlock(sbi, flag);
+		f2fs_map_unlock(sbi, &lc, flag);
 		f2fs_balance_fs(sbi, dn.node_changed);
 	}
 	goto next_dnode;
@@ -1835,7 +1841,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	f2fs_put_dnode(&dn);
 unlock_out:
 	if (map->m_may_create) {
-		f2fs_map_unlock(sbi, flag);
+		f2fs_map_unlock(sbi, &lc, flag);
 		f2fs_balance_fs(sbi, dn.node_changed);
 	}
 out:
@@ -2865,6 +2871,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	struct inode *inode = folio->mapping->host;
 	struct dnode_of_data dn;
 	struct node_info ni;
+	struct f2fs_lock_context lc;
 	bool ipu_force = false;
 	bool atomic_commit;
 	int err = 0;
@@ -2890,7 +2897,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	}
 
 	/* Deadlock due to between page->lock and f2fs_lock_op */
-	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi))
+	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi, &lc))
 		return -EAGAIN;
 
 	err = f2fs_get_dnode_of_data(&dn, folio->index, LOOKUP_NODE);
@@ -2931,7 +2938,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		folio_start_writeback(folio);
 		f2fs_put_dnode(&dn);
 		if (fio->need_lock == LOCK_REQ)
-			f2fs_unlock_op(fio->sbi);
+			f2fs_unlock_op(fio->sbi, &lc);
 		err = f2fs_inplace_write_data(fio);
 		if (err) {
 			if (fscrypt_inode_uses_fs_layer_crypto(inode))
@@ -2945,7 +2952,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	}
 
 	if (fio->need_lock == LOCK_RETRY) {
-		if (!f2fs_trylock_op(fio->sbi)) {
+		if (!f2fs_trylock_op(fio->sbi, &lc)) {
 			err = -EAGAIN;
 			goto out_writepage;
 		}
@@ -2977,7 +2984,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	f2fs_put_dnode(&dn);
 out:
 	if (fio->need_lock == LOCK_REQ)
-		f2fs_unlock_op(fio->sbi);
+		f2fs_unlock_op(fio->sbi, &lc);
 	return err;
 }
 
@@ -3570,6 +3577,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	struct inode *inode = folio->mapping->host;
 	pgoff_t index = folio->index;
 	struct dnode_of_data dn;
+	struct f2fs_lock_context lc;
 	struct folio *ifolio;
 	bool locked = false;
 	int flag = F2FS_GET_BLOCK_PRE_AIO;
@@ -3586,10 +3594,10 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	if (f2fs_has_inline_data(inode)) {
 		if (pos + len > MAX_INLINE_DATA(inode))
 			flag = F2FS_GET_BLOCK_DEFAULT;
-		f2fs_map_lock(sbi, flag);
+		f2fs_map_lock(sbi, &lc, flag);
 		locked = true;
 	} else if ((pos & PAGE_MASK) >= i_size_read(inode)) {
-		f2fs_map_lock(sbi, flag);
+		f2fs_map_lock(sbi, &lc, flag);
 		locked = true;
 	}
 
@@ -3633,7 +3641,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 		if (!err && dn.data_blkaddr != NULL_ADDR)
 			goto out;
 		f2fs_put_dnode(&dn);
-		f2fs_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO);
+		f2fs_map_lock(sbi, &lc, F2FS_GET_BLOCK_PRE_AIO);
 		WARN_ON(flag != F2FS_GET_BLOCK_PRE_AIO);
 		locked = true;
 		goto restart;
@@ -3647,7 +3655,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	f2fs_put_dnode(&dn);
 unlock_out:
 	if (locked)
-		f2fs_map_unlock(sbi, flag);
+		f2fs_map_unlock(sbi, &lc, flag);
 	return err;
 }
 
@@ -3683,10 +3691,11 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct dnode_of_data dn;
+	struct f2fs_lock_context lc;
 	struct folio *ifolio;
 	int err = 0;
 
-	f2fs_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO);
+	f2fs_map_lock(sbi, &lc, F2FS_GET_BLOCK_PRE_AIO);
 
 	ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
 	if (IS_ERR(ifolio)) {
@@ -3704,7 +3713,7 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
 	f2fs_put_dnode(&dn);
 
 unlock_out:
-	f2fs_map_unlock(sbi, F2FS_GET_BLOCK_PRE_AIO);
+	f2fs_map_unlock(sbi, &lc, F2FS_GET_BLOCK_PRE_AIO);
 	return err;
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b31589e5e19f..03f5eb7549a6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -175,6 +175,7 @@ enum device_allocation_policy {
 
 enum f2fs_lock_name {
 	LOCK_NAME_NONE,
+	LOCK_NAME_CP_RWSEM,
 };
 
 /*
@@ -2417,33 +2418,6 @@ static inline bool enabled_nat_bits(struct f2fs_sb_info *sbi,
 	return (cpc) ? (cpc->reason & CP_UMOUNT) && set : set;
 }
 
-static inline void f2fs_lock_op(struct f2fs_sb_info *sbi)
-{
-	f2fs_down_read(&sbi->cp_rwsem);
-}
-
-static inline int f2fs_trylock_op(struct f2fs_sb_info *sbi)
-{
-	if (time_to_inject(sbi, FAULT_LOCK_OP))
-		return 0;
-	return f2fs_down_read_trylock(&sbi->cp_rwsem);
-}
-
-static inline void f2fs_unlock_op(struct f2fs_sb_info *sbi)
-{
-	f2fs_up_read(&sbi->cp_rwsem);
-}
-
-static inline void f2fs_lock_all(struct f2fs_sb_info *sbi)
-{
-	f2fs_down_write(&sbi->cp_rwsem);
-}
-
-static inline void f2fs_unlock_all(struct f2fs_sb_info *sbi)
-{
-	f2fs_up_write(&sbi->cp_rwsem);
-}
-
 static inline int __get_cp_reason(struct f2fs_sb_info *sbi)
 {
 	int reason = CP_SYNC;
@@ -3770,7 +3744,7 @@ void f2fs_update_inode_page(struct inode *inode);
 int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc);
 void f2fs_remove_donate_inode(struct inode *inode);
 void f2fs_evict_inode(struct inode *inode);
-void f2fs_handle_failed_inode(struct inode *inode);
+void f2fs_handle_failed_inode(struct inode *inode, struct f2fs_lock_context *lc);
 
 /*
  * namei.c
@@ -4037,6 +4011,9 @@ static inline bool f2fs_need_rand_seg(struct f2fs_sb_info *sbi)
 /*
  * checkpoint.c
  */
+void f2fs_lock_op(struct f2fs_sb_info *sbi, struct f2fs_lock_context *lc);
+int f2fs_trylock_op(struct f2fs_sb_info *sbi, struct f2fs_lock_context *lc);
+void f2fs_unlock_op(struct f2fs_sb_info *sbi, struct f2fs_lock_context *lc);
 void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
 							unsigned char reason);
 void f2fs_flush_ckpt_thread(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e75e61ac50d7..1cdbbc2e1005 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -774,6 +774,7 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct dnode_of_data dn;
+	struct f2fs_lock_context lc;
 	pgoff_t free_from;
 	int count = 0, err = 0;
 	struct folio *ifolio;
@@ -792,7 +793,7 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 		goto free_partial;
 
 	if (lock)
-		f2fs_lock_op(sbi);
+		f2fs_lock_op(sbi, &lc);
 
 	ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
 	if (IS_ERR(ifolio)) {
@@ -843,7 +844,7 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 	err = f2fs_truncate_inode_blocks(inode, free_from);
 out:
 	if (lock)
-		f2fs_unlock_op(sbi);
+		f2fs_unlock_op(sbi, &lc);
 free_partial:
 	/* lastly zero out the first data page */
 	if (!err)
@@ -1118,11 +1119,13 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	}
 	if (i_uid_needs_update(idmap, attr, inode) ||
 	    i_gid_needs_update(idmap, attr, inode)) {
-		f2fs_lock_op(sbi);
+		struct f2fs_lock_context lc;
+
+		f2fs_lock_op(sbi, &lc);
 		err = dquot_transfer(idmap, inode, attr);
 		if (err) {
 			set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
-			f2fs_unlock_op(sbi);
+			f2fs_unlock_op(sbi, &lc);
 			return err;
 		}
 		/*
@@ -1132,7 +1135,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		i_uid_update(idmap, attr, inode);
 		i_gid_update(idmap, attr, inode);
 		f2fs_mark_inode_dirty_sync(inode, true);
-		f2fs_unlock_op(sbi);
+		f2fs_unlock_op(sbi, &lc);
 	}
 
 	if (attr->ia_valid & ATTR_SIZE) {
@@ -1216,15 +1219,16 @@ static int fill_zero(struct inode *inode, pgoff_t index,
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct folio *folio;
+	struct f2fs_lock_context lc;
 
 	if (!len)
 		return 0;
 
 	f2fs_balance_fs(sbi, true);
 
-	f2fs_lock_op(sbi);
+	f2fs_lock_op(sbi, &lc);
 	folio = f2fs_get_new_data_folio(inode, NULL, index, false);
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 
 	if (IS_ERR(folio))
 		return PTR_ERR(folio);
@@ -1307,6 +1311,7 @@ static int f2fs_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 		if (pg_start < pg_end) {
 			loff_t blk_start, blk_end;
 			struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+			struct f2fs_lock_context lc;
 
 			f2fs_balance_fs(sbi, true);
 
@@ -1318,9 +1323,9 @@ static int f2fs_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 
 			truncate_pagecache_range(inode, blk_start, blk_end - 1);
 
-			f2fs_lock_op(sbi);
+			f2fs_lock_op(sbi, &lc);
 			ret = f2fs_truncate_hole(inode, pg_start, pg_end);
-			f2fs_unlock_op(sbi);
+			f2fs_unlock_op(sbi, &lc);
 
 			filemap_invalidate_unlock(inode->i_mapping);
 			f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
@@ -1552,6 +1557,7 @@ static int __exchange_data_block(struct inode *src_inode,
 static int f2fs_do_collapse(struct inode *inode, loff_t offset, loff_t len)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_lock_context lc;
 	pgoff_t nrpages = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
 	pgoff_t start = offset >> PAGE_SHIFT;
 	pgoff_t end = (offset + len) >> PAGE_SHIFT;
@@ -1565,11 +1571,11 @@ static int f2fs_do_collapse(struct inode *inode, loff_t offset, loff_t len)
 
 	f2fs_zero_post_eof_page(inode, offset + len, false);
 
-	f2fs_lock_op(sbi);
+	f2fs_lock_op(sbi, &lc);
 	f2fs_drop_extent_tree(inode);
 	truncate_pagecache(inode, offset);
 	ret = __exchange_data_block(inode, inode, end, start, nrpages - end, true);
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 
 	filemap_invalidate_unlock(inode->i_mapping);
 	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
@@ -1717,6 +1723,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 
 		for (index = pg_start; index < pg_end;) {
 			struct dnode_of_data dn;
+			struct f2fs_lock_context lc;
 			unsigned int end_offset;
 			pgoff_t end;
 
@@ -1727,12 +1734,12 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 				(loff_t)index << PAGE_SHIFT,
 				((loff_t)pg_end << PAGE_SHIFT) - 1);
 
-			f2fs_lock_op(sbi);
+			f2fs_lock_op(sbi, &lc);
 
 			set_new_dnode(&dn, inode, NULL, NULL, 0);
 			ret = f2fs_get_dnode_of_data(&dn, index, ALLOC_NODE);
 			if (ret) {
-				f2fs_unlock_op(sbi);
+				f2fs_unlock_op(sbi, &lc);
 				filemap_invalidate_unlock(mapping);
 				f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 				goto out;
@@ -1744,7 +1751,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 			ret = f2fs_do_zero_range(&dn, index, end);
 			f2fs_put_dnode(&dn);
 
-			f2fs_unlock_op(sbi);
+			f2fs_unlock_op(sbi, &lc);
 			filemap_invalidate_unlock(mapping);
 			f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 
@@ -1827,17 +1834,19 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 	truncate_pagecache(inode, offset);
 
 	while (!ret && idx > pg_start) {
+		struct f2fs_lock_context lc;
+
 		nr = idx - pg_start;
 		if (nr > delta)
 			nr = delta;
 		idx -= nr;
 
-		f2fs_lock_op(sbi);
+		f2fs_lock_op(sbi, &lc);
 		f2fs_drop_extent_tree(inode);
 
 		ret = __exchange_data_block(inode, inode, idx,
 					idx + delta, nr, false);
-		f2fs_unlock_op(sbi);
+		f2fs_unlock_op(sbi, &lc);
 	}
 	filemap_invalidate_unlock(mapping);
 	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
@@ -3093,6 +3102,7 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	struct inode *src = file_inode(file_in);
 	struct inode *dst = file_inode(file_out);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(src);
+	struct f2fs_lock_context lc;
 	size_t olen = len, dst_max_i_size = 0;
 	size_t dst_osize;
 	int ret;
@@ -3188,7 +3198,7 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 			goto out_src;
 	}
 
-	f2fs_lock_op(sbi);
+	f2fs_lock_op(sbi, &lc);
 	ret = __exchange_data_block(src, dst, F2FS_BYTES_TO_BLK(pos_in),
 				F2FS_BYTES_TO_BLK(pos_out),
 				F2FS_BYTES_TO_BLK(len), false);
@@ -3199,7 +3209,7 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 		else if (dst_osize != dst->i_size)
 			f2fs_i_size_write(dst, dst_osize);
 	}
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 
 	if (src != dst)
 		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);
@@ -3367,6 +3377,7 @@ static int f2fs_ioc_setproject(struct inode *inode, __u32 projid)
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_inode *ri = NULL;
+	struct f2fs_lock_context lc;
 	kprojid_t kprojid;
 	int err;
 
@@ -3397,7 +3408,7 @@ static int f2fs_ioc_setproject(struct inode *inode, __u32 projid)
 	if (err)
 		return err;
 
-	f2fs_lock_op(sbi);
+	f2fs_lock_op(sbi, &lc);
 	err = f2fs_transfer_project_quota(inode, kprojid);
 	if (err)
 		goto out_unlock;
@@ -3406,7 +3417,7 @@ static int f2fs_ioc_setproject(struct inode *inode, __u32 projid)
 	inode_set_ctime_current(inode);
 	f2fs_mark_inode_dirty_sync(inode, true);
 out_unlock:
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 	return err;
 }
 #else
@@ -3839,6 +3850,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	struct inode *inode = file_inode(filp);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_lock_context lc;
 	pgoff_t page_idx = 0, last_idx;
 	unsigned int released_blocks = 0;
 	int ret;
@@ -3893,12 +3905,12 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 		struct dnode_of_data dn;
 		pgoff_t end_offset, count;
 
-		f2fs_lock_op(sbi);
+		f2fs_lock_op(sbi, &lc);
 
 		set_new_dnode(&dn, inode, NULL, NULL, 0);
 		ret = f2fs_get_dnode_of_data(&dn, page_idx, LOOKUP_NODE);
 		if (ret) {
-			f2fs_unlock_op(sbi);
+			f2fs_unlock_op(sbi, &lc);
 			if (ret == -ENOENT) {
 				page_idx = f2fs_get_next_page_offset(&dn,
 								page_idx);
@@ -3916,7 +3928,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 
 		f2fs_put_dnode(&dn);
 
-		f2fs_unlock_op(sbi);
+		f2fs_unlock_op(sbi, &lc);
 
 		if (ret < 0)
 			break;
@@ -4069,14 +4081,15 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 
 	while (page_idx < last_idx) {
 		struct dnode_of_data dn;
+		struct f2fs_lock_context lc;
 		pgoff_t end_offset, count;
 
-		f2fs_lock_op(sbi);
+		f2fs_lock_op(sbi, &lc);
 
 		set_new_dnode(&dn, inode, NULL, NULL, 0);
 		ret = f2fs_get_dnode_of_data(&dn, page_idx, LOOKUP_NODE);
 		if (ret) {
-			f2fs_unlock_op(sbi);
+			f2fs_unlock_op(sbi, &lc);
 			if (ret == -ENOENT) {
 				page_idx = f2fs_get_next_page_offset(&dn,
 								page_idx);
@@ -4094,7 +4107,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 
 		f2fs_put_dnode(&dn);
 
-		f2fs_unlock_op(sbi);
+		f2fs_unlock_op(sbi, &lc);
 
 		if (ret < 0)
 			break;
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index ba66d8bc9b5f..8999829a9559 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2263,6 +2263,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
 	__u64 old_block_count, shrunk_blocks;
 	struct cp_control cpc = { CP_RESIZE, 0, 0, 0 };
+	struct f2fs_lock_context lc;
 	unsigned int secs;
 	int err = 0;
 	__u32 rem;
@@ -2312,7 +2313,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 	}
 
 	/* stop CP to protect MAIN_SEC in free_segment_range */
-	f2fs_lock_op(sbi);
+	f2fs_lock_op(sbi, &lc);
 
 	spin_lock(&sbi->stat_lock);
 	if (shrunk_blocks + valid_user_blocks(sbi) +
@@ -2327,7 +2328,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 	err = free_segment_range(sbi, secs, true);
 
 out_unlock:
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 	f2fs_up_write(&sbi->gc_lock);
 out_drop_write:
 	mnt_drop_write_file(filp);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index e5c6a08b7e4f..0a1052d5ee62 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -218,6 +218,7 @@ int f2fs_convert_inline_inode(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct dnode_of_data dn;
+	struct f2fs_lock_context lc;
 	struct folio *ifolio, *folio;
 	int err = 0;
 
@@ -235,7 +236,7 @@ int f2fs_convert_inline_inode(struct inode *inode)
 	if (IS_ERR(folio))
 		return PTR_ERR(folio);
 
-	f2fs_lock_op(sbi);
+	f2fs_lock_op(sbi, &lc);
 
 	ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
 	if (IS_ERR(ifolio)) {
@@ -250,7 +251,7 @@ int f2fs_convert_inline_inode(struct inode *inode)
 
 	f2fs_put_dnode(&dn);
 out:
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 
 	f2fs_folio_put(folio, true);
 
@@ -597,13 +598,14 @@ int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
 	struct folio *ifolio;
 	struct f2fs_filename fname;
+	struct f2fs_lock_context lc;
 	void *inline_dentry = NULL;
 	int err = 0;
 
 	if (!f2fs_has_inline_dentry(dir))
 		return 0;
 
-	f2fs_lock_op(sbi);
+	f2fs_lock_op(sbi, &lc);
 
 	err = f2fs_setup_filename(dir, &dentry->d_name, 0, &fname);
 	if (err)
@@ -628,7 +630,7 @@ int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry)
 out_fname:
 	f2fs_free_filename(&fname);
 out:
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 	return err;
 }
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index d1270b25ad7d..b8cf1fab6391 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -910,9 +910,11 @@ void f2fs_evict_inode(struct inode *inode)
 		err = -EIO;
 
 	if (!err) {
-		f2fs_lock_op(sbi);
+		struct f2fs_lock_context lc;
+
+		f2fs_lock_op(sbi, &lc);
 		err = f2fs_remove_inode_page(inode);
-		f2fs_unlock_op(sbi);
+		f2fs_unlock_op(sbi, &lc);
 		if (err == -ENOENT) {
 			err = 0;
 
@@ -1009,7 +1011,7 @@ void f2fs_evict_inode(struct inode *inode)
 }
 
 /* caller should call f2fs_lock_op() */
-void f2fs_handle_failed_inode(struct inode *inode)
+void f2fs_handle_failed_inode(struct inode *inode, struct f2fs_lock_context *lc)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct node_info ni;
@@ -1058,7 +1060,7 @@ void f2fs_handle_failed_inode(struct inode *inode)
 	}
 
 out:
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, lc);
 
 	/* iput will drop the inode object */
 	iput(inode);
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 043d20516a21..e360f08a9586 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -354,6 +354,7 @@ static int f2fs_create(struct mnt_idmap *idmap, struct inode *dir,
 		       struct dentry *dentry, umode_t mode, bool excl)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
+	struct f2fs_lock_context lc;
 	struct inode *inode;
 	nid_t ino = 0;
 	int err;
@@ -376,11 +377,11 @@ static int f2fs_create(struct mnt_idmap *idmap, struct inode *dir,
 	inode->i_mapping->a_ops = &f2fs_dblock_aops;
 	ino = inode->i_ino;
 
-	f2fs_lock_op(sbi);
+	f2fs_lock_op(sbi, &lc);
 	err = f2fs_add_link(dentry, inode);
 	if (err)
 		goto out;
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 
 	f2fs_alloc_nid_done(sbi, ino);
 
@@ -392,7 +393,7 @@ static int f2fs_create(struct mnt_idmap *idmap, struct inode *dir,
 	f2fs_balance_fs(sbi, true);
 	return 0;
 out:
-	f2fs_handle_failed_inode(inode);
+	f2fs_handle_failed_inode(inode, &lc);
 	return err;
 }
 
@@ -401,6 +402,7 @@ static int f2fs_link(struct dentry *old_dentry, struct inode *dir,
 {
 	struct inode *inode = d_inode(old_dentry);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
+	struct f2fs_lock_context lc;
 	int err;
 
 	if (unlikely(f2fs_cp_error(sbi)))
@@ -427,11 +429,11 @@ static int f2fs_link(struct dentry *old_dentry, struct inode *dir,
 	ihold(inode);
 
 	set_inode_flag(inode, FI_INC_LINK);
-	f2fs_lock_op(sbi);
+	f2fs_lock_op(sbi, &lc);
 	err = f2fs_add_link(dentry, inode);
 	if (err)
 		goto out;
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 
 	d_instantiate(dentry, inode);
 
@@ -441,7 +443,7 @@ static int f2fs_link(struct dentry *old_dentry, struct inode *dir,
 out:
 	clear_inode_flag(inode, FI_INC_LINK);
 	iput(inode);
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 	return err;
 }
 
@@ -545,6 +547,7 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
 	struct inode *inode = d_inode(dentry);
 	struct f2fs_dir_entry *de;
+	struct f2fs_lock_context lc;
 	struct folio *folio;
 	int err;
 
@@ -581,15 +584,15 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 
 	f2fs_balance_fs(sbi, true);
 
-	f2fs_lock_op(sbi);
+	f2fs_lock_op(sbi, &lc);
 	err = f2fs_acquire_orphan_inode(sbi);
 	if (err) {
-		f2fs_unlock_op(sbi);
+		f2fs_unlock_op(sbi, &lc);
 		f2fs_folio_put(folio, false);
 		goto out;
 	}
 	f2fs_delete_entry(de, folio, dir, inode);
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 
 	/* VFS negative dentries are incompatible with Encoding and
 	 * Case-insensitiveness. Eventually we'll want avoid
@@ -632,6 +635,7 @@ static int f2fs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 			struct dentry *dentry, const char *symname)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
+	struct f2fs_lock_context lc;
 	struct inode *inode;
 	size_t len = strlen(symname);
 	struct fscrypt_str disk_link;
@@ -662,11 +666,11 @@ static int f2fs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 	inode_nohighmem(inode);
 	inode->i_mapping->a_ops = &f2fs_dblock_aops;
 
-	f2fs_lock_op(sbi);
+	f2fs_lock_op(sbi, &lc);
 	err = f2fs_add_link(dentry, inode);
 	if (err)
 		goto out_f2fs_handle_failed_inode;
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 	f2fs_alloc_nid_done(sbi, inode->i_ino);
 
 	err = fscrypt_encrypt_symlink(inode, symname, len, &disk_link);
@@ -701,7 +705,7 @@ static int f2fs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 	goto out_free_encrypted_link;
 
 out_f2fs_handle_failed_inode:
-	f2fs_handle_failed_inode(inode);
+	f2fs_handle_failed_inode(inode, &lc);
 out_free_encrypted_link:
 	if (disk_link.name != (unsigned char *)symname)
 		kfree(disk_link.name);
@@ -712,6 +716,7 @@ static struct dentry *f2fs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 				 struct dentry *dentry, umode_t mode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
+	struct f2fs_lock_context lc;
 	struct inode *inode;
 	int err;
 
@@ -732,11 +737,11 @@ static struct dentry *f2fs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	mapping_set_gfp_mask(inode->i_mapping, GFP_NOFS);
 
 	set_inode_flag(inode, FI_INC_LINK);
-	f2fs_lock_op(sbi);
+	f2fs_lock_op(sbi, &lc);
 	err = f2fs_add_link(dentry, inode);
 	if (err)
 		goto out_fail;
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 
 	f2fs_alloc_nid_done(sbi, inode->i_ino);
 
@@ -750,7 +755,7 @@ static struct dentry *f2fs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 
 out_fail:
 	clear_inode_flag(inode, FI_INC_LINK);
-	f2fs_handle_failed_inode(inode);
+	f2fs_handle_failed_inode(inode, &lc);
 	return ERR_PTR(err);
 }
 
@@ -767,6 +772,7 @@ static int f2fs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 		      struct dentry *dentry, umode_t mode, dev_t rdev)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
+	struct f2fs_lock_context lc;
 	struct inode *inode;
 	int err = 0;
 
@@ -786,11 +792,11 @@ static int f2fs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 	init_special_inode(inode, inode->i_mode, rdev);
 	inode->i_op = &f2fs_special_inode_operations;
 
-	f2fs_lock_op(sbi);
+	f2fs_lock_op(sbi, &lc);
 	err = f2fs_add_link(dentry, inode);
 	if (err)
 		goto out;
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 
 	f2fs_alloc_nid_done(sbi, inode->i_ino);
 
@@ -802,7 +808,7 @@ static int f2fs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 	f2fs_balance_fs(sbi, true);
 	return 0;
 out:
-	f2fs_handle_failed_inode(inode);
+	f2fs_handle_failed_inode(inode, &lc);
 	return err;
 }
 
@@ -811,6 +817,7 @@ static int __f2fs_tmpfile(struct mnt_idmap *idmap, struct inode *dir,
 			  struct inode **new_inode, struct f2fs_filename *fname)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
+	struct f2fs_lock_context lc;
 	struct inode *inode;
 	int err;
 
@@ -831,7 +838,7 @@ static int __f2fs_tmpfile(struct mnt_idmap *idmap, struct inode *dir,
 		inode->i_mapping->a_ops = &f2fs_dblock_aops;
 	}
 
-	f2fs_lock_op(sbi);
+	f2fs_lock_op(sbi, &lc);
 	err = f2fs_acquire_orphan_inode(sbi);
 	if (err)
 		goto out;
@@ -860,7 +867,7 @@ static int __f2fs_tmpfile(struct mnt_idmap *idmap, struct inode *dir,
 			f2fs_i_links_write(inode, false);
 	}
 	/* link_count was changed by d_tmpfile as well. */
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 	unlock_new_inode(inode);
 
 	if (new_inode)
@@ -872,7 +879,7 @@ static int __f2fs_tmpfile(struct mnt_idmap *idmap, struct inode *dir,
 release_out:
 	f2fs_release_orphan_inode(sbi);
 out:
-	f2fs_handle_failed_inode(inode);
+	f2fs_handle_failed_inode(inode, &lc);
 	return err;
 }
 
@@ -920,6 +927,7 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	struct f2fs_dir_entry *old_dir_entry = NULL;
 	struct f2fs_dir_entry *old_entry;
 	struct f2fs_dir_entry *new_entry;
+	struct f2fs_lock_context lc;
 	bool old_is_dir = S_ISDIR(old_inode->i_mode);
 	int err;
 
@@ -1008,7 +1016,7 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 
 		f2fs_balance_fs(sbi, true);
 
-		f2fs_lock_op(sbi);
+		f2fs_lock_op(sbi, &lc);
 
 		err = f2fs_acquire_orphan_inode(sbi);
 		if (err)
@@ -1031,11 +1039,11 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	} else {
 		f2fs_balance_fs(sbi, true);
 
-		f2fs_lock_op(sbi);
+		f2fs_lock_op(sbi, &lc);
 
 		err = f2fs_add_link(new_dentry, old_inode);
 		if (err) {
-			f2fs_unlock_op(sbi);
+			f2fs_unlock_op(sbi, &lc);
 			goto out_dir;
 		}
 
@@ -1084,7 +1092,7 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 							TRANS_DIR_INO);
 	}
 
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 
 	if (IS_DIRSYNC(old_dir) || IS_DIRSYNC(new_dir))
 		f2fs_sync_fs(sbi->sb, 1);
@@ -1093,7 +1101,7 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	return 0;
 
 put_out_dir:
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 	f2fs_folio_put(new_folio, false);
 out_dir:
 	if (old_dir_entry)
@@ -1115,6 +1123,7 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 	struct folio *old_folio, *new_folio;
 	struct f2fs_dir_entry *old_dir_entry = NULL, *new_dir_entry = NULL;
 	struct f2fs_dir_entry *old_entry, *new_entry;
+	struct f2fs_lock_context lc;
 	int old_nlink = 0, new_nlink = 0;
 	int err;
 
@@ -1194,7 +1203,7 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 
 	f2fs_balance_fs(sbi, true);
 
-	f2fs_lock_op(sbi);
+	f2fs_lock_op(sbi, &lc);
 
 	/* update ".." directory entry info of old dentry */
 	if (old_dir_entry)
@@ -1247,7 +1256,7 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 		f2fs_add_ino_entry(sbi, new_dir->i_ino, TRANS_DIR_INO);
 	}
 
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 
 	if (IS_DIRSYNC(old_dir) || IS_DIRSYNC(new_dir))
 		f2fs_sync_fs(sbi->sb, 1);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c0c5b7075b04..e4a8daf433a8 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -400,6 +400,7 @@ int f2fs_commit_atomic_write(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
+	struct f2fs_lock_context lc;
 	int err;
 
 	err = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
@@ -407,11 +408,11 @@ int f2fs_commit_atomic_write(struct inode *inode)
 		return err;
 
 	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
-	f2fs_lock_op(sbi);
+	f2fs_lock_op(sbi, &lc);
 
 	err = __f2fs_commit_atomic_write(inode);
 
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 
 	return err;
@@ -3362,13 +3363,14 @@ int f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force)
 
 int f2fs_allocate_pinning_section(struct f2fs_sb_info *sbi)
 {
+	struct f2fs_lock_context lc;
 	int err;
 	bool gc_required = true;
 
 retry:
-	f2fs_lock_op(sbi);
+	f2fs_lock_op(sbi, &lc);
 	err = f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_PINNED, false);
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 
 	if (f2fs_sb_has_blkzoned(sbi) && err == -EAGAIN && gc_required) {
 		f2fs_down_write(&sbi->gc_lock);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d277f082d4c0..d60b91292c23 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3325,6 +3325,7 @@ int f2fs_do_quota_sync(struct super_block *sb, int type)
 	 * that userspace sees the changes.
 	 */
 	for (cnt = 0; cnt < MAXQUOTAS; cnt++) {
+		struct f2fs_lock_context lc;
 
 		if (type != -1 && cnt != type)
 			continue;
@@ -3344,13 +3345,13 @@ int f2fs_do_quota_sync(struct super_block *sb, int type)
 		 *			      block_operation
 		 *			      f2fs_down_read(quota_sem)
 		 */
-		f2fs_lock_op(sbi);
+		f2fs_lock_op(sbi, &lc);
 		f2fs_down_read(&sbi->quota_sem);
 
 		ret = f2fs_quota_sync_file(sbi, cnt);
 
 		f2fs_up_read(&sbi->quota_sem);
-		f2fs_unlock_op(sbi);
+		f2fs_unlock_op(sbi, &lc);
 
 		if (!f2fs_sb_has_quota_ino(sbi))
 			inode_unlock(dqopt->files[cnt]);
@@ -4898,7 +4899,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	init_f2fs_rwsem(&sbi->node_write);
 	init_f2fs_rwsem(&sbi->node_change);
 	spin_lock_init(&sbi->stat_lock);
-	init_f2fs_rwsem(&sbi->cp_rwsem);
+	init_f2fs_rwsem_trace(&sbi->cp_rwsem, sbi, LOCK_NAME_CP_RWSEM);
 	init_f2fs_rwsem(&sbi->cp_enable_rwsem);
 	init_f2fs_rwsem(&sbi->quota_sem);
 	init_waitqueue_head(&sbi->cp_wait);
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index b4e5c406632f..941dc62a6d6f 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -804,6 +804,7 @@ int f2fs_setxattr(struct inode *inode, int index, const char *name,
 				struct folio *ifolio, int flags)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_lock_context lc;
 	int err;
 
 	if (unlikely(f2fs_cp_error(sbi)))
@@ -821,11 +822,11 @@ int f2fs_setxattr(struct inode *inode, int index, const char *name,
 						size, ifolio, flags);
 	f2fs_balance_fs(sbi, true);
 
-	f2fs_lock_op(sbi);
+	f2fs_lock_op(sbi, &lc);
 	f2fs_down_write(&F2FS_I(inode)->i_xattr_sem);
 	err = __f2fs_setxattr(inode, index, name, value, size, NULL, flags);
 	f2fs_up_write(&F2FS_I(inode)->i_xattr_sem);
-	f2fs_unlock_op(sbi);
+	f2fs_unlock_op(sbi, &lc);
 
 	f2fs_update_time(sbi, REQ_TIME);
 	return err;
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 9a852a16df9c..f4f13ddbe104 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -186,7 +186,7 @@ TRACE_DEFINE_ENUM(CP_PHASE_FINISH_CHECKPOINT);
 
 #define show_lock_name(lock)						\
 	__print_symbolic(lock,						\
-		{ LOCK_NAME_NONE,		"none" })
+		{ LOCK_NAME_CP_RWSEM,		"cp_rwsem" })
 
 struct f2fs_sb_info;
 struct f2fs_io_info;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

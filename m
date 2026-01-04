Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB8ACF0828
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 04 Jan 2026 03:08:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBKgcVHSiMgQRNjG3MMo6jdLhrJh76Z7rwuncd22jAs=; b=HE8WrpzPzgtU2EhswdQTOVRZEs
	IthvIAB+QSgajC8MazHroeGY3iqiUP0umAJrXwfAqltWb8aXsjIKJ16zfH3apKCwPrcfLntIU14Z2
	KXxJ57WwGBIT0r/sTemhOR+XzV5XOKvpmfVnHNGgi+lE3OzAI/O2KN3T94i3qWzuaaUw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcDXa-0006xf-K3;
	Sun, 04 Jan 2026 02:08:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vcDXY-0006xM-E3
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YrsIZksl29uJVSVVRjgBUXyUUttiRXpalwERdh99muY=; b=kY4nJTZ8sbIyS2C2FQreMwpKCo
 KMpN5wtNrbdtNPZfXNxkPSGD7/9vtPuce7BLsO6VtiX2A3p/lIa5qLuFxIRISFfUemZl2hqKamrON
 ILKZXpHIJ3YdJ1SkJUU2I/XUS/p9L6TOB+wY/+jCFBl9xfLHGfNpqq+gUQ53Ar3F4VVc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YrsIZksl29uJVSVVRjgBUXyUUttiRXpalwERdh99muY=; b=E/oXH3NwndHEphLacUfullPFUP
 s2otq6zIwIXexT2aue0SZJ8Ed9WWzVlb/MVV1KnBxhCciRrHSMWLZwyC1WtxgstD7kzZh4WC2FRD+
 6BsDlIO7lsHn+Szh0GfKnivvRK7h0X1zxMzW297h5OP688Bz8JpAaxyBdw6fJE7EmuH8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcDXY-0005nl-Kk for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5D4AA43785
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  4 Jan 2026 02:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43921C113D0;
 Sun,  4 Jan 2026 02:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767492490;
 bh=9ICu90GB2tA69M9q9UmsOp3ZgiSleoaMnB7RpM2lw50=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TwJgQkjvBMgXffoRew7yhvJFFSQYtuR2/WQPWPzxoC/RNfePPeIZ9mgtuqB9CPh1p
 ZaA6llCsSzRlOjOYnmMQJwIexRJ3BJmngCQbwjglyDBCCNQVnClMLMaA0NC5bWwQJh
 acZ9v7h7Bmp7CGxEq/cDKUdZk2zx6qmz/W539fBOtyMh/RMzxGxnEejj0ofII+IDgw
 TCc+WingVvVQCnVZU8uTYZEHrEPP+czzhJQb3QUn+r0oRhPE84N1TUrapbGEnVrt/Z
 wwNQ8CbScoCGwmxfEGxeySD/2z9Y9LXXCJrWqlGY6EthNhpFrBte7IAdBZ3jNaUZzI
 KrWapD0G7zQCg==
To: jaegeuk@kernel.org
Date: Sun,  4 Jan 2026 10:07:20 +0800
Message-ID: <20260104020729.1064529-5-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
In-Reply-To: <20260104020729.1064529-1-chao@kernel.org>
References: <20260104020729.1064529-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Use f2fs_{down,up}_read_trace for node_write to trace lock
 elapsed time. Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/compress.c
 | 6 +++--- fs/f2fs/data.c | 6 ++++-- fs/f2fs/f2fs.h | 1 + fs/f2fs/node.c
 | 9 +++++---- fs/f2fs/super.c | 2 +- include/trace/events/f2fs. [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vcDXY-0005nl-Kk
Subject: [f2fs-dev] [PATCH 05/14] f2fs: trace elapsed time for node_write
 lock
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

Use f2fs_{down,up}_read_trace for node_write to trace lock elapsed time.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c          | 6 +++---
 fs/f2fs/data.c              | 6 ++++--
 fs/f2fs/f2fs.h              | 1 +
 fs/f2fs/node.c              | 9 +++++----
 fs/f2fs/super.c             | 2 +-
 include/trace/events/f2fs.h | 3 ++-
 6 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 3155d30b2448..316bc3e6d2d4 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1309,7 +1309,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		 * checkpoint. This can only happen to quota writes which can cause
 		 * the below discard race condition.
 		 */
-		f2fs_down_read(&sbi->node_write);
+		f2fs_down_read_trace(&sbi->node_write, &lc);
 	} else if (!f2fs_trylock_op(sbi, &lc)) {
 		goto out_free;
 	}
@@ -1434,7 +1434,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 	f2fs_put_dnode(&dn);
 	if (quota_inode)
-		f2fs_up_read(&sbi->node_write);
+		f2fs_up_read_trace(&sbi->node_write, &lc);
 	else
 		f2fs_unlock_op(sbi, &lc);
 
@@ -1463,7 +1463,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	f2fs_put_dnode(&dn);
 out_unlock_op:
 	if (quota_inode)
-		f2fs_up_read(&sbi->node_write);
+		f2fs_up_read_trace(&sbi->node_write, &lc);
 	else
 		f2fs_unlock_op(sbi, &lc);
 out_free:
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5469547142e7..79455d7acba5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3064,19 +3064,21 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 write:
 	/* Dentry/quota blocks are controlled by checkpoint */
 	if (S_ISDIR(inode->i_mode) || quota_inode) {
+		struct f2fs_lock_context lc;
+
 		/*
 		 * We need to wait for node_write to avoid block allocation during
 		 * checkpoint. This can only happen to quota writes which can cause
 		 * the below discard race condition.
 		 */
 		if (quota_inode)
-			f2fs_down_read(&sbi->node_write);
+			f2fs_down_read_trace(&sbi->node_write, &lc);
 
 		fio.need_lock = LOCK_DONE;
 		err = f2fs_do_write_data_page(&fio);
 
 		if (quota_inode)
-			f2fs_up_read(&sbi->node_write);
+			f2fs_up_read_trace(&sbi->node_write, &lc);
 
 		goto done;
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 972cff745e63..3f6278ba620d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -177,6 +177,7 @@ enum f2fs_lock_name {
 	LOCK_NAME_NONE,
 	LOCK_NAME_CP_RWSEM,
 	LOCK_NAME_NODE_CHANGE,
+	LOCK_NAME_NODE_WRITE,
 };
 
 /*
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index ecba9b0836eb..99e425e8c00a 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1738,6 +1738,7 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 		.io_type = io_type,
 		.io_wbc = wbc,
 	};
+	struct f2fs_lock_context lc;
 	unsigned int seq;
 
 	trace_f2fs_writepage(folio, NODE);
@@ -1767,13 +1768,13 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 	if (f2fs_get_node_info(sbi, nid, &ni, !do_balance))
 		goto redirty_out;
 
-	f2fs_down_read(&sbi->node_write);
+	f2fs_down_read_trace(&sbi->node_write, &lc);
 
 	/* This page is already truncated */
 	if (unlikely(ni.blk_addr == NULL_ADDR)) {
 		folio_clear_uptodate(folio);
 		dec_page_count(sbi, F2FS_DIRTY_NODES);
-		f2fs_up_read(&sbi->node_write);
+		f2fs_up_read_trace(&sbi->node_write, &lc);
 		folio_unlock(folio);
 		return true;
 	}
@@ -1781,7 +1782,7 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 	if (__is_valid_data_blkaddr(ni.blk_addr) &&
 		!f2fs_is_valid_blkaddr(sbi, ni.blk_addr,
 					DATA_GENERIC_ENHANCE)) {
-		f2fs_up_read(&sbi->node_write);
+		f2fs_up_read_trace(&sbi->node_write, &lc);
 		goto redirty_out;
 	}
 
@@ -1806,7 +1807,7 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 	f2fs_do_write_node_page(nid, &fio);
 	set_node_addr(sbi, &ni, fio.new_blkaddr, is_fsync_dnode(folio));
 	dec_page_count(sbi, F2FS_DIRTY_NODES);
-	f2fs_up_read(&sbi->node_write);
+	f2fs_up_read_trace(&sbi->node_write, &lc);
 
 	folio_unlock(folio);
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0d406fc8bc22..d8e5e8652d97 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4896,7 +4896,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	init_f2fs_rwsem(&sbi->gc_lock);
 	mutex_init(&sbi->writepages);
 	init_f2fs_rwsem(&sbi->cp_global_sem);
-	init_f2fs_rwsem(&sbi->node_write);
+	init_f2fs_rwsem_trace(&sbi->node_write, sbi, LOCK_NAME_NODE_WRITE);
 	init_f2fs_rwsem_trace(&sbi->node_change, sbi, LOCK_NAME_NODE_CHANGE);
 	spin_lock_init(&sbi->stat_lock);
 	init_f2fs_rwsem_trace(&sbi->cp_rwsem, sbi, LOCK_NAME_CP_RWSEM);
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index d472f47eedec..e5cfb8ad0d5e 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -187,7 +187,8 @@ TRACE_DEFINE_ENUM(CP_PHASE_FINISH_CHECKPOINT);
 #define show_lock_name(lock)						\
 	__print_symbolic(lock,						\
 		{ LOCK_NAME_CP_RWSEM,		"cp_rwsem" },		\
-		{ LOCK_NAME_NODE_CHANGE,	"node_change" })
+		{ LOCK_NAME_NODE_CHANGE,	"node_change" },	\
+		{ LOCK_NAME_NODE_WRITE,		"node_write" })
 
 struct f2fs_sb_info;
 struct f2fs_io_info;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA599B1F907
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Aug 2025 10:00:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3KpTBVPmlODfOST/8d49opM0o78kueXjKpOGo6ZzBs=; b=ip4KiDjVnQmy7e75GrFmsSTuUZ
	abbK7H7+RRGgLtUUdNNhQeykGSMzsDfsmFLJv5ANmEIvK66TLOK35K/xu6Tl7Y4dF7BhsHf+Jcgvm
	crbMZuQUSplv21heJH+LvBrbXyjv4zo/zV2d49Jn1YGc7FQmS7+yvp3oq6/azJ9Rh73s=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ul0yd-0008N4-Gf;
	Sun, 10 Aug 2025 08:00:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ul0yb-0008Md-Ca
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zxa4upjEh6TUCWFIh4BYmoZbQciCOe2SX7F+Y9rESKs=; b=mFfN6/oJduBseyZBIx+4gwPbH7
 mwokVeTedazcAzcCAheOlx6Azw7b6Z/kScqylfaOaAFbXPDtD9ZPYP7AvKMZauAMJSbq7W2oCfrDh
 BHMF7qVKR4Z0psPYD9feCce2p0jkvRk49bi/Tg32btlVoXv0SgIRuC21va5PRPOL+L7w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zxa4upjEh6TUCWFIh4BYmoZbQciCOe2SX7F+Y9rESKs=; b=DSlrvsB5J3l2Z8Z8Y+Snbvprog
 8SLc6A0F9gwODPPmxEp/NIUMynZVSqfY0dUD9KzJv+9m5goJ4mVdPvYere2Bpe4dWDXXS1+5v0JvI
 Z+xtbCGGgP6sU3AGsTtBh5nBQ+CqjxP/ZB6XCxyRBpZz+czNkrO91rzvwkWYG2/Jo0LA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ul0ya-00011K-T0 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 11AD845C51;
 Sun, 10 Aug 2025 08:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EBCC113CF;
 Sun, 10 Aug 2025 08:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754812813;
 bh=4ALZh1TX6fbceabPFA2hm4uM38KlRQdFwuBGPkO3fiQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WrdsILbDUeHsSLCqkLIk932Dt2ft5mbjyrE14aQEF/nn2Pq8A94dxpPvu46Rx5hQe
 8tzKe7dmDUzJgfofTapEb1rVqKkqr/QkF4KfBsSMYp4lMGHNXAf1D47sA4az5MAfEV
 BCJ0OimXCSWvozt+8XYBZKApWRzQlt7Puqaz3lm06hfjSVR87qCb/HIam2C5DpXefv
 +ByHz8g72FZi9U6OiqvWWhkIaIrGxCJnkGLcmtRdOrzozekuhoRfC663e53fBT3tvu
 8J17CNaXveiknAWq1luhFlgs6mRJxXvOCcaccTW6LguZC6s8JAbk+v80HBcAGcCqea
 YHJcypJNTou/A==
To: linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev
Date: Sun, 10 Aug 2025 00:57:05 -0700
Message-ID: <20250810075706.172910-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Now that all fsverity-capable filesystems store the pointer
 to fsverity_info in the filesystem-specific part of the inode structure,
 inode::i_verity_info is no longer needed. Update fsverity_info_addr [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ul0ya-00011K-T0
Subject: [f2fs-dev] [PATCH v5 12/13] fs: remove inode::i_verity_info
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Now that all fsverity-capable filesystems store the pointer to
fsverity_info in the filesystem-specific part of the inode structure,
inode::i_verity_info is no longer needed.  Update fsverity_info_addr()
to no longer support the fallback to inode::i_verity_info.  Finally,
remove inode::i_verity_info itself, and move the forward declaration of
struct fsverity_info from fs.h (which no longer needs it) to fsverity.h.

The end result of the migration to the filesystem-specific pointer is
memory savings on CONFIG_FS_VERITY=y kernels for all filesystems that
don't support fsverity.  Specifically, their in-memory inodes are now
smaller by the size of a pointer: either 4 or 8 bytes.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/linux/fs.h       |  5 -----
 include/linux/fsverity.h | 10 ++++++++--
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 1dafa18169be6..12ecc6b0e6f96 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -71,11 +71,10 @@ struct cred;
 struct swap_info_struct;
 struct seq_file;
 struct workqueue_struct;
 struct iov_iter;
 struct fscrypt_operations;
-struct fsverity_info;
 struct fsverity_operations;
 struct fsnotify_mark_connector;
 struct fsnotify_sb_info;
 struct fs_context;
 struct fs_parameter_spec;
@@ -777,14 +776,10 @@ struct inode {
 	__u32			i_fsnotify_mask; /* all events this inode cares about */
 	/* 32-bit hole reserved for expanding i_fsnotify_mask */
 	struct fsnotify_mark_connector __rcu	*i_fsnotify_marks;
 #endif
 
-#ifdef CONFIG_FS_VERITY
-	struct fsverity_info	*i_verity_info;
-#endif
-
 	void			*i_private; /* fs or device private pointer */
 } __randomize_layout;
 
 static inline void inode_set_cached_link(struct inode *inode, char *link, int linklen)
 {
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index e0f132cb78393..844f7b8b56bbc 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -24,10 +24,12 @@
 #define FS_VERITY_MAX_DIGEST_SIZE	SHA512_DIGEST_SIZE
 
 /* Arbitrary limit to bound the kmalloc() size.  Can be changed. */
 #define FS_VERITY_MAX_DESCRIPTOR_SIZE	16384
 
+struct fsverity_info;
+
 /* Verity operations for filesystems */
 struct fsverity_operations {
 	/**
 	 * The offset of the pointer to struct fsverity_info in the
 	 * filesystem-specific part of the inode, relative to the beginning of
@@ -128,15 +130,19 @@ struct fsverity_operations {
 				       u64 pos, unsigned int size);
 };
 
 #ifdef CONFIG_FS_VERITY
 
+/*
+ * Returns the address of the verity info pointer within the filesystem-specific
+ * part of the inode.  (To save memory on filesystems that don't support
+ * fsverity, a field in 'struct inode' itself is no longer used.)
+ */
 static inline struct fsverity_info **
 fsverity_info_addr(const struct inode *inode)
 {
-	if (inode->i_sb->s_vop->inode_info_offs == 0)
-		return (struct fsverity_info **)&inode->i_verity_info;
+	VFS_WARN_ON_ONCE(inode->i_sb->s_vop->inode_info_offs == 0);
 	return (void *)inode + inode->i_sb->s_vop->inode_info_offs;
 }
 
 static inline struct fsverity_info *fsverity_get_info(const struct inode *inode)
 {
-- 
2.50.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

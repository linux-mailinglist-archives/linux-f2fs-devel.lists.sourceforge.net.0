Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE2AB1F900
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Aug 2025 10:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lD+5gZbBlgjiVt3x//QDM0u7RKf34VEVzllhv++ErE=; b=LmiPVt1SZut9wfRphodw6utPyo
	XNxqm32mADq2JN7b7emvKpXZQJpJqHsf6WXMldL8DYbvNcQkMKjbFwkdr3CUKDG4tiIx6pR3moeYP
	EkZ/nYuJjnnpN7qsKHuVXS+OjcelkJCYjTUYbysg3Qsk6IZeiMr16lxs6M7n8HIFs2aw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ul0ya-0002Xh-Bs;
	Sun, 10 Aug 2025 08:00:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ul0yY-0002XV-Dh
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bCfUr9pWbmQD3yJvMtwetcY/5gPxduPf1schk1P7ZLw=; b=CufPpSBmT1AIvi8FrH5kVIHGPx
 FbkZxnXCSEeUBAG010i505x4M4JFHBrR0VdVhLlb/GNMd6zNbNOuckB4dOpqRU9RkcCOkA3dMHaXN
 Oq6E0oeGQkaCn+wal5uVFCf0WCMNiQJOwjWxVrXVAXv85KnGHHDYoqycbN6z2cTlDzWY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bCfUr9pWbmQD3yJvMtwetcY/5gPxduPf1schk1P7ZLw=; b=dksDaKwLQ5DjtNoQcOXvXqD+jq
 lXWZFNKQbVJX7T97YB490aCjXBXb0pc9oztm//V9Os3/5Tt2bzrEHa+fHA9aOwLGumAq2EbX1EJgh
 raVjG+9qf9nQkt3zslFt99qr/pBTSUzUD+Jic77zF1O0oMyYEBReEfuq9l1sm32zyGnU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ul0yX-00010f-Ap for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA4825C5721;
 Sun, 10 Aug 2025 08:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FFA2C4CEF0;
 Sun, 10 Aug 2025 08:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754812811;
 bh=0W2QfxH3SEgQE9yRuqSbCQDiVKMNeIT6t0Ume6h8gTo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nbO0fBqNeeMZN0WDI+kgBFdzKJGAGVEHnaPJxNqqowTDLniJGOt0j4uw17U+6FdFo
 H1Rc+/DvLZMsGO2D5fctgnRrjZXcK7So5ofrPTD2H2yqTs1twguCtFJ2JNW4cMPtPp
 TrBjF8WHO/Fqi8b5bl1QcFjUuAV1wELwTmlaoVQa+YVbKZI//49bHAJwmSo25dwBt1
 9Velrja88wsmjHCfWt9uhUSDzFuUBb8Ukug6Giba73mFWBZs8MnCbze0Ch6npBgJ7e
 PSD9t23xAMkrpUHkqc+5V+32XM9Fgs/eeDPf3ADl5GWNi5DG2oJSS8jBlPWdvKu8/N
 WR+Wmk3zLpjvA==
To: linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev
Date: Sun, 10 Aug 2025 00:57:02 -0700
Message-ID: <20250810075706.172910-10-ebiggers@kernel.org>
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
 Content preview: Move the fsverity_info pointer into the filesystem-specific
 part of the inode by adding the field ext4_inode_info::i_verity_info and
 configuring fsverity_operations::inode_info_offs accordingly. This is a
 prerequisite
 for a later commit that removes inode::i_verity_info,
 saving memory and improving
 cache efficiency on filesystems that don't support fsverity. 
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
X-Headers-End: 1ul0yX-00010f-Ap
Subject: [f2fs-dev] [PATCH v5 09/13] ext4: move verity info pointer to
 fs-specific part of inode
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

Move the fsverity_info pointer into the filesystem-specific part of the
inode by adding the field ext4_inode_info::i_verity_info and configuring
fsverity_operations::inode_info_offs accordingly.

This is a prerequisite for a later commit that removes
inode::i_verity_info, saving memory and improving cache efficiency on
filesystems that don't support fsverity.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/ext4/ext4.h   | 4 ++++
 fs/ext4/super.c  | 3 +++
 fs/ext4/verity.c | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index c897109dadb15..6cb784a56b3ba 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -1184,10 +1184,14 @@ struct ext4_inode_info {
 	kprojid_t i_projid;
 
 #ifdef CONFIG_FS_ENCRYPTION
 	struct fscrypt_inode_info *i_crypt_info;
 #endif
+
+#ifdef CONFIG_FS_VERITY
+	struct fsverity_info *i_verity_info;
+#endif
 };
 
 /*
  * File system states
  */
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 0c3059ecce37c..46138a6cb32a3 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1471,10 +1471,13 @@ static void init_once(void *foo)
 	inode_init_once(&ei->vfs_inode);
 	ext4_fc_init_inode(&ei->vfs_inode);
 #ifdef CONFIG_FS_ENCRYPTION
 	ei->i_crypt_info = NULL;
 #endif
+#ifdef CONFIG_FS_VERITY
+	ei->i_verity_info = NULL;
+#endif
 }
 
 static int __init init_inodecache(void)
 {
 	ext4_inode_cachep = kmem_cache_create_usercopy("ext4_inode_cache",
diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index d9203228ce979..b0acb0c503137 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -387,10 +387,12 @@ static int ext4_write_merkle_tree_block(struct inode *inode, const void *buf,
 
 	return pagecache_write(inode, buf, size, pos);
 }
 
 const struct fsverity_operations ext4_verityops = {
+	.inode_info_offs	= (int)offsetof(struct ext4_inode_info, i_verity_info) -
+				  (int)offsetof(struct ext4_inode_info, vfs_inode),
 	.begin_enable_verity	= ext4_begin_enable_verity,
 	.end_enable_verity	= ext4_end_enable_verity,
 	.get_verity_descriptor	= ext4_get_verity_descriptor,
 	.read_merkle_tree_page	= ext4_read_merkle_tree_page,
 	.write_merkle_tree_block = ext4_write_merkle_tree_block,
-- 
2.50.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

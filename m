Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CABD9B1F90D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Aug 2025 10:00:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLqKAXW373ak0HWCPXCBca31Rh8QQSg8ohcFI5dFOJ4=; b=Lhg2iCh8WJi6jGakE+ihJkcB+i
	dwVJbbJ/szuILrXe1P8RZugY83CwpRfbyzokOWMuT0L4fnT4mw9qew24+DKegeU60VA7ho35azNhd
	GRvAfMHh3P6DFOuVKm1cf8O+7dZkp7ZUJgvAqJ1NJfwh3tXxgk3yzRXY2iYPBQdsiJ/U=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ul0yh-000222-Lt;
	Sun, 10 Aug 2025 08:00:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ul0yd-00021c-GC
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6B027XudR3cu79h/OGaP4U1UdBfAybOO/au53lFfKA0=; b=bUidbA5oJ9T9a7bOeTWQOSB5b9
 /ZBlacqgrJvTDB9t5UgMRYU7SYXiBkzMqcTRx4Mt1kwjuy5XVA+nUkruItHjck2NNQswIrC2KjooE
 TLxM07E1SZ/lyZ7+z4TzYnxXXFqadeew/qjUgt2pS51hWFP2QQ9WIe8m5x1RTvRWGFYg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6B027XudR3cu79h/OGaP4U1UdBfAybOO/au53lFfKA0=; b=apb0czbXZNWC2aqm+4xcvDHRVi
 kYLn4pA3lyStsUxi8xPht3Lhzcg6Ye9IAm+dFnEMCuzBLo3S1Pa51WB/9sG2IvGUZPVmGFTXsYRIb
 Zl4pfdxpc5QHKY0aTEVm/uAAn0PB1vTu60OWsrNreeYb7+kaVFhNvrPjzI7Y5/9esNMo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ul0yd-00011k-2W for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C0C4945C74;
 Sun, 10 Aug 2025 08:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3376CC19421;
 Sun, 10 Aug 2025 08:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754812812;
 bh=uSWAqJvL/RiAtfpBphLEdbPpxmsErLOL7QyUHYYHGg4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dvISGINgSttzGx8S1Yo6P0RNV1i2csXZr4uItP+Yiv8ictOEXawreDSudyFW5/fK3
 TrwPhv1wyy4MawAWSn2oSte2ZGC1l5i5yo6Jtv2FSBFQ/p2zYBEF9QutXIQiBecGmi
 JpxfpZIcybAHf26NvHx6M0iOxLRcc/g0TGocFP8mTe0GO5rP4SutVwcgL3p8EGl4uN
 qUS2D/z/OLXWkHCjIv8gzAGFAcRuZoAivquHz1RBh847/S+SFMxhbYwiwFbk45SmQS
 bBQlYp+rFGlZeRYHd59Wsn6XV4FG+gZ/PDxO+U3ame2WBmS/tDBEH2Tz1E4UFj/ith
 d3raZqdhdM4RQ==
To: linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev
Date: Sun, 10 Aug 2025 00:57:04 -0700
Message-ID: <20250810075706.172910-12-ebiggers@kernel.org>
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
 part of the inode by adding the field btrfs_inode::i_verity_info and
 configuring
 fsverity_operations::inode_info_offs accordingly. This is a prerequisite
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
X-Headers-End: 1ul0yd-00011k-2W
Subject: [f2fs-dev] [PATCH v5 11/13] btrfs: move verity info pointer to
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
inode by adding the field btrfs_inode::i_verity_info and configuring
fsverity_operations::inode_info_offs accordingly.

This is a prerequisite for a later commit that removes
inode::i_verity_info, saving memory and improving cache efficiency on
filesystems that don't support fsverity.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/btrfs/btrfs_inode.h | 5 +++++
 fs/btrfs/inode.c       | 3 +++
 fs/btrfs/verity.c      | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/fs/btrfs/btrfs_inode.h b/fs/btrfs/btrfs_inode.h
index b99fb02732929..2c9489497cbea 100644
--- a/fs/btrfs/btrfs_inode.h
+++ b/fs/btrfs/btrfs_inode.h
@@ -336,10 +336,15 @@ struct btrfs_inode {
 
 	/* Hook into fs_info->delayed_iputs */
 	struct list_head delayed_iput;
 
 	struct rw_semaphore i_mmap_lock;
+
+#ifdef CONFIG_FS_VERITY
+	struct fsverity_info *i_verity_info;
+#endif
+
 	struct inode vfs_inode;
 };
 
 static inline u64 btrfs_get_first_dir_index_to_log(const struct btrfs_inode *inode)
 {
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index b77dd22b8cdbe..de722b232ec14 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -7959,10 +7959,13 @@ int btrfs_drop_inode(struct inode *inode)
 static void init_once(void *foo)
 {
 	struct btrfs_inode *ei = foo;
 
 	inode_init_once(&ei->vfs_inode);
+#ifdef CONFIG_FS_VERITY
+	ei->i_verity_info = NULL;
+#endif
 }
 
 void __cold btrfs_destroy_cachep(void)
 {
 	/*
diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
index b7a96a005487e..4633cbcfcdb90 100644
--- a/fs/btrfs/verity.c
+++ b/fs/btrfs/verity.c
@@ -800,10 +800,12 @@ static int btrfs_write_merkle_tree_block(struct inode *inode, const void *buf,
 	return write_key_bytes(BTRFS_I(inode), BTRFS_VERITY_MERKLE_ITEM_KEY,
 			       pos, buf, size);
 }
 
 const struct fsverity_operations btrfs_verityops = {
+	.inode_info_offs         = (int)offsetof(struct btrfs_inode, i_verity_info) -
+				   (int)offsetof(struct btrfs_inode, vfs_inode),
 	.begin_enable_verity     = btrfs_begin_enable_verity,
 	.end_enable_verity       = btrfs_end_enable_verity,
 	.get_verity_descriptor   = btrfs_get_verity_descriptor,
 	.read_merkle_tree_page   = btrfs_read_merkle_tree_page,
 	.write_merkle_tree_block = btrfs_write_merkle_tree_block,
-- 
2.50.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

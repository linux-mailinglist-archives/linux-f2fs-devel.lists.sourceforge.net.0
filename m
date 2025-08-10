Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2481EB1F902
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Aug 2025 10:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3BIDy2qsbB6R0KVR6/FowB4bqjKxkho3I8rQGoPUHo=; b=WTGH8xuIfamGCZKEQRkiv8lmjL
	p2a9LGrnOiOkMrn50em0V+t1pSGXXhgiAfFgwUaj1iG8uFGFtzycN5VlkAy/DQOiLu1+/bUjuhodM
	dKanPOEe/V6i3XfinCBmc011GKrAeKX9o5y6zSP4e1TUygOPRkwTly/mlkHJbpbnuV0Y=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ul0yX-0008Lu-7p;
	Sun, 10 Aug 2025 08:00:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ul0yV-0008Lo-Uu
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jEWlUZlkE4+g7GRHFs3/q9TcoG16IqXhpaTAcFUdi4w=; b=itBScNnO3VNqK0Bj+04x6x7fVj
 2AB6b5qpmYg18JI+J3nCYWDmBDWGxg/xD6Z6jtXNvu0LEBE0qY+AQWx4wM8+DSVm4fqkxTY2hK01k
 9WOYsPf7knE/yrt+CEbz0aICzt/kzkOfEHsS7nVJKMzmGRwQm9ZM9pS8aSZ+9L/J+93E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jEWlUZlkE4+g7GRHFs3/q9TcoG16IqXhpaTAcFUdi4w=; b=m6kstOb4lyp8w9thNYjyo1NH4H
 3DOxaQv09c+w/I3mVW3krxvjcQyFB+/+kpmRJWuKocdwtKbSUYRe8pYnypEiTK8wgdH1+g18y8aer
 jiFiJTIpn3EDGI89tYc4QxXnkuGGQXPqnYnOXGBP4WxZpFgbNksZopJJhDm7zlZEzid4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ul0yU-00010R-RE for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8528245C60;
 Sun, 10 Aug 2025 08:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C70C4CEF8;
 Sun, 10 Aug 2025 08:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754812809;
 bh=Dg7N4Yxhd1Q0fVMr+QNgQgiF2vNBJPVNwSrIaGVuBhA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VEb0L+26rIN6EuClQPwD6XWh/x1ogGk1gHqNfKeABEaGso81WskiRPvahQXrAuCOZ
 w2k9gwPcM4MVzy2Xtu93ICIZqwGAZiFUmW03irgpEFgGPONzVBlgA6iWwZdW2VAjvp
 ckA/LCdmP5MZbWj/9vUZG482qZtgY9xS1gsOTEm/SHQJRHZ0jQf5v0AOB5kVLhzAr5
 SOjntj25+qR6WW2NoRSLMXpdEylk+m4qP1c0l4gHM7T7zu0GwfPp1aBhPwApR2RcmI
 cIXrdjVQsfxC0fsbYUTOYO6xUsGL+VNBvyFbKBM5ODIr83OGKk7cOz9+EyNoG4ihpm
 vskpt49wZ+FMw==
To: linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev
Date: Sun, 10 Aug 2025 00:56:57 -0700
Message-ID: <20250810075706.172910-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Move the fscrypt_inode_info pointer into the
 filesystem-specific
 part of the inode by adding the field f2fs_inode_info::i_crypt_info and
 configuring
 fscrypt_operations::inode_info_offs accordingly. This is a prerequisite for
 a later commit that removes inode::i_crypt_info, saving memory and improving
 cache efficiency with filesystems that don't support fscrypt. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ul0yU-00010R-RE
Subject: [f2fs-dev] [PATCH v5 04/13] f2fs: move crypt info pointer to
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

Move the fscrypt_inode_info pointer into the filesystem-specific part of
the inode by adding the field f2fs_inode_info::i_crypt_info and
configuring fscrypt_operations::inode_info_offs accordingly.

This is a prerequisite for a later commit that removes
inode::i_crypt_info, saving memory and improving cache efficiency with
filesystems that don't support fscrypt.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/f2fs/f2fs.h  | 3 +++
 fs/f2fs/super.c | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 46be7560548ce..2f5c30c069c3c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -905,10 +905,13 @@ struct f2fs_inode_info {
 	unsigned char i_compress_flag;		/* compress flag */
 	unsigned int i_cluster_size;		/* cluster size */
 
 	unsigned int atomic_write_cnt;
 	loff_t original_i_size;		/* original i_size before atomic write */
+#ifdef CONFIG_FS_ENCRYPTION
+	struct fscrypt_inode_info *i_crypt_info; /* filesystem encryption info */
+#endif
 };
 
 static inline void get_read_extent_info(struct extent_info *ext,
 					struct f2fs_extent *i_ext)
 {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index e16c4e2830c29..b42b55280d9e3 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -478,10 +478,13 @@ static inline void adjust_unusable_cap_perc(struct f2fs_sb_info *sbi)
 static void init_once(void *foo)
 {
 	struct f2fs_inode_info *fi = (struct f2fs_inode_info *) foo;
 
 	inode_init_once(&fi->vfs_inode);
+#ifdef CONFIG_FS_ENCRYPTION
+	fi->i_crypt_info = NULL;
+#endif
 }
 
 #ifdef CONFIG_QUOTA
 static const char * const quotatypes[] = INITQFNAMES;
 #define QTYPE2NAME(t) (quotatypes[t])
@@ -3568,10 +3571,12 @@ static struct block_device **f2fs_get_devices(struct super_block *sb,
 	*num_devs = sbi->s_ndevs;
 	return devs;
 }
 
 static const struct fscrypt_operations f2fs_cryptops = {
+	.inode_info_offs	= (int)offsetof(struct f2fs_inode_info, i_crypt_info) -
+				  (int)offsetof(struct f2fs_inode_info, vfs_inode),
 	.needs_bounce_pages	= 1,
 	.has_32bit_inodes	= 1,
 	.supports_subblock_data_units = 1,
 	.legacy_key_prefix	= "f2fs:",
 	.get_context		= f2fs_get_context,
@@ -3579,11 +3584,11 @@ static const struct fscrypt_operations f2fs_cryptops = {
 	.get_dummy_policy	= f2fs_get_dummy_policy,
 	.empty_dir		= f2fs_empty_dir,
 	.has_stable_inodes	= f2fs_has_stable_inodes,
 	.get_devices		= f2fs_get_devices,
 };
-#endif
+#endif /* CONFIG_FS_ENCRYPTION */
 
 static struct inode *f2fs_nfs_get_inode(struct super_block *sb,
 		u64 ino, u32 generation)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
-- 
2.50.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

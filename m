Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A50B1F904
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Aug 2025 10:00:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xk/25hcVFBn+kLjqaGIakM8mhhp1V4LD5jtSxBXUE/I=; b=AmFabIOM6Qi1iOoggMFhonq6ND
	60rVsT15lNLDsSlBv4HDvs0vhJDrWlPPy6BVJgrQzFftwGi++hYV6SUVqblUj0Dov+qg+n0NLd+6O
	+3fmvSOA4rV2dKQQqAuRzRO7Mu5s6SwEcI3YYaARaOTcYJesYotWaVnmfD8AHMB5jS34=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ul0yW-0003Tg-EI;
	Sun, 10 Aug 2025 08:00:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ul0yV-0003Ta-JM
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kDS6Qm+ARvJ1Ux5PbS8NB1R1tfva1Nms5ie0IOsUZuA=; b=eVOtBesXu0b4SLYFv7M+ugj9t2
 +pGnqIW9/Jj5w/SBZ3+mg3j1yNy3+lXlQP1Y14GHwCwnktMY6fYH+D9IFV0tgG98hB3fXm5Vgp+Hh
 R/v4kp9QN/pEjQpMcNa8Y9P+GwaPOHWMkinJ1QQ/H4JzW7bHYrMpdcZIGY05GFyXieko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kDS6Qm+ARvJ1Ux5PbS8NB1R1tfva1Nms5ie0IOsUZuA=; b=S/QpEFJwawEgPIGA872QHpwHG3
 ZvglLR6vYslhtJJt8dlvDxJBR7wt8qfX/LzgTDaP/MRqlwkKVfAuNYPaQ5zFJfleogLqyPSuvDPli
 IupuZRxSrcgeAnxmfYAjoQNxnvFkySVGe3wsDK8w7aQC0KLFti6yONx/KULhXaAJYOGw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ul0yV-00010W-SV for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3C55EA55132;
 Sun, 10 Aug 2025 08:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D421C4CEEB;
 Sun, 10 Aug 2025 08:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754812809;
 bh=Qm1plsgVlmTBCpbZLW/xcJNpj1w2kpvFy1WqJ9hSAZw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IBNeIHJ2heVgM/csrEC21oBuVod6FeprqFqd1W+zzBuMWSAFjawLCDuBK4bneu7ou
 0AlF0wyE4wt//266UDH7gUEIzRcrV+jXb8aeubS8u1tpfdXci4muagNyNZfgTKW7z6
 jF+JQtHOfsQEB/S3jXe+F3X3rWlXyf4VbWi7aYpAxVSjgjSsDaWRFTSxEVW7ec7/Rc
 kHShVks2Ht5rGE4vyY02UuKKgzsrXLCZoQMGvSwhz/kAeIpVrCuHfxcKEFzFAG1/fr
 XCR8JpQGpS8e3uHh5SXlecIvhE6bSOWV5WiT27UJA8SYlbR+nXiMx3EeZEKqt1YvaB
 x54EA9wnkMuUw==
To: linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev
Date: Sun, 10 Aug 2025 00:56:58 -0700
Message-ID: <20250810075706.172910-6-ebiggers@kernel.org>
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
 part of the inode by adding the field ubifs_inode::i_crypt_info and
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
X-Headers-End: 1ul0yV-00010W-SV
Subject: [f2fs-dev] [PATCH v5 05/13] ubifs: move crypt info pointer to
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
the inode by adding the field ubifs_inode::i_crypt_info and configuring
fscrypt_operations::inode_info_offs accordingly.

This is a prerequisite for a later commit that removes
inode::i_crypt_info, saving memory and improving cache efficiency with
filesystems that don't support fscrypt.

Note that the initialization of ubifs_inode::i_crypt_info to NULL on
inode allocation is handled by the memset() in ubifs_alloc_inode().

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/ubifs/crypto.c | 2 ++
 fs/ubifs/ubifs.h  | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index fb5ac358077b1..0b14d004a095b 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -86,10 +86,12 @@ int ubifs_decrypt(const struct inode *inode, struct ubifs_data_node *dn,
 
 	return 0;
 }
 
 const struct fscrypt_operations ubifs_crypt_operations = {
+	.inode_info_offs	= (int)offsetof(struct ubifs_inode, i_crypt_info) -
+				  (int)offsetof(struct ubifs_inode, vfs_inode),
 	.legacy_key_prefix	= "ubifs:",
 	.get_context		= ubifs_crypt_get_context,
 	.set_context		= ubifs_crypt_set_context,
 	.empty_dir		= ubifs_crypt_empty_dir,
 };
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 5db45c9e26ee0..49e50431741cd 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -363,10 +363,11 @@ struct ubifs_gced_idx_leb {
  * @compr_type: default compression type used for this inode
  * @last_page_read: page number of last page read (for bulk read)
  * @read_in_a_row: number of consecutive pages read in a row (for bulk read)
  * @data_len: length of the data attached to the inode
  * @data: inode's data
+ * @i_crypt_info: inode's fscrypt information
  *
  * @ui_mutex exists for two main reasons. At first it prevents inodes from
  * being written back while UBIFS changing them, being in the middle of an VFS
  * operation. This way UBIFS makes sure the inode fields are consistent. For
  * example, in 'ubifs_rename()' we change 4 inodes simultaneously, and
@@ -414,10 +415,13 @@ struct ubifs_inode {
 	int flags;
 	pgoff_t last_page_read;
 	pgoff_t read_in_a_row;
 	int data_len;
 	void *data;
+#ifdef CONFIG_FS_ENCRYPTION
+	struct fscrypt_inode_info *i_crypt_info;
+#endif
 };
 
 /**
  * struct ubifs_unclean_leb - records a LEB recovered under read-only mode.
  * @list: list
-- 
2.50.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

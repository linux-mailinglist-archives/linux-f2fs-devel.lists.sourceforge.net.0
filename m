Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 231CFB1F90A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Aug 2025 10:00:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFwu7E6OnV8ASaSi53ny/oGTuKb9G/v9k0pX0KE+Wns=; b=fyM1lqYUh0WqQAtBG7iswYBk9M
	UqLYhMohsDLlHRLTLwqs5eSCdhT1elq7l3QpNiIw9ZF5Ge6VEWVaN/pNIiESzv1G4W4AfFw59UkcZ
	tVHGFrTS1UCLmPtnFBjTdbjs9zc3doGVWdESefT9IsUH2xeDZZA97OdNDlEIkWNfTnV4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ul0yf-0002Yl-2V;
	Sun, 10 Aug 2025 08:00:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ul0yd-0002YQ-Rz
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=72Hnh/btaerSpBlTsRZh4sRUxV5BbZ2/QfZGzkIwlT0=; b=EgAkdYnpSyiOAU/bmD1po7UmNj
 YSaH/5mxvPnnQc/NzPuHQkQWlhk4qG1HwFPuFUBuEGBluEA8IzEj6XEFbx0E/YJz7x5d1lziCcEKN
 Wcfyy2av97eXXFHf07ZgJmavPwHaYO4iD8zj5oE05xdBryiYsBt5Q/9ZxmcDszxZEAIg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=72Hnh/btaerSpBlTsRZh4sRUxV5BbZ2/QfZGzkIwlT0=; b=W9pPZQ5LTyLJ5H29jkznGK+P66
 XVhYZRsFq7qaNrgAB3JQyEq6Gw8nEJYCnIOX9qktT6gW/1/aQ6qAgn350x3lS2zzmwr/lfbQQgz5M
 gm7xBV7S9NinSNi5z+EUelKCD+ZPiQBPobfnvZ0XMwoOkmjCGBo+4n1aaGSSh9vbxxdQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ul0yd-00011l-Cf for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A9B82613AE;
 Sun, 10 Aug 2025 08:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2C7C4CEF9;
 Sun, 10 Aug 2025 08:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754812812;
 bh=mAk2HuPLK15i8Ku+xAc7HePI/XnULAPP/YM3x9265tc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rqdcDpAJoSITR9lcMi9rlgGgii+Fo12miTFMisZBALLfiW83XRzb99WcY11e9R1JD
 WeC0crLpN370pkZOLTdGtu23gELfMSDcGRhPaANxbgwBfCOvNFm6D7ZsONCOCe3VOK
 rUBV4j1Rp0yBAc5FpGToXFDIVEd3qeu0NRivNT+KOyxmLtdL5ZaRz38uzC/FfzYw7l
 l2bhPafvNTlsflkyOGHdI20ETqliyQ6oOSmIxUcgCQ2DsVt4WpC6NCxQAMWZAgdtx2
 4YB1bMU10EdiocZzGg+uwT/kwQ64HeB5Mt7XSptyLK5vU9hctWLtl+zK0ag2BP1JLj
 93jGZQmovo8rQ==
To: linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev
Date: Sun, 10 Aug 2025 00:57:03 -0700
Message-ID: <20250810075706.172910-11-ebiggers@kernel.org>
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
 Content preview: Move the fsverity_info pointer into the filesystem-specific
 part of the inode by adding the field f2fs_inode_info::i_verity_info and
 configuring fsverity_operations::inode_info_offs accordingly. This is a
 prerequisite
 for a later commit that removes inode::i_verity_info,
 saving memory and improving
 cache efficiency on filesystems that don't support fsverity. 
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
X-Headers-End: 1ul0yd-00011l-Cf
Subject: [f2fs-dev] [PATCH v5 10/13] f2fs: move verity info pointer to
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
inode by adding the field f2fs_inode_info::i_verity_info and configuring
fsverity_operations::inode_info_offs accordingly.

This is a prerequisite for a later commit that removes
inode::i_verity_info, saving memory and improving cache efficiency on
filesystems that don't support fsverity.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/f2fs/f2fs.h   | 3 +++
 fs/f2fs/super.c  | 3 +++
 fs/f2fs/verity.c | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2f5c30c069c3c..6e465bbc85ee5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -908,10 +908,13 @@ struct f2fs_inode_info {
 	unsigned int atomic_write_cnt;
 	loff_t original_i_size;		/* original i_size before atomic write */
 #ifdef CONFIG_FS_ENCRYPTION
 	struct fscrypt_inode_info *i_crypt_info; /* filesystem encryption info */
 #endif
+#ifdef CONFIG_FS_VERITY
+	struct fsverity_info *i_verity_info; /* filesystem verity info */
+#endif
 };
 
 static inline void get_read_extent_info(struct extent_info *ext,
 					struct f2fs_extent *i_ext)
 {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b42b55280d9e3..1db024b20e29b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -481,10 +481,13 @@ static void init_once(void *foo)
 
 	inode_init_once(&fi->vfs_inode);
 #ifdef CONFIG_FS_ENCRYPTION
 	fi->i_crypt_info = NULL;
 #endif
+#ifdef CONFIG_FS_VERITY
+	fi->i_verity_info = NULL;
+#endif
 }
 
 #ifdef CONFIG_QUOTA
 static const char * const quotatypes[] = INITQFNAMES;
 #define QTYPE2NAME(t) (quotatypes[t])
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 2287f238ae09e..f0ab9a3c7a82b 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -285,10 +285,12 @@ static int f2fs_write_merkle_tree_block(struct inode *inode, const void *buf,
 
 	return pagecache_write(inode, buf, size, pos);
 }
 
 const struct fsverity_operations f2fs_verityops = {
+	.inode_info_offs	= (int)offsetof(struct f2fs_inode_info, i_verity_info) -
+				  (int)offsetof(struct f2fs_inode_info, vfs_inode),
 	.begin_enable_verity	= f2fs_begin_enable_verity,
 	.end_enable_verity	= f2fs_end_enable_verity,
 	.get_verity_descriptor	= f2fs_get_verity_descriptor,
 	.read_merkle_tree_page	= f2fs_read_merkle_tree_page,
 	.write_merkle_tree_block = f2fs_write_merkle_tree_block,
-- 
2.50.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

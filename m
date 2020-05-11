Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D6F1CE3B4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2020 21:16:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYDuv-0005HX-MQ; Mon, 11 May 2020 19:16:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jYDuu-0005HK-HZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 May 2020 19:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8wifyF+e/aszpa+m180KTkAHv+ccEaRdUDAZLvKOKNU=; b=lSNWcAVFSwx/NOApVnniW2ZzPY
 cT+RohbjW43BLMxpz5fesYxgFuVJFE4av4RQrJ2xX5ODNag2jdcMCGs09c0AY/z+J2y6dDIv0SyHj
 rB+qVqg+kxHXF6icNUVNgZdu0kH3E91laFwaUiiFxXYECfMtcg/hqH/sOAD7CiHSp8+o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8wifyF+e/aszpa+m180KTkAHv+ccEaRdUDAZLvKOKNU=; b=RHxpLF/Aos+0hVWtpdJRhv3sLk
 H6NbUxkI2VxoRrn7XyJfe68pJHdZVsq/D5QKO7GKZIfMSD2Nm4JSlelS5WrUW3yktyvDGSuchBWoe
 g1W2jzadFiZR2p11mY2BvczpOSgRoeUfOMzpj3g6FauLu8gfjgVZ5iuFu/27EXVzd0/Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYDus-001mcX-Mu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 May 2020 19:16:44 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E57F720736;
 Mon, 11 May 2020 19:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589224597;
 bh=2izxiaGUPO1H4O0NjBC09EHeAyN3lBintH1KSBHdM7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IGot39VZ4JxU3bOq3SYiM+yhf0lCV0+Bj+ZcrTnwEAran6zZKi8fSNOwAfUiNgzpD
 4m5aUV/F2Y8CA2vHCzezmFNd6qy8RvOJsMzyq2lxrfo7xH60QSycSYKYdTsgRcnylR
 7Oh6MBOJr5GV79WfzTLrM8N3EoS7N8qr9dkbdL50=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 11 May 2020 12:13:57 -0700
Message-Id: <20200511191358.53096-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511191358.53096-1-ebiggers@kernel.org>
References: <20200511191358.53096-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jYDus-001mcX-Mu
Subject: [f2fs-dev] [PATCH 2/3] fscrypt: name all function parameters
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Name all the function parameters.  This makes it so that we don't have a
mix of both styles, so it won't be ambiguous what to use in new fscrypt
patches.  This also matches the checkpatch expectation.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/linux/fscrypt.h | 46 ++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index cb2c41f8dfdee7..210a05dd9ecd4a 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -56,10 +56,11 @@ struct fscrypt_name {
 struct fscrypt_operations {
 	unsigned int flags;
 	const char *key_prefix;
-	int (*get_context)(struct inode *, void *, size_t);
-	int (*set_context)(struct inode *, const void *, size_t, void *);
-	bool (*dummy_context)(struct inode *);
-	bool (*empty_dir)(struct inode *);
+	int (*get_context)(struct inode *inode, void *ctx, size_t len);
+	int (*set_context)(struct inode *inode, const void *ctx, size_t len,
+			   void *fs_data);
+	bool (*dummy_context)(struct inode *inode);
+	bool (*empty_dir)(struct inode *inode);
 	unsigned int max_namelen;
 	bool (*has_stable_inodes)(struct super_block *sb);
 	void (*get_ino_and_lblk_bits)(struct super_block *sb,
@@ -137,13 +138,15 @@ static inline struct page *fscrypt_pagecache_page(struct page *bounce_page)
 extern void fscrypt_free_bounce_page(struct page *bounce_page);
 
 /* policy.c */
-extern int fscrypt_ioctl_set_policy(struct file *, const void __user *);
-extern int fscrypt_ioctl_get_policy(struct file *, void __user *);
-extern int fscrypt_ioctl_get_policy_ex(struct file *, void __user *);
+extern int fscrypt_ioctl_set_policy(struct file *filp, const void __user *arg);
+extern int fscrypt_ioctl_get_policy(struct file *filp, void __user *arg);
+extern int fscrypt_ioctl_get_policy_ex(struct file *filp, void __user *arg);
 extern int fscrypt_ioctl_get_nonce(struct file *filp, void __user *arg);
-extern int fscrypt_has_permitted_context(struct inode *, struct inode *);
-extern int fscrypt_inherit_context(struct inode *, struct inode *,
-					void *, bool);
+extern int fscrypt_has_permitted_context(struct inode *parent,
+					 struct inode *child);
+extern int fscrypt_inherit_context(struct inode *parent, struct inode *child,
+				   void *fs_data, bool preload);
+
 /* keyring.c */
 extern void fscrypt_sb_free(struct super_block *sb);
 extern int fscrypt_ioctl_add_key(struct file *filp, void __user *arg);
@@ -153,23 +156,24 @@ extern int fscrypt_ioctl_remove_key_all_users(struct file *filp,
 extern int fscrypt_ioctl_get_key_status(struct file *filp, void __user *arg);
 
 /* keysetup.c */
-extern int fscrypt_get_encryption_info(struct inode *);
-extern void fscrypt_put_encryption_info(struct inode *);
-extern void fscrypt_free_inode(struct inode *);
+extern int fscrypt_get_encryption_info(struct inode *inode);
+extern void fscrypt_put_encryption_info(struct inode *inode);
+extern void fscrypt_free_inode(struct inode *inode);
 extern int fscrypt_drop_inode(struct inode *inode);
 
 /* fname.c */
-extern int fscrypt_setup_filename(struct inode *, const struct qstr *,
-				int lookup, struct fscrypt_name *);
+extern int fscrypt_setup_filename(struct inode *inode, const struct qstr *iname,
+				  int lookup, struct fscrypt_name *fname);
 
 static inline void fscrypt_free_filename(struct fscrypt_name *fname)
 {
 	kfree(fname->crypto_buf.name);
 }
 
-extern int fscrypt_fname_alloc_buffer(const struct inode *, u32,
-				struct fscrypt_str *);
-extern void fscrypt_fname_free_buffer(struct fscrypt_str *);
+extern int fscrypt_fname_alloc_buffer(const struct inode *inode,
+				      u32 max_encrypted_len,
+				      struct fscrypt_str *crypto_str);
+extern void fscrypt_fname_free_buffer(struct fscrypt_str *crypto_str);
 extern int fscrypt_fname_disk_to_usr(const struct inode *inode,
 				     u32 hash, u32 minor_hash,
 				     const struct fscrypt_str *iname,
@@ -180,9 +184,9 @@ extern u64 fscrypt_fname_siphash(const struct inode *dir,
 				 const struct qstr *name);
 
 /* bio.c */
-extern void fscrypt_decrypt_bio(struct bio *);
-extern int fscrypt_zeroout_range(const struct inode *, pgoff_t, sector_t,
-				 unsigned int);
+extern void fscrypt_decrypt_bio(struct bio *bio);
+extern int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
+				 sector_t pblk, unsigned int len);
 
 /* hooks.c */
 extern int fscrypt_file_open(struct inode *inode, struct file *filp);
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4587515625F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 Feb 2020 02:36:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FwXx5e1UGRbMNNOsZBlZi2kQvTebBpzNSegtAGgyZGg=; b=ZxsX0W2cImNDDYGpu9XWklMA3
	PF4b7xob/rvNyWE+jNCzWoPkmxGnvo+qnmJiSUsXbCv4UV4REKc6a7vAJ8MYqD0OtTyR8moydbv9d
	6VviTXkN3kVOGfWUJe2OKnMdQ+7jgrwGzXKNN8OYR/xUT6/oJqazXArOTJX2k1rCzsrHU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j0F2g-0005Eh-2t; Sat, 08 Feb 2020 01:36:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3gRA-XgYKAJIzDAE092AA270.yA8@flex--drosen.bounces.google.com>)
 id 1j0F2d-0005Dk-Pa
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 Feb 2020 01:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lQld5kNve/mYGx33ywgb3C2T81loeCfqKmMUxoorgwo=; b=L0ILQ2ivc3a6lzNdRHLBGZETs
 vSfIZqc7HRpE6FJN90eUWw0EHMad1wEDQc8PbG9d7J/S3s6z/05NBJS9RNQI71nCsWgkxGnwzDoTv
 LSXjJo/878dr6QheZzc8ISdnwI4zrKXWpokXH6Hvp60MUwMn3mRJx1Gg88Vz07vfZ/uMA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lQld5kNve/mYGx33ywgb3C2T81loeCfqKmMUxoorgwo=; b=WeneB6EMNyQKkCqyzqrdAF/pTK
 TCJAxR6LPddJXkSRqI8BEzEFWctHF4u4QiAU0oED51tgcsHR4XWZZCEEi1gWN8kAwZ9fIvwe28A+5
 PaROs9dMZNr1iYrSg7yzR/LfD93dKgTm+EKWSLA757LFABLRMjZR5t8Cy3mj0tgCAX9k=;
Received: from mail-pj1-f73.google.com ([209.85.216.73])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j0F2U-003ajK-TM
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 Feb 2020 01:36:11 +0000
Received: by mail-pj1-f73.google.com with SMTP id d3so2356554pjl.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 07 Feb 2020 17:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=lQld5kNve/mYGx33ywgb3C2T81loeCfqKmMUxoorgwo=;
 b=tHAHsO84KZodW1A5q0UcxWbVd34YpN8bKrI45/UzTyYqtOtMHxtv9z1eu2YWmF3rp8
 pto73M5v2Zi1uc8Gh+/xbMcBwhSTjTm8IvlR413WLCCivWmR4vzwovxq+mf62QH7nkDU
 L+sBiYtHaxliorz2p0bcAhGmb+0qSNw2i+sSoyisJuR7x4NDMDUxs2lKvSsnNDXOv2OB
 pvlmy1N5G5zntq59sgU//zZcJbkE56oM4NZDlKr/fkGPPx2IH6izyOp1oeN1wgvzST28
 GFooSK5uattgEpIcNWFN1UdaaBMabjTSJ18At+opMzvVwQ2y0sxHoesTw8521mkBX/MJ
 MF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=lQld5kNve/mYGx33ywgb3C2T81loeCfqKmMUxoorgwo=;
 b=EmxWEkffujGhH1jpFy0N8kBftMlEUVhsjBqgbat9806LgOBSwECC3TbGqjZLsYE5WV
 DJUdIiYw49J0XVM02IF2iwF3bDXY4LAojhwxc8Jmk+h1aKlUeoZrLaOuhEc2yvmNk9Xn
 OIvJWWG2m2bE/fDby68UuLttCsndMxRP6CGFQ2Zupt6CUOH/TCMUGHkI1YQaes1OnAk9
 AizdaO1s5IIM3RvGDNK0Pin33DJUNXzZIPK8a2T1K3yOr1RDFbCdHyvxUjxR28g5mEmC
 Lu4Mg/XGk1Qe1G930vzMIvcjPt1i8m6iHBEdk33UqKxUN/xP/m+xzV0KvJROVidIpOJH
 WdXQ==
X-Gm-Message-State: APjAAAWRVogABulBfnYu6yR5UbVQJmSekcvS1JRMCLV4KgnBnjvRfAoP
 3ARXygKP0ci/OhqCtlPev/yLFpxj9Q4=
X-Google-Smtp-Source: APXvYqxnNQ327ovtQHLo13uDQ5tgGKOObkOGRtYqXrH4MruUSC0Npomkwh/Lx38xaSz0tJRsjDFKBHOo3Nk=
X-Received: by 2002:a63:e30e:: with SMTP id f14mr2179384pgh.260.1581125761051; 
 Fri, 07 Feb 2020 17:36:01 -0800 (PST)
Date: Fri,  7 Feb 2020 17:35:46 -0800
In-Reply-To: <20200208013552.241832-1-drosen@google.com>
Message-Id: <20200208013552.241832-3-drosen@google.com>
Mime-Version: 1.0
References: <20200208013552.241832-1-drosen@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.73 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.73 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j0F2U-003ajK-TM
Subject: [f2fs-dev] [PATCH v7 2/8] fs: Add standard casefolding support
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This adds general supporting functions for filesystems that use
utf8 casefolding. It provides standard dentry_operations and adds the
necessary structures in struct super_block to allow this standardization.

Ext4 and F2fs are switch to these implementations.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/libfs.c         | 77 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h | 22 +++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index c686bd9caac67..433c283df3099 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -20,6 +20,9 @@
 #include <linux/fs_context.h>
 #include <linux/pseudo_fs.h>
 #include <linux/fsnotify.h>
+#include <linux/unicode.h>
+#include <linux/fscrypt.h>
+#include <linux/stringhash.h>
 
 #include <linux/uaccess.h>
 
@@ -1361,3 +1364,77 @@ bool is_empty_dir_inode(struct inode *inode)
 	return (inode->i_fop == &empty_dir_operations) &&
 		(inode->i_op == &empty_dir_inode_operations);
 }
+
+#ifdef CONFIG_UNICODE
+bool needs_casefold(const struct inode *dir)
+{
+	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding &&
+			(!IS_ENCRYPTED(dir) || fscrypt_has_encryption_key(dir));
+}
+EXPORT_SYMBOL(needs_casefold);
+
+int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
+			  const char *str, const struct qstr *name)
+{
+	const struct dentry *parent = READ_ONCE(dentry->d_parent);
+	const struct inode *inode = READ_ONCE(parent->d_inode);
+	const struct super_block *sb = dentry->d_sb;
+	const struct unicode_map *um = sb->s_encoding;
+	struct qstr entry = QSTR_INIT(str, len);
+	int ret;
+
+	if (!inode || !needs_casefold(inode))
+		goto fallback;
+
+	ret = utf8_strncasecmp(um, name, &entry);
+	if (ret >= 0)
+		return ret;
+
+	if (sb_has_enc_strict_mode(sb))
+		return -EINVAL;
+fallback:
+	if (len != name->len)
+		return 1;
+	return !!memcmp(str, name->name, len);
+}
+EXPORT_SYMBOL(generic_ci_d_compare);
+
+struct hash_ctx {
+	struct utf8_itr_context ctx;
+	unsigned long hash;
+};
+
+static int do_generic_ci_hash(struct utf8_itr_context *ctx, int byte, int pos)
+{
+	struct hash_ctx *hctx = container_of(ctx, struct hash_ctx, ctx);
+
+	hctx->hash = partial_name_hash((unsigned char)byte, hctx->hash);
+	return 0;
+}
+
+int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
+{
+	const struct inode *inode = READ_ONCE(dentry->d_inode);
+	struct super_block *sb = dentry->d_sb;
+	const struct unicode_map *um = sb->s_encoding;
+	int ret = 0;
+	struct hash_ctx hctx;
+
+	if (!inode || !needs_casefold(inode))
+		return 0;
+
+	hctx.hash = init_name_hash(dentry);
+	hctx.ctx.actor = do_generic_ci_hash;
+	ret = utf8_casefold_iter(um, str, &hctx.ctx);
+	if (ret < 0)
+		goto err;
+	str->hash = end_name_hash(hctx.hash);
+
+	return 0;
+err:
+	if (sb_has_enc_strict_mode(sb))
+		ret = -EINVAL;
+	return ret;
+}
+EXPORT_SYMBOL(generic_ci_d_hash);
+#endif
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 6eae91c0668f9..a260afbc06d22 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1382,6 +1382,12 @@ extern int send_sigurg(struct fown_struct *fown);
 #define SB_ACTIVE	(1<<30)
 #define SB_NOUSER	(1<<31)
 
+/* These flags relate to encoding and casefolding */
+#define SB_ENC_STRICT_MODE_FL	(1 << 0)
+
+#define sb_has_enc_strict_mode(sb) \
+	(sb->s_encoding_flags & SB_ENC_STRICT_MODE_FL)
+
 /*
  *	Umount options
  */
@@ -1449,6 +1455,10 @@ struct super_block {
 #endif
 #ifdef CONFIG_FS_VERITY
 	const struct fsverity_operations *s_vop;
+#endif
+#ifdef CONFIG_UNICODE
+	struct unicode_map *s_encoding;
+	__u16 s_encoding_flags;
 #endif
 	struct hlist_bl_head	s_roots;	/* alternate root dentries for NFS */
 	struct list_head	s_mounts;	/* list of mounts; _not_ for fs use */
@@ -3361,6 +3371,18 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
 
 extern int generic_check_addressable(unsigned, u64);
 
+#ifdef CONFIG_UNICODE
+extern int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
+extern int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
+				const char *str, const struct qstr *name);
+extern bool needs_casefold(const struct inode *dir);
+#else
+static inline bool needs_casefold(const struct inode *dir)
+{
+	return 0;
+}
+#endif
+
 #ifdef CONFIG_MIGRATION
 extern int buffer_migrate_page(struct address_space *,
 				struct page *, struct page *,
-- 
2.25.0.341.g760bfbb309-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

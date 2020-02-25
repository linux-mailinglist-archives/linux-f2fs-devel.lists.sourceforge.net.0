Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC27016BE6B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Feb 2020 11:17:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6XHc-0006y4-GR; Tue, 25 Feb 2020 10:17:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j6XHb-0006xx-Nq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 10:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wCSDN2G4CPRqRqwMcqRB8LDiwZXez2mMR3O76aWbFGw=; b=FJ1uy3gKoLVnfm0OekbuziVkju
 d3EGkEmnMcWzNU1aQiYMkUaUOWOMGhIns4UJih+nj5TzV5BVdUthri/ZyBNXWVMVyYbGi7vir+DLv
 sUp0qf7cJ0Dy/uLf7jZ57sXEYGkH9gAFHsE9VLQLb/2iKUSuJuHlir3GD9m8npjqdgMU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wCSDN2G4CPRqRqwMcqRB8LDiwZXez2mMR3O76aWbFGw=; b=S
 DTDWD8ml23aUKwVsEqOr5qRzIzb2C1ChaiZ+xZJV+P8RXj4GrnN/8lDBO6FOKs2dS0dyUTEh3LHzm
 6aqcUQpVPZrIdI/FpBbMak+DqH1xsScjp2jMU5QrCUr9uGj7KoLhRdipRMuQj0UKuvbnbHfNvOiQv
 /1eXD15g3XPdKxB8=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6XHX-009LOl-C6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 10:17:43 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 394B0841A307DA2C4BF4;
 Tue, 25 Feb 2020 18:17:26 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Tue, 25 Feb 2020 18:17:19 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 25 Feb 2020 18:17:10 +0800
Message-ID: <20200225101710.40123-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j6XHX-009LOl-C6
Subject: [f2fs-dev] [PATCH v2] f2fs: use kmem_cache pool during inline xattr
 lookups
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It's been observed that kzalloc() on lookup_all_xattrs() are called millions
of times on Android, quickly becoming the top abuser of slub memory allocator.

Use a dedicated kmem cache pool for xattr lookups to mitigate this.

Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- avoid compile warning in f2fs_destroy_xattr_caches().
 fs/f2fs/f2fs.h  |  3 +++
 fs/f2fs/super.c | 10 ++++++++-
 fs/f2fs/xattr.c | 54 ++++++++++++++++++++++++++++++++++++++++++++-----
 fs/f2fs/xattr.h |  4 ++++
 4 files changed, 65 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 12a197e89a3e..23b93a116c73 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1486,6 +1486,9 @@ struct f2fs_sb_info {
 	__u32 s_chksum_seed;
 
 	struct workqueue_struct *post_read_wq;	/* post read workqueue */
+
+	struct kmem_cache *inline_xattr_slab;	/* inline xattr entry */
+	unsigned int inline_xattr_slab_size;	/* default inline xattr slab size */
 };
 
 struct f2fs_private_dio {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d241e07c0bfa..0b16204d3b7d 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1201,6 +1201,7 @@ static void f2fs_put_super(struct super_block *sb)
 	kvfree(sbi->raw_super);
 
 	destroy_device_list(sbi);
+	f2fs_destroy_xattr_caches(sbi);
 	mempool_destroy(sbi->write_io_dummy);
 #ifdef CONFIG_QUOTA
 	for (i = 0; i < MAXQUOTAS; i++)
@@ -3457,12 +3458,17 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		}
 	}
 
+	/* init per sbi slab cache */
+	err = f2fs_init_xattr_caches(sbi);
+	if (err)
+		goto free_io_dummy;
+
 	/* get an inode for meta space */
 	sbi->meta_inode = f2fs_iget(sb, F2FS_META_INO(sbi));
 	if (IS_ERR(sbi->meta_inode)) {
 		f2fs_err(sbi, "Failed to read F2FS meta data inode");
 		err = PTR_ERR(sbi->meta_inode);
-		goto free_io_dummy;
+		goto free_xattr_cache;
 	}
 
 	err = f2fs_get_valid_checkpoint(sbi);
@@ -3735,6 +3741,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	make_bad_inode(sbi->meta_inode);
 	iput(sbi->meta_inode);
 	sbi->meta_inode = NULL;
+free_xattr_cache:
+	f2fs_destroy_xattr_caches(sbi);
 free_io_dummy:
 	mempool_destroy(sbi->write_io_dummy);
 free_percpu:
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index a3360a97e624..e46a10eb0e42 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -23,6 +23,25 @@
 #include "xattr.h"
 #include "segment.h"
 
+static void *xattr_alloc(struct f2fs_sb_info *sbi, int size, bool *is_inline)
+{
+	*is_inline = (size == sbi->inline_xattr_slab_size);
+
+	if (*is_inline)
+		return kmem_cache_zalloc(sbi->inline_xattr_slab, GFP_NOFS);
+
+	return f2fs_kzalloc(sbi, size, GFP_NOFS);
+}
+
+static void xattr_free(struct f2fs_sb_info *sbi, void *xattr_addr,
+							bool is_inline)
+{
+	if (is_inline)
+		kmem_cache_free(sbi->inline_xattr_slab, xattr_addr);
+	else
+		kvfree(xattr_addr);
+}
+
 static int f2fs_xattr_generic_get(const struct xattr_handler *handler,
 		struct dentry *unused, struct inode *inode,
 		const char *name, void *buffer, size_t size)
@@ -301,7 +320,8 @@ static int read_xattr_block(struct inode *inode, void *txattr_addr)
 static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
 				unsigned int index, unsigned int len,
 				const char *name, struct f2fs_xattr_entry **xe,
-				void **base_addr, int *base_size)
+				void **base_addr, int *base_size,
+				bool *is_inline)
 {
 	void *cur_addr, *txattr_addr, *last_txattr_addr;
 	void *last_addr = NULL;
@@ -313,7 +333,7 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
 		return -ENODATA;
 
 	*base_size = XATTR_SIZE(inode) + XATTR_PADDING_SIZE;
-	txattr_addr = f2fs_kzalloc(F2FS_I_SB(inode), *base_size, GFP_NOFS);
+	txattr_addr = xattr_alloc(F2FS_I_SB(inode), *base_size, is_inline);
 	if (!txattr_addr)
 		return -ENOMEM;
 
@@ -362,7 +382,7 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
 	*base_addr = txattr_addr;
 	return 0;
 out:
-	kvfree(txattr_addr);
+	xattr_free(F2FS_I_SB(inode), txattr_addr, *is_inline);
 	return err;
 }
 
@@ -499,6 +519,7 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
 	unsigned int size, len;
 	void *base_addr = NULL;
 	int base_size;
+	bool is_inline;
 
 	if (name == NULL)
 		return -EINVAL;
@@ -509,7 +530,7 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
 
 	down_read(&F2FS_I(inode)->i_xattr_sem);
 	error = lookup_all_xattrs(inode, ipage, index, len, name,
-				&entry, &base_addr, &base_size);
+				&entry, &base_addr, &base_size, &is_inline);
 	up_read(&F2FS_I(inode)->i_xattr_sem);
 	if (error)
 		return error;
@@ -532,7 +553,7 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
 	}
 	error = size;
 out:
-	kvfree(base_addr);
+	xattr_free(F2FS_I_SB(inode), base_addr, is_inline);
 	return error;
 }
 
@@ -767,3 +788,26 @@ int f2fs_setxattr(struct inode *inode, int index, const char *name,
 	f2fs_update_time(sbi, REQ_TIME);
 	return err;
 }
+
+int f2fs_init_xattr_caches(struct f2fs_sb_info *sbi)
+{
+	dev_t dev = sbi->sb->s_bdev->bd_dev;
+	char slab_name[32];
+
+	sprintf(slab_name, "f2fs_xattr_entry-%u:%u", MAJOR(dev), MINOR(dev));
+
+	sbi->inline_xattr_slab_size = F2FS_OPTION(sbi).inline_xattr_size *
+					sizeof(__le32) + XATTR_PADDING_SIZE;
+
+	sbi->inline_xattr_slab = f2fs_kmem_cache_create(slab_name,
+					sbi->inline_xattr_slab_size);
+	if (!sbi->inline_xattr_slab)
+		return -ENOMEM;
+
+	return 0;
+}
+
+void f2fs_destroy_xattr_caches(struct f2fs_sb_info *sbi)
+{
+	kmem_cache_destroy(sbi->inline_xattr_slab);
+}
diff --git a/fs/f2fs/xattr.h b/fs/f2fs/xattr.h
index 574beea46494..0153b4c9ef21 100644
--- a/fs/f2fs/xattr.h
+++ b/fs/f2fs/xattr.h
@@ -131,6 +131,8 @@ extern int f2fs_setxattr(struct inode *, int, const char *,
 extern int f2fs_getxattr(struct inode *, int, const char *, void *,
 						size_t, struct page *);
 extern ssize_t f2fs_listxattr(struct dentry *, char *, size_t);
+extern int f2fs_init_xattr_caches(struct f2fs_sb_info *);
+extern void f2fs_destroy_xattr_caches(struct f2fs_sb_info *);
 #else
 
 #define f2fs_xattr_handlers	NULL
@@ -151,6 +153,8 @@ static inline ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer,
 {
 	return -EOPNOTSUPP;
 }
+static int f2fs_init_xattr_caches(struct f2fs_sb_info *sbi) { return 0; }
+static void f2fs_destroy_xattr_caches(struct f2fs_sb_info *sbi) { }
 #endif
 
 #ifdef CONFIG_F2FS_FS_SECURITY
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

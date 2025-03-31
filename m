Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ABEA76EC6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWX-0006EG-J1;
	Mon, 31 Mar 2025 20:14:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVv-0005oO-HU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yGY/u+lvRpWuScvEez9iiYbturNoRoBWWWJMMGynQDo=; b=dGGiN2rBuJifw8UezIireV3Dqd
 mVLPP5/FY9aKmXJV2wWKOQy++zDjwLDzyaPZWKwM7WW0xm0qEosV/FpXaikpkGYd7dV7nOVLG9bdT
 JqKFMtLX+3TEZ9Dw9yPNUdJpe11Qra4plT6642FPLiSTZ5pQaKgx7f3Zgq/JftCXpUeY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yGY/u+lvRpWuScvEez9iiYbturNoRoBWWWJMMGynQDo=; b=f1LrF1QbN0Yzclz3cG52mjWMzC
 Cy4KfuTS0WBrEe7upGf2WhJJnzyY+8f9oLtjG/cdzsq1r4bp+tyS/bnI+z8/wlHivWhkoI6Hc2bjz
 IK/UQ4yo38Q7QuE7oAd3KpLw3Kmj3AaCYxayBh1IggWKm+bBRzbsNcwKuGI/8pzr2md8=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVk-0003fq-71 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=yGY/u+lvRpWuScvEez9iiYbturNoRoBWWWJMMGynQDo=; b=Zn5hbKjqSC0T+oxF7cWsGX4iWg
 p9PPUwi49OKXkHwh0GRO+5BnfBhA8Ov9y7dqMALlaK6zcxJLCKwdeINZduqWGPCOITzyTfrgcjYFU
 5U/tcN1fD0uiH28K4b3CRgLKDNVNyUzWmNJqEUaf59qw+/LI+AS/ExOz+Xm+GWDDBKusNSUkY0YEi
 P1T1q5zPe/jl6XrYH2S6+5A1U2iEkqXpORJZVdtFFJU3SJqtmjQzVN5qbMYmKoq0twSfL0ewg7vIb
 GL5IrdoxD0gNmVZOVs5rBfP+mSd0kYKKSMrepSjnYqz+0jzpatSm9kG29buIew6Rw6jnywEpg3gs7
 1xhMKqqQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVY-00000004SPn-3TY1;
 Mon, 31 Mar 2025 20:13:20 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:15 +0100
Message-ID: <20250331201256.1057782-116-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The one caller of __f2fs_get_acl() which passes a non-NULL
 page already has a folio, so pass it in, then into f2fs_getxattr(), which
 lets us pass it to lookup_all_xattrs(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/acl.c | 8 ++++---- fs/f2fs/xattr.c | 12
 ++++++------ fs/f2fs/xattr.h | 4 ++-- 3 files changed, 12 insertions(+),
 12 deletions(- [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVk-0003fq-71
Subject: [f2fs-dev] [PATCH 115/153] f2fs: Pass a folio to f2fs_getxattr()
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The one caller of __f2fs_get_acl() which passes a non-NULL page already
has a folio, so pass it in, then into f2fs_getxattr(), which lets us
pass it to lookup_all_xattrs().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/acl.c   |  8 ++++----
 fs/f2fs/xattr.c | 12 ++++++------
 fs/f2fs/xattr.h |  4 ++--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
index 0a4d160235e0..d4d7f329d23f 100644
--- a/fs/f2fs/acl.c
+++ b/fs/f2fs/acl.c
@@ -166,7 +166,7 @@ static void *f2fs_acl_to_disk(struct f2fs_sb_info *sbi,
 }
 
 static struct posix_acl *__f2fs_get_acl(struct inode *inode, int type,
-						struct page *dpage)
+						struct folio *dfolio)
 {
 	int name_index = F2FS_XATTR_INDEX_POSIX_ACL_DEFAULT;
 	void *value = NULL;
@@ -176,13 +176,13 @@ static struct posix_acl *__f2fs_get_acl(struct inode *inode, int type,
 	if (type == ACL_TYPE_ACCESS)
 		name_index = F2FS_XATTR_INDEX_POSIX_ACL_ACCESS;
 
-	retval = f2fs_getxattr(inode, name_index, "", NULL, 0, dpage);
+	retval = f2fs_getxattr(inode, name_index, "", NULL, 0, dfolio);
 	if (retval > 0) {
 		value = f2fs_kmalloc(F2FS_I_SB(inode), retval, GFP_F2FS_ZERO);
 		if (!value)
 			return ERR_PTR(-ENOMEM);
 		retval = f2fs_getxattr(inode, name_index, "", value,
-							retval, dpage);
+							retval, dfolio);
 	}
 
 	if (retval > 0)
@@ -371,7 +371,7 @@ static int f2fs_acl_create(struct inode *dir, umode_t *mode,
 	if (S_ISLNK(*mode) || !IS_POSIXACL(dir))
 		return 0;
 
-	p = __f2fs_get_acl(dir, ACL_TYPE_DEFAULT, &dfolio->page);
+	p = __f2fs_get_acl(dir, ACL_TYPE_DEFAULT, dfolio);
 	if (!p || p == ERR_PTR(-EOPNOTSUPP)) {
 		*mode &= ~current_umask();
 		return 0;
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 28b32728a113..ff49bcba96f3 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -314,7 +314,7 @@ static int read_xattr_block(struct inode *inode, void *txattr_addr)
 	return 0;
 }
 
-static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
+static int lookup_all_xattrs(struct inode *inode, struct folio *ifolio,
 				unsigned int index, unsigned int len,
 				const char *name, struct f2fs_xattr_entry **xe,
 				void **base_addr, int *base_size,
@@ -338,7 +338,7 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
 
 	/* read from inline xattr */
 	if (inline_size) {
-		err = read_inline_xattr(inode, ipage, txattr_addr);
+		err = read_inline_xattr(inode, &ifolio->page, txattr_addr);
 		if (err)
 			goto out;
 
@@ -512,7 +512,7 @@ static inline int write_all_xattrs(struct inode *inode, __u32 hsize,
 }
 
 int f2fs_getxattr(struct inode *inode, int index, const char *name,
-		void *buffer, size_t buffer_size, struct page *ipage)
+		void *buffer, size_t buffer_size, struct folio *ifolio)
 {
 	struct f2fs_xattr_entry *entry = NULL;
 	int error;
@@ -528,11 +528,11 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
 	if (len > F2FS_NAME_LEN)
 		return -ERANGE;
 
-	if (!ipage)
+	if (!ifolio)
 		f2fs_down_read(&F2FS_I(inode)->i_xattr_sem);
-	error = lookup_all_xattrs(inode, ipage, index, len, name,
+	error = lookup_all_xattrs(inode, ifolio, index, len, name,
 				&entry, &base_addr, &base_size, &is_inline);
-	if (!ipage)
+	if (!ifolio)
 		f2fs_up_read(&F2FS_I(inode)->i_xattr_sem);
 	if (error)
 		return error;
diff --git a/fs/f2fs/xattr.h b/fs/f2fs/xattr.h
index e0f7b865c116..4fc0b2305fbd 100644
--- a/fs/f2fs/xattr.h
+++ b/fs/f2fs/xattr.h
@@ -130,7 +130,7 @@ extern const struct xattr_handler * const f2fs_xattr_handlers[];
 int f2fs_setxattr(struct inode *, int, const char *, const void *,
 		size_t, struct folio *, int);
 int f2fs_getxattr(struct inode *, int, const char *, void *,
-		size_t, struct page *);
+		size_t, struct folio *);
 ssize_t f2fs_listxattr(struct dentry *, char *, size_t);
 int f2fs_init_xattr_caches(struct f2fs_sb_info *);
 void f2fs_destroy_xattr_caches(struct f2fs_sb_info *);
@@ -146,7 +146,7 @@ static inline int f2fs_setxattr(struct inode *inode, int index,
 }
 static inline int f2fs_getxattr(struct inode *inode, int index,
 			const char *name, void *buffer,
-			size_t buffer_size, struct page *dpage)
+			size_t buffer_size, struct folio *dfolio)
 {
 	return -EOPNOTSUPP;
 }
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

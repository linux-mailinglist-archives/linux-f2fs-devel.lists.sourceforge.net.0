Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FEEA76E9D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWC-000633-4X;
	Mon, 31 Mar 2025 20:13:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVq-0005jq-2G
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oUVZyJA8DBletosZlFJmzLFyTCGy/CJwPZJaii47xKg=; b=PQGTgc2gWVrGkjHDOWm8a3mqtv
 PncLljSvXbGIwie1PPCr6HMjKy60ziFhPE+Gyj8TcJdXfJmbjKVN93VdfkFvkqpYSSP0/HkJAsMKy
 GepZqH3oC3MfOf7J6ELOQD3PJz+wSAUdLoQv6G/k9BhwaP8/oDzKnxiLdixLyE6/nIhE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oUVZyJA8DBletosZlFJmzLFyTCGy/CJwPZJaii47xKg=; b=gupbhBvNX8wXrYBknBWAoiw5XG
 cUn/ZPW0MlW7Gc0n8VawENHt263VmrZ+NZMHtFIt5Nyy6NOsJHJRZ+ORtIEs7J0nYXC4Xc9XrEdtn
 KM2DiYiDeOx8AmqLoGL4mV2QihD/+fonorYiWwNaZy5OlGZOK8AnpMM9f5M8I8LaqkBo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVe-0003d0-3Y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=oUVZyJA8DBletosZlFJmzLFyTCGy/CJwPZJaii47xKg=; b=fPenic8s1iobXBAI0J1iwPbDpc
 9w9YEkRdz9fF434uTT7K3URL1kmG95LgVdGx9S71/DY/GZ34CUG6oG/3E+ChVQ6jpia1wiJ3/5W7d
 FX5oE2Qh1Y07lz87jjiwNYuDliJXVog2DNqGRaqUsl75ygXrGjPowdhEgaZczlHMigN11tUSFdgdX
 xfbF+KiMJGpFwfH5ZATIFaikDkHDckSqhfQXYvlRIKm+KB/kley3aNFOYKm1dmLo7d9IrLh8N7xUo
 aEvp3aqpfczns5OOFjpWugyabgi+ZOuwdsxeFAUG0l6gOkzP2NaT3m0tddXAb/nYsckTPRR72LLjK
 sVIrHsPA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVX-00000004SKW-398K;
 Mon, 31 Mar 2025 20:13:19 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:09 +0100
Message-ID: <20250331201256.1057782-110-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Also convert f2fs_initxattrs() to take a folio.
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/acl.c | 2 +-
 fs/f2fs/dir.c
 | 2 +- fs/f2fs/xattr.c | 16 ++++++++-------- fs/f2fs/xattr.h | 22 +++++++++++
 4 files cha [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVe-0003d0-3Y
Subject: [f2fs-dev] [PATCH 109/153] f2fs: Pass a folio to f2fs_setxattr()
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

Also convert f2fs_initxattrs() to take a folio.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/acl.c   |  2 +-
 fs/f2fs/dir.c   |  2 +-
 fs/f2fs/xattr.c | 16 ++++++++--------
 fs/f2fs/xattr.h | 22 +++++++++++-----------
 4 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
index 1ec6125cadc5..0a4d160235e0 100644
--- a/fs/f2fs/acl.c
+++ b/fs/f2fs/acl.c
@@ -264,7 +264,7 @@ static int __f2fs_set_acl(struct mnt_idmap *idmap,
 		}
 	}
 
-	error = f2fs_setxattr(inode, name_index, "", value, size, &ifolio->page, 0);
+	error = f2fs_setxattr(inode, name_index, "", value, size, ifolio, 0);
 
 	kfree(value);
 	if (!error)
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index bd404a5de4a1..4decec1800bf 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -542,7 +542,7 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 
 		err = f2fs_init_security(inode, dir,
 					 fname ? fname->usr_fname : NULL,
-					 &folio->page);
+					 folio);
 		if (err)
 			goto put_error;
 
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index dd632df8d944..10f4f82bdbde 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -136,7 +136,7 @@ static int f2fs_xattr_advise_set(const struct xattr_handler *handler,
 
 #ifdef CONFIG_F2FS_FS_SECURITY
 static int f2fs_initxattrs(struct inode *inode, const struct xattr *xattr_array,
-		void *page)
+		void *folio)
 {
 	const struct xattr *xattr;
 	int err = 0;
@@ -144,7 +144,7 @@ static int f2fs_initxattrs(struct inode *inode, const struct xattr *xattr_array,
 	for (xattr = xattr_array; xattr->name != NULL; xattr++) {
 		err = f2fs_setxattr(inode, F2FS_XATTR_INDEX_SECURITY,
 				xattr->name, xattr->value,
-				xattr->value_len, (struct page *)page, 0);
+				xattr->value_len, folio, 0);
 		if (err < 0)
 			break;
 	}
@@ -152,10 +152,10 @@ static int f2fs_initxattrs(struct inode *inode, const struct xattr *xattr_array,
 }
 
 int f2fs_init_security(struct inode *inode, struct inode *dir,
-				const struct qstr *qstr, struct page *ipage)
+				const struct qstr *qstr, struct folio *ifolio)
 {
 	return security_inode_init_security(inode, dir, qstr,
-				&f2fs_initxattrs, ipage);
+				f2fs_initxattrs, ifolio);
 }
 #endif
 
@@ -800,7 +800,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 
 int f2fs_setxattr(struct inode *inode, int index, const char *name,
 				const void *value, size_t size,
-				struct page *ipage, int flags)
+				struct folio *ifolio, int flags)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	int err;
@@ -815,14 +815,14 @@ int f2fs_setxattr(struct inode *inode, int index, const char *name,
 		return err;
 
 	/* this case is only from f2fs_init_inode_metadata */
-	if (ipage)
+	if (ifolio)
 		return __f2fs_setxattr(inode, index, name, value,
-						size, ipage, flags);
+						size, &ifolio->page, flags);
 	f2fs_balance_fs(sbi, true);
 
 	f2fs_lock_op(sbi);
 	f2fs_down_write(&F2FS_I(inode)->i_xattr_sem);
-	err = __f2fs_setxattr(inode, index, name, value, size, ipage, flags);
+	err = __f2fs_setxattr(inode, index, name, value, size, NULL, flags);
 	f2fs_up_write(&F2FS_I(inode)->i_xattr_sem);
 	f2fs_unlock_op(sbi);
 
diff --git a/fs/f2fs/xattr.h b/fs/f2fs/xattr.h
index a005ffdcf717..e0f7b865c116 100644
--- a/fs/f2fs/xattr.h
+++ b/fs/f2fs/xattr.h
@@ -127,20 +127,20 @@ extern const struct xattr_handler f2fs_xattr_security_handler;
 
 extern const struct xattr_handler * const f2fs_xattr_handlers[];
 
-extern int f2fs_setxattr(struct inode *, int, const char *,
-				const void *, size_t, struct page *, int);
-extern int f2fs_getxattr(struct inode *, int, const char *, void *,
-						size_t, struct page *);
-extern ssize_t f2fs_listxattr(struct dentry *, char *, size_t);
-extern int f2fs_init_xattr_caches(struct f2fs_sb_info *);
-extern void f2fs_destroy_xattr_caches(struct f2fs_sb_info *);
+int f2fs_setxattr(struct inode *, int, const char *, const void *,
+		size_t, struct folio *, int);
+int f2fs_getxattr(struct inode *, int, const char *, void *,
+		size_t, struct page *);
+ssize_t f2fs_listxattr(struct dentry *, char *, size_t);
+int f2fs_init_xattr_caches(struct f2fs_sb_info *);
+void f2fs_destroy_xattr_caches(struct f2fs_sb_info *);
 #else
 
 #define f2fs_xattr_handlers	NULL
 #define f2fs_listxattr		NULL
 static inline int f2fs_setxattr(struct inode *inode, int index,
 		const char *name, const void *value, size_t size,
-		struct page *page, int flags)
+		struct folio *folio, int flags)
 {
 	return -EOPNOTSUPP;
 }
@@ -155,11 +155,11 @@ static inline void f2fs_destroy_xattr_caches(struct f2fs_sb_info *sbi) { }
 #endif
 
 #ifdef CONFIG_F2FS_FS_SECURITY
-extern int f2fs_init_security(struct inode *, struct inode *,
-				const struct qstr *, struct page *);
+int f2fs_init_security(struct inode *, struct inode *,
+				const struct qstr *, struct folio *);
 #else
 static inline int f2fs_init_security(struct inode *inode, struct inode *dir,
-				const struct qstr *qstr, struct page *ipage)
+				const struct qstr *qstr, struct folio *ifolio)
 {
 	return 0;
 }
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

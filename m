Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E14C097E83
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Aug 2019 17:20:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0SPY-0006AR-Ul; Wed, 21 Aug 2019 15:20:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1i0SPY-0006AG-08
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 15:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AWEZm+GDarC95G+UtZScXrUBr2YcGvj6LjJgSLHxJ+8=; b=ZCGFjhGJb/fsd7SMo77eHVkjRK
 0KX8sXyAP8x8iGJt47RW+PUHCoB6mJtrQQhn622r0OtPUN2hai7N+hbrLmaWKcI933JbjXIQiaDjy
 VhDUg/plEywPozvvOmZT3JOHCmQH1EK74mpKwu94b8p/KeT8T/iB7AWZ+p9G7i9oTV+Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AWEZm+GDarC95G+UtZScXrUBr2YcGvj6LjJgSLHxJ+8=; b=DRgYWPm9sm+56rq/F10zL9iD1z
 6Gd86GxePEIAdhkjWSAa9x2KwxAkqrGnN75DTishNDWsqMiKcAC91uJ8yuSRRv9/+/9ET6iNCmStt
 e7qrx9RbJg8l0ST7WqQ+xuOQdCxdVgHmPaZK4KyobNFxwKP2Os2+rYQSe5snbTVy808s=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i0SPW-00AeEw-2y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 15:20:31 +0000
Received: from localhost.localdomain (unknown [180.111.132.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 511DF22DD3;
 Wed, 21 Aug 2019 15:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566400824;
 bh=9/75u3Tvm7n34viu09eAdOl3V9lhc9uG6Rxa1n05bT0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bycgHQ+ZC/zGBc1mzQ6vqFT1gg42d40dW6R5OO/PHwzq1wPRurESaiqjSLy1zvAFB
 5LZQhnI0dhW0/jdEEGrAC8DO+1STTTsfnpiiS7s23Iq8R6AAhWfohFbkBihJ0F52IR
 XBrNLazBumveD69/bckbYeX6DDwFqL40+rzhonM0=
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 21 Aug 2019 23:13:35 +0800
Message-Id: <20190821151335.21312-2-chao@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821151335.21312-1-chao@kernel.org>
References: <20190821151335.21312-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: entry.name]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i0SPW-00AeEw-2y
Subject: [f2fs-dev] [PATCH 2/2] f2fs: optimize case-insensitive lookups
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

From: Chao Yu <yuchao0@huawei.com>

This patch ports below casefold enhancement patch from ext4 to f2fs

commit 3ae72562ad91 ("ext4: optimize case-insensitive lookups")

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/dir.c  | 57 ++++++++++++++++++++++++++++++++++++++++++++------
 fs/f2fs/f2fs.h |  3 ++-
 2 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index e34c17106084..7498b789518a 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -112,13 +112,17 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
  * doesn't match or less than zero on error.
  */
 int f2fs_ci_compare(const struct inode *parent, const struct qstr *name,
-		    const struct qstr *entry)
+				const struct qstr *entry, bool quick)
 {
 	const struct f2fs_sb_info *sbi = F2FS_SB(parent->i_sb);
 	const struct unicode_map *um = sbi->s_encoding;
 	int ret;
 
-	ret = utf8_strncasecmp(um, name, entry);
+	if (quick)
+		ret = utf8_strncasecmp_folded(um, name, entry);
+	else
+		ret = utf8_strncasecmp(um, name, entry);
+
 	if (ret < 0) {
 		/* Handle invalid character sequence as either an error
 		 * or as an opaque byte sequence.
@@ -134,11 +138,36 @@ int f2fs_ci_compare(const struct inode *parent, const struct qstr *name,
 
 	return ret;
 }
+
+void f2fs_fname_setup_ci_filename(struct inode *dir,
+					const struct qstr *iname,
+					struct fscrypt_str *cf_name)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
+
+	if (!IS_CASEFOLDED(dir)) {
+		cf_name->name = NULL;
+		return;
+	}
+
+	cf_name->name = f2fs_kmalloc(sbi, F2FS_NAME_LEN, GFP_NOFS);
+	if (!cf_name->name)
+		return;
+
+	cf_name->len = utf8_casefold(sbi->s_encoding,
+					iname, cf_name->name,
+					F2FS_NAME_LEN);
+	if (cf_name->len <= 0) {
+		kvfree(cf_name->name);
+		cf_name->name = NULL;
+	}
+}
 #endif
 
 static inline bool f2fs_match_name(struct f2fs_dentry_ptr *d,
 					struct f2fs_dir_entry *de,
 					struct fscrypt_name *fname,
+					struct fscrypt_str *cf_str,
 					unsigned long bit_pos,
 					f2fs_hash_t namehash)
 {
@@ -155,8 +184,15 @@ static inline bool f2fs_match_name(struct f2fs_dentry_ptr *d,
 	entry.name = d->filename[bit_pos];
 	entry.len = de->name_len;
 
-	if (sbi->s_encoding && IS_CASEFOLDED(parent))
-		return !f2fs_ci_compare(parent, fname->usr_fname, &entry);
+	if (sbi->s_encoding && IS_CASEFOLDED(parent)) {
+		if (cf_str->name) {
+			struct qstr cf = {.name = cf_str->name,
+					  .len = cf_str->len};
+			return !f2fs_ci_compare(parent, &cf, &entry, true);
+		}
+		return !f2fs_ci_compare(parent, fname->usr_fname, &entry,
+					false);
+	}
 #endif
 	if (fscrypt_match_name(fname, d->filename[bit_pos],
 				le16_to_cpu(de->name_len)))
@@ -169,9 +205,14 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(struct fscrypt_name *fname,
 			struct f2fs_dentry_ptr *d)
 {
 	struct f2fs_dir_entry *de;
+	struct fscrypt_str cf_str = { .name = NULL, .len = 0 };
 	unsigned long bit_pos = 0;
 	int max_len = 0;
 
+#ifdef CONFIG_UNICODE
+	f2fs_fname_setup_ci_filename(d->inode, fname->usr_fname, &cf_str);
+#endif
+
 	if (max_slots)
 		*max_slots = 0;
 	while (bit_pos < d->max) {
@@ -188,7 +229,7 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(struct fscrypt_name *fname,
 			continue;
 		}
 
-		if (f2fs_match_name(d, de, fname, bit_pos, namehash))
+		if (f2fs_match_name(d, de, fname, &cf_str, bit_pos, namehash))
 			goto found;
 
 		if (max_slots && max_len > *max_slots)
@@ -202,6 +243,10 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(struct fscrypt_name *fname,
 found:
 	if (max_slots && max_len > *max_slots)
 		*max_slots = max_len;
+
+#ifdef CONFIG_UNICODE
+	kvfree(cf_str.name);
+#endif
 	return de;
 }
 
@@ -1025,7 +1070,7 @@ static int f2fs_d_compare(const struct dentry *dentry, unsigned int len,
 		return memcmp(str, name, len);
 	}
 
-	return f2fs_ci_compare(dentry->d_parent->d_inode, name, &qstr);
+	return f2fs_ci_compare(dentry->d_parent->d_inode, name, &qstr, false);
 }
 
 static int f2fs_d_hash(const struct dentry *dentry, struct qstr *str)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2d0cab0cd620..52174aae3299 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2951,7 +2951,8 @@ struct dentry *f2fs_get_parent(struct dentry *child);
 
 extern int f2fs_ci_compare(const struct inode *parent,
 			   const struct qstr *name,
-			   const struct qstr *entry);
+			   const struct qstr *entry,
+			   bool quick);
 
 /*
  * dir.c
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

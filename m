Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2381C842A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 May 2020 10:02:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWbUC-0004FL-PH; Thu, 07 May 2020 08:02:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jWbTz-0004Ei-Ug
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 08:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qxhsQODHUbrnycVRAVdts1Nxkk6JIbmSkvyrt0TYJuc=; b=lm88ZAEePdR7xdN5h1M0LGIz6a
 ERM0jp/VzCocYuGTiBPQD3iuQnGC4TQKshzKL5HTSl72g8qhmP4aoCC6cG8W9UHFYquAsjUDf26y/
 tQgM+MT/kmWkcY4XXk5jUXe21W0980arGWysJjVx67Jo+iGY48Sn2TuKNAZ1TnjnW2zk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qxhsQODHUbrnycVRAVdts1Nxkk6JIbmSkvyrt0TYJuc=; b=Poc1iZT4CL0QyijU/cf8bqhreE
 lguWrpJNSAHlRtQcEmwIBprYbr6IThuh6L0u2GBYPiWYKV2BkIdU5s+QM1wUAAeNzg5Xo/tzcvn8V
 unhtXxB3/z9gsmN3XfwZpIgf234VVcCehLW0V8ftwzX4yKI6SEa1gqtHAo3vIhlzED7w=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWbTv-00Duvf-GV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 08:02:15 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C73F820870;
 Thu,  7 May 2020 08:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588838525;
 bh=ztW4C2b6T2EFInxjRwHnDi0WLo+7XrsN3yd2t+lAdAY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QVN/U1fKwqbnkjNigCQV+W1CpB/UN45jcHJkfWHEjDvBsAMKDRgAYPL+kKki1MCTm
 CP3/KRZaA7FxagZAlIwjyTVrhskgP5W6quvOKrfxTqzRdhansIl6ZVxF25uqfqQuQD
 g07K453HTrcl/Kk+PydPJoz75sqsDjPo52vhmPWc=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  7 May 2020 00:59:03 -0700
Message-Id: <20200507075905.953777-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507075905.953777-1-ebiggers@kernel.org>
References: <20200507075905.953777-1-ebiggers@kernel.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWbTv-00Duvf-GV
Subject: [f2fs-dev] [PATCH 2/4] f2fs: split f2fs_d_compare() from
 f2fs_match_name()
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
Cc: linux-fscrypt@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Sharing f2fs_ci_compare() between comparing cached dentries
(f2fs_d_compare()) and comparing on-disk dentries (f2fs_match_name())
doesn't work as well as intended, as these actions fundamentally differ
in several ways (e.g. whether the task may sleep, whether the directory
is stable, whether the casefolded name was precomputed, whether the
dentry will need to be decrypted once we allow casefold+encrypt, etc.)

Just make f2fs_d_compare() implement what it needs directly, and rework
f2fs_ci_compare() to be specialized for f2fs_match_name().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/dir.c  | 70 +++++++++++++++++++++++++-------------------------
 fs/f2fs/f2fs.h |  5 ----
 2 files changed, 35 insertions(+), 40 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 44bfc464df7872..44eb12a00cd0ed 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -107,36 +107,28 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
 /*
  * Test whether a case-insensitive directory entry matches the filename
  * being searched for.
- *
- * Returns: 0 if the directory entry matches, more than 0 if it
- * doesn't match or less than zero on error.
  */
-int f2fs_ci_compare(const struct inode *parent, const struct qstr *name,
-				const struct qstr *entry, bool quick)
+static bool f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
+			       const struct qstr *entry, bool quick)
 {
-	const struct f2fs_sb_info *sbi = F2FS_SB(parent->i_sb);
+	const struct f2fs_sb_info *sbi = F2FS_SB(dir->i_sb);
 	const struct unicode_map *um = sbi->s_encoding;
-	int ret;
+	int res;
 
 	if (quick)
-		ret = utf8_strncasecmp_folded(um, name, entry);
+		res = utf8_strncasecmp_folded(um, name, entry);
 	else
-		ret = utf8_strncasecmp(um, name, entry);
-
-	if (ret < 0) {
-		/* Handle invalid character sequence as either an error
-		 * or as an opaque byte sequence.
+		res = utf8_strncasecmp(um, name, entry);
+	if (res < 0) {
+		/*
+		 * In strict mode, ignore invalid names.  In non-strict mode,
+		 * fall back to treating them as opaque byte sequences.
 		 */
-		if (f2fs_has_strict_mode(sbi))
-			return -EINVAL;
-
-		if (name->len != entry->len)
-			return 1;
-
-		return !!memcmp(name->name, entry->name, name->len);
+		if (f2fs_has_strict_mode(sbi) || name->len != entry->len)
+			return false;
+		return !memcmp(name->name, entry->name, name->len);
 	}
-
-	return ret;
+	return res == 0;
 }
 
 static void f2fs_fname_setup_ci_filename(struct inode *dir,
@@ -188,10 +180,10 @@ static inline bool f2fs_match_name(struct f2fs_dentry_ptr *d,
 		if (cf_str->name) {
 			struct qstr cf = {.name = cf_str->name,
 					  .len = cf_str->len};
-			return !f2fs_ci_compare(parent, &cf, &entry, true);
+			return f2fs_match_ci_name(parent, &cf, &entry, true);
 		}
-		return !f2fs_ci_compare(parent, fname->usr_fname, &entry,
-					false);
+		return f2fs_match_ci_name(parent, fname->usr_fname, &entry,
+					  false);
 	}
 #endif
 	if (fscrypt_match_name(fname, d->filename[bit_pos],
@@ -1080,17 +1072,25 @@ const struct file_operations f2fs_dir_operations = {
 static int f2fs_d_compare(const struct dentry *dentry, unsigned int len,
 			  const char *str, const struct qstr *name)
 {
-	struct qstr qstr = {.name = str, .len = len };
 	const struct dentry *parent = READ_ONCE(dentry->d_parent);
-	const struct inode *inode = READ_ONCE(parent->d_inode);
-
-	if (!inode || !IS_CASEFOLDED(inode)) {
-		if (len != name->len)
-			return -1;
-		return memcmp(str, name->name, len);
-	}
-
-	return f2fs_ci_compare(inode, name, &qstr, false);
+	const struct inode *dir = READ_ONCE(parent->d_inode);
+	const struct f2fs_sb_info *sbi = F2FS_SB(dentry->d_sb);
+	struct qstr entry = QSTR_INIT(str, len);
+	int res;
+
+	if (!dir || !IS_CASEFOLDED(dir))
+		goto fallback;
+
+	res = utf8_strncasecmp(sbi->s_encoding, name, &entry);
+	if (res >= 0)
+		return res;
+
+	if (f2fs_has_strict_mode(sbi))
+		return -EINVAL;
+fallback:
+	if (len != name->len)
+		return 1;
+	return !!memcmp(str, name->name, len);
 }
 
 static int f2fs_d_hash(const struct dentry *dentry, struct qstr *str)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5ef9711ccb4967..a953a622f260e3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3134,11 +3134,6 @@ int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
 							bool hot, bool set);
 struct dentry *f2fs_get_parent(struct dentry *child);
 
-extern int f2fs_ci_compare(const struct inode *parent,
-			   const struct qstr *name,
-			   const struct qstr *entry,
-			   bool quick);
-
 /*
  * dir.c
  */
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

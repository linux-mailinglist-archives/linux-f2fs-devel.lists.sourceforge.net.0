Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C88B5527365
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 May 2022 20:00:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npw46-0007kv-DT; Sat, 14 May 2022 18:00:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1npw44-0007kp-Vk
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 May 2022 18:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IcSxTO0tiPF4q4A7UQYDj3DwRLovMJcX7f+D+2KbtyI=; b=czJ0ktqPuAOQbyeJ8RPRqUZwy5
 j6frKIPn6idxY7xIEtfrL5jAjoDQC+xMZ5cradSHM3imPkXaWRoomusq5Fbf04K2MEuYjEJKGvwty
 OawUTVB/wHvdur2Ig//NwwpZ/kjUyWkEKLKPr7c71G8jVJh73TtzVAnfOk/jjPNT5zbo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IcSxTO0tiPF4q4A7UQYDj3DwRLovMJcX7f+D+2KbtyI=; b=e
 h4WvWNTDCO2mkXqTkf2GtG0Bk1WVPJGhhl/OKd7n+8FfzueGJ8rJk9sxFzgolbVrbghw5WT8Q0KT5
 1KzMZgX2QxH2hcpIIn6U9N4LzpZfl+UEXEBk1rGhPL/7wIttqaRX/o3nZdAXg0drj67zmCAvz70Z9
 gUUUWdqBQ3so3NmE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npw41-0000CG-1d
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 May 2022 18:00:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 53E90B80AF5;
 Sat, 14 May 2022 18:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5808C34113;
 Sat, 14 May 2022 18:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652551207;
 bh=zMdAqlOlcoMBi8vXNWHO9v1vLmu+3e67HT++NXP4bQg=;
 h=From:To:Cc:Subject:Date:From;
 b=S3BcptZ6vCGDAfEb9eDP2fDZk5pSeofFMRm48liqAKL3XjmIiQNenMfo7dtodJWop
 uf63GA9AYDLy+D7YbiPGshutyOA9HmFN4ycbLPSsp3hALCP0H8eElquPrrR2aZ5uMl
 R1KHIBhcPIG5Eepbz91W0cEjgmcuvLEO4HzwV1KVuB/pvTx+53pH+0WOnPAWhghg73
 Kkb7C77UkfJs1fPCje19epnLj92BVm4Eeut6LkgqCMX2g91LR+B7lROYifStApgEgn
 J6wdLwLkZZzVejQfn9FwjSl5CMDsQ+exsNYAlX9cSFPSDDIWednmogUfJL6X/uOaOg
 6z945m18zHMKw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 14 May 2022 10:59:29 -0700
Message-Id: <20220514175929.44439-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> Tryng to rename a
 directory that has all following properties fails with EINVAL and triggers
 the 'WARN_ON_ONCE(!fscrypt_has_encryption_key(dir))' in f2fs_match_ci_name():
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npw41-0000CG-1d
Subject: [f2fs-dev] [PATCH] f2fs: don't use casefolded comparison for "."
 and ".."
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
 Gabriel Krisman Bertazi <krisman@collabora.com>, stable@vger.kernel.org,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Tryng to rename a directory that has all following properties fails with
EINVAL and triggers the 'WARN_ON_ONCE(!fscrypt_has_encryption_key(dir))'
in f2fs_match_ci_name():

    - The directory is casefolded
    - The directory is encrypted
    - The directory's encryption key is not yet set up
    - The parent directory is *not* encrypted

The problem is incorrect handling of the lookup of ".." to get the
parent reference to update.  fscrypt_setup_filename() treats ".." (and
".") specially, as it's never encrypted.  It's passed through as-is, and
setting up the directory's key is not attempted.  As the name isn't a
no-key name, f2fs treats it as a "normal" name and attempts a casefolded
comparison.  That breaks the assumption of the WARN_ON_ONCE() in
f2fs_match_ci_name() which assumes that for encrypted directories,
casefolded comparisons only happen when the directory's key is set up.

We could just remove this WARN_ON_ONCE().  However, since casefolding is
always a no-op on "." and ".." anyway, let's instead just not casefold
these names.  This results in the standard bytewise comparison.

Fixes: 7ad08a58bf67 ("f2fs: Handle casefolding with Encryption")
Cc: <stable@vger.kernel.org> # v5.11+
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/dir.c  |  3 ++-
 fs/f2fs/f2fs.h | 10 +++++-----
 fs/f2fs/hash.c | 11 ++++++-----
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index a0e51937d92eb..d5bd7932fb642 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -82,7 +82,8 @@ int f2fs_init_casefolded_name(const struct inode *dir,
 #if IS_ENABLED(CONFIG_UNICODE)
 	struct super_block *sb = dir->i_sb;
 
-	if (IS_CASEFOLDED(dir)) {
+	if (IS_CASEFOLDED(dir) &&
+	    !is_dot_dotdot(fname->usr_fname->name, fname->usr_fname->len)) {
 		fname->cf_name.name = f2fs_kmem_cache_alloc(f2fs_cf_name_slab,
 					GFP_NOFS, false, F2FS_SB(sb));
 		if (!fname->cf_name.name)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 492af5b96de19..e9e32bc814dfe 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -508,11 +508,11 @@ struct f2fs_filename {
 #if IS_ENABLED(CONFIG_UNICODE)
 	/*
 	 * For casefolded directories: the casefolded name, but it's left NULL
-	 * if the original name is not valid Unicode, if the directory is both
-	 * casefolded and encrypted and its encryption key is unavailable, or if
-	 * the filesystem is doing an internal operation where usr_fname is also
-	 * NULL.  In all these cases we fall back to treating the name as an
-	 * opaque byte sequence.
+	 * if the original name is not valid Unicode, if the original name is
+	 * "." or "..", if the directory is both casefolded and encrypted and
+	 * its encryption key is unavailable, or if the filesystem is doing an
+	 * internal operation where usr_fname is also NULL.  In all these cases
+	 * we fall back to treating the name as an opaque byte sequence.
 	 */
 	struct fscrypt_str cf_name;
 #endif
diff --git a/fs/f2fs/hash.c b/fs/f2fs/hash.c
index 3cb1e7a24740f..049ce50cec9b0 100644
--- a/fs/f2fs/hash.c
+++ b/fs/f2fs/hash.c
@@ -91,7 +91,7 @@ static u32 TEA_hash_name(const u8 *p, size_t len)
 /*
  * Compute @fname->hash.  For all directories, @fname->disk_name must be set.
  * For casefolded directories, @fname->usr_fname must be set, and also
- * @fname->cf_name if the filename is valid Unicode.
+ * @fname->cf_name if the filename is valid Unicode and is not "." or "..".
  */
 void f2fs_hash_filename(const struct inode *dir, struct f2fs_filename *fname)
 {
@@ -110,10 +110,11 @@ void f2fs_hash_filename(const struct inode *dir, struct f2fs_filename *fname)
 		/*
 		 * If the casefolded name is provided, hash it instead of the
 		 * on-disk name.  If the casefolded name is *not* provided, that
-		 * should only be because the name wasn't valid Unicode, so fall
-		 * back to treating the name as an opaque byte sequence.  Note
-		 * that to handle encrypted directories, the fallback must use
-		 * usr_fname (plaintext) rather than disk_name (ciphertext).
+		 * should only be because the name wasn't valid Unicode or was
+		 * "." or "..", so fall back to treating the name as an opaque
+		 * byte sequence.  Note that to handle encrypted directories,
+		 * the fallback must use usr_fname (plaintext) rather than
+		 * disk_name (ciphertext).
 		 */
 		WARN_ON_ONCE(!fname->usr_fname->name);
 		if (fname->cf_name.name) {

base-commit: c0d31ec6397d963d85a190996b4b74654ef32e1d
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

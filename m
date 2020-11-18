Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D04772B7764
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Nov 2020 08:58:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfIMA-0003Sz-Ko; Wed, 18 Nov 2020 07:58:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kfIM8-0003SV-10
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 07:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LOf1123Lt0x6TV4YY2f8yoymBVQLJTHRU5GvHOu2iQk=; b=F3uePK6vjRTPZ3CQ6noBQCNbyL
 f1BWcWJRDwthKCC72Gpd7m2CBr7ANcBNsYE96LIyQjV8BqwYA2QQ6wJCOJ0Y7+gH2KETfVR+44C/e
 OfHczlVOS6q48PQ+kKZGDkjKNKpTxKoTbfoerVJWpdwSPUnu/byOvSoFeDGSTmNzo8lQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LOf1123Lt0x6TV4YY2f8yoymBVQLJTHRU5GvHOu2iQk=; b=ZE906pSUe0u7BFCG0801JJKIcq
 ViZKrdIY/aP8nsZ/2NDbIlxy9MrDn3d40SnlgyOYbBB19CzxzSnAkMHJbAwNF3wYr5PX7J8EujaVM
 BQ5vZZMTbql/uEZ+O6AVwWzhGYmU69rXiLxysjfVknxLv6zZQIN1cyTc0r4Ac+yTklhw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kfILs-002toe-Bd
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 07:58:19 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72022246B2;
 Wed, 18 Nov 2020 07:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605686261;
 bh=FaJPS+4AhsPK9Hjqvyuvxb/1dnxymbnVlmZfAPn5gcU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ETs/fepezweXiR3RVvD/V08ZO2J+3w+axT1045ZXG0ySoHoOPkv8KQGhsYkhLcqGs
 xVfQzJxdV+6XoMxfSSp/QZ/D0rjuhBJeN1gE+7S7o11NaQpjRy4O4ZLCXloc3aUcTV
 L4jkljPJYdapxPjojPTtKPw+RVYI5VVc0BNtD4bQ=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 17 Nov 2020 23:56:09 -0800
Message-Id: <20201118075609.120337-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118075609.120337-1-ebiggers@kernel.org>
References: <20201118075609.120337-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.5 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kfILs-002toe-Bd
Subject: [f2fs-dev] [PATCH 5/5] fscrypt: remove unnecessary calls to
 fscrypt_require_key()
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

In an encrypted directory, a regular dentry (one that doesn't have the
no-key name flag) can only be created if the directory's encryption key
is available.

Therefore the calls to fscrypt_require_key() in __fscrypt_prepare_link()
and __fscrypt_prepare_rename() are unnecessary, as these functions
already check that the dentries they're given aren't no-key names.

Remove these unnecessary calls to fscrypt_require_key().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/hooks.c       | 26 ++++++++------------------
 include/linux/fscrypt.h |  3 +--
 2 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 061418be4b08..c582e2ddb39c 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -54,15 +54,12 @@ EXPORT_SYMBOL_GPL(fscrypt_file_open);
 int __fscrypt_prepare_link(struct inode *inode, struct inode *dir,
 			   struct dentry *dentry)
 {
-	int err;
-
-	err = fscrypt_require_key(dir);
-	if (err)
-		return err;
-
-	/* ... in case we looked up no-key name before key was added */
 	if (fscrypt_is_nokey_name(dentry))
 		return -ENOKEY;
+	/*
+	 * We don't need to separately check that the directory inode's key is
+	 * available, as it's implied by the dentry not being a no-key name.
+	 */
 
 	if (!fscrypt_has_permitted_context(dir, inode))
 		return -EXDEV;
@@ -75,20 +72,13 @@ int __fscrypt_prepare_rename(struct inode *old_dir, struct dentry *old_dentry,
 			     struct inode *new_dir, struct dentry *new_dentry,
 			     unsigned int flags)
 {
-	int err;
-
-	err = fscrypt_require_key(old_dir);
-	if (err)
-		return err;
-
-	err = fscrypt_require_key(new_dir);
-	if (err)
-		return err;
-
-	/* ... in case we looked up no-key name(s) before key was added */
 	if (fscrypt_is_nokey_name(old_dentry) ||
 	    fscrypt_is_nokey_name(new_dentry))
 		return -ENOKEY;
+	/*
+	 * We don't need to separately check that the directory inodes' keys are
+	 * available, as it's implied by the dentries not being no-key names.
+	 */
 
 	if (old_dir != new_dir) {
 		if (IS_ENCRYPTED(new_dir) &&
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 8e1d31c959bf..0c9e64969b73 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -710,8 +710,7 @@ static inline int fscrypt_require_key(struct inode *inode)
  *
  * A new link can only be added to an encrypted directory if the directory's
  * encryption key is available --- since otherwise we'd have no way to encrypt
- * the filename.  Therefore, we first set up the directory's encryption key (if
- * not already done) and return an error if it's unavailable.
+ * the filename.
  *
  * We also verify that the link will not violate the constraint that all files
  * in an encrypted directory tree use the same encryption policy.
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

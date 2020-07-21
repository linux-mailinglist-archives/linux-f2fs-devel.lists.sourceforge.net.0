Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5346228C61
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jul 2020 01:01:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jy1G0-00081G-0f; Tue, 21 Jul 2020 23:01:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jy1Fy-00080v-Lu
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 23:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BY03pxjeJ4OoV+qeNV/4qRxhGAl99MM5BGOPaay3wug=; b=La4gjZ09Yytkrw6y4MjsWsB5mE
 VuHzW7Y30MnbJLYgCi3BjtopPdrIPpr+4tYJVgyuB8Ds/ahwYhwt9zBN7/r90MWMDR7bfGxoGM5sG
 BiGEN1pnbIRaTklSso9AzfVnNPQDcrhCW+Joe92UMmyiCtEBnUTaWfRtj6LOjPGMK3Qc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BY03pxjeJ4OoV+qeNV/4qRxhGAl99MM5BGOPaay3wug=; b=YtkIRa4X8BYYU7ENyAVCgrvjwi
 uC30q7sP6ehhOFY0uBV+iPmaQNhUj1lBVB0Py0TlbEJx8t7RC02YizRsq/k+5NDVW3uV0z/+f0HqL
 WNrmfCap01BxkV51VdfaVXFxx8ExQz/MkYSPULZ5Pp15ZuXt5xWMtJVWX88Nh36sGuFY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jy1Fx-00FjTL-Dv
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 23:01:06 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E00EE207DD;
 Tue, 21 Jul 2020 23:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595372460;
 bh=8CFq23ApT2mi7bzagu5otAQAJtf6QR9J0mMn4N8FXeY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SR6ircD6vFmclMJka0AoeoQ9p3CzMhFXM0C/JTPKEDNRmpvX+YWX2C6WaCXWupSs0
 887U4yLW+4Zwi3HLY0Smlz3Zc0Kmv4SmZz4fMM8qfuia9S23AKRjvGCGfVKjsAMXWK
 kaW5huWBgPPHacSfH1KGUwxg9hb9Wg0y3Bc0t6pE=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 21 Jul 2020 15:59:19 -0700
Message-Id: <20200721225920.114347-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200721225920.114347-1-ebiggers@kernel.org>
References: <20200721225920.114347-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jy1Fx-00FjTL-Dv
Subject: [f2fs-dev] [PATCH 4/5] fscrypt: use smp_load_acquire() for
 ->i_crypt_info
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
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Normally smp_store_release() or cmpxchg_release() is paired with
smp_load_acquire().  Sometimes smp_load_acquire() can be replaced with
the more lightweight READ_ONCE().  However, for this to be safe, all the
published memory must only be accessed in a way that involves the
pointer itself.  This may not be the case if allocating the object also
involves initializing a static or global variable, for example.

fscrypt_info includes various sub-objects which are internal to and are
allocated by other kernel subsystems such as keyrings and crypto.  So by
using READ_ONCE() for ->i_crypt_info, we're relying on internal
implementation details of these other kernel subsystems.

Remove this fragile assumption by using smp_load_acquire() instead.

(Note: I haven't seen any real-world problems here.  This change is just
fixing the code to be guaranteed correct and less fragile.)

Fixes: e37a784d8b6a ("fscrypt: use READ_ONCE() to access ->i_crypt_info")
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/keysetup.c    | 12 +++++++++++-
 fs/crypto/policy.c      |  4 ++--
 include/linux/fscrypt.h | 29 ++++++++++++++++++++++++-----
 3 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 7f85fc645602..fea6226afc2b 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -518,7 +518,17 @@ int fscrypt_get_encryption_info(struct inode *inode)
 	if (res)
 		goto out;
 
+	/*
+	 * Multiple tasks may race to set ->i_crypt_info, so use
+	 * cmpxchg_release().  This pairs with the smp_load_acquire() in
+	 * fscrypt_get_info().  I.e., here we publish ->i_crypt_info with a
+	 * RELEASE barrier so that other tasks can ACQUIRE it.
+	 */
 	if (cmpxchg_release(&inode->i_crypt_info, NULL, crypt_info) == NULL) {
+		/*
+		 * We won the race and set ->i_crypt_info to our crypt_info.
+		 * Now link it into the master key's inode list.
+		 */
 		if (master_key) {
 			struct fscrypt_master_key *mk =
 				master_key->payload.data[0];
@@ -589,7 +599,7 @@ EXPORT_SYMBOL(fscrypt_free_inode);
  */
 int fscrypt_drop_inode(struct inode *inode)
 {
-	const struct fscrypt_info *ci = READ_ONCE(inode->i_crypt_info);
+	const struct fscrypt_info *ci = fscrypt_get_info(inode);
 	const struct fscrypt_master_key *mk;
 
 	/*
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index 8a8ad0e44bb8..2a2d0c06147b 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -338,7 +338,7 @@ static int fscrypt_get_policy(struct inode *inode, union fscrypt_policy *policy)
 	union fscrypt_context ctx;
 	int ret;
 
-	ci = READ_ONCE(inode->i_crypt_info);
+	ci = fscrypt_get_info(inode);
 	if (ci) {
 		/* key available, use the cached policy */
 		*policy = ci->ci_policy;
@@ -627,7 +627,7 @@ int fscrypt_inherit_context(struct inode *parent, struct inode *child,
 	if (res < 0)
 		return res;
 
-	ci = READ_ONCE(parent->i_crypt_info);
+	ci = fscrypt_get_info(parent);
 	if (ci == NULL)
 		return -ENOKEY;
 
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index bb257411365f..991ff8575d0e 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -74,10 +74,15 @@ struct fscrypt_operations {
 			    struct request_queue **devs);
 };
 
-static inline bool fscrypt_has_encryption_key(const struct inode *inode)
+static inline struct fscrypt_info *fscrypt_get_info(const struct inode *inode)
 {
-	/* pairs with cmpxchg_release() in fscrypt_get_encryption_info() */
-	return READ_ONCE(inode->i_crypt_info) != NULL;
+	/*
+	 * Pairs with the cmpxchg_release() in fscrypt_get_encryption_info().
+	 * I.e., another task may publish ->i_crypt_info concurrently, executing
+	 * a RELEASE barrier.  We need to use smp_load_acquire() here to safely
+	 * ACQUIRE the memory the other task published.
+	 */
+	return smp_load_acquire(&inode->i_crypt_info);
 }
 
 /**
@@ -234,9 +239,9 @@ static inline void fscrypt_set_ops(struct super_block *sb,
 }
 #else  /* !CONFIG_FS_ENCRYPTION */
 
-static inline bool fscrypt_has_encryption_key(const struct inode *inode)
+static inline struct fscrypt_info *fscrypt_get_info(const struct inode *inode)
 {
-	return false;
+	return NULL;
 }
 
 static inline bool fscrypt_needs_contents_encryption(const struct inode *inode)
@@ -619,6 +624,20 @@ static inline bool fscrypt_inode_uses_fs_layer_crypto(const struct inode *inode)
 	       !__fscrypt_inode_uses_inline_crypto(inode);
 }
 
+/**
+ * fscrypt_has_encryption_key() - check whether an inode has had its key set up
+ * @inode: the inode to check
+ *
+ * Return: %true if the inode has had its encryption key set up, else %false.
+ *
+ * Usually this should be preceded by fscrypt_get_encryption_info() to try to
+ * set up the key first.
+ */
+static inline bool fscrypt_has_encryption_key(const struct inode *inode)
+{
+	return fscrypt_get_info(inode) != NULL;
+}
+
 /**
  * fscrypt_require_key() - require an inode's encryption key
  * @inode: the inode we need the key for
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E90527688F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Sep 2020 07:49:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLK7x-0007KA-Mg; Thu, 24 Sep 2020 05:49:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kLK7w-0007K3-PB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Sep 2020 05:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c7aW+8cZACN44YLRMWk1O6KQuOWu71Q6nAoJ2At+2/w=; b=ZY3aCRK7pkjT63SbNKNFY784bA
 k/Uo3S1ocnB93SMj2sDAALmfwz3rnrBTIOFzJyxVHsy0x3CGADsjlJ95SIvTsDADn9nLsPnTpnfG/
 2hL0MXLHCmns/U1EMA117QpKLAKkZfYWf9Dbsw2fEGCISqy0UZtpy4eGSJZ9P98YmTCE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c7aW+8cZACN44YLRMWk1O6KQuOWu71Q6nAoJ2At+2/w=; b=T
 yjsDYTGCnlNzKgi9mxEvtozHjOAVt53wl6qrgQA0O5pOIkmi8L8zLySO4n28b7eFUpap2EObv/DCB
 iv0UvBLFaGPjbFh88m2tG0v7sWXSLDCkFf79fm76b2ZXZnwxwR7kJBWE9Qk0/lXSPBM+p1PxId+CI
 1RktF2qHef5GnEpY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kLK7m-003Vgy-7i
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Sep 2020 05:49:08 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5527A235FD;
 Thu, 24 Sep 2020 05:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600926527;
 bh=ZBd12iiaWrJLLa5wlKz4XAdvI+v27GCLwdJDLWNHLIY=;
 h=From:To:Cc:Subject:Date:From;
 b=yxcfpsFWdaISRwAI+JVWSVcxnMGJEi4ShtKIgyoJgyvWOVArjZfAHg8LIHipiUC6V
 QMGF7qU5twNettIbNqxJCnUBLmarGE/ysxglhg3oHN61q/vyHwjZyzoCBNs0tdGBKd
 hdHf1ETiZYCxPPjHI7/27bpsdedx2WvOrXU8y9L0=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed, 23 Sep 2020 22:47:21 -0700
Message-Id: <20200924054721.187797-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kLK7m-003Vgy-7i
Subject: [f2fs-dev] [PATCH] fscrypt: export fscrypt_d_revalidate()
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
Cc: ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Dentries that represent no-key names must have a dentry_operations that
includes fscrypt_d_revalidate().  Currently, this is handled by
fscrypt_prepare_lookup() installing fscrypt_d_ops.

However, ceph support for encryption
(https://lore.kernel.org/r/20200914191707.380444-1-jlayton@kernel.org)
can't use fscrypt_d_ops, since ceph already has its own
dentry_operations.

Similarly, ext4 and f2fs support for directories that are both encrypted
and casefolded
(https://lore.kernel.org/r/20200923010151.69506-1-drosen@google.com)
can't use fscrypt_d_ops either, since casefolding requires some dentry
operations too.

To satisfy both users, we need to move the responsibility of installing
the dentry_operations to filesystems.

In preparation for this, export fscrypt_d_revalidate() and give it a
!CONFIG_FS_ENCRYPTION stub.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---

Compared to the versions of this patch from Jeff and Daniel, I've
improved the commit message and added a !CONFIG_FS_ENCRYPTION stub,
which was missing.  I'm planning to apply this for 5.10 in preparation
for both the ceph patchset and the encrypt+casefold patchset.


 fs/crypto/fname.c       | 3 ++-
 include/linux/fscrypt.h | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index c65979452844..1fbe6c24d705 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -530,7 +530,7 @@ EXPORT_SYMBOL_GPL(fscrypt_fname_siphash);
  * Validate dentries in encrypted directories to make sure we aren't potentially
  * caching stale dentries after a key has been added.
  */
-static int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
+int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
 {
 	struct dentry *dir;
 	int err;
@@ -569,6 +569,7 @@ static int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
 
 	return valid;
 }
+EXPORT_SYMBOL_GPL(fscrypt_d_revalidate);
 
 const struct dentry_operations fscrypt_d_ops = {
 	.d_revalidate = fscrypt_d_revalidate,
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index f1757e73162d..a8f7a43f031b 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -197,6 +197,7 @@ int fscrypt_fname_disk_to_usr(const struct inode *inode,
 bool fscrypt_match_name(const struct fscrypt_name *fname,
 			const u8 *de_name, u32 de_name_len);
 u64 fscrypt_fname_siphash(const struct inode *dir, const struct qstr *name);
+int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags);
 
 /* bio.c */
 void fscrypt_decrypt_bio(struct bio *bio);
@@ -454,6 +455,12 @@ static inline u64 fscrypt_fname_siphash(const struct inode *dir,
 	return 0;
 }
 
+static inline int fscrypt_d_revalidate(struct dentry *dentry,
+				       unsigned int flags)
+{
+	return 1;
+}
+
 /* bio.c */
 static inline void fscrypt_decrypt_bio(struct bio *bio)
 {
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

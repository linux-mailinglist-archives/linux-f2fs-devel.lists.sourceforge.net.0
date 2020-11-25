Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9386F2C3575
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Nov 2020 01:25:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khict-0008BT-VH; Wed, 25 Nov 2020 00:25:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1khicW-00087Q-Ke
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Nov 2020 00:25:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IzvZnvz5oJxDZIwk1zJpg72qZiJCv22uUcbJ6MkoaT8=; b=WKq8Wysc1/oZMzcHcM/AAvQrSf
 uPtg7B7y71LdWHUmK0ZNrUyi/ID6Og2HpAdOHV7LW6yGDf8gKmB3ToHvdghdKDtTZ3/ctp7WMO8CW
 g3JAie5oPm2/I1ckaSKqeWLzdHjtD7RyrSGCrci/89S8HWT56BNAC/QijOjeXrBlmkIM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IzvZnvz5oJxDZIwk1zJpg72qZiJCv22uUcbJ6MkoaT8=; b=W58f4+6pzRfNPHeFCE3YZOR3KE
 2z/44ktHFh5DBhun3QjKOmtXgvCzhW/4+QeT4Lpvbe+Le5LiVztOfOp5v72Y/9HHeRkty9VUoar6W
 lVd6nxrLoeel723m/3HB8mYbz/KqaKoIYjE/ifjDhehWXT8m1VGrPneK8SMHy6eawRwo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1khicP-00E1Rs-VM
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Nov 2020 00:25:16 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48A7121734;
 Wed, 25 Nov 2020 00:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606263887;
 bh=GcIDgPOioF2enf4UU7puDpYrUGLkFezb8sSeAZk5UsQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Or7jtegODYCPin3wnbGFqeaYo4hDY+OxiIiEAowN8CUBQ6bTDLf73iBgbHeyhFqjL
 NJcr+qxkJUxfy0EFiF5xdWTVIQE7rXw2wp0AnOyphxIZU1Z9HuAxERl6pSDZ4ZBlzu
 g5BYjw6/bP+k+SA7ND0XOIPbOngJ56i2VNYOop9w=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 24 Nov 2020 16:23:33 -0800
Message-Id: <20201125002336.274045-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125002336.274045-1-ebiggers@kernel.org>
References: <20201125002336.274045-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.4 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1khicP-00E1Rs-VM
Subject: [f2fs-dev] [PATCH 6/9] fscrypt: move body of
 fscrypt_prepare_setattr() out-of-line
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

In preparation for reducing the visibility of fscrypt_require_key() by
moving it to fscrypt_private.h, move the call to it from
fscrypt_prepare_setattr() to an out-of-line function.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/hooks.c       |  8 ++++++++
 include/linux/fscrypt.h | 11 +++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 82f351d3113a..1c16dba222d9 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -120,6 +120,14 @@ int __fscrypt_prepare_readdir(struct inode *dir)
 }
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_readdir);
 
+int __fscrypt_prepare_setattr(struct dentry *dentry, struct iattr *attr)
+{
+	if (attr->ia_valid & ATTR_SIZE)
+		return fscrypt_require_key(d_inode(dentry));
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
+
 /**
  * fscrypt_prepare_setflags() - prepare to change flags with FS_IOC_SETFLAGS
  * @inode: the inode on which flags are being changed
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 8cbb26f55695..b20900bb829f 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -243,6 +243,7 @@ int __fscrypt_prepare_rename(struct inode *old_dir, struct dentry *old_dentry,
 int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
 			     struct fscrypt_name *fname);
 int __fscrypt_prepare_readdir(struct inode *dir);
+int __fscrypt_prepare_setattr(struct dentry *dentry, struct iattr *attr);
 int fscrypt_prepare_setflags(struct inode *inode,
 			     unsigned int oldflags, unsigned int flags);
 int fscrypt_prepare_symlink(struct inode *dir, const char *target,
@@ -543,6 +544,12 @@ static inline int __fscrypt_prepare_readdir(struct inode *dir)
 	return -EOPNOTSUPP;
 }
 
+static inline int __fscrypt_prepare_setattr(struct dentry *dentry,
+					    struct iattr *attr)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int fscrypt_prepare_setflags(struct inode *inode,
 					   unsigned int oldflags,
 					   unsigned int flags)
@@ -840,8 +847,8 @@ static inline int fscrypt_prepare_readdir(struct inode *dir)
 static inline int fscrypt_prepare_setattr(struct dentry *dentry,
 					  struct iattr *attr)
 {
-	if (attr->ia_valid & ATTR_SIZE)
-		return fscrypt_require_key(d_inode(dentry));
+	if (IS_ENCRYPTED(d_inode(dentry)))
+		return __fscrypt_prepare_setattr(dentry, attr);
 	return 0;
 }
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 283D22CCC6E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 03:23:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkeH6-0007tg-Tk; Thu, 03 Dec 2020 02:23:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kkeH5-0007tL-Tp
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 02:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iBm79Vfm2YbF1EwXi4OCdx+aJMU9m5NdlLv54G3qcKU=; b=c8dE/nTmZ9uWKz+uqNRUmDTxnC
 dVD6ZZscWQBRjvFAuJf8R+ZpA+HXfSb350YxraB6MuIN98W05KNO+3a99NEmas9N4gXSDoqOvdM6S
 /0LUnIHlZSnMOrUo935UHyqJz2nDbFeRje5ETMCbnzRvZM9L24iYFsG7B5su+3AY+xFA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iBm79Vfm2YbF1EwXi4OCdx+aJMU9m5NdlLv54G3qcKU=; b=GaMpIuspIsGN9fJtBnHDtVcGtc
 2zgTe7MVLUFz5oSyRwj38NdjHIAo9VlbjNG45jWlEzSb1pg1HwHy05GG9dZu/9wPH+YIXfEaAheRE
 4zgW6ghshMOukqa/r2PWHdV4HW0UJ46cRj1FcT/3NAdGDIYkXn4YZMjiBM61m8uEJk68=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkeH2-00CSpp-1Y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 02:23:15 +0000
From: Eric Biggers <ebiggers@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-fscrypt@vger.kernel.org
Date: Wed,  2 Dec 2020 18:20:38 -0800
Message-Id: <20201203022041.230976-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203022041.230976-1-ebiggers@kernel.org>
References: <20201203022041.230976-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.5 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
X-Headers-End: 1kkeH2-00CSpp-1Y
Subject: [f2fs-dev] [PATCH v2 6/9] fscrypt: move body of
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
Cc: linux-fsdevel@vger.kernel.org, Andreas Dilger <adilger@dilger.ca>,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

In preparation for reducing the visibility of fscrypt_require_key() by
moving it to fscrypt_private.h, move the call to it from
fscrypt_prepare_setattr() to an out-of-line function.

Reviewed-by: Andreas Dilger <adilger@dilger.ca>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/hooks.c       |  8 ++++++++
 include/linux/fscrypt.h | 11 +++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 82f351d3113ac..1c16dba222d95 100644
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
index 8cbb26f556952..b20900bb829fc 100644
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

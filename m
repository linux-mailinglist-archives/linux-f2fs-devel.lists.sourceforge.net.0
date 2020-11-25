Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 010332C3558
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Nov 2020 01:25:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khicX-0005cl-OY; Wed, 25 Nov 2020 00:25:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1khicW-0005cb-Dx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Nov 2020 00:25:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CkLLL8hikHfynw+9m5cwuXiG8pYsioDRQcitRb0ZROM=; b=i5Nud9vWyqj5ZU+29S9Sb8XX3m
 Pq8VtzkO1iULwATXSRuOz1BZYtM08sL+p0QfzQ735T8WBcGEVYQGGx1xzq5obuaHuAncPS7Gvybl5
 MmkQ99ik4GtCVIBcT8LVNBwZV7TGP0jcX2i5AW/iv6WBsc5eyvHDw9+ceTnbQWXGAAX4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CkLLL8hikHfynw+9m5cwuXiG8pYsioDRQcitRb0ZROM=; b=ND0HUGfgRLEmySOwzWBaohOIEL
 6iIsJfBOuMfoRYbj4FlJRfxOqeRqMkWe9WgeqV7Xki00pvhWU8UqVlKeZhJASY/BjmPhZSyV7xYxZ
 knCf7PpZEsvNY7HhrK83vAS7IxfXDZFXrXPjRWnwltkBb2H+XvArJQc4lXLo7zzRKXQo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1khicQ-00E1Ru-EH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Nov 2020 00:25:16 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8AF542173E;
 Wed, 25 Nov 2020 00:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606263887;
 bh=ABvDlXMwjRq5govS1GsOlH9NgSkx2Q1+FWd/EUcY1U8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LXljaE/jMVXFHaMrkVVLTTRANdzCOz4et9MOVW8G6aVFZLsykL8yQST5y0NwuNDwP
 8vTr++uc04ONtcJUMiq+jHlS5K4vPYzlvAEWuu0e2oRUhqlKTIXzqUas8qwdmGWZ6N
 3m9HsnYwlQrmNxSuDRq/lS/nzCIBKAHdPUMz7s6k=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 24 Nov 2020 16:23:34 -0800
Message-Id: <20201125002336.274045-8-ebiggers@kernel.org>
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
X-Headers-End: 1khicQ-00E1Ru-EH
Subject: [f2fs-dev] [PATCH 7/9] fscrypt: move fscrypt_require_key() to
 fscrypt_private.h
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

fscrypt_require_key() is now only used by files in fs/crypto/.  So
reduce its visibility to fscrypt_private.h.  This is also a prerequsite
for unexporting fscrypt_get_encryption_info().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h | 26 ++++++++++++++++++++++++++
 include/linux/fscrypt.h     | 26 --------------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index a61d4dbf0a0b..16dd55080127 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -571,6 +571,32 @@ int fscrypt_derive_dirhash_key(struct fscrypt_info *ci,
 void fscrypt_hash_inode_number(struct fscrypt_info *ci,
 			       const struct fscrypt_master_key *mk);
 
+/**
+ * fscrypt_require_key() - require an inode's encryption key
+ * @inode: the inode we need the key for
+ *
+ * If the inode is encrypted, set up its encryption key if not already done.
+ * Then require that the key be present and return -ENOKEY otherwise.
+ *
+ * No locks are needed, and the key will live as long as the struct inode --- so
+ * it won't go away from under you.
+ *
+ * Return: 0 on success, -ENOKEY if the key is missing, or another -errno code
+ * if a problem occurred while setting up the encryption key.
+ */
+static inline int fscrypt_require_key(struct inode *inode)
+{
+	if (IS_ENCRYPTED(inode)) {
+		int err = fscrypt_get_encryption_info(inode);
+
+		if (err)
+			return err;
+		if (!fscrypt_has_encryption_key(inode))
+			return -ENOKEY;
+	}
+	return 0;
+}
+
 /* keysetup_v1.c */
 
 void fscrypt_put_direct_key(struct fscrypt_direct_key *dk);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index b20900bb829f..a07610f27926 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -688,32 +688,6 @@ static inline bool fscrypt_has_encryption_key(const struct inode *inode)
 	return fscrypt_get_info(inode) != NULL;
 }
 
-/**
- * fscrypt_require_key() - require an inode's encryption key
- * @inode: the inode we need the key for
- *
- * If the inode is encrypted, set up its encryption key if not already done.
- * Then require that the key be present and return -ENOKEY otherwise.
- *
- * No locks are needed, and the key will live as long as the struct inode --- so
- * it won't go away from under you.
- *
- * Return: 0 on success, -ENOKEY if the key is missing, or another -errno code
- * if a problem occurred while setting up the encryption key.
- */
-static inline int fscrypt_require_key(struct inode *inode)
-{
-	if (IS_ENCRYPTED(inode)) {
-		int err = fscrypt_get_encryption_info(inode);
-
-		if (err)
-			return err;
-		if (!fscrypt_has_encryption_key(inode))
-			return -ENOKEY;
-	}
-	return 0;
-}
-
 /**
  * fscrypt_prepare_link() - prepare to link an inode into a possibly-encrypted
  *			    directory
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

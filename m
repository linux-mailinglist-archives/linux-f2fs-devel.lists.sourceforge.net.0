Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E48821E6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2019 18:28:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hufqq-0002Ic-SZ; Mon, 05 Aug 2019 16:28:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hufqn-0002Ht-Pg
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 16:28:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c6YYyXppZmMxUDFwj3JedKixJ0i4/avbjUzL7jyEYEE=; b=Se+l9taaDFR+FczxTVH+CJ/PC/
 XnKyy+0ohVyJ3O5ZD0HSKnmHLYtdUVX0tExr2SOAH59qCBHrpKQjsuTxOE4VPXlOt1NZMH5o2Cal+
 ZSPNdm/J0GdZr3uonpec/G3ae5kqVrmUqxhxHafeBmpJQMtiQL8N8emA/Kx2+tSfeqRE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c6YYyXppZmMxUDFwj3JedKixJ0i4/avbjUzL7jyEYEE=; b=YGLsUkmnlSJWVc+DPg3mztU4KK
 px1NeItH6B8m9tLH8yy/VPWH+GSYsa3+iJA0YJY9M6e6CniFCcV3h2XvlxloqHZei1MaV0MtUkddG
 Zc5hH+sPjtxmJc5sXuQcs+GEW35Fvqz7PdGDZ6hRiBIP+/VHQrzQhfYZVsxi0RKCu94g=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hufql-00BLyl-Ux
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 16:28:45 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8ADD21872;
 Mon,  5 Aug 2019 16:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565022514;
 bh=ysbdRDp4t6yR1/mnrxfjF5Thy72larG2YRdxScNw3NY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IkaekEVWEZv6P2zLxKDfAFH2Rc6UZEkYYApZq0mdc1+4uY1/CZV13/7sak9dAfvi5
 TVTcBTb9vnNLTJjQihbmUmF9b9Grh8tR04GSku4ZTqZC2Tv2iYxol8vBleANB+5qTD
 Ft4OIaHcgSEFShuge2qtieXLdDjlceCu/wpmEpHw=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon,  5 Aug 2019 09:25:09 -0700
Message-Id: <20190805162521.90882-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
In-Reply-To: <20190805162521.90882-1-ebiggers@kernel.org>
References: <20190805162521.90882-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.7 (/)
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
 0.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hufql-00BLyl-Ux
Subject: [f2fs-dev] [PATCH v8 08/20] fscrypt: rename keyinfo.c to keysetup.c
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
Cc: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Rename keyinfo.c to keysetup.c since this better describes what the file
does (sets up the key), and it matches the new file keysetup_v1.c.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/Makefile                  | 2 +-
 fs/crypto/fscrypt_private.h         | 2 +-
 fs/crypto/{keyinfo.c => keysetup.c} | 0
 include/linux/fscrypt.h             | 4 ++--
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename fs/crypto/{keyinfo.c => keysetup.c} (100%)

diff --git a/fs/crypto/Makefile b/fs/crypto/Makefile
index 1fba255c34ca56..ad14d4c29784a6 100644
--- a/fs/crypto/Makefile
+++ b/fs/crypto/Makefile
@@ -4,7 +4,7 @@ obj-$(CONFIG_FS_ENCRYPTION)	+= fscrypto.o
 fscrypto-y := crypto.o \
 	      fname.o \
 	      hooks.o \
-	      keyinfo.o \
+	      keysetup.o \
 	      keysetup_v1.o \
 	      policy.o
 
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 387b44b255f6ab..794dcba25ca826 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -156,7 +156,7 @@ extern bool fscrypt_fname_encrypted_size(const struct inode *inode,
 					 u32 orig_len, u32 max_len,
 					 u32 *encrypted_len_ret);
 
-/* keyinfo.c */
+/* keysetup.c */
 
 struct fscrypt_mode {
 	const char *friendly_name;
diff --git a/fs/crypto/keyinfo.c b/fs/crypto/keysetup.c
similarity index 100%
rename from fs/crypto/keyinfo.c
rename to fs/crypto/keysetup.c
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 81c0c754f8b21b..583802cb2e35d0 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -138,7 +138,7 @@ extern int fscrypt_ioctl_get_policy(struct file *, void __user *);
 extern int fscrypt_has_permitted_context(struct inode *, struct inode *);
 extern int fscrypt_inherit_context(struct inode *, struct inode *,
 					void *, bool);
-/* keyinfo.c */
+/* keysetup.c */
 extern int fscrypt_get_encryption_info(struct inode *);
 extern void fscrypt_put_encryption_info(struct inode *);
 extern void fscrypt_free_inode(struct inode *);
@@ -367,7 +367,7 @@ static inline int fscrypt_inherit_context(struct inode *parent,
 	return -EOPNOTSUPP;
 }
 
-/* keyinfo.c */
+/* keysetup.c */
 static inline int fscrypt_get_encryption_info(struct inode *inode)
 {
 	return -EOPNOTSUPP;
-- 
2.22.0.770.g0f2c4a37fd-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

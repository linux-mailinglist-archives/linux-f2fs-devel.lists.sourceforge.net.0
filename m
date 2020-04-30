Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9081BF149
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Apr 2020 09:24:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jU3Yv-0003V8-7W; Thu, 30 Apr 2020 07:24:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jU3Yt-0003V1-W7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 07:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y9lD0wQhqEQexxRZtHrOgrBXdARxyEjrN9bpeHP9MMw=; b=a5M4tuRyGiYxpw12XLLGNFVQkO
 21sUq+r2RvMUKa4k/LmzIRrEV/dV0QI/3O0dd7bcLKt7DX+E/Orfwp6mjChDzihd9dA6Anqpxq3s2
 +Mg9xq9lrQTBYJ3pYFv3QXnSwNKzJyvW4CwYN+zJcNBw7vBg36ETTMs156QrSeubGjns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y9lD0wQhqEQexxRZtHrOgrBXdARxyEjrN9bpeHP9MMw=; b=B00176ubVBCX4A3dfDP2AwqObV
 Qm0OnaOO/G5cYak3p3yTCmrlq+ao/EfAaH317hMXHSkicTZbbljaxKwyqGnhFsVKzMSGSjCPM5pSo
 OxjNEoYoY7ICvUM8VaLpa3zYUOlatV8KF5cmqkNkBRYKwyuJLZGNPdGhYlqF/UdsQGSM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jU3Yn-00H3GD-PA
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 07:24:47 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD94A20838;
 Thu, 30 Apr 2020 07:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588231476;
 bh=B1510mH7/QkNFP5gDC7/BK6EbcgbEzV8MhuqKtudeLQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0jSbTpTIKAp8HftBanaummT3PLxHjd7KNLv7h+rLMtW46sSj4rCYu67IuaiurcWub
 ndocTRCyPFh7Efb03EY75Tg1wlk8hu+ayQEYKpXdfI7SxyfnlakHfBB7OpKfdPw94L
 V7tN58WoWf9C3V0q2eTm9gEr1x9xbLPnT2nk/B90=
Date: Thu, 30 Apr 2020 00:24:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200430072434.GD16238@sol.localdomain>
References: <20200429072121.50094-1-satyat@google.com>
 <20200429072121.50094-11-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429072121.50094-11-satyat@google.com>
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jU3Yn-00H3GD-PA
Subject: Re: [f2fs-dev] [PATCH v11 10/12] fscrypt: add inline encryption
 support
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 29, 2020 at 07:21:19AM +0000, Satya Tangirala wrote:
> +/**
> + * fscrypt_inode_uses_inline_crypto - test whether an inode uses inline
> + *				      encryption
> + * @inode: an inode

I think this should also mention that the key must be setup, like

 * @inode: an inode.  If encrypted, its key must be set up.

Likewise in fscrypt_inode_uses_fs_layer_crypto().

> + *
> + * Return: true if the inode requires file contents encryption and if the
> + *	   encryption should be done in the block layer via blk-crypto rather
> + *	   than in the filesystem layer.
> + */
> +bool fscrypt_inode_uses_inline_crypto(const struct inode *inode)
> +{
> +	return fscrypt_needs_contents_encryption(inode) &&
> +	       inode->i_crypt_info->ci_inlinecrypt;
> +}
> +EXPORT_SYMBOL_GPL(fscrypt_inode_uses_inline_crypto);
> +
> +/**
> + * fscrypt_inode_uses_fs_layer_crypto - test whether an inode uses fs-layer
> + *					encryption
> + * @inode: an inode
> + *
> + * Return: true if the inode requires file contents encryption and if the
> + *	   encryption should be done in the filesystem layer rather than in the
> + *	   block layer via blk-crypto.
> + */
> +bool fscrypt_inode_uses_fs_layer_crypto(const struct inode *inode)
> +{
> +	return fscrypt_needs_contents_encryption(inode) &&
> +	       !inode->i_crypt_info->ci_inlinecrypt;
> +}
> +EXPORT_SYMBOL_GPL(fscrypt_inode_uses_fs_layer_crypto);

It might also make sense to implement these as inline functions in fscrypt.h:

diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index 0676832817a74a..6d44d89087b4e5 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -178,37 +178,10 @@ void fscrypt_destroy_inline_crypt_key(struct fscrypt_prepared_key *prep_key)
 	}
 }
 
-/**
- * fscrypt_inode_uses_inline_crypto - test whether an inode uses inline
- *				      encryption
- * @inode: an inode
- *
- * Return: true if the inode requires file contents encryption and if the
- *	   encryption should be done in the block layer via blk-crypto rather
- *	   than in the filesystem layer.
- */
-bool fscrypt_inode_uses_inline_crypto(const struct inode *inode)
-{
-	return fscrypt_needs_contents_encryption(inode) &&
-	       inode->i_crypt_info->ci_inlinecrypt;
-}
-EXPORT_SYMBOL_GPL(fscrypt_inode_uses_inline_crypto);
-
-/**
- * fscrypt_inode_uses_fs_layer_crypto - test whether an inode uses fs-layer
- *					encryption
- * @inode: an inode
- *
- * Return: true if the inode requires file contents encryption and if the
- *	   encryption should be done in the filesystem layer rather than in the
- *	   block layer via blk-crypto.
- */
-bool fscrypt_inode_uses_fs_layer_crypto(const struct inode *inode)
+bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode)
 {
-	return fscrypt_needs_contents_encryption(inode) &&
-	       !inode->i_crypt_info->ci_inlinecrypt;
+	return inode->i_crypt_info->ci_inlinecrypt;
 }
-EXPORT_SYMBOL_GPL(fscrypt_inode_uses_fs_layer_crypto);
 
 static void fscrypt_generate_dun(const struct fscrypt_info *ci, u64 lblk_num,
 				 u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE])
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index e02820b8e981e1..df30d3dde6ce02 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -508,9 +508,7 @@ static inline void fscrypt_set_ops(struct super_block *sb,
 
 /* inline_crypt.c */
 #ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
-extern bool fscrypt_inode_uses_inline_crypto(const struct inode *inode);
-
-extern bool fscrypt_inode_uses_fs_layer_crypto(const struct inode *inode);
+extern bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode);
 
 extern void fscrypt_set_bio_crypt_ctx(struct bio *bio,
 				      const struct inode *inode,
@@ -527,16 +525,11 @@ extern bool fscrypt_mergeable_bio_bh(struct bio *bio,
 				     const struct buffer_head *next_bh);
 
 #else /* CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
-static inline bool fscrypt_inode_uses_inline_crypto(const struct inode *inode)
+static inline bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode)
 {
 	return false;
 }
 
-static inline bool fscrypt_inode_uses_fs_layer_crypto(const struct inode *inode)
-{
-	return fscrypt_needs_contents_encryption(inode);
-}
-
 static inline void fscrypt_set_bio_crypt_ctx(struct bio *bio,
 					     const struct inode *inode,
 					     u64 first_lblk, gfp_t gfp_mask) { }
@@ -560,6 +553,36 @@ static inline bool fscrypt_mergeable_bio_bh(struct bio *bio,
 }
 #endif /* !CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
 
+/**
+ * fscrypt_inode_uses_inline_crypto - test whether an inode uses inline
+ *				      encryption
+ * @inode: an inode.  If encrypted, its key must be set up.
+ *
+ * Return: true if the inode requires file contents encryption and if the
+ *	   encryption should be done in the block layer via blk-crypto rather
+ *	   than in the filesystem layer.
+ */
+static inline bool fscrypt_inode_uses_inline_crypto(const struct inode *inode)
+{
+	return fscrypt_needs_contents_encryption(inode) &&
+	       __fscrypt_inode_uses_inline_crypto(inode);
+}
+
+/**
+ * fscrypt_inode_uses_fs_layer_crypto - test whether an inode uses fs-layer
+ *					encryption
+ * @inode: an inode.  If encrypted, its key must be set up.
+ *
+ * Return: true if the inode requires file contents encryption and if the
+ *	   encryption should be done in the filesystem layer rather than in the
+ *	   block layer via blk-crypto.
+ */
+static inline bool fscrypt_inode_uses_fs_layer_crypto(const struct inode *inode)
+{
+	return fscrypt_needs_contents_encryption(inode) &&
+	       !__fscrypt_inode_uses_inline_crypto(inode);
+}
+
 /**
  * fscrypt_require_key - require an inode's encryption key
  * @inode: the inode we need the key for



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

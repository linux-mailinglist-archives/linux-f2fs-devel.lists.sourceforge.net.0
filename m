Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1541FFA83
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 19:48:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlyec-0000eN-7B; Thu, 18 Jun 2020 17:48:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jlyeb-0000eC-Bu
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 17:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3iOvAGG+1dvmbSeYyG2NGBwUuzjjMg2xBoPtj+f/OBU=; b=AwiWPlbe3Up9ESHD34A/Q3BKds
 3rAkrsYUfB7wpYWoi1rCrkyuMCWSquANgnugodaB0Gbk2TxUBADfk9uSvfsVrH2VKR93GE4rv0Sbr
 l2enBjNLhgn+jShJvIc0Jl8S964fz3VtQVV6ZarYl59xPw0IJ29eeKEMMADdsjr9WxtI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3iOvAGG+1dvmbSeYyG2NGBwUuzjjMg2xBoPtj+f/OBU=; b=gdbHvIZ3Yrr6Depr8kELWJam6S
 AB8f0cvHhk4FhCwIFp2gceS2s7hIBMcq2ucGUkEbWmiPDAA9V2KQ0UJruI9A6GFnmkEoCuFrIVohT
 ph6pV0+KNixHj7D0pg05ge1WfRDM9H3078h/3zXYIZ6yjTBNrhrW2kcN15mcGYMA2A6I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jlyeZ-0081AP-8R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 17:48:45 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D599207DD;
 Thu, 18 Jun 2020 17:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592502512;
 bh=ZOxGV61qCMZ+mvpZMM0gV3hYOdWhVFXHU/BEccRNoNE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uedDzgpvpynhZLypdYUPWQUHm9movWphBFmtrCdHmsm3s7+j/ieEsOiR4XkReCYto
 OEZtiW6GiqXvnUx4YqqthusOkVd8jzdinjuEqzGCz/uSUwIHmQWGYWz2s9EzLAeuW1
 GLCim5nOZXmhLjy1G+awTfmk/P+XKYaNthFqQUUY=
Date: Thu, 18 Jun 2020 10:48:31 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200618174831.GB2957@sol.localdomain>
References: <20200617075732.213198-1-satyat@google.com>
 <20200617075732.213198-3-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617075732.213198-3-satyat@google.com>
X-Spam-Score: -0.5 (/)
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jlyeZ-0081AP-8R
Subject: Re: [f2fs-dev] [PATCH 2/4] fscrypt: add inline encryption support
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

A few nits:

On Wed, Jun 17, 2020 at 07:57:30AM +0000, Satya Tangirala wrote:
> To use inline encryption, the filesystem needs to be mounted with
> '-o inlinecrypt'.  The contents of any encrypted files will then be
> encrypted using blk-crypto, instead of using the traditional
> filesystem-layer crypto.

This isn't clear about what happens when blk-crypto isn't supported on a
file.  How about:

"To use inline encryption, the filesystem needs to be mounted with
'-o inlinecrypt'.  blk-crypto will then be used to encrypt the contents
of any encrypted files where it can be used instead of the traditional
filesystem-layer crypto."

> diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
> index eb7fcd2b7fb8..1572186b0db4 100644
> --- a/fs/crypto/fscrypt_private.h
> +++ b/fs/crypto/fscrypt_private.h
> @@ -14,6 +14,7 @@
>  #include <linux/fscrypt.h>
>  #include <linux/siphash.h>
>  #include <crypto/hash.h>
> +#include <linux/blk-crypto.h>
>  
>  #define CONST_STRLEN(str)	(sizeof(str) - 1)
>  
> @@ -166,6 +167,20 @@ struct fscrypt_symlink_data {
>  	char encrypted_path[1];
>  } __packed;
>  
> +/**
> + * struct fscrypt_prepared_key - a key prepared for actual encryption/decryption
> + * @tfm: crypto API transform object
> + * @blk_key: key for blk-crypto
> + *
> + * Normally only one of the fields will be non-NULL.
> + */
> +struct fscrypt_prepared_key {
> +	struct crypto_skcipher *tfm;
> +#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
> +	struct fscrypt_blk_crypto_key *blk_key;
> +#endif
> +};
> +
>  /*
>   * fscrypt_info - the "encryption key" for an inode
>   *
> @@ -175,12 +190,23 @@ struct fscrypt_symlink_data {
>   */
>  struct fscrypt_info {
>  
> -	/* The actual crypto transform used for encryption and decryption */
> -	struct crypto_skcipher *ci_ctfm;
> +	/* The key in a form prepared for actual encryption/decryption */
> +	struct fscrypt_prepared_key	ci_enc_key;

Space instead of tab before ci_enc_key, to match the other fields of
this struct.

>  
> -	/* True if the key should be freed when this fscrypt_info is freed */
> +	/*
> +	 * True if the ci_enc_key should be freed when this fscrypt_info is
> +	 * freed
> +	 */
>  	bool ci_owns_key;

This comment would fit nicely on one line if "the" was deleted:

	/* True if ci_enc_key should be freed when this fscrypt_info is freed */

> +/* inline_crypt.c */
> +#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
> +void fscrypt_select_encryption_impl(struct fscrypt_info *ci);
> +
> +static inline bool
> +fscrypt_using_inline_encryption(const struct fscrypt_info *ci)
> +{
> +	return ci->ci_inlinecrypt;
> +}
> +
> +int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
> +				     const u8 *raw_key,
> +				     const struct fscrypt_info *ci);
> +
> +void fscrypt_destroy_inline_crypt_key(struct fscrypt_prepared_key *prep_key);
> +
> +/*
> + * Check whether the crypto transform or blk-crypto key has been allocated in
> + * @prep_key, depending on which encryption implementation the file will use.
> + */
> +static inline bool
> +fscrypt_is_key_prepared(struct fscrypt_prepared_key *prep_key,
> +			const struct fscrypt_info *ci)
> +{
> +	/*
> +	 * The READ_ONCE() here pairs with the smp_store_release() in
> +	 * fscrypt_prepare_key().  (This only matters for the per-mode keys,
> +	 * which are shared by multiple inodes.)
> +	 */
> +	if (fscrypt_using_inline_encryption(ci))
> +		return READ_ONCE(prep_key->blk_key) != NULL;
> +	return READ_ONCE(prep_key->tfm) != NULL;
> +}
> +
> +#else /* CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
> +
> +static inline void fscrypt_select_encryption_impl(struct fscrypt_info *ci)
> +{
> +}
> +
> +static inline bool fscrypt_using_inline_encryption(
> +					const struct fscrypt_info *ci)
> +{
> +	return false;
> +}

fscrypt_using_inline_encryption() here is formatted differently from the
CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y case.  I'd use for both:

static inline bool
fscrypt_using_inline_encryption(const struct fscrypt_info *ci)

> +int fscrypt_prepare_key(struct fscrypt_prepared_key *prep_key,
> +			const u8 *raw_key,
> +			const struct fscrypt_info *ci);

'raw_key' and 'ci' fit on one line.  (Note: the definition already does that.)

> +/* Enable inline encryption for this file if supported. */
> +void fscrypt_select_encryption_impl(struct fscrypt_info *ci)
> +{

This function should return an error code (0 or -ENOMEM) so that
failure of kmalloc_array() can be reported.

> +	/* The crypto mode must be valid */
> +	if (ci->ci_mode->blk_crypto_mode == BLK_ENCRYPTION_MODE_INVALID)
> +		return;

The comment "The crypto mode must be valid" is confusing, since the mode
*is* valid for fscrypt, just not for blk-crypto.  How about:

	/* The crypto mode must have a blk-crypto counterpart */

> +	/*
> +	 * blk-crypto must support the crypto configuration we'll use for the
> +	 * inode on all devices in the sb
> +	 */

I think the following would be a slightly clearer and more consistent
with other comments:

	/*
	 * On all the filesystem's devices, blk-crypto must support the crypto
	 * configuration that the file would use.
	 */

> +/**
> + * fscrypt_mergeable_bio() - test whether data can be added to a bio
> + * @bio: the bio being built up
> + * @inode: the inode for the next part of the I/O
> + * @next_lblk: the next file logical block number in the I/O
> + *
> + * When building a bio which may contain data which should undergo inline
> + * encryption (or decryption) via fscrypt, filesystems should call this function
> + * to ensure that the resulting bio contains only logically contiguous data.
> + * This will return false if the next part of the I/O cannot be merged with the
> + * bio because either the encryption key would be different or the encryption
> + * data unit numbers would be discontiguous.
> + *
> + * fscrypt_set_bio_crypt_ctx() must have already been called on the bio.
> + *
> + * Return: true iff the I/O is mergeable
> + */

The mention of "logically contiguous data" here is now technically wrong
due to the new IV_INO_LBLK_32 IV generation method.  For that, logically
contiguous blocks don't necessarily have contiguous DUNs.

I'd replace in this comment:
	"logically contiguous data" => "contiguous data unit numbers"

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

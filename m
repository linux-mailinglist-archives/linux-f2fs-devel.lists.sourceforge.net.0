Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F949F726
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Aug 2019 02:07:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2lUY-0007MV-0m; Wed, 28 Aug 2019 00:07:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1i2lUX-0007MJ-1F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Aug 2019 00:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Aom9QgGjnO28+qX7ga2mf8XV0BNBETi9eMNPV7EWuEo=; b=bWbYr/s+Cdf3AqVr+Dxj0ytsFG
 XqGy2hSyjX4zJ6depRsRGOFUTcnlGT2GrSuaiH3vECx+S4/LgDY3xfMc9AUJLNtFJTK6E4dOzItSp
 +N4h4EAvp+ixlUCPqPZRk3lO2QJSzMTMDvbn4y3kNmtRUSDCY81lyOY8X0ssxAB9xpb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Aom9QgGjnO28+qX7ga2mf8XV0BNBETi9eMNPV7EWuEo=; b=GwzACcVwyv3e3Hv0N/xmtzQeRN
 tcGczpPy0r2FFUhEoNXqtZIACGIdxkpwkS6PsJ7WZkB6Gc4VDVc05KM0dJKElQO0U7O1+L14Hd4Ja
 5Uuh8neiFnXDLo/3wt9jJVk3XSh9GGP35o0hguRrdgcuYgsqs76BgMrPRPlYHjXhFi8Y=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2lUV-000lrc-JS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Aug 2019 00:07:12 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A694F20854;
 Wed, 28 Aug 2019 00:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566950825;
 bh=FmClub3HwpuCluB7fJjDTEQxR8M/jDVYDBvVokxsfdQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OJLrT8i3kkAyEtMrn2V5UExYI0JrO+3VSC+3F/8lBRFGG89aBao4a0nf2HqlJgAXF
 Me4kROVinB1HFwZLpF/+7ze3b+Z+PhMEIRdGTVzJcbh/28oer0LxMG9NUHOHrZ+bIx
 3CrB8IF0bJ+GX3V2kckOARPhHcjHpTamh5OWUwwE=
Date: Tue, 27 Aug 2019 17:07:04 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20190828000700.GB92220@gmail.com>
Mail-Followup-To: Satya Tangirala <satyat@google.com>,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Kim Boojin <boojin.kim@samsung.com>
References: <20190821075714.65140-1-satyat@google.com>
 <20190821075714.65140-8-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821075714.65140-8-satyat@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.2 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i2lUV-000lrc-JS
Subject: Re: [f2fs-dev] [PATCH v4 7/8] fscrypt: wire up fscrypt to use
 blk-crypto
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
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 21, 2019 at 12:57:13AM -0700, Satya Tangirala wrote:
> Introduce fscrypt_set_bio_crypt_ctx for filesystems to call to set up
> encryption contexts in bios, and fscrypt_evict_crypt_key to evict
> the encryption context associated with an inode.
> 
> Inline encryption is controlled by a policy flag in the fscrypt_info
> in the inode, and filesystems may check if an inode should use inline
> encryption by calling fscrypt_inode_is_inline_crypted. Files can be marked
> as inline encrypted from userspace by appropriately modifying the flags
> (OR-ing FS_POLICY_FLAGS_INLINE_ENCRYPTION to it) in the fscrypt_policy
> passed to fscrypt_ioctl_set_policy.
> 
> To test inline encryption with the fscrypt dummy context, add
> ctx.flags |= FS_POLICY_FLAGS_INLINE_ENCRYPTION
> when setting up the dummy context in fs/crypto/keyinfo.c.

INLINE_ENCRYPTION => INLINE_CRYPT_OPTIMIZED.
(Code was updated, but the commit message was not.)

> diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
> index 82da2510721f..d3c3f63ec109 100644
> --- a/fs/crypto/bio.c
> +++ b/fs/crypto/bio.c
[...]
> +#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
> +enum blk_crypto_mode_num
> +get_blk_crypto_mode_for_fscryptalg(u8 fscrypt_alg)
> +{
> +	switch (fscrypt_alg) {
> +	case FS_ENCRYPTION_MODE_AES_256_XTS:
> +		return BLK_ENCRYPTION_MODE_AES_256_XTS;
> +	default: return BLK_ENCRYPTION_MODE_INVALID;
> +	}
> +}

This function isn't static, so it needs the "fscrypt_" prefix.
How about: fscrypt_mode_to_block_mode(u8 fscrypt_mode);

> +int fscrypt_set_bio_crypt_ctx(struct bio *bio,
> +			      const struct inode *inode,
> +			      u64 data_unit_num,
> +			      gfp_t gfp_mask)
> +{
> +	struct fscrypt_info *ci = inode->i_crypt_info;
> +	int err;
> +	enum blk_crypto_mode_num blk_crypto_mode;
> +
> +
> +	/* If inode is not inline encrypted, nothing to do. */
> +	if (!fscrypt_inode_is_inline_crypted(inode))
> +		return 0;
> +
> +	blk_crypto_mode = get_blk_crypto_mode_for_fscryptalg(ci->ci_data_mode);
> +	if (blk_crypto_mode == BLK_ENCRYPTION_MODE_INVALID)
> +		return -EINVAL;
> +
> +	err = bio_crypt_set_ctx(bio, ci->ci_master_key->mk_raw,
> +				blk_crypto_mode,
> +				data_unit_num,
> +				inode->i_blkbits,
> +				gfp_mask);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(fscrypt_set_bio_crypt_ctx);

The end can shortened to:  return bio_crypt_set_ctx(...)

> +int fscrypt_evict_crypt_key(struct inode *inode)
> +{
> +	struct request_queue *q;
> +	struct fscrypt_info *ci;
> +
> +	if (!inode)
> +		return 0;
> +
> +	q = inode->i_sb->s_bdev->bd_queue;
> +	ci = inode->i_crypt_info;
> +
> +	if (!q || !q->ksm || !ci ||
> +	    !fscrypt_inode_is_inline_crypted(inode)) {
> +		return 0;
> +	}
> +
> +	return keyslot_manager_evict_key(q->ksm,
> +					 ci->ci_master_key->mk_raw,
> +					 get_blk_crypto_mode_for_fscryptalg(
> +						ci->ci_data_mode),
> +					 1 << inode->i_blkbits);
> +}
> +EXPORT_SYMBOL(fscrypt_evict_crypt_key);

This is really evicting a master key that may be shared by many inodes...  So it
doesn't make sense to pass a specific inode here.  Shouldn't it pass the struct
fscrypt_master_key itself?

Also, this function needs kerneldoc.

> +
> +bool fscrypt_inode_crypt_mergeable(const struct inode *inode_1,
> +				   const struct inode *inode_2)
> +{
> +	struct fscrypt_info *ci_1, *ci_2;
> +	bool enc_1 = !inode_1 || fscrypt_inode_is_inline_crypted(inode_1);
> +	bool enc_2 = !inode_2 || fscrypt_inode_is_inline_crypted(inode_2);
> +
> +	if (enc_1 != enc_2)
> +		return false;
> +
> +	if (!enc_1)
> +		return true;
> +
> +	if (inode_1 == inode_2)
> +		return true;
> +
> +	ci_1 = inode_1->i_crypt_info;
> +	ci_2 = inode_2->i_crypt_info;
> +
> +	return ci_1->ci_data_mode == ci_2->ci_data_mode &&
> +	       crypto_memneq(ci_1->ci_master_key->mk_raw,
> +			     ci_2->ci_master_key->mk_raw,
> +			     ci_1->ci_master_key->mk_mode->keysize) == 0;
> +}
> +EXPORT_SYMBOL(fscrypt_inode_crypt_mergeable);

Needs kerneldoc.

> diff --git a/fs/crypto/keyinfo.c b/fs/crypto/keyinfo.c
> index 207ebed918c1..989cf12217df 100644
> --- a/fs/crypto/keyinfo.c
> +++ b/fs/crypto/keyinfo.c
[...]
> -	if (cmpxchg_release(&inode->i_crypt_info, NULL, crypt_info) == NULL)
> +	if (cmpxchg_release(&inode->i_crypt_info, NULL, crypt_info) == NULL) {
>  		crypt_info = NULL;
> +		if (!flags_inline_crypted(ctx.flags, inode))
> +			goto out;
> +		blk_crypto_mode = get_blk_crypto_mode_for_fscryptalg(
> +			inode->i_crypt_info->ci_mode - available_modes);
> +
> +		if (keyslot_manager_rq_crypto_mode_supported(
> +						inode->i_sb->s_bdev->bd_queue,
> +						blk_crypto_mode,
> +						(1 << inode->i_blkbits))) {
> +			goto out;
> +		}
> +
> +		blk_crypto_mode_alloc_ciphers(blk_crypto_mode);
> +	}

As soon as ->i_crypt_info is set by the cmpxchg_release(), another thread can
start I/O to the file.  So it's too late to call blk_crypto_mode_alloc_ciphers()
here; it needs to happen before the cmpxchg_release().

Also, shouldn't keyslot_manager_rq_crypto_mode_supported() and
blk_crypto_mode_alloc_ciphers() be combined into a single function like
blk_crypto_start_using_mode()?  The fact that it may have to pre-allocate the
crypto transforms is an implementation detail, not something that users of the
block layer should care about, it seems...

> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index bd8f207a2fb6..6db1c7c5009d 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -61,6 +61,7 @@ struct fscrypt_operations {
>  	bool (*dummy_context)(struct inode *);
>  	bool (*empty_dir)(struct inode *);
>  	unsigned int max_namelen;
> +	bool inline_crypt_supp;
>  };
>  
>  /* Decryption work */
> @@ -141,6 +142,23 @@ extern int fscrypt_inherit_context(struct inode *, struct inode *,
>  extern int fscrypt_get_encryption_info(struct inode *);
>  extern void fscrypt_put_encryption_info(struct inode *);
>  extern void fscrypt_free_inode(struct inode *);
> +extern bool fscrypt_needs_fs_layer_crypto(const struct inode *inode);
> +
> +#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
> +extern bool fscrypt_inode_is_inline_crypted(const struct inode *inode);
> +extern bool fscrypt_inode_crypt_mergeable(const struct inode *inode_1,
> +					  const struct inode *inode_2);
> +#else
> +static inline bool fscrypt_inode_is_inline_crypted(const struct inode *inode)
> +{
> +	return false;
> +}
> +static inline bool fscrypt_inode_crypt_mergeable(const struct inode *inode_1,
> +						 const struct inode *inode_2)
> +{
> +	return true;
> +}
> +#endif /* CONFIG_FS_ENCRYPTION_INLINE_CRYPT */

Please try to put all the declarations in the right place.  E.g.
fscrypt_inode_crypt_mergeable() is in the /* keyinfo.c */ part of
this header, but it's actually defined in fs/crypto/bio.c.

>  
>  /* fname.c */
>  extern int fscrypt_setup_filename(struct inode *, const struct qstr *,
> @@ -237,6 +255,29 @@ extern void fscrypt_enqueue_decrypt_bio(struct fscrypt_ctx *ctx,
>  					struct bio *bio);
>  extern int fscrypt_zeroout_range(const struct inode *, pgoff_t, sector_t,
>  				 unsigned int);
> +#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
> +extern int fscrypt_set_bio_crypt_ctx(struct bio *bio,
> +				     const struct inode *inode,
> +				     u64 data_unit_num,
> +				     gfp_t gfp_mask);
> +extern void fscrypt_unset_bio_crypt_ctx(struct bio *bio);
> +extern int fscrypt_evict_crypt_key(struct inode *inode);
> +#else
> +static inline int fscrypt_set_bio_crypt_ctx(struct bio *bio,
> +					    const struct inode *inode,
> +					    u64 data_unit_num,
> +					    gfp_t gfp_mask)
> +{
> +	return 0;
> +}
> +
> +static inline void fscrypt_unset_bio_crypt_ctx(struct bio *bio) { }
> +
> +static inline int fscrypt_evict_crypt_key(struct inode *inode)
> +{
> +	return 0;
> +}
> +#endif

fscrypt_evict_crypt_key() is only called by fs/crypto/ itself, so why is it
being exported to filesystems?

> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index 59c71fa8c553..dea16d0f9d2e 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -224,7 +224,8 @@ struct fsxattr {
>  #define FS_POLICY_FLAGS_PAD_32		0x03
>  #define FS_POLICY_FLAGS_PAD_MASK	0x03
>  #define FS_POLICY_FLAG_DIRECT_KEY	0x04	/* use master key directly */
> -#define FS_POLICY_FLAGS_VALID		0x07
> +#define FS_POLICY_FLAGS_INLINE_CRYPT_OPTIMIZED	0x08

Should be "FLAG" instead of "FLAGS" since it's a single flag, not a mask or
multi-bit field.  See FS_POLICY_FLAG_DIRECT_KEY.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

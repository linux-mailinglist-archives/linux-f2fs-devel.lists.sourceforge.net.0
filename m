Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9D2306A14
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Jan 2021 02:15:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4vud-0000Wn-9E; Thu, 28 Jan 2021 01:15:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1l4vub-0000Wc-5s
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 01:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=paYDAb7LmZ4xHcBEaGBrzzP51gJFQWT7wMl+7XgvZ2g=; b=acPh3/I2SOdZ35FpOEKaQNoQPI
 M+uq2bJNI2L4pPr4K1IT+pmaaTfUzAuORZTHU0QrcxqrroChzhU+ff3Z9pf0CzU/iVA83gPJwQmTc
 /o61ZwbUYiR4uH2TgkRRVoSE7FF6gYav7YrbFzoKMP1LvElRbpc4u310oeb3WVqh8KNo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=paYDAb7LmZ4xHcBEaGBrzzP51gJFQWT7wMl+7XgvZ2g=; b=h6ZySXffTKVcugIryQrt6p1MEs
 icJU8g2eYQuJhoPbMDFRBWOKO8dC1iICT7j85xEFFTp54vxYJV4kf8sKcPJ4fCrkIvIJjo/1WLaBm
 n7vF56gWo1isciS6NVD6thHX/12OOTfn/DcK6+dduuG9J9oW35R1R1+1/EkMCHtZfJFw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4vuR-00Cegd-Sn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 01:15:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C69C64DD1;
 Thu, 28 Jan 2021 01:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611795857;
 bh=9u+pX6tITQPni/ZTAGHNlkfJc+eKK2wzAvA+xh2TVPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pCUSbfI7WRD+4txA2pHo3Xrw3oZG+pmpeTwBWaNcegbi36zxBW/ML2+IuDHKMbzHn
 AVTlavn5uNudzkPHCEf7hOhLjZyJxaX0VqC+vmh0Ax9J0E99UlNwAjDmZT8rxkmXhe
 W9tkHXGPTWxNhLRsIOiZ63gbCL00Xe4L0F4ttBQWkxnoSOup3VE3LxSDWVoxdaf48/
 fISbEA7jX+sAUC3svQE6GrupalDXRGVf9ICYNTaONC8eARwMjBA04hUG0OmSmVNpkL
 mLuVd2lKIw2s/GnYIUz1aajlGgJohdw5ia9o9MmXIjfeSLBbSbO5d/RUmc6QsOUv8/
 bhT8EDe+EENaw==
Date: Wed, 27 Jan 2021 17:04:15 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YBINj74g4Qhgwr9L@google.com>
References: <20210115181819.34732-1-ebiggers@kernel.org>
 <20210115181819.34732-3-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115181819.34732-3-ebiggers@kernel.org>
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
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l4vuR-00Cegd-Sn
Subject: Re: [f2fs-dev] [PATCH 2/6] fs-verity: don't pass whole descriptor
 to fsverity_verify_signature()
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/15, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Now that fsverity_get_descriptor() validates the sig_size field,
> fsverity_verify_signature() doesn't need to do it.
> 
> Just change the prototype of fsverity_verify_signature() to take the
> signature directly rather than take a fsverity_descriptor.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  fs/verity/fsverity_private.h |  6 ++----
>  fs/verity/open.c             |  3 ++-
>  fs/verity/signature.c        | 20 ++++++--------------
>  3 files changed, 10 insertions(+), 19 deletions(-)
> 
> diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
> index 6c9caccc06021..a7920434bae50 100644
> --- a/fs/verity/fsverity_private.h
> +++ b/fs/verity/fsverity_private.h
> @@ -140,15 +140,13 @@ void __init fsverity_exit_info_cache(void);
>  
>  #ifdef CONFIG_FS_VERITY_BUILTIN_SIGNATURES
>  int fsverity_verify_signature(const struct fsverity_info *vi,
> -			      const struct fsverity_descriptor *desc,
> -			      size_t desc_size);
> +			      const u8 *signature, size_t sig_size);
>  
>  int __init fsverity_init_signature(void);
>  #else /* !CONFIG_FS_VERITY_BUILTIN_SIGNATURES */
>  static inline int
>  fsverity_verify_signature(const struct fsverity_info *vi,
> -			  const struct fsverity_descriptor *desc,
> -			  size_t desc_size)
> +			  const u8 *signature, size_t sig_size)
>  {
>  	return 0;
>  }
> diff --git a/fs/verity/open.c b/fs/verity/open.c
> index a987bb785e9b0..60ff8af7219fe 100644
> --- a/fs/verity/open.c
> +++ b/fs/verity/open.c
> @@ -181,7 +181,8 @@ struct fsverity_info *fsverity_create_info(const struct inode *inode,
>  		 vi->tree_params.hash_alg->name,
>  		 vi->tree_params.digest_size, vi->file_digest);
>  
> -	err = fsverity_verify_signature(vi, desc, desc_size);
> +	err = fsverity_verify_signature(vi, desc->signature,
> +					le32_to_cpu(desc->sig_size));
>  out:
>  	if (err) {
>  		fsverity_free_info(vi);
> diff --git a/fs/verity/signature.c b/fs/verity/signature.c
> index 012468eda2a78..143a530a80088 100644
> --- a/fs/verity/signature.c
> +++ b/fs/verity/signature.c
> @@ -29,21 +29,19 @@ static struct key *fsverity_keyring;
>  /**
>   * fsverity_verify_signature() - check a verity file's signature
>   * @vi: the file's fsverity_info
> - * @desc: the file's fsverity_descriptor
> - * @desc_size: size of @desc
> + * @signature: the file's built-in signature
> + * @sig_size: size of signature in bytes, or 0 if no signature
>   *
> - * If the file's fs-verity descriptor includes a signature of the file digest,
> - * verify it against the certificates in the fs-verity keyring.
> + * If the file includes a signature of its fs-verity file digest, verify it
> + * against the certificates in the fs-verity keyring.
>   *
>   * Return: 0 on success (signature valid or not required); -errno on failure
>   */
>  int fsverity_verify_signature(const struct fsverity_info *vi,
> -			      const struct fsverity_descriptor *desc,
> -			      size_t desc_size)
> +			      const u8 *signature, size_t sig_size)
>  {
>  	const struct inode *inode = vi->inode;
>  	const struct fsverity_hash_alg *hash_alg = vi->tree_params.hash_alg;
> -	const u32 sig_size = le32_to_cpu(desc->sig_size);
>  	struct fsverity_formatted_digest *d;
>  	int err;
>  
> @@ -56,11 +54,6 @@ int fsverity_verify_signature(const struct fsverity_info *vi,
>  		return 0;
>  	}
>  
> -	if (sig_size > desc_size - sizeof(*desc)) {
> -		fsverity_err(inode, "Signature overflows verity descriptor");
> -		return -EBADMSG;
> -	}
> -
>  	d = kzalloc(sizeof(*d) + hash_alg->digest_size, GFP_KERNEL);
>  	if (!d)
>  		return -ENOMEM;
> @@ -70,8 +63,7 @@ int fsverity_verify_signature(const struct fsverity_info *vi,
>  	memcpy(d->digest, vi->file_digest, hash_alg->digest_size);
>  
>  	err = verify_pkcs7_signature(d, sizeof(*d) + hash_alg->digest_size,
> -				     desc->signature, sig_size,
> -				     fsverity_keyring,
> +				     signature, sig_size, fsverity_keyring,
>  				     VERIFYING_UNSPECIFIED_SIGNATURE,
>  				     NULL, NULL);
>  	kfree(d);
> -- 
> 2.30.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

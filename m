Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FD511203E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Dec 2019 00:25:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1icHYK-0004zz-07; Tue, 03 Dec 2019 23:25:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1icHYI-0004zT-NW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 23:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sKWmA6CClZscmflCN+7QeozBzU6LDA6jRCfVqRLNgMo=; b=KRPf93O/RVGOGLmBqmfJ+jkB+8
 32MRcx9oTDQOpoxOkekGsZFeK2YBNXzdKU4t62I1yJgNzhdmzMd3n/PZGUXadLAW1QRhYN8GjkRgG
 CLx3p/13QJUdpH1YgZ8MUUMsxhe1kWiIJzflrWEvezf9wZDAiqfIuxouMTavhzpmSKKI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sKWmA6CClZscmflCN+7QeozBzU6LDA6jRCfVqRLNgMo=; b=GixsLgjogjTcQyaSQh1fdm2CrJ
 +9xOKr/fAvYbtvWwajF4aj/bFGx6DO/mCudllpayFeXTFSQV5io4+p2GeuS/Nmm9vLF4rkMuAvvQE
 FXxt609MZ7bMXd4ncy9/2wfd3WmPrrjxifkoEFqEM6T35/Le5h5nv/hwSNSFh7AjNFL0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1icHYE-006VlB-89
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 23:25:54 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C1DD2068E;
 Tue,  3 Dec 2019 23:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575415544;
 bh=s62NE83AvGkHv7a8GdNaMsP2tq9piaojVsurSzGHy0Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=crsYPp1d5tGI/MP8ReqUbvWAAZnafXFc4U7M2rUBZkC9KU0ir1bSFtgigA7Bg9rVd
 olCW0/Tc+JxkFPpad+Rfap03k421RQ0XdMzO626E63or+h+JBju4GUy6IXTOYo/3W+
 FUDxxcg0Q2J8npexMUa0+kZy0QjQ3emGL9pDB/E8=
Date: Tue, 3 Dec 2019 15:25:42 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20191203232542.GB727@sol.localdomain>
References: <20191203051049.44573-1-drosen@google.com>
 <20191203051049.44573-2-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203051049.44573-2-drosen@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1icHYE-006VlB-89
Subject: Re: [f2fs-dev] [PATCH 1/8] fscrypt: Add siphash and hash key for
 policy v2
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
Cc: Theodore Ts'o <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@android.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Dec 02, 2019 at 09:10:42PM -0800, Daniel Rosenberg wrote:
> When using casefolding along with encryption, we need to use a
> cryptographic hash to allow fast filesystem operations while not knowing
> the case of the name stored on disk while not revealing extra
> information about the name if the key is not present.

This sentence is hard to parse.  Can you make it any clearer?

> 
> When a v2 policy is used on a directory, we derive a key for use with
> siphash.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/crypto/fname.c           | 22 ++++++++++++++++++++++
>  fs/crypto/fscrypt_private.h |  9 +++++++++
>  fs/crypto/keysetup.c        | 29 ++++++++++++++++++++---------
>  include/linux/fscrypt.h     |  8 ++++++++
>  4 files changed, 59 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
> index 3da3707c10e3..b33f03b9f892 100644
> --- a/fs/crypto/fname.c
> +++ b/fs/crypto/fname.c
> @@ -12,6 +12,7 @@
>   */
>  
>  #include <linux/scatterlist.h>
> +#include <linux/siphash.h>
>  #include <crypto/skcipher.h>
>  #include "fscrypt_private.h"
>  
> @@ -400,3 +401,24 @@ int fscrypt_setup_filename(struct inode *dir, const struct qstr *iname,
>  	return ret;
>  }
>  EXPORT_SYMBOL(fscrypt_setup_filename);
> +
> +/**
> + * fscrypt_fname_siphash() - Calculate the siphash for a file name
> + * @dir: the parent directory
> + * @name: the name of the file to get the siphash of
> + *
> + * Given a user-provided filename @name, this function calculates the siphash of
> + * that name using the hash key stored with the directory's policy.

I suggest writing "using the directory's hash key" instead of "using the hash
key stored with the directory's policy", since the latter might be misunderstood
as meaning that the hash key is stored on-disk.

Also it would be helpful to document the assumptions:

	The directory must use a v2 encryption policy, and its key must be available.

> + *
> + *
> + * Return: the siphash of @name using the hash key of @dir
> + */
> +u64 fscrypt_fname_siphash(const struct inode *dir, const struct qstr *name)
> +{
> +	struct fscrypt_info *ci = dir->i_crypt_info;
> +
> +	WARN_ON(!ci || !ci->ci_hash_key_initialized);
> +
> +	return siphash(name->name, name->len, &ci->ci_hash_key);
> +}
> +EXPORT_SYMBOL(fscrypt_fname_siphash);

The !ci part of the WARN_ON is pointless because if it ever triggers, there will
be a NULL dereference afterwards anyway.  I suggest changing it to just:

	WARN_ON(!ci->ci_hash_key_initialized);

> diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
> index 130b50e5a011..f0dfef9921de 100644
> --- a/fs/crypto/fscrypt_private.h
> +++ b/fs/crypto/fscrypt_private.h
> @@ -12,6 +12,7 @@
>  #define _FSCRYPT_PRIVATE_H
>  
>  #include <linux/fscrypt.h>
> +#include <linux/siphash.h>
>  #include <crypto/hash.h>
>  
>  #define CONST_STRLEN(str)	(sizeof(str) - 1)
> @@ -194,6 +195,13 @@ struct fscrypt_info {
>  	 */
>  	struct fscrypt_direct_key *ci_direct_key;
>  
> +	/*
> +	 * With v2 policies, this can be used with siphash
> +	 * When the key has been set, ci_hash_key_initialized is set to true
> +	 */
> +	siphash_key_t ci_hash_key;
> +	bool ci_hash_key_initialized;
> +
>  	/* The encryption policy used by this inode */
>  	union fscrypt_policy ci_policy;
>  
> @@ -286,6 +294,7 @@ extern int fscrypt_init_hkdf(struct fscrypt_hkdf *hkdf, const u8 *master_key,
>  #define HKDF_CONTEXT_PER_FILE_KEY	2
>  #define HKDF_CONTEXT_DIRECT_KEY		3
>  #define HKDF_CONTEXT_IV_INO_LBLK_64_KEY	4
> +#define HKDF_CONTEXT_FNAME_HASH_KEY     5
>  
>  extern int fscrypt_hkdf_expand(struct fscrypt_hkdf *hkdf, u8 context,
>  			       const u8 *info, unsigned int infolen,
> diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
> index f577bb6613f9..e6c7ec04cd25 100644
> --- a/fs/crypto/keysetup.c
> +++ b/fs/crypto/keysetup.c
> @@ -192,7 +192,7 @@ static int fscrypt_setup_v2_file_key(struct fscrypt_info *ci,
>  				     ci->ci_mode->friendly_name);
>  			return -EINVAL;
>  		}
> -		return setup_per_mode_key(ci, mk, mk->mk_direct_tfms,
> +		err = setup_per_mode_key(ci, mk, mk->mk_direct_tfms,
>  					  HKDF_CONTEXT_DIRECT_KEY, false);
>  	} else if (ci->ci_policy.v2.flags &
>  		   FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64) {
> @@ -202,20 +202,31 @@ static int fscrypt_setup_v2_file_key(struct fscrypt_info *ci,
>  		 * the IVs.  This format is optimized for use with inline
>  		 * encryption hardware compliant with the UFS or eMMC standards.
>  		 */
> -		return setup_per_mode_key(ci, mk, mk->mk_iv_ino_lblk_64_tfms,
> +		err = setup_per_mode_key(ci, mk, mk->mk_iv_ino_lblk_64_tfms,
>  					  HKDF_CONTEXT_IV_INO_LBLK_64_KEY,
>  					  true);
> -	}
> -
> -	err = fscrypt_hkdf_expand(&mk->mk_secret.hkdf,
> +	} else {
> +		err = fscrypt_hkdf_expand(&mk->mk_secret.hkdf,
>  				  HKDF_CONTEXT_PER_FILE_KEY,
>  				  ci->ci_nonce, FS_KEY_DERIVATION_NONCE_SIZE,
>  				  derived_key, ci->ci_mode->keysize);

Nit: keep continuation lines aligned when they don't exceed 80 characters:

		err = fscrypt_hkdf_expand(&mk->mk_secret.hkdf,
					  HKDF_CONTEXT_PER_FILE_KEY,
					  ci->ci_nonce,
					  FS_KEY_DERIVATION_NONCE_SIZE,
					  derived_key, ci->ci_mode->keysize);

> -	if (err)
> -		return err;
> +		if (err)
> +			return err;
> +
> +		err = fscrypt_set_derived_key(ci, derived_key);
> +		memzero_explicit(derived_key, ci->ci_mode->keysize);
> +		if (err)
> +			return err;

This 'if (err)' check is in the wrong place.  It needs to be below the brace
below, so that it also checks the error from setup_per_mode_key().

> +	}
>  
> -	err = fscrypt_set_derived_key(ci, derived_key);
> -	memzero_explicit(derived_key, ci->ci_mode->keysize);
> +	if (S_ISDIR(ci->ci_inode->i_mode)) {
> +		err = fscrypt_hkdf_expand(&mk->mk_secret.hkdf,
> +			  HKDF_CONTEXT_FNAME_HASH_KEY,
> +			  ci->ci_nonce, FS_KEY_DERIVATION_NONCE_SIZE,
> +			  (u8 *)&ci->ci_hash_key, sizeof(ci->ci_hash_key));

Nit: keep continuation lines aligned when they don't exceed 80 characters:

		err = fscrypt_hkdf_expand(&mk->mk_secret.hkdf,
					  HKDF_CONTEXT_FNAME_HASH_KEY,
					  ci->ci_nonce,
					  FS_KEY_DERIVATION_NONCE_SIZE,
					  (u8 *)&ci->ci_hash_key,
					  sizeof(ci->ci_hash_key));

> +		if (!err)
> +			ci->ci_hash_key_initialized = true;
> +	}
>  	return err;

Nit: an early return on error would be better here
(consistent with the code above):

                if (err)
                        return err;
                ci->ci_hash_key_initialized = true;
        }
        return 0;

> +extern u64 fscrypt_fname_siphash(const struct inode *dir,
> +					const struct qstr *name);

Nit: align the continuation line:

extern u64 fscrypt_fname_siphash(const struct inode *dir,
				 const struct qstr *name);

>  
>  #define FSCRYPT_FNAME_MAX_UNDIGESTED_SIZE	32
>  
> @@ -446,6 +448,12 @@ static inline int fscrypt_fname_disk_to_usr(struct inode *inode,
>  	return -EOPNOTSUPP;
>  }
>  
> +static inline u64 fscrypt_fname_siphash(const struct inode *inode,

In the other places the first parameter is called 'dir', not 'inode'.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

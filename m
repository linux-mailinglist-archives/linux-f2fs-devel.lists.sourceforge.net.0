Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F201E6E3A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2020 23:56:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jeQW4-0007db-9q; Thu, 28 May 2020 21:56:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jeQVv-0007ct-Ja
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 21:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X0oZLIAgJb4O8VFG+2Iavge0psDJeZJs2InFp9EHWL0=; b=Cc8IyQxEQ8SOMdCzwfah3gLcn7
 o9vwvIP1DK2Nl6HYkYH2Niq1FNGchicxSP4tLh8UQycHnNUUu2XWhn1ofz1A0pWhsZoOMz9TlRpuB
 LleAn+gQRuHfcpxE0Di7hDnJjvuz2w6pI4+XSTs0fM48XEVNikh6u8KmZmtQzfrhpaJ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X0oZLIAgJb4O8VFG+2Iavge0psDJeZJs2InFp9EHWL0=; b=aMCLk3cVQ1W2bYxTp1ObTXqaWG
 h6TgQDVJ0FnjDQqlibZ0af9nfiOxFVITCfw/EQKI2TMzCpsg+h8ymL931VIP6N1b6XrvOjaKHWNGT
 HXS+SxeXzgAtFkbcWkgmyK3qY1PGmjWTiROeoNBZDovrbjfKcr0fPwJXX8uzLv09e8Bw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jeQVo-001yAq-0A
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 21:56:30 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C1E0206F1;
 Thu, 28 May 2020 21:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590702982;
 bh=YrvA6l1wo4LASJiVpABx+mDsD3QcKwzk5VGr+qu3r4c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rEJMBMPXsLqP516mYlBkqFn4ZibP50uBkCESunKDePTB/L5cCrgLy2v/2tR1SN+aa
 g3GjRaUu76j+HeqJkWL7d6rAhzwYeGle3Q+vgQj6s/0yhQ+hWVDunlbLRfOr835Mt5
 mac8NUQU0tbuTlMA7ONnECD74zrStT9vhTojjbxQ=
Date: Thu, 28 May 2020 14:54:30 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200528215430.GA143195@gmail.com>
References: <20200514003727.69001-1-satyat@google.com>
 <20200514003727.69001-11-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514003727.69001-11-satyat@google.com>
X-Spam-Score: -0.6 (/)
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
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jeQVo-001yAq-0A
Subject: Re: [f2fs-dev] [PATCH v13 10/12] fscrypt: add inline encryption
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

A few minor things to clean up when you resend this after v5.8-rc1:

(You'll have to resolve the conflicts with
 https://lore.kernel.org/r/20200515204141.251098-1-ebiggers@kernel.org
 too, but it shouldn't be too hard.  Note that I made setup_per_mode_enc_key()
 use a mutex, like this patch does.)

On Thu, May 14, 2020 at 12:37:25AM +0000, Satya Tangirala wrote:
> Add support for inline encryption to fs/crypto/.  With "inline
> encryption", the block layer handles the decryption/encryption as part
> of the bio, instead of the filesystem doing the crypto itself via
> Linux's crypto API.  This model is needed in order to take advantage of
> the inline encryption hardware present on most modern mobile SoCs.
> 
> To use inline encryption, the filesystem needs to be mounted with
> '-o inlinecrypt'.  The contents of any encrypted files will then be
> encrypted using blk-crypto, instead of using the traditional
> filesystem-layer crypto. Fscrypt still provides the key and IV to use,
> and the actual ciphertext on-disk is still the same; therefore it's
> testable using the existing fscrypt ciphertext verification tests.
> 
> Note that since blk-crypto has a fallack to Linux's crypto API, and

"fallack" => "fallback"

>  struct fscrypt_info {
>  
> -	/* The actual crypto transform used for encryption and decryption */
> -	struct crypto_skcipher *ci_ctfm;
> +	/* The key in a form prepared for actual encryption/decryption */
> +	struct fscrypt_prepared_key	ci_key;
>  

It would be clearer to call this field 'ci_enc_key' instead of 'ci_key'.
Since there are several types of fscrypt keys, including the recently added
ci_dirhash_key, I've been trying to clarify what type of key is meant when it's
ambiguous.  E.g. see https://git.kernel.org/torvalds/c/f592efe735a29c76

>  	/* True if the key should be freed when this fscrypt_info is freed */

If taking the above suggestion, this would need "the key" => "ci_enc_key"

>  	/*
>  	 * If non-NULL, then encryption is done using the master key directly
> -	 * and ci_ctfm will equal ci_direct_key->dk_ctfm.
> +	 * and ci_key will equal ci_direct_key->dk_key.
>  	 */

If taking the above suggestion, this would need "ci_key" => "ci_enc_key"

> +/* inline_crypt.c */
> +#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
> +extern void fscrypt_select_encryption_impl(struct fscrypt_info *ci);

I'm now trying to consistently not use 'extern' on function declarations.  So,
can you remove it from the new declarations here and include/linux/fscrypt.h?

> +/**
> + * fscrypt_set_bio_crypt_ctx - prepare a file contents bio for inline encryption

I'm also now trying to consistently include the parentheses in the function
names in kerneldoc comments.  So:

 * fscrypt_set_bio_crypt_ctx() - prepare a file data bio for inline crypto

 * fscrypt_set_bio_crypt_ctx_bh() - prepare a file data bio for inline crypto

(similarly for the other new kerneldoc comments)

Make sure to also run

	scripts/kernel-doc -v -none fs/crypto/*.{c,h} include/linux/fscrypt.h

to check for new kerneldoc warnings.  In fscrypt.git#master I've gotten rid of
all the existing ones.

Thanks!

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

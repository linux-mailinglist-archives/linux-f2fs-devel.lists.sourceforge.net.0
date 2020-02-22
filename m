Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76516168CC2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Feb 2020 06:39:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5NVb-0000kM-97; Sat, 22 Feb 2020 05:39:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j5NVX-0000jr-2l
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 05:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NkWjHwiPdU6s4/tjVgLNFb3DI4fybXTeQbsBa1pP0K8=; b=IJt7vExhVtXDCmS0ATG45TALrj
 IHbdUznuUqsv/RcxSd6g/VFoaNeHkCMSDEl4UXXbe07RDUB2tGfUR2/f2a14U7/43dgNbO4QRMl0g
 tGL42xk7Gk5IP1iiAQVO+rzfzhsdb2eP6u8WCrK/xoZRXLYmwX9HWWODU7Qn8YjGQMpM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NkWjHwiPdU6s4/tjVgLNFb3DI4fybXTeQbsBa1pP0K8=; b=KuPlKR04OKunBjhNIwbwra0i+n
 oLOvmM7r3VTqfoLw0WNVFecBL/Umi6f0B9UTKQ6PM0xMTe9PxnpyPOS2Aj4EaDMkAxmZ8amUsJKgp
 fqxNBKfhC9aFkElo/ZQx2WxEsYN+l0AMj55uqQdOBhQAoq7TJoMWeO/MW9FgV2YAXyNg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5NVV-00DIWx-CO
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 05:39:19 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F502208C3;
 Sat, 22 Feb 2020 05:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582349946;
 bh=tstnNHhaIvRVX4ExQFdDOhN9ZstDOzAqulx7HPJbK8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nQfM6CCgx+pVqyEwP92qBWdLJjAuuh7iZeR3ncbtvvgsiun0gVfKr9vYHUxYAxjFP
 abj9rUQsDl68oqGY5yOTPK4sCVbNj+yNYvjFQxlcOdCuS2hCQWRqLguVjvPBGtdKF8
 jOKekVc3QEjPSLZ+EsQDPvTSXf7tADwaIwl6OAh4=
Date: Fri, 21 Feb 2020 21:39:05 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200222053905.GC848@sol.localdomain>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-8-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221115050.238976-8-satyat@google.com>
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
X-Headers-End: 1j5NVV-00DIWx-CO
Subject: Re: [f2fs-dev] [PATCH v7 7/9] fscrypt: add inline encryption support
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

On Fri, Feb 21, 2020 at 03:50:48AM -0800, Satya Tangirala wrote:
> diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
> index 65cb09fa6ead..7c157130c16a 100644
> --- a/fs/crypto/keysetup.c
> +++ b/fs/crypto/keysetup.c
> @@ -19,6 +19,8 @@ struct fscrypt_mode fscrypt_modes[] = {
>  		.cipher_str = "xts(aes)",
>  		.keysize = 64,
>  		.ivsize = 16,
> +		.blk_crypto_mode = BLK_ENCRYPTION_MODE_AES_256_XTS,
> +		.blk_crypto_dun_bytes_required = 8,
>  	},
>  	[FSCRYPT_MODE_AES_256_CTS] = {
>  		.friendly_name = "AES-256-CTS-CBC",
> @@ -31,6 +33,8 @@ struct fscrypt_mode fscrypt_modes[] = {
>  		.cipher_str = "essiv(cbc(aes),sha256)",
>  		.keysize = 16,
>  		.ivsize = 16,
> +		.blk_crypto_mode = BLK_ENCRYPTION_MODE_AES_128_CBC_ESSIV,
> +		.blk_crypto_dun_bytes_required = 8,
>  	},
>  	[FSCRYPT_MODE_AES_128_CTS] = {
>  		.friendly_name = "AES-128-CTS-CBC",
> @@ -43,6 +47,8 @@ struct fscrypt_mode fscrypt_modes[] = {
>  		.cipher_str = "adiantum(xchacha12,aes)",
>  		.keysize = 32,
>  		.ivsize = 32,
> +		.blk_crypto_mode = BLK_ENCRYPTION_MODE_ADIANTUM,
> +		.blk_crypto_dun_bytes_required = 24,
>  	},
>  };

The DUN bytes required is actually determined by the IV generation method too.
Currently fscrypt has the following combinations:

	AES-256-XTS: 8 bytes
	AES-128-CBC-ESSIV: 8 bytes
	Adiantum without DIRECT_KEY: 8 bytes
	Adiantum with DIRECT_KEY: 24 bytes

I.e., DIRECT_KEY is only allowed with Adiantum, but not required for it.

So it's technically incorrect to always pass dun_bytes_required=24 for Adiantum.

And it's conceivable that in the future we could add an fscrypt setting that
uses AES-256-XTS with 16 IV bytes.  Such a setting wouldn't be usable with UFS
inline encryption, yet the existing AES-256-XTS settings still would.

So, how about instead of putting .blk_crypto_dun_bytes_required in the
crypto_mode table, using logic like:

	dun_bytes_required = 8;
	if (flags & FSCRYPT_POLICY_FLAG_DIRECT_KEY)
		dun_bytes_required += 16;

> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 3cd4fe6b845e..2331ff0464b2 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1370,6 +1370,7 @@ extern int send_sigurg(struct fown_struct *fown);
>  #define SB_NODIRATIME	2048	/* Do not update directory access times */
>  #define SB_SILENT	32768
>  #define SB_POSIXACL	(1<<16)	/* VFS does not apply the umask */
> +#define SB_INLINE_CRYPT	(1<<17)	/* inodes in SB use blk-crypto */
>  #define SB_KERNMOUNT	(1<<22) /* this is a kern_mount call */
>  #define SB_I_VERSION	(1<<23) /* Update inode I_version field */
>  #define SB_LAZYTIME	(1<<25) /* Update the on-disk [acm]times lazily */

This flag probably should be called "SB_INLINECRYPT" to match the mount option,
which is "inlinecrypt" not "inline_crypt".

Also, the addition of this flag, along with the update to show_sb_opts() in
fs/proc_namespace.c which I think is needed, maybe should go in a separate patch
whose subject is prefixed with "fs: " to make it clearer to reviewers that this
part is a VFS-level change.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

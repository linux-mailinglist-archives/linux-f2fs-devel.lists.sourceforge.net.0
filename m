Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 896F322F57E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Jul 2020 18:35:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k0669-0000FK-T3; Mon, 27 Jul 2020 16:35:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1k0668-0000F7-JW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jul 2020 16:35:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WQrdSmfWJwHKxLAllG8YVV/hXXHdJqHitN7Sb2kUl14=; b=IJ6nhXgbsTvKBdNaGPX139ZUQr
 d7ermpC0/QX7EsNDPossAmf5W+IU0OnxpeTfIzebGa70Ig2cRAgppExa1vIlOEwpRJZEjdHMRfK3z
 +kw93GgEykeZFAjAcFVMHR4iVnI9caFpAO04wtWy2RqtAMm5hh7/WHjoD55pRq2sMsXQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WQrdSmfWJwHKxLAllG8YVV/hXXHdJqHitN7Sb2kUl14=; b=fufdoT619WTeru7Gksz5eXVtkY
 T6VHBcbkoKPyk0+ZCNXuI7vKJeRnP3oRCxaG8OI+zuMdITDAhdq5MXe7JwmWnIESGrJIKA4blL6Tn
 hkqWyb3yHRRIEGOrHKUBCS8UIjoww12avsejah4KcgdUR45BgCjQMvls5lUzpq00rV8o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k0667-001GQ8-EL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jul 2020 16:35:32 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1886C20729;
 Mon, 27 Jul 2020 16:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595867721;
 bh=Najnwn6ct2tS23uzjWWO8aAe31i35Vpz52OO8sKRDZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sqfNr5jE3Q7DGAj+IYToNrMuvjqaJg4KuB2rk+RFFpAP619xIZIVo/IX2AgfYRtM4
 kDT90jODcRriTGURbrxNmJqDJgz+f0UZW2l2hhzEEhOYmz24f7ML6RDyfgrzsrRyll
 3XYnn3SR8g5gboxlByBVl86Y9Q622I7sE2y9BDPg=
Date: Mon, 27 Jul 2020 09:35:19 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20200727163519.GB1138@sol.localdomain>
References: <20200721181012.39308-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721181012.39308-1-ebiggers@kernel.org>
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
X-Headers-End: 1k0667-001GQ8-EL
Subject: Re: [f2fs-dev] [PATCH] fscrypt: restrict IV_INO_LBLK_* to
 AES-256-XTS
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
Cc: Satya Tangirala <satyat@google.com>, Paul Crowley <paulcrowley@google.com>,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 21, 2020 at 11:10:12AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> IV_INO_LBLK_* exist only because of hardware limitations, and currently
> the only known use case for them involves AES-256-XTS.  Therefore, for
> now only allow them in combination with AES-256-XTS.  This way we don't
> have to worry about them being combined with other encryption modes.
> 
> (To be clear, combining IV_INO_LBLK_* with other encryption modes
> *should* work just fine.  It's just not being tested, so we can't be
> 100% sure it works.  So with no known use case, it's best to disallow it
> for now, just like we don't allow other weird combinations like
> AES-256-XTS contents encryption with Adiantum filenames encryption.)
> 
> This can be relaxed later if a use case for other combinations arises.
> 
> Fixes: b103fb7653ff ("fscrypt: add support for IV_INO_LBLK_64 policies")
> Fixes: e3b1078bedd3 ("fscrypt: add support for IV_INO_LBLK_32 policies")
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/crypto/policy.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
> index 8a8ad0e44bb8..8e667aadf271 100644
> --- a/fs/crypto/policy.c
> +++ b/fs/crypto/policy.c
> @@ -77,6 +77,20 @@ static bool supported_iv_ino_lblk_policy(const struct fscrypt_policy_v2 *policy,
>  	struct super_block *sb = inode->i_sb;
>  	int ino_bits = 64, lblk_bits = 64;
>  
> +	/*
> +	 * IV_INO_LBLK_* exist only because of hardware limitations, and
> +	 * currently the only known use case for them involves AES-256-XTS.
> +	 * That's also all we test currently.  For these reasons, for now only
> +	 * allow AES-256-XTS here.  This can be relaxed later if a use case for
> +	 * IV_INO_LBLK_* with other encryption modes arises.
> +	 */
> +	if (policy->contents_encryption_mode != FSCRYPT_MODE_AES_256_XTS) {
> +		fscrypt_warn(inode,
> +			     "Can't use %s policy with contents mode other than AES-256-XTS",
> +			     type);
> +		return false;
> +	}
> +
>  	/*
>  	 * It's unsafe to include inode numbers in the IVs if the filesystem can
>  	 * potentially renumber inodes, e.g. via filesystem shrinking.
> -- 

Applied to fscrypt.git#master for 5.9.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

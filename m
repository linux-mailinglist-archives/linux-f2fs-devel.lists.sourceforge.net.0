Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 748F2524497
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 May 2022 06:55:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1np0rN-0000IN-Fc; Thu, 12 May 2022 04:55:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1np0rM-0000IG-OP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 04:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tsCAEO8I3kuEqKM40i6OYMx0TbeMg0serI2CdlkRbtc=; b=PCAO+ULHtgyNj46cuJD7DynKJd
 P2jwnSiQN7r/O6s/yVyuL3x23XTB8XwDF9icrSuvzPKXawjAT6d7psegAuI3d/0ZY36NUetxaA73Z
 EMFPY94ot9Fi/23pNSHbcfVvuMlV7oeiFT6xnMBOREF0hV3zceRm9NgEjuLHl/pEEnj0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tsCAEO8I3kuEqKM40i6OYMx0TbeMg0serI2CdlkRbtc=; b=HY5rhWZjLtgmKFwUtp0U4E6Yxo
 lDUGSh3Q+hJEWbcD91JLwym+YMFO70dipb52SYRN795TxcT2RWNCvburlTOSXo4dlIqCvYzFNPfZW
 k/geqcU7R2xWeo2Cjn/zmno2ix5uHU0Msh3EmxpSkMR0mlvQRc/Zc2dajSfxzr6clqBU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1np0rL-0005eG-5E
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 04:55:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E1C0B61A78;
 Thu, 12 May 2022 04:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F5FC385B8;
 Thu, 12 May 2022 04:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652331324;
 bh=LjJkrm4cL0YKX8d0K1tDmCRcU9xobTmXP7lqKvNMgzk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CUbZiuT2sGtwfXmUDmNN0ngEkt+xo7xEuqs3rQTzLZuKRuxIxqou1ZKgZgjwoDTZB
 vYtty0AoC7G1D9gz3Z0p57cott30zT19BGmpbcfYG1qMisR6fCuk+nl3vjPtGZvTFn
 CtiLqgNdAJ0xhcHMVNRYWDLDdeXDKXfziS+ptf3JEif5NtnOyochFV/vBD4V6CurW5
 Wn0AvFcM4rqhkfa1k+pC2FfdGA6UDeHw+sU1iSxv3uPsPtYEBzTwRhAolUs9LeWeWb
 USLZqrMTSFzCOOon2I4ouQhthRK3eW8oY/4TFLixzJdoImZot/wkSJf93yNJn4FuvR
 eMbosi09CDTTQ==
Date: Wed, 11 May 2022 21:55:22 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YnyTOlV5p498bvPg@sol.localdomain>
References: <20220511193146.27526-1-krisman@collabora.com>
 <20220511193146.27526-11-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511193146.27526-11-krisman@collabora.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 11, 2022 at 03:31:46PM -0400, Gabriel Krisman
 Bertazi wrote: > @@ -293, 10 +294,
 6 @@ static void f2fs_destroy_casefold_cache(void)
 > { > kmem_cache_destroy(f2fs_cf_name_slab); > } > -#else [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1np0rL-0005eG-5E
Subject: Re: [f2fs-dev] [PATCH v4 10/10] f2fs: Move CONFIG_UNICODE defguards
 into the code flow
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
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 11, 2022 at 03:31:46PM -0400, Gabriel Krisman Bertazi wrote:
> @@ -293,10 +294,6 @@ static void f2fs_destroy_casefold_cache(void)
>  {
>  	kmem_cache_destroy(f2fs_cf_name_slab);
>  }
> -#else
> -static int __init f2fs_create_casefold_cache(void) { return 0; }
> -static void f2fs_destroy_casefold_cache(void) { }
> -#endif
[...]
> @@ -4611,7 +4608,10 @@ static int __init init_f2fs_fs(void)
>  	err = f2fs_init_compress_cache();
>  	if (err)
>  		goto free_compress_mempool;
> -	err = f2fs_create_casefold_cache();
> +
> +	if (IS_ENABLED(CONFIG_UNICODE))
> +		err = f2fs_create_casefold_cache();
> +
>  	if (err)
>  		goto free_compress_cache;
>  	return 0;
> @@ -4654,7 +4654,9 @@ static int __init init_f2fs_fs(void)
>  
>  static void __exit exit_f2fs_fs(void)
>  {
> -	f2fs_destroy_casefold_cache();
> +	if (IS_ENABLED(CONFIG_UNICODE))
> +		f2fs_destroy_casefold_cache();
> +

I don't think the above two changes are actually an improvement.  It's cleaner
to use stub functions to keep the callers simpler, as the original code did.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

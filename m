Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 166DB524492
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 May 2022 06:50:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1np0m8-0007js-Mw; Thu, 12 May 2022 04:50:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1np0m7-0007jm-IE
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 04:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/j8Rq1b7OSrLFHDbvf5Q0QzewmqUDfcfVplcrueZWH4=; b=MvwC27NF+9KU9YzP0oAkgovBH1
 03u7ei+fVo+LMbmWJOxEI82GMLXMFfY4at/GE3G7nRvnG217+kGG8IrlObVn0pmgxNV3Yyb17x+HT
 y1mvKisEhnhPdeXDLuBOEUngb9oYa+RIbxeoNMI0ryKzglRWmv2IV4FEM5XiDAQ0Tegw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/j8Rq1b7OSrLFHDbvf5Q0QzewmqUDfcfVplcrueZWH4=; b=bOwLfqW77ZCO7QNDqo25xw5yhT
 ji9m1o8qPTQlyezAZ5GYPMCNFpaVx8kEpOHC+wKwPSuj5ejB0mJYeEshDIhmmhUOZtUu+p1l38bSf
 Von/TQZT8RL804adQ1cs2xHFxjnAV1ubsCY9HfS13s7dfa918zi3KOPAGELsZPaVNHiI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1np0m1-0005Sn-7Z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 04:50:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EA72EB826F0;
 Thu, 12 May 2022 04:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F54BC385B8;
 Thu, 12 May 2022 04:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652330987;
 bh=z5xJvbJLg59ozEttNGP0Krcnr/2NB7zY+KOPdFEubAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rBgtivz89dyaoNiKj0AZQhqwNaicoQKTRCRTU3GN5cjfTn/A2RlHzrkGl/syGnrWi
 sx2M170zd+seUOZJYWgfgixDth8PCL6fXgixux+HP6t0jaRCrVV2S0kJKnYTafdPGj
 67eixDmVrmktKdswK9higqgDPAUbgf1umNwn3sw5XDGFmlEOghO/59sIzxXI41Oxzr
 J1jPXj1oTBDnJl7WJQNLraATvElZngLaK525gA3/UAQ30slVP1MRDW5N69yVx+DSIQ
 MTDjLs9PZiAiL6dhp2nMMK5Altrz3N2BKpugbhOUYUCGQwuU48fhTgF8fkQhxlj6UP
 GBvbd6LRZWPBw==
Date: Wed, 11 May 2022 21:49:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YnyR6Z/IdLtTkejE@sol.localdomain>
References: <20220511193146.27526-1-krisman@collabora.com>
 <20220511193146.27526-4-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511193146.27526-4-krisman@collabora.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 11, 2022 at 03:31:39PM -0400, Gabriel Krisman
 Bertazi wrote: > Keeping it as qstr avoids the unnecessary conversion in
 f2fs_match
 > > Signed-off-by: Gabriel Krisman Bertazi <krisman@collab [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1np0m1-0005Sn-7Z
Subject: Re: [f2fs-dev] [PATCH v4 03/10] f2fs: Simplify the handling of
 cached insensitive names
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

On Wed, May 11, 2022 at 03:31:39PM -0400, Gabriel Krisman Bertazi wrote:
> Keeping it as qstr avoids the unnecessary conversion in f2fs_match
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> ---
>  fs/f2fs/dir.c      | 52 ++++++++++++++++++++++++++++------------------
>  fs/f2fs/f2fs.h     |  3 ++-
>  fs/f2fs/recovery.c |  5 +----
>  3 files changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 166f08623362..c2a02003c5b9 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -81,28 +81,47 @@ int f2fs_init_casefolded_name(const struct inode *dir,
>  {
>  #if IS_ENABLED(CONFIG_UNICODE)
>  	struct super_block *sb = dir->i_sb;
> +	unsigned char *buf;
> +	int len;
>  
>  	if (IS_CASEFOLDED(dir)) {
> -		fname->cf_name.name = f2fs_kmem_cache_alloc(f2fs_cf_name_slab,
> +		buf = f2fs_kmem_cache_alloc(f2fs_cf_name_slab,
>  					GFP_NOFS, false, F2FS_SB(sb));
> -		if (!fname->cf_name.name)
> -			return -ENOMEM;
> -		fname->cf_name.len = utf8_casefold(sb->s_encoding,
> -						   fname->usr_fname,
> -						   fname->cf_name.name,
> -						   F2FS_NAME_LEN);
> -		if ((int)fname->cf_name.len <= 0) {
> -			kmem_cache_free(f2fs_cf_name_slab, fname->cf_name.name);
> +		if (!buf) {
>  			fname->cf_name.name = NULL;
> +			return -ENOMEM;
> +		}
> +
> +		len = utf8_casefold(sb->s_encoding, fname->usr_fname,
> +				    buf, F2FS_NAME_LEN);
> +
> +		if (len <= 0) {
> +			kmem_cache_free(f2fs_cf_name_slab, buf);
> +			buf = NULL;
>  			if (sb_has_strict_encoding(sb))
>  				return -EINVAL;
>  			/* fall back to treating name as opaque byte sequence */
>  		}
> +		fname->cf_name.name = buf;
> +		fname->cf_name.len = (unsigned int) len;
>  	}
>  #endif

There's some inconsistent behavior above; now sometimes fname->cf_name.name is
set to NULL on failure and sometime it's not.  Also now fname->cf_name.len can
be set to a negative value.

Since struct f2fs_filename is always zero-initialized, how about only setting
the fname->cf_name fields if we actually have a valid value to assign?  I.e.

		buf = f2fs_kmem_cache_alloc(f2fs_cf_name_slab,
					GFP_NOFS, false, F2FS_SB(sb));
		if (!buf)
			return -ENOMEM;

		len = utf8_casefold(sb->s_encoding, fname->usr_fname,
				    buf, F2FS_NAME_LEN);
		if (len <= 0) {
			kmem_cache_free(f2fs_cf_name_slab, buf);
			if (sb_has_strict_encoding(sb))
				return -EINVAL;
			/* fall back to treating name as opaque byte sequence */
			return 0;
		}
		fname->cf_name.name = buf;
		fname->cf_name.len = len;

> +void f2fs_free_casefolded_name(struct f2fs_filename *fname)
> +{
> +#if IS_ENABLED(CONFIG_UNICODE)
> +	unsigned char *buf = (unsigned char *)fname->cf_name.name;
> +
> +	if (buf) {
> +		kmem_cache_free(f2fs_cf_name_slab, buf);
> +		fname->cf_name.name = NULL;
> +	}
> +
> +#endif
> +}

Kernel code usually uses static inline stubs for the !CONFIG_$FOO case in cases
like this, as that causes the function calls to be compiled away to nothing when
they're unneeded.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

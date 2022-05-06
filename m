Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFC351E1C2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 May 2022 01:38:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nn7Ww-0008F8-9D; Fri, 06 May 2022 23:38:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nn7Wu-0008F0-E3
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 May 2022 23:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wNmzif7sOSyX2Vh/1GzLfqJ+EPu7BUzr9UHYOxKaVIo=; b=NHbsH45I0KLcG/nKJA9vm+fFL0
 tDZrtPXxfWNsc/abL0S2ybS6FNXwnhxfHMWn6rYIwR5H5c6FI7DU34F9dVPrX67l0hioOI+mHzlu4
 6fJrYKiUP9N1XeKYZucqi4EsO2WYUmegNm6e2mNl2n54u4HGcXGux7zjeWL+yC0p3RaU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wNmzif7sOSyX2Vh/1GzLfqJ+EPu7BUzr9UHYOxKaVIo=; b=W97Iu07xIRYHqp0DWu9KA5CLto
 EF6WptBxN716M3QORRSki0jelphCuPd0r4rdiolKCP8X6JlQ5mgD7MXIscPp7iVpttMDM2FdFOzoA
 VaxXlXZ4ykBR8JHllZwgTIVzrVgt5NT+buO91BEbLvk+0JPWJFq/4tP2OQrwCW/T1qhg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nn7Wr-003dvY-1D
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 May 2022 23:38:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BA222B839F3;
 Fri,  6 May 2022 23:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F751C385A9;
 Fri,  6 May 2022 23:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651880305;
 bh=E3hT75HfE0yUnoE9AzY6yzQbkzzCK/cPOjBn/FOV+D0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l7mDWnkOTbRKey9Q0CpPGebINX96ja5Z3nRGzZZ5AGlzhex1U8i8O/9BZ0d9mDBDe
 mrEjkFY+OSurJXO5SeVynwlOvlnlfC01fr0XyDFs47XrZarWkXYCEyfHluPFZ/Ux2W
 fUvLEiA8SCFXGVcs2H1zgohv2f5NTz3NKsGCZKqIaM40WjB0buJIbhJgftmWsRFsk4
 ENE6KVUyRStHKngVrjGFuJT3X7oaMET0DK1PM1AXu7e/HGFiZEi5YngO0YgH2Gibvv
 f1M4bAqceds57ArLRT8Sil/uDbB7n9U51dm0vCGoQ3lywOK0E+me0GOvkaoy9xysC6
 Mvs/P61OSN2hw==
Date: Fri, 6 May 2022 16:38:23 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Weichao Guo <guoweichao@msn.com>
Message-ID: <YnWxb8LXlsRNN3GK@google.com>
References: <DM5PR17MB0953D6D7C81E3F4B54DF1006C6C59@DM5PR17MB0953.namprd17.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM5PR17MB0953D6D7C81E3F4B54DF1006C6C59@DM5PR17MB0953.namprd17.prod.outlook.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/07,
 Weichao Guo wrote: > From: Weichao Guo <guoweichao@oppo.com>
 > > If the number of unusable blocks is not larger than > unusable capacity,
 we can skip GC when checkpoint > disabling. I modified to fix restoring
 gc_mode back by the below. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nn7Wr-003dvY-1D
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip GC if possible when checkpoint
 disabling
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
Cc: zhangshiming@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/07, Weichao Guo wrote:
> From: Weichao Guo <guoweichao@oppo.com>
> 
> If the number of unusable blocks is not larger than
> unusable capacity, we can skip GC when checkpoint
> disabling.

I modified to fix restoring gc_mode back by the below.

-       unsigned int gc_mode;
+       unsigned int gc_mode = sbi->gc_mode;


> 
> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/super.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index d06a577..7edb018 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2069,6 +2069,11 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>  	}
>  	sbi->sb->s_flags |= SB_ACTIVE;
>  
> +	/* check if we need more GC first */
> +	unusable = f2fs_get_unusable_blocks(sbi);
> +	if (!f2fs_disable_cp_again(sbi, unusable))
> +		goto skip_gc;
> +
>  	f2fs_update_time(sbi, DISABLE_TIME);
>  
>  	gc_mode = sbi->gc_mode;
> @@ -2097,6 +2102,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>  		goto restore_flag;
>  	}
>  
> +skip_gc:
>  	f2fs_down_write(&sbi->gc_lock);
>  	cpc.reason = CP_PAUSE;
>  	set_sbi_flag(sbi, SBI_CP_DISABLED);
> -- 
> 1.9.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

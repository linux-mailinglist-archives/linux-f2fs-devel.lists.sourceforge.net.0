Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CD783D4CF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jan 2024 09:43:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTHny-0004g2-LB;
	Fri, 26 Jan 2024 08:43:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rTHnu-0004fw-34
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 08:43:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MTlF0A8OVruMfGhYpp1F87TvnzAMI2zOKaiyYMi3ekQ=; b=PX4LixFfDt23KtK8TrSoTDDCcH
 dHEilYKs68R4hkrf02nwSYSYzkYUhCSBvNuusdoFqfZiRcZlGRXG5ZXFBZQwvE30DUhiHuKw9X55C
 lEO876r57fjVTWgIx1row0Z1UiyYAdCa1n/KEXlb7yFLXCbz1Pu0CovUgU6HKA5qhEqE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MTlF0A8OVruMfGhYpp1F87TvnzAMI2zOKaiyYMi3ekQ=; b=IsDvLgFLsxH9CQfZM+dK6yQkGs
 17vX8n8pPVzjZHgKXmDbmhYqZdiJCRVWbsx/f93I5baHEqT+nV1L/vO47E5Lc12f7smNjM+FS1YEL
 Mns/VSX1vpePN8hazaPqH0H4c9VgcYrZBT3DXieq4zcV47H5sr8O7SUZZ0Ktwva1+krU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rTHnl-0003Qi-HK for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 08:43:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0D8D2CE364A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Jan 2024 08:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0C2C433C7;
 Fri, 26 Jan 2024 08:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706258575;
 bh=EJ8HNBNPvrJzALg5dpS/zcxB8MUSRkw2iTKEPWWRH5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PfOyWlGCDHTixxfui7jZbFLFYkMp0yZuTFnthDrhlU+NdHkfbyU4LACmYVuc7FDZA
 nfczveWp2HFWQ4LYJJpUhsWFjY8FFf+Dal8IzQa+rPNuR/5NsaZ0gtzFjhkOfphEAx
 w0Kia+Ez0LHfo2oxKSfVATg9iiciNWdsSoRNRmbysR/Lp24/JQOLwsKJAffGDeAXKr
 FLuYxms+w+epimv/lxCMRFMjGPPuiP39ieO6MecoaoCah4wxxXGH3pbl/tjEafwvkj
 CeMFNnl/QrELg2Nvl14+l5Qe556/Q/EV9HLEOHz2WXW650iSOIDDd8gX4DjGXKnjAV
 asOQZg5tVdGQA==
Date: Fri, 26 Jan 2024 00:42:53 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZbNwjbXyue2-HIr_@google.com>
References: <20240124144506.15052-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240124144506.15052-1-chao@kernel.org>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/24, Chao Yu wrote: > Use printk_ratelimited() instead
 of f2fs_err() in f2fs_record_stop_reason(), > and f2fs_record_errors() to
 avoid redundant logs. > > Signed-off-by: Chao Yu <chao@kernel.org> [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rTHnl-0003Qi-HK
Subject: Re: [f2fs-dev] [PATCH] f2fs: use printk_ratelimited to avoid
 redundant logs
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/24, Chao Yu wrote:
> Use printk_ratelimited() instead of f2fs_err() in f2fs_record_stop_reason(),
> and f2fs_record_errors() to avoid redundant logs.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/super.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index e2c066fbc0fa..7e437aea268e 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4091,7 +4091,9 @@ static void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
>  
>  	f2fs_up_write(&sbi->sb_lock);
>  	if (err)
> -		f2fs_err(sbi, "f2fs_commit_super fails to record err:%d", err);

Needing f2fs_err_ratelimited()?

> +		printk_ratelimited(
> +			"%sF2FS-fs (%s): f2fs_commit_super fails to record stop_reason, err:%d\n",
> +			KERN_ERR, sbi->sb->s_id, err);
>  }
>  
>  void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag)
> @@ -4134,8 +4136,9 @@ static void f2fs_record_errors(struct f2fs_sb_info *sbi, unsigned char error)
>  
>  	err = f2fs_commit_super(sbi, false);
>  	if (err)
> -		f2fs_err(sbi, "f2fs_commit_super fails to record errors:%u, err:%d",
> -								error, err);
> +		printk_ratelimited(
> +			"%sF2FS-fs (%s): f2fs_commit_super fails to record errors:%u, err:%d\n",
> +			KERN_ERR, sbi->sb->s_id, error, err);
>  out_unlock:
>  	f2fs_up_write(&sbi->sb_lock);
>  }
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

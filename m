Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EE8BB11E4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Oct 2025 17:39:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sr0qbBr+b5vQxfN8x1/lEAu0jPJ6KI0r43hhe/+cZE=; b=CnSiS0parT9K0eG6HnKXGd/d9N
	BMdcIjL0u7LKHNyjW3r9ROHQ5SBKSoXSrpRC5RG29YBpW/effiOo+WGWsUW3i07d0H3P4NUFbuKd0
	ADTdw0jTw+VgntyMYBKs4TVM82tZaLCio1AWtIPlTUaB69NmnEqbG6wYoSs89Y8mlUcs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3yvd-0006Hm-C1;
	Wed, 01 Oct 2025 15:39:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1v3yvb-0006Hc-L7
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Oct 2025 15:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o/080FLBJ/6Z5gYnrLHdW84luu2wvuzpy87mly6cJ6M=; b=SMwMrq8Gf6WCykyuTxh/8AGngG
 u5ib0B47ip0nsJ87niaERAnTMIQ8cWqVJ5HWFClPlc82ZcYGN/gpWsu8PlvATzKPrturX4GeGHw0w
 NOjumWPJsll8DTCe90WGZPc2wWwG6zsvLLIUfZqnzlyZ37skLLj/deVXKJYIe8qaQDAU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o/080FLBJ/6Z5gYnrLHdW84luu2wvuzpy87mly6cJ6M=; b=N1HpMU4LzLoMSBw8grdRmf96Nf
 3Xrmrhv8Do84155yyvZNlskWyugkBqJEsKh/jmwirqvSnY3ZJFFM730iVol0U7pU54q6H7dmBeUtR
 DPml3V2pC9QIwPQvTtNhzADNgSJTIcfGpFdpVLtwpPQ13wTwyupgIal4Wvek0Pz7ddAQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3yvb-00078P-5q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Oct 2025 15:39:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D76944177A;
 Wed,  1 Oct 2025 15:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C530C4CEF5;
 Wed,  1 Oct 2025 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759333173;
 bh=WtEVlB/YEbSlFvYtNBcdguT+bm4fsIj2BYpq1A7Iniw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XgnMXPctSvRuwYy/18hRVob5/ZdSKRwjcttZoPJW9cvfReYnVs79jLDqVP9p3UlUp
 lgCO02MmMfh8AbPYGs1FFj5Wez195JQWlCDMlsq3nDR9k4CrCgd3gyVf5mK+VAnWWr
 piJ5zMQSkHv8zmJKBBMBk44Bkg4ZDdTxK/H3befI6YE0ZPDu+GYeXOjwEN7/JeuRON
 bM3IF8JBEjFWdzAIirezKoDlCWJ5XQzzhJrAEIBG4PmTffoxfkmKVlkdexk9feEiJ2
 XX//65JSYAdjxaOMRs31yBiKgQFk6+2dd0YWgt8uw9VbiZbIeYUwUtZXkLK3+34XI2
 p3tr0APudIlNg==
Date: Wed, 1 Oct 2025 15:39:31 +0000
To: Mateusz Guzik <mjguzik@gmail.com>
Message-ID: <aN1LM3C3Dc1TrQTq@google.com>
References: <202509301450.138b448f-lkp@intel.com>
 <20250930232957.14361-1-mjguzik@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250930232957.14361-1-mjguzik@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/01, Mateusz Guzik wrote: > iput() calls the problematic
 routine,
 which does a ->i_count inc/dec > cycle. Undoing it with iput() recurses
 into the problem. > > Note f2fs should not be playing gam [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v3yvb-00078P-5q
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't call iput() from
 f2fs_drop_inode()
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: brauner@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, oe-lkp@lists.linux.dev,
 oliver.sang@intel.com, linux-fsdevel@vger.kernel.org, josef@toxicpanda.com,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/01, Mateusz Guzik wrote:
> iput() calls the problematic routine, which does a ->i_count inc/dec
> cycle. Undoing it with iput() recurses into the problem.
> 
> Note f2fs should not be playing games with the refcount to begin with,
> but that will be handled later. Right now solve the immediate
> regression.
> 
> Fixes: bc986b1d756482a ("fs: stop accessing ->i_count directly in f2fs and gfs2")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202509301450.138b448f-lkp@intel.com
> Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
> ---
>  fs/f2fs/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 2619cbbd7d2d..26ec31eb8c80 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1769,7 +1769,7 @@ static int f2fs_drop_inode(struct inode *inode)
>  			sb_end_intwrite(inode->i_sb);
>  
>  			spin_lock(&inode->i_lock);
> -			iput(inode);
> +			atomic_dec(&inode->i_count);

It seems this was applied by Josef [1], added in 6.18-rc1. Let me apply this fix
after my f2fs pull request, since I don't have this issue in my -next tree yet.

[1] https://lore.kernel.org/all/b8e6eb8a3e690ce082828d3580415bf70dfa93aa.1755806649.git.josef@toxicpanda.com/

>  		}
>  		trace_f2fs_drop_inode(inode, 0);
>  		return 0;
> -- 
> 2.43.0
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

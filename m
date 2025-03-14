Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6792AA61F5B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Mar 2025 22:50:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ttCvW-00070d-WF;
	Fri, 14 Mar 2025 21:50:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ttCvV-00070W-Iq
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Mar 2025 21:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GcZgsU2GtBFKXeDUFli8IPCMkoJfgdfjQKG7SDxCHUE=; b=AWoMX/4U6QlizNSW5pKWZuvHaM
 xjrfoEy5LXIJmy35z7wMQugSMgx7bJeY0/YidkgoqmpKrt0nrQmdDUiVvaeRgz49Kz1UWuHTKzuFK
 Rkx4qdgu2cHCXa4FzgYoMEVGmn2ak2LUIcLX/5kf6nsAHtCf9ENI56gYdUUkCUOboFeA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GcZgsU2GtBFKXeDUFli8IPCMkoJfgdfjQKG7SDxCHUE=; b=L5kzZ2GlZ7aSa7SMfHFHx4MbA8
 gE+9jeuGJhxLIxC6FSsPnPD2OJ2s1OoE0oE/yufKKuA7mLMty6fWunZmsI0mpXl5Agsvw1ToKJqOg
 YB8K7qV62mSYzETy2y1gK+Vk1fx1zYGvb3YygiILzruI/KJuf+pjq5grhvn4ORK2qJj4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ttCvV-0005qY-Ca for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Mar 2025 21:50:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DFF86A45424;
 Fri, 14 Mar 2025 21:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFC5C4CEE3;
 Fri, 14 Mar 2025 21:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741989034;
 bh=tmqCpcVXwWVsDWj4IBtSm1R/td472GxXq775uoQ0xnU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qANbF8Cu1Xcn7oCvxwPNdeOT/ZHfCxCwgmoR8Isv7UjmWWWmWY/ErbzgOYy5fOemv
 qRr2yztxgzDYffVUcS4wsDOqLNyftZYFd6tMwmWjT1H3ADraeeEPrP7KFKePeEhP/E
 D4wsPS2ZVPpShC37DpcZPdzndtWzM32LVQ28lJNLxfDUSe8fXvPf+V05k75kDy841D
 UbjPn/xVLt81ObHsnjxmfbKMGwp5LCakvz1bt965CWDAqHAQjOVNKlvaRmBUXLmkC+
 PPlhxF8p+9qZWKMJsin/C2ZOoUkD12sUmn3FwXN42iDTKvs3kd4AN2seNdMOuEQ2Wg
 EaYRGAttV5oiQ==
Date: Fri, 14 Mar 2025 21:50:32 +0000
To: Yeongjin Gil <youngjin.gil@samsung.com>
Message-ID: <Z9SkqFP93rWQrffm@google.com>
References: <CGME20250314120658epcas1p2d3ec037c294d4c907ce7fa2fe1c3aa27@epcas1p2.samsung.com>
 <20250314120651.443184-1-youngjin.gil@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250314120651.443184-1-youngjin.gil@samsung.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/14, Yeongjin Gil wrote: > In the case of the following
 call stack for an atomic file, > FI_DIRTY_INODE is set, but FI_ATOMIC_DIRTIED
 is not subsequently set. > > f2fs_file_write_iter > f2fs_map_ [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ttCvV-0005qY-Ca
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid atomicity corruption of
 atomic file
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
Cc: linux-f2fs-devel@lists.sourceforge.net, daehojeong@google.com,
 linux-kernel@vger.kernel.org, sj1557.seo@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/14, Yeongjin Gil wrote:
> In the case of the following call stack for an atomic file,
> FI_DIRTY_INODE is set, but FI_ATOMIC_DIRTIED is not subsequently set.
> 
> f2fs_file_write_iter
>   f2fs_map_blocks
>     f2fs_reserve_new_blocks
>       inc_valid_block_count
>         __mark_inode_dirty(dquot)
>           f2fs_dirty_inode
> 
> If FI_ATOMIC_DIRTIED is not set, atomic file can encounter corruption
> due to a mismatch between old file size and new data.
> 
> To resolve this issue, I changed to set FI_ATOMIC_DIRTIED when
> FI_DIRTY_INODE is set. This ensures that FI_DIRTY_INODE, which was
> previously cleared by the Writeback thread during the commit atomic, is
> set and i_size is updated.
> 
> Fixes: fccaa81de87e ("f2fs: prevent atomic file from being dirtied before commit")
> Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
> Reviewed-by: Sunmin Jeong <s_min.jeong@samsung.com>
> Signed-off-by: Yeongjin Gil <youngjin.gil@samsung.com>
> ---
>  fs/f2fs/inode.c | 4 +---
>  fs/f2fs/super.c | 4 ++++
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index aa2f41696a88..83f862578fc8 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -34,10 +34,8 @@ void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync)
>  	if (f2fs_inode_dirtied(inode, sync))
>  		return;
>  
> -	if (f2fs_is_atomic_file(inode)) {
> -		set_inode_flag(inode, FI_ATOMIC_DIRTIED);
> +	if (f2fs_is_atomic_file(inode))
>  		return;
> -	}
>  
>  	mark_inode_dirty_sync(inode);
>  }
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 397df271885c..c08d52c6467a 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1534,6 +1534,10 @@ int f2fs_inode_dirtied(struct inode *inode, bool sync)
>  		inc_page_count(sbi, F2FS_DIRTY_IMETA);
>  	}
>  	spin_unlock(&sbi->inode_lock[DIRTY_META]);
> +
> +	if (!ret && f2fs_is_atomic_file(inode))
> +		set_inode_flag(inode, FI_ATOMIC_DIRTIED);
> +

I'm not sure what's different here.

Before and after this patch, set_inode_flag(inode, FI_ATOMIC_DIRTIED) is called
only if f2fs_inode_dirtied() returns zero and f2fs_is_atomic_file(inode).

Note, f2fs_mark_inode_dirty_sync() looks the single caller of f2fs_inode_dirtied.


>  	return ret;
>  }
>  
> -- 
> 2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB5D114B96
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Dec 2019 05:08:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1id4v0-0006jN-MK; Fri, 06 Dec 2019 04:08:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1id4uy-0006jG-UP
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Dec 2019 04:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nj3xns2x/AlA74QkXu0IUlkm6jU1rHGT51/KYm8MWvE=; b=ETQsRBkjqgE5h4AVi9FBm+LTHZ
 FI7VqOYqqhvZnu33FQQXy96sajbcYyMg6XU52ByIXxSrmk0waWOfXIeRQXqXc+1dlyb6Qg2hC0Tu2
 H4fLdVF861tWmgTVacjB3bUSE5YskHicS7DovcgQC0kUrTwpInCBU3dYztQk4QbWeTWo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nj3xns2x/AlA74QkXu0IUlkm6jU1rHGT51/KYm8MWvE=; b=Imwrl7xnoYbCUdx1xyrArHCT/w
 Qraiemx2rOLLR+2yo8kxiPfg0oAKAqHyeRzArAaZuYoGF5VVU4viSO9pquU5aO2AiNcKf7XxVAlbC
 GgeuEOO7q9iehZ5Y7zTPmzcuW6bUMmpASw2PXAbQePpQ5sVpFakmSojJkZeG8jLUsVAM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1id4us-009Ur0-9G
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Dec 2019 04:08:36 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95F1621823;
 Fri,  6 Dec 2019 04:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575605304;
 bh=j7VIs/pP2Li7ttXFZelak/7oq+uT2fUP9Er5lq8WUk4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GGiMLRPFljplVbwHEJ4djhtj0Keydq/B2UZcK8qlSb7S0+JXXTO0pN4NsR/d+5xZO
 9u06KvCL6artBVKWPAvj9zPBC9PCtiXrNyTFStTagz1Rb3YhVkMvdmad3a1fQQmeBl
 L8dru2gtvpk005BznlEd0JOLFWqG6WmsdkMZDnqA=
Date: Thu, 5 Dec 2019 20:08:23 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20191206040823.GA33758@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191206033100.36345-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191206033100.36345-1-yuchao0@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1id4us-009Ur0-9G
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to relocate f2fs_balance_fs() in
 mkwrite()
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

Hi Chao,

I was testing this.

https://github.com/jaegeuk/f2fs/commit/76be33b9f1fce70dd2d3f04f66d0f78b418fe3f5

On 12/06, Chao Yu wrote:
> As Dinosaur Huang reported, there is a potential deadlock in between
> GC and mkwrite():
> 
> Thread A			Thread B
> - do_page_mkwrite
>  - f2fs_vm_page_mkwrite
>   - lock_page
> 				- f2fs_balance_fs
>                                  - mutex_lock(gc_mutex)
> 				 - f2fs_gc
> 				  - do_garbage_collect
> 				   - ra_data_block
> 				    - grab_cache_page
>   - f2fs_balance_fs
>    - mutex_lock(gc_mutex)
> 
> In order to fix this, we just move f2fs_balance_fs() out of page lock's
> coverage in f2fs_vm_page_mkwrite().
> 
> Reported-by: Dinosaur Huang <dinosaur.huang@unisoc.com>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/file.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index c0560d62dbee..ed3290225506 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -67,6 +67,8 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  
>  	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
>  
> +	f2fs_balance_fs(sbi, true);
> +
>  	file_update_time(vmf->vma->vm_file);
>  	down_read(&F2FS_I(inode)->i_mmap_sem);
>  	lock_page(page);
> @@ -120,8 +122,6 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  out_sem:
>  	up_read(&F2FS_I(inode)->i_mmap_sem);
>  
> -	f2fs_balance_fs(sbi, dn.node_changed);
> -
>  	sb_end_pagefault(inode->i_sb);
>  err:
>  	return block_page_mkwrite_return(err);
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 155C51BED78
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Apr 2020 03:12:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jTxk9-0007nT-Vo; Thu, 30 Apr 2020 01:12:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jTxk8-0007n6-KV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 01:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hRVJIZ1kt9O+HHoRrxtFm2LZsBppIzxxdoss52JVem4=; b=gg7Fpb7H97jQL1LC+lih/la88S
 8S3jFX2ufuyeR8ceMwEdemzw9dopf/SS/wbcjPYrvI8f41mAYCU3xRDyxIjh9HwwNv1+IfyPdd+78
 2JNmrt+vFzPYKFeiKQDUqEH2z5x6Z6lZ6A1Bnm/SgSbPCZfX4xUnRZNevMBebDjkJ0Uo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hRVJIZ1kt9O+HHoRrxtFm2LZsBppIzxxdoss52JVem4=; b=mzSAvQ8nqk0harSIfY1Dx9nnY2
 GdijB0S4+85WA1LzHx8DW2IC+eY+IWcYD01twUNhysZELBq7osoknOLrFXbbGvxm7+1Rub93FwPUg
 0VjdtUny9gdUTNF329ygSJdqyCLFsYEKgJtdVjjr8762BqYLOZn8Z0anu5WIy5UfcGEE=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jTxk5-002pya-M1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 01:11:59 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4C278CF36F6CE4FD2A34;
 Thu, 30 Apr 2020 09:11:48 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 30 Apr
 2020 09:11:45 +0800
To: Sayali Lokhande <sayalil@codeaurora.org>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <1588179630-22819-1-git-send-email-sayalil@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <7c68cd6d-d858-f80c-f258-e5e1340b9aa3@huawei.com>
Date: Thu, 30 Apr 2020 09:11:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1588179630-22819-1-git-send-email-sayalil@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jTxk5-002pya-M1
Subject: Re: [f2fs-dev] [PATCH V3] f2fs: Avoid double lock for cp_rwsem
 during checkpoint
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/4/30 1:00, Sayali Lokhande wrote:
> There could be a scenario where f2fs_sync_node_pages gets
> called during checkpoint, which in turn tries to flush
> inline data and calls iput(). This results in deadlock as
> iput() tries to hold cp_rwsem, which is already held at the
> beginning by checkpoint->block_operations().
> 
> Call stack :
> 
> Thread A		Thread B
> f2fs_write_checkpoint()
> - block_operations(sbi)
>  - f2fs_lock_all(sbi);
>   - down_write(&sbi->cp_rwsem);
> 
>                         - open()
>                          - igrab()
>                         - write() write inline data
>                         - unlink()
> - f2fs_sync_node_pages()
>  - if (is_inline_node(page))
>   - flush_inline_data()
>    - ilookup()
>      page = f2fs_pagecache_get_page()
>      if (!page)
>       goto iput_out;
>      iput_out:
> 			-close()
> 			-iput()
>        iput(inode);
>        - f2fs_evict_inode()
>         - f2fs_truncate_blocks()
>          - f2fs_lock_op()
>            - down_read(&sbi->cp_rwsem);
> 
> Fixes: 399368372ed9 ("f2fs: introduce a new global lock scheme")

IMO, it should be

2049d4fcb057 ("f2fs: avoid multiple node page writes due to inline_data")

It brings iput() to checkpoint process for the first time.

Thanks,

> Signed-off-by: Sayali Lokhande <sayalil@codeaurora.org>
> ---
>  fs/f2fs/checkpoint.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 5ba649e..97b6378 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1219,21 +1219,19 @@ static int block_operations(struct f2fs_sb_info *sbi)
>  		goto retry_flush_quotas;
>  	}
>  
> -retry_flush_nodes:
>  	down_write(&sbi->node_write);
>  
>  	if (get_pages(sbi, F2FS_DIRTY_NODES)) {
>  		up_write(&sbi->node_write);
> +		up_write(&sbi->node_change);
> +		f2fs_unlock_all(sbi);
>  		atomic_inc(&sbi->wb_sync_req[NODE]);
>  		err = f2fs_sync_node_pages(sbi, &wbc, false, FS_CP_NODE_IO);
>  		atomic_dec(&sbi->wb_sync_req[NODE]);
> -		if (err) {
> -			up_write(&sbi->node_change);
> -			f2fs_unlock_all(sbi);
> +		if (err)
>  			goto out;
> -		}
>  		cond_resched();
> -		goto retry_flush_nodes;
> +		goto retry_flush_quotas;
>  	}
>  
>  	/*
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

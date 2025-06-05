Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D5AACE853
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Jun 2025 04:24:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abclUrKd1uRqNjjEL4wkrK1onTZAfdMN5GigDsBx+Xg=; b=Cm10vcm8QS8DYnjrFZn8sqlGCN
	QlVHgP3DRThAO5M7RWEbw4Ctu8ZXmLnVGXWadhjs26Yw7CVCWn30JHuebJYQrMfm0iCDNcvKUy+gm
	eyZl1yKhnNzp0rF+1AmaBAnbc1fQC0Ykv4L/lav7t5qAwr9kuB+4etcthz46+Dg1EICM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uN0Gz-0007mu-Le;
	Thu, 05 Jun 2025 02:24:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uN0Gy-0007ml-14
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 02:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NB4VFt+nS3ywH1ZthNrle8H+PiCHEye2oMIr+P6vDnM=; b=SQTrvkZz+C6I/MHrgkoEmvmLWD
 eCeH5yn4GSDNNSgzTCqiGtoTuTSMN8kuVp0MCogdEz+b+BFFZNVp0nLh6mZ9cbuD8WTkT3MGovR7X
 UNRvaTFsYiUjk+npau/QxiXxtzfz0GypG++S5QzIri5H8qC4L8+/xg8MMb3pewYmimK4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NB4VFt+nS3ywH1ZthNrle8H+PiCHEye2oMIr+P6vDnM=; b=lG+uw/RaFzhGXmGxxB74AYsRM6
 uCMt2OpQ88GfGJwwX2ZsayQeyTJVhqIT5fG9ypwKZVYjUOMV7qA/7g4fEUg6hQePe30z7WlwOrQ0h
 ohjasPRe94BJB20WLDBRdF5LVi5wBL48WqzhZwUCOviE4NG+bSAPmypghtgv3qmCkH74=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uN0Gx-0005No-J9 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 02:24:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2515F43DF0;
 Thu,  5 Jun 2025 02:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0708AC4CEE4;
 Thu,  5 Jun 2025 02:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749090237;
 bh=/kcE555w9kFdV5l/AbRPGaf2+lFzCpzHbueTVlIUK+0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=bGAx2nZPo/ajfn9KlbrYt473bL1oTK6so6RMy1Yds3rZrSP9uIuHsP3aq+f9vxgl2
 wrUZAXhq7uryrXLXt8Jb5limPaFtfqNRxPU3PG+eoGNhoVVHn0CFUBVvmkAIdDsMW5
 DYqERjxSW6l3fLVbP7P6d/AqVRH915liUmGv+2le3ACKRPyBR2tQ2stO2YA52D6+/8
 ThYLyuieORgaWQF86u16jraYgYOSq5mtdCB3cx5KpkMwwpox6UP04BUoFWZkArOCsD
 vnsCSLpVwoSSGiNGULCRJcoQmM/S6dI0Cqkfk3jCCGUpCuE5bOVJvh/gizYFQHwE0i
 cW98ehacEXsjw==
Message-ID: <76adf905-191d-4415-a584-a79bc502bb87@kernel.org>
Date: Thu, 5 Jun 2025 10:23:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1749037059-4243-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
In-Reply-To: <1749037059-4243-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/4/25 19:37, Zhiguo Niu wrote: > The decompress_io_ctx
 may be released asynchronously after > I/O completion. If this file is deleted
 immediately after read, > and the kworker of processing post_r [...] 
 Content analysis details:   (-0.5 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uN0Gx-0005No-J9
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: fix UAF of
 f2fs_inode_info in f2fs_free_dic
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, baocong.liu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/4/25 19:37, Zhiguo Niu wrote:
> The decompress_io_ctx may be released asynchronously after
> I/O completion. If this file is deleted immediately after read,
> and the kworker of processing post_read_wq has not been executed yet
> due to high workloads, It is possible that the inode(f2fs_inode_info)
> is evicted and freed before it is used f2fs_free_dic.
> 
>     The UAF case as below:
>     Thread A                                      Thread B
>     - f2fs_decompress_end_io
>      - f2fs_put_dic
>       - queue_work
>         add free_dic work to post_read_wq
>                                                    - do_unlink
>                                                     - iput
>                                                      - evict
>                                                       - call_rcu
>     This file is deleted after read.
> 
>     Thread C                                 kworker to process post_read_wq
>     - rcu_do_batch
>      - f2fs_free_inode
>       - kmem_cache_free
>      inode is freed by rcu
>                                              - process_scheduled_works
>                                               - f2fs_late_free_dic
>                                                - f2fs_free_dic
>                                                 - f2fs_release_decomp_mem
>                                       read (dic->inode)->i_compress_algorithm
> 
> This patch use __iget before f2fs_free_dic and iput after free the dic.
> 
> Cc: Daeho Jeong <daehojeong@google.com>
> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
> ---
> v2: use __iget/iput function
> ---
>  fs/f2fs/compress.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index b3c1df9..3f0c18d 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1687,7 +1687,7 @@ static void f2fs_release_decomp_mem(struct decompress_io_ctx *dic,
>  }
>  
>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
> -		bool bypass_destroy_callback);
> +		bool bypass_destroy_callback, bool late_free);
>  
>  struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
>  {
> @@ -1743,12 +1743,12 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
>  	return dic;
>  
>  out_free:
> -	f2fs_free_dic(dic, true);
> +	f2fs_free_dic(dic, true, false);
>  	return ERR_PTR(ret);
>  }
>  
>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
> -		bool bypass_destroy_callback)
> +		bool bypass_destroy_callback, bool late_free)
>  {
>  	int i;
>  
> @@ -1775,6 +1775,8 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
>  	}
>  
>  	page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
> +	if (late_free)
> +		iput(dic->inode);
>  	kmem_cache_free(dic_entry_slab, dic);
>  }
>  
> @@ -1783,16 +1785,20 @@ static void f2fs_late_free_dic(struct work_struct *work)
>  	struct decompress_io_ctx *dic =
>  		container_of(work, struct decompress_io_ctx, free_work);
>  
> -	f2fs_free_dic(dic, false);
> +	f2fs_free_dic(dic, false, true);
>  }
>  
>  static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_task)
>  {
>  	if (refcount_dec_and_test(&dic->refcnt)) {
>  		if (in_task) {
> -			f2fs_free_dic(dic, false);
> +			f2fs_free_dic(dic, false, false);
>  		} else {
>  			INIT_WORK(&dic->free_work, f2fs_late_free_dic);
> +			/* to avoid inode is evicted simultaneously */
> +			spin_lock(&dic->inode->i_lock);
> +			__iget(dic->inode);
> +			spin_unlock(&dic->inode->i_lock);

Oh, how about using igrab() instead?

>  			queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
>  					&dic->free_work);
>  		}



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

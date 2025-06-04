Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F91ACDB60
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jun 2025 11:49:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+684vYgLhNgE7jw3cyOA1kpoitl6W3zi/6HfUwUzfI=; b=fPlhGnGVcIhEbn3zZmY6vB1r9h
	5x3RJva14s5GZGZh5g2cb4Yfsz57TnhfNK9c0XYSL2CgqAP4x2wwv5v201koVjwVD7WGZVerWlgpH
	heNbXRC63zVIm2zZA3/WZ8aa38QVBsyhaK+6GObmHUF8yO6+0sZamGdke9kOnWpBcSoI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMkjy-0008I7-R3;
	Wed, 04 Jun 2025 09:48:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uMkjy-0008I1-3L
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 09:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9m2BEyWjfFqBZ2ingQLrHJ0t+YQfK9w5vjtUSYAL6TA=; b=QbLA1cu06Xx49xyRFq+mww5Rij
 7G7XTat8+uUgeAzXSjnR7DhtBroWsboc9Ys7LvOGFKe8wJbscakXdbYuvhxbh+61Zlf6OAPwrC+Qa
 JTD/VFeexa+joAQ22XDJVwPMdig2P+mI6S5E1Lz3CG1EjVM+35UjDlBtpcx5jL0L7WME=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9m2BEyWjfFqBZ2ingQLrHJ0t+YQfK9w5vjtUSYAL6TA=; b=SeLUC5AEqaspZzFkKVstCMtre7
 T7eDcOw0x0OiI1GKt/MtpcuiWXygxxC2/7AhaYa6yzeTG8XxmbqITnMvr/G+wBo665qNs08d8WEmf
 OiuvtNU/aHM+iW5ZwaJalGZS0G20DXCvlwoKA8VZh3sLA/0cpr4uy5Md7tFmSd9BWuR4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uMkjx-0000nt-SD for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 09:48:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 207F5A5038B;
 Wed,  4 Jun 2025 09:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8741C4CEE7;
 Wed,  4 Jun 2025 09:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749030531;
 bh=pbdV4FPg+q7X6VNKgCyiuIlkd0/NfsNnQ/IoEFmOi0Q=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=LF7iY5xADR0LXMGkmm3+bM5eMGvuyWceDXQquWYHJu8o1DPGweDZUlbzSun2oxC3O
 i3kw8nB+PYnttftlV0vYg5XjKjdBopEPmcgtYqBZcBo+Nz/qSn6gsmUaz5n/PzrGhA
 JyMCaTySGc34cBPHkY6frvjDwcqawYDJuPVvJlAoGAEZVYonc7rlBOeHBpRudP1AgP
 Tzl58nSAPGh+/Q2S7eRAKjKZqtjlt1+lXQKHT9ZkktGx8M0DUapK8BLy5djzbfq1qr
 Y9a2u1fZrCbtM3LhFOva3vRDZTAZsU+qY48KDXKVAovDq/4h+Xa9EkI19YznbbyfoJ
 wA+jhVm3U4duQ==
Message-ID: <061c94ab-ff57-42e3-ad7c-592dfb2a822e@kernel.org>
Date: Wed, 4 Jun 2025 17:48:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1749016492-31835-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
In-Reply-To: <1749016492-31835-1-git-send-email-zhiguo.niu@unisoc.com>
X-Headers-End: 1uMkjx-0000nt-SD
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix UAF of f2fs_inode_info
 in f2fs_free_dic
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

On 6/4/25 13:54, Zhiguo Niu wrote:
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
> This patch increase inode->i_count before f2fs_free_dic and decrease it
> after free the dic.
> 
> Cc: Daeho Jeong <daehojeong@google.com>
> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
> ---
>  fs/f2fs/compress.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index b3c1df9..6b3b3a7 100644
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
> @@ -1775,6 +1775,11 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
>  	}
>  
>  	page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
> +	if (late_free) {
> +		spin_lock(&dic->inode->i_lock);
> +		atomic_dec(&dic->inode->i_count);
> +		spin_unlock(&dic->inode->i_lock);

If it is the last one release i_count, it needs to call iput_final to evict inode
like what iput did, so we'd better to call iput() here?

> +	}
>  	kmem_cache_free(dic_entry_slab, dic);
>  }
>  
> @@ -1783,16 +1788,20 @@ static void f2fs_late_free_dic(struct work_struct *work)
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
> +			atomic_inc(&dic->inode->i_count);
> +			spin_unlock(&dic->inode->i_lock);

iget()?

BTW, can we store i_compress_algorithm in dic to avoid inode access?

Thanks,

>  			queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
>  					&dic->free_work);
>  		}



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

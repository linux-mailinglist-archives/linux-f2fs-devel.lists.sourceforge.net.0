Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB654AD3E5B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 18:08:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jY9STrpC1Xf1UJIC5AcjCQ+YRUyciPL1vOvJRpXTd00=; b=B6hQcGn54xB193QZz6m8l7Qis/
	XegCf26yk5DA8IknBQc+Nn8+SiYH1Hzsp/OI2hdkZDGnOr1MKy7aaDOvN7zvYICFYMHDIYedMZyO3
	gzIISfDJvgRdZhTvI2R0hJ5u7N/X9QTaX7J9972napA8rBoGoNt7CgBor+Q052evk99I=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP1Wt-0006MD-D6;
	Tue, 10 Jun 2025 16:08:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uP1Wk-0006LT-Qq
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 16:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IN4jj/Y5sS3aHIqwno2PiQzDWLwYBHbc46T16vluFhw=; b=WsyWWQ1QsZ19A3FLxeq2x6N4qU
 U1eXgniTJKOq1QDcfyHIjVx+6lx1fNkm+uVHZW04cSgiHk2NIlf2bHHoPZhwB2Uzd2+yx3mITSliQ
 GvKWPbj+7oLH3wWchQhq7+mvK2OtVIZ/izCNn7nMaJN4B3VSNKDTEmUhDFYnL8sGdlNY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IN4jj/Y5sS3aHIqwno2PiQzDWLwYBHbc46T16vluFhw=; b=kJrdwVPvZIVMNkgtDXSuFafvw3
 kKM2/j5mWOGkAY6lQqZiyg1i+lfNVL6i+q8Mv4jxuSWrhFDCiVwe+SttmUanwFbkS8ymhhfImUr2G
 mGppCTLgUPtrKOHg7RGx0IpZ008jWKm9WoyPe5GaOb2sskRSt5v0uf8oXGRkEsE4Qibc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uP1Wk-00014h-Bb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 16:08:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DB0FA44BA6;
 Tue, 10 Jun 2025 16:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E0FC4CEF0;
 Tue, 10 Jun 2025 16:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749571711;
 bh=USwOIsVhkg9+A/PdAnwHxSXCbsHxApVOGy15tnigTpU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nMzYR96Fynzp3sQAzKNWvM5Z4VgwmmPLWIhJsUYmsy632UmWgluCPVruUCW6sRvuO
 s3ZyevWiEH3dmLRdHDKHapVNOpma34dD8NOmucqRnJ20rhQQ+vtuhxLO/OzoOykJxG
 PNREOVlBcNi4q2tcXQYOr0mn4n+hSmHDY4ngMku0BOwuBhHghpKe7VMvS9uWTsP7tT
 FnYawbySQa/ft0EgIJ07c5qwF86yMNM0taB/e/FS9EWI9qDEqMP9hgsPfLDs5afBPm
 +96kG9e0pWOrQoG/K6D4JaZsHW7ffVY/F7JIvQvAQQDGvoT3sCYkoo8g0tvsw88MYI
 Q7BPA5VdsuAiA==
Date: Tue, 10 Jun 2025 16:08:29 +0000
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
Message-ID: <aEhYfYrknbNzT8Or@google.com>
References: <1749107920-17958-1-git-send-email-zhiguo.niu@unisoc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1749107920-17958-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Zhiguo, This patch causes CPU hang when running fsstress
 on compressed/non-compressed files. Please check. On 06/05, Zhiguo Niu wrote:
 > The decompress_io_ctx may be released asynchronously after > I/O completion.
 If this file is deleted immediately after read, > and the kworker of processing
 post_read_wq [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uP1Wk-00014h-Bb
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: compress: fix UAF of
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, baocong.liu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Zhiguo,

This patch causes CPU hang when running fsstress on compressed/non-compressed
files. Please check.

On 06/05, Zhiguo Niu wrote:
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
> This patch use igrab before f2fs_free_dic and iput after free the dic when dic free
> action is done by kworker.
> 
> Cc: Daeho Jeong <daehojeong@google.com>
> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
> ---
> v3: use igrab to replace __iget
> v2: use __iget/iput function
> ---
>  fs/f2fs/compress.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index b3c1df9..729ad16 100644
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
> @@ -1783,16 +1785,18 @@ static void f2fs_late_free_dic(struct work_struct *work)
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
> +			/* use igrab to avoid inode is evicted simultaneously */
> +			f2fs_bug_on(F2FS_I_SB(dic->inode), !igrab(dic->inode));
>  			queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
>  					&dic->free_work);
>  		}
> -- 
> 1.9.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

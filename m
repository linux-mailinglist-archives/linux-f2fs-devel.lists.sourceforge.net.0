Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE5B5BBD7B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 18 Sep 2022 12:48:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oZrqr-0001WI-61;
	Sun, 18 Sep 2022 10:48:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oZrqa-0001W6-U1
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 18 Sep 2022 10:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hav2ja+QwUqwe/fS9SSclF4glzknk/fmFFpOa+7eAd4=; b=L2zpFLfCLfBb4oW3ImIt/NPDV0
 un6yPO5Ekqmgt3XmNO5ON+QdyMbM3FRiL8OU52vtZ49B7ly5pup03/h7845fjQ0mN9jlgLx4Jvz4G
 sVbNZGaEx9KfVgEUQBpUJNtRppjaB2KdIs6aqexsMqvc1K+14zhbHgAtOfm2Te9oblrA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hav2ja+QwUqwe/fS9SSclF4glzknk/fmFFpOa+7eAd4=; b=VrDtMKSNm9v/FuddZiQ7bLqR7d
 rPBBmnj8J7kfJu/mYn3h61hEkcVu7jTDjant6amXasbF4a+AthY0Mo9P2v657RXMn41T1Bl+OVVe7
 XSupfOUcHsZdUx2f52kVkQXdeSM9AJx2ABUxZQgMcUnWK2pRZC8G/2idwUh+HNbjj4q8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oZrqm-00C6nj-Ti for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 18 Sep 2022 10:48:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7621260BEF;
 Sun, 18 Sep 2022 10:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C6CC433C1;
 Sun, 18 Sep 2022 10:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663498110;
 bh=mHXwss8AvGFfzH1zbrAtSDXL0mmfUrttukh+3azXyns=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=df6eT4BkNlPT+ttFY6HGanIjPyTCofRqoN8uQPfX5ji++fXtDqsWUuhVlKArcpZZg
 wPp3HsdHzaq88ZOV0IS+BQwgT+JaSG0/f4PR2hbKITd1y60csjA24BfHLs3jeTNme8
 NFOojeMwZLsi1sLCW2liJvNi7wgLGtp8xG6iSwXR32WbrXvgrKvbQvs4TCD1FwkmEg
 S+5TYlk/LgcU+afRDv9OJY9IPTecx5oFqHNM/nwULKqs+9ZBKZVyEmGX3A7ei4uBR7
 h/Gv8Vs9N5v+mh9Jfo3fv85IoVLGVuvHq3bpEHeJsttjL6ur0dWrtJvxNZZSVY6H2t
 0rrGMfuFt3y5Q==
Message-ID: <2f5e8d93-ea68-70cf-4c9b-07a8bbc3220b@kernel.org>
Date: Sun, 18 Sep 2022 18:48:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, jaegeuk@kernel.org
References: <20220915134408.69886-1-zhangqilong3@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220915134408.69886-1-zhangqilong3@huawei.com>
X-Spam-Score: -8.9 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/15 21:44,
 Zhang Qilong wrote: > For f2fs_update_extent_tree_range_compressed, 
 keeping > the trace and function name consistent to distinguish > from trace
 of f2fs_update_extent_tree_range. A [...] 
 Content analysis details:   (-8.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -3.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oZrqm-00C6nj-Ti
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: add a trace interface for
 f2fs_update_extent_tree_range_compressed
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/9/15 21:44, Zhang Qilong wrote:
> For f2fs_update_extent_tree_range_compressed, keeping
> the trace and function name consistent to distinguish
> from trace of f2fs_update_extent_tree_range. And we add
> "c_len" into the trace, result like:
> 
>    [003] .....   228.568157: f2fs_update_extent_tree_range_compressed:
>                  dev = (8,0), ino = 5, pgofs = 96, blkaddr = 2548760,
>                  len = 4, c_len = 1
> 
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>   fs/f2fs/extent_cache.c      |  2 +-
>   include/trace/events/f2fs.h | 36 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index 761fd42c93f2..df41eca6386a 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -675,7 +675,7 @@ void f2fs_update_extent_tree_range_compressed(struct inode *inode,
>   	struct rb_node **insert_p = NULL, *insert_parent = NULL;
>   	bool leftmost = false;
>   
> -	trace_f2fs_update_extent_tree_range(inode, fofs, blkaddr, llen);
> +	trace_f2fs_update_extent_tree_range_compressed(inode, fofs, blkaddr, llen, c_len);
>   
>   	/* it is safe here to check FI_NO_EXTENT w/o et->lock in ro image */
>   	if (is_inode_flag_set(inode, FI_NO_EXTENT))
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index b262985f0c3a..54a9f6feca1b 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -1606,6 +1606,42 @@ TRACE_EVENT(f2fs_update_extent_tree_range,
>   		__entry->len)
>   );
>   
> +TRACE_EVENT(f2fs_update_extent_tree_range_compressed,

Why not adding parameter c_len in trace_f2fs_update_extent_tree_range()
to avoid duplicated codes...

Thanks,

> +
> +	TP_PROTO(struct inode *inode, unsigned int pgofs, block_t blkaddr,
> +						unsigned int len,
> +						unsigned int c_len),
> +
> +	TP_ARGS(inode, pgofs, blkaddr, len, c_len),
> +
> +	TP_STRUCT__entry(
> +		__field(dev_t,	dev)
> +		__field(ino_t,	ino)
> +		__field(unsigned int, pgofs)
> +		__field(u32, blk)
> +		__field(unsigned int, len)
> +		__field(unsigned int, c_len)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->dev = inode->i_sb->s_dev;
> +		__entry->ino = inode->i_ino;
> +		__entry->pgofs = pgofs;
> +		__entry->blk = blkaddr;
> +		__entry->len = len;
> +		__entry->c_len = c_len;
> +	),
> +
> +	TP_printk("dev = (%d,%d), ino = %lu, pgofs = %u, "
> +					"blkaddr = %u, len = %u, "
> +					"c_len = %u",
> +		show_dev_ino(__entry),
> +		__entry->pgofs,
> +		__entry->blk,
> +		__entry->len,
> +		__entry->c_len)
> +);
> +
>   TRACE_EVENT(f2fs_shrink_extent_tree,
>   
>   	TP_PROTO(struct f2fs_sb_info *sbi, unsigned int node_cnt,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

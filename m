Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4016F4FFBFB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Apr 2022 19:01:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1negMi-0004vb-LI; Wed, 13 Apr 2022 17:01:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1negMh-0004vU-8M
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 17:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dN2N7aA3DJYmT+OggU2t2VcCqtr9N3Gc19vFyfChO5c=; b=a0Vh9T6vXlOgoQOkj97muMXbpL
 k8O6GJ+MaGXVEfwoz24n8mmM5ph4kf6bhpzCzOFPeVMxgV6zb1M9EjPjCSAsJP0Tfqki0uVwwyZsz
 WNZBXWg60SzB90zd8JRQrT8c/Hu8H6SxZ7lfhjh+h5hM8i5hHcuNFdU4ZwdIkEfu0Oqw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dN2N7aA3DJYmT+OggU2t2VcCqtr9N3Gc19vFyfChO5c=; b=EU8oYuQbmRD21OZHjqSkJ7lCy/
 JGrKG5p093VtKuDBPU9S8K3+pZc4cb3s9dM/dFLZ7PAWgV/MknoLHgLkFO5AJXBha+dl6AXnjseMj
 2EV0ZW0cznSpwjpEdwirXq+UFCAQBk93g9aycLIjrg/e48dvpfl0Yp9as8W0C/2fxP3s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1negMa-00FP0y-T4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 17:01:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74DC661E87;
 Wed, 13 Apr 2022 17:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8143C385A4;
 Wed, 13 Apr 2022 17:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649869254;
 bh=wo3Wo9GrccRUNVNFdx4h+0W9/sxWbdIkUAXNTds8zzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LiH2UC/zXex0HeGiA9EV5VGeZ+86nnNRaHVKQHN0dhG22QaE5kgi+8s6YBJhfdawQ
 k5v2Y4YF4dIuPu/JlI1jEiSE3gUhDdgMKf+PXTmgaAcKiPH8oN+pTPlSfAT4082pxK
 Bdz+CDOFxhZ6T9ggxCD5DZ8gKQCde8dqXLUkH0tqwWGNhlMw+jl/KTGrK1oy8l6YHz
 j5eQ0o5h7gjPtE8L8aLIkZaKpGcXruhkUR+OK1Mig8/5RN88RFcs1pIK7Cp3uw/YKf
 V3S1Ha8NH4ouExHOwsYRheyZfqu0uyL728O+42/WTISlHfevoGSh76IjqqzqF3SXSM
 p7dMicmAElWxw==
Date: Wed, 13 Apr 2022 10:00:53 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Rokudo Yan <wu-yan@tcl.com>
Message-ID: <YlcBxSA5qYN4z1ia@google.com>
References: <20220413084432.1312900-1-wu-yan@tcl.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220413084432.1312900-1-wu-yan@tcl.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/13, Rokudo Yan wrote: > There is a potential deadlock
 in gc thread may happen > under low memory as below: > > gc_thread_func >
 -f2fs_gc > -do_garbage_collect > -gc_data_segment > -move_data_blo [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1negMa-00FP0y-T4
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid deadlock in gc thread under low
 memory
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
Cc: tang.ding@tcl.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/13, Rokudo Yan wrote:
> There is a potential deadlock in gc thread may happen
> under low memory as below:
> 
> gc_thread_func
>  -f2fs_gc
>   -do_garbage_collect
>    -gc_data_segment
>     -move_data_block
>      -set_page_writeback(fio.encrypted_page);
>      -f2fs_submit_page_write
> as f2fs_submit_page_write try to do io merge when possible, so the
> encrypted_page is marked PG_writeback but may not submit to block
> layer immediately, if system enter low memory when gc thread try
> to move next data block, it may do direct reclaim and enter fs layer
> as below:
>    -move_data_block
>     -f2fs_grab_cache_page(index=?, for_write=false)
>      -grab_cache_page
>       -find_or_create_page
>        -pagecache_get_page
>         -__page_cache_alloc --  __GFP_FS is set
>          -alloc_pages_node
>           -__alloc_pages
>            -__alloc_pages_slowpath
>             -__alloc_pages_direct_reclaim
>              -__perform_reclaim
>               -try_to_free_pages
>                -do_try_to_free_pages
>                 -shrink_zones
>                  -mem_cgroup_soft_limit_reclaim
>                   -mem_cgroup_soft_reclaim
>                    -mem_cgroup_shrink_node
>                     -shrink_node_memcg
>                      -shrink_list
>                       -shrink_inactive_list
>                        -shrink_page_list
>                         -wait_on_page_writeback -- the page is marked
>                        writeback during previous move_data_block call
> 
> the gc thread wait for the encrypted_page writeback complete,
> but as gc thread held sbi->gc_lock, the writeback & sync thread
> may blocked waiting for sbi->gc_lock, so the bio contain the
> encrypted_page may nerver submit to block layer and complete the
> writeback, which cause deadlock. To avoid this deadlock condition,
> we mark the gc thread with PF_MEMALLOC_NOFS flag, then it will nerver
> enter fs layer when try to alloc cache page during move_data_block.
> 
> Signed-off-by: Rokudo Yan <wu-yan@tcl.com>
> ---
>  fs/f2fs/gc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index e020804f7b07..cc71f77b98c8 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -38,6 +38,12 @@ static int gc_thread_func(void *data)
>  
>  	wait_ms = gc_th->min_sleep_time;
>  
> +	/*
> +	 * Make sure that no allocations from gc thread will ever
> +	 * recurse to the fs layer to avoid deadlock as it will
> +	 * hold sbi->gc_lock during garbage collection
> +	 */
> +	memalloc_nofs_save();

I think this cannot cover all the f2fs_gc() call cases. Can we just avoid by:

--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1233,7 +1233,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
                                CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;

        /* do not read out */
-       page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
+       page = f2fs_grab_cache_page(inode->i_mapping, bidx, true);
        if (!page)
                return -ENOMEM;

Thanks,

>  	set_freezable();
>  	do {
>  		bool sync_mode, foreground = false;
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 522945773AF
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Jul 2022 05:23:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oCusC-0002Xm-UL; Sun, 17 Jul 2022 03:23:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oCusA-0002Xc-Qq
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 03:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=teqDjbEBEjn5XhKfQu1Ah+tHJ+JPV42s0IRoYrLAem8=; b=mspcCAWjjiahO5XygRrETrAqhN
 OCEWJUCx53t2f7MeqZL7N7u9EZvYOSMCjM4bVaXBWezzz3az7ur5GtGDGkUo0906COOFLD34p/fZG
 528WZqlT5d3NVEuhfKrcQoK7O8mVh1+UtgG9PdQeF81KO3fsfuZxrbIUdU6MOdaks5yc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=teqDjbEBEjn5XhKfQu1Ah+tHJ+JPV42s0IRoYrLAem8=; b=ktNu7Or7amCxskAOJmUIPXcp2V
 M9431EmC7XjLy1d4DMlUUlX4j5Ed8DWG97EuX6AAU9/kZ6FIdgzNNU/f8/pM6xYUtWkzyLdX2WqWV
 17wxElO812KztmmcK21AqzpPb++rVUpsh2hYBEadWZernmIC/ZG8HUdqNChA0RYH25Gw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oCurw-0004tw-RB
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 03:23:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 86918B80D21;
 Sun, 17 Jul 2022 03:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5EDC341C6;
 Sun, 17 Jul 2022 03:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658028168;
 bh=P06XfQBj1+UBaNpA2IbYm4dPtlzSjJukCXg5o2u2im8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BhooycgVqR9eb4qY7Wxt+HPoZ+z9jFkhbwmmMiXsX8olmq0g0Jveatn34O55qagd+
 K8J+tuthF9Ej+3codUttEYjgxdvx0swzEbke29ZH5syypX3+3BQswj2WzeeoWuORTo
 57pZeL1OdKPA+Ns48gmx1QonBrVVcRu5Qf1LjQJyS+pU1bO4CBb/JuaiZAtVl1xI4k
 9FGNwIAgs7OQ3JqOVAtODiXOX5BnZ9iZI+AhK14dmRGP8ZRzBEM1mEIY6mKQRfvJLq
 yBkesip9+/pKaeBUP9OknL6IVevYKOQ4ynRt9IPKHVVTvkdXTFZqoh6k/QaPaLUJwt
 0tB4wXpWLguIw==
Message-ID: <279827c1-734b-829c-72ca-aa5233b8165c@kernel.org>
Date: Sun, 17 Jul 2022 11:22:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daeho43@gmail.com>
References: <20220620173843.1462198-1-daeho43@gmail.com>
 <20220620173843.1462198-2-daeho43@gmail.com> <YrHs3K/MHSAKzG2s@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YrHs3K/MHSAKzG2s@google.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/22 0:07, Jaegeuk Kim wrote: > Can we do like this
 which has no functional change but refactored > some functions? > > --- >
 fs/f2fs/compress.c | 208 ++++++++++++++++++++++++++++ [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oCurw-0004tw-RB
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: handle decompress only post
 processing in softirq
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
Cc: linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/22 0:07, Jaegeuk Kim wrote:
> Can we do like this which has no functional change but refactored
> some functions?
> 
> ---
>   fs/f2fs/compress.c | 208 ++++++++++++++++++++++++++++-----------------
>   fs/f2fs/data.c     |  52 ++++++++----
>   fs/f2fs/f2fs.h     |  17 ++--
>   3 files changed, 172 insertions(+), 105 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index fa237e5c7173..494ce3634b62 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -729,28 +729,18 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
>   	return ret;
>   }
>   
> -void f2fs_decompress_cluster(struct decompress_io_ctx *dic)
> +static int f2fs_prepare_decomp_mem(struct decompress_io_ctx *dic, bool end_io)
>   {
> -	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
> -	struct f2fs_inode_info *fi = F2FS_I(dic->inode);
>   	const struct f2fs_compress_ops *cops =
> -			f2fs_cops[fi->i_compress_algorithm];
> -	int ret;
> +		f2fs_cops[F2FS_I(dic->inode)->i_compress_algorithm];
>   	int i;
>   
> -	trace_f2fs_decompress_pages_start(dic->inode, dic->cluster_idx,
> -				dic->cluster_size, fi->i_compress_algorithm);
> -
> -	if (dic->failed) {
> -		ret = -EIO;
> -		goto out_end_io;
> -	}
> +	if (!(end_io ^ f2fs_low_mem_mode(F2FS_I_SB(dic->inode))))

How about using allow_decompress_in_softirq() to wrap !f2fs_low_mem_mode()
to improve readability?

> +		return 0;
>   
>   	dic->tpages = page_array_alloc(dic->inode, dic->cluster_size);
> -	if (!dic->tpages) {
> -		ret = -ENOMEM;
> -		goto out_end_io;
> -	}
> +	if (!dic->tpages)
> +		return 1;

return -ENOMEM instead of magic number.

>   
>   	for (i = 0; i < dic->cluster_size; i++) {
>   		if (dic->rpages[i]) {
> @@ -759,28 +749,100 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic)
>   		}
>   
>   		dic->tpages[i] = f2fs_compress_alloc_page();
> -		if (!dic->tpages[i]) {
> -			ret = -ENOMEM;
> -			goto out_end_io;
> -		}
> +		if (!dic->tpages[i])
> +			return 1;

Ditto,

>   	}
>   
> +	dic->rbuf = f2fs_vmap(dic->tpages, dic->cluster_size);
> +	if (!dic->rbuf)
> +		return 1;

Ditto,

> +
> +	dic->cbuf = f2fs_vmap(dic->cpages, dic->nr_cpages);
> +	if (!dic->cbuf)
> +		return 1;

Ditto,

> +
> +	cops = f2fs_cops[F2FS_I(dic->inode)->i_compress_algorithm];

No need to assign cops again?

>   	if (cops->init_decompress_ctx) {
> -		ret = cops->init_decompress_ctx(dic);
> +		int ret = cops->init_decompress_ctx(dic);
> +
>   		if (ret)
> -			goto out_end_io;
> +			return 1;

How about returning ret here instead of magic number?

>   	}
>   
> -	dic->rbuf = f2fs_vmap(dic->tpages, dic->cluster_size);
> -	if (!dic->rbuf) {
> -		ret = -ENOMEM;
> -		goto out_destroy_decompress_ctx;
> +	return 0;
> +}
> +
> +static void f2fs_release_decomp_mem(struct decompress_io_ctx *dic,
> +		bool bypass_destroy_callback, bool end_io)
> +{
> +	const struct f2fs_compress_ops *cops =
> +		f2fs_cops[F2FS_I(dic->inode)->i_compress_algorithm];
> +
> +	if (end_io ^ f2fs_low_mem_mode(F2FS_I_SB(dic->inode)))
> +		return;
> +
> +	if (!bypass_destroy_callback && cops->destroy_decompress_ctx)
> +		cops->destroy_decompress_ctx(dic);
> +
> +	if (dic->cbuf)
> +		vm_unmap_ram(dic->cbuf, dic->nr_cpages);
> +
> +	if (dic->rbuf)
> +		vm_unmap_ram(dic->rbuf, dic->cluster_size);
> +}
> +
> +static void f2fs_free_dic(struct decompress_io_ctx *dic,
> +		bool bypass_destroy_callback)
> +{
> +	int i;
> +
> +	f2fs_release_decomp_mem(dic, bypass_destroy_callback, false);
> +
> +	if (dic->tpages) {
> +		for (i = 0; i < dic->cluster_size; i++) {
> +			if (dic->rpages[i])
> +				continue;
> +			if (!dic->tpages[i])
> +				continue;
> +			f2fs_compress_free_page(dic->tpages[i]);
> +		}
> +		page_array_free(dic->inode, dic->tpages, dic->cluster_size);
>   	}
>   
> -	dic->cbuf = f2fs_vmap(dic->cpages, dic->nr_cpages);
> -	if (!dic->cbuf) {
> +	if (dic->cpages) {
> +		for (i = 0; i < dic->nr_cpages; i++) {
> +			if (!dic->cpages[i])
> +				continue;
> +			f2fs_compress_free_page(dic->cpages[i]);
> +		}
> +		page_array_free(dic->inode, dic->cpages, dic->nr_cpages);
> +	}
> +
> +	page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
> +	kmem_cache_free(dic_entry_slab, dic);
> +}
> +
> +void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
> +	struct f2fs_inode_info *fi = F2FS_I(dic->inode);
> +	const struct f2fs_compress_ops *cops =
> +			f2fs_cops[fi->i_compress_algorithm];
> +	bool bypass_callback = false;
> +	int ret;
> +
> +	trace_f2fs_decompress_pages_start(dic->inode, dic->cluster_idx,
> +				dic->cluster_size, fi->i_compress_algorithm);
> +
> +	if (dic->failed) {
> +		ret = -EIO;
> +		goto out_end_io;
> +	}
> +
> +	if (f2fs_prepare_decomp_mem(dic, true)) {
> +		bypass_callback = true;
>   		ret = -ENOMEM;
> -		goto out_vunmap_rbuf;
> +		goto out_release;
>   	}
>   
>   	dic->clen = le32_to_cpu(dic->cbuf->clen);
> @@ -788,7 +850,7 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic)
>   
>   	if (dic->clen > PAGE_SIZE * dic->nr_cpages - COMPRESS_HEADER_SIZE) {
>   		ret = -EFSCORRUPTED;
> -		goto out_vunmap_cbuf;
> +		goto out_release;
>   	}
>   
>   	ret = cops->decompress_pages(dic);
> @@ -809,17 +871,13 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic)
>   		}
>   	}
>   
> -out_vunmap_cbuf:
> -	vm_unmap_ram(dic->cbuf, dic->nr_cpages);
> -out_vunmap_rbuf:
> -	vm_unmap_ram(dic->rbuf, dic->cluster_size);
> -out_destroy_decompress_ctx:
> -	if (cops->destroy_decompress_ctx)
> -		cops->destroy_decompress_ctx(dic);
> +out_release:
> +	f2fs_release_decomp_mem(dic, bypass_callback, true);
> +
>   out_end_io:
>   	trace_f2fs_decompress_pages_end(dic->inode, dic->cluster_idx,
>   							dic->clen, ret);
> -	f2fs_decompress_end_io(dic, ret);
> +	f2fs_decompress_end_io(dic, ret, in_task);
>   }
>   
>   /*
> @@ -829,7 +887,7 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic)
>    * (or in the case of a failure, cleans up without actually decompressing).
>    */
>   void f2fs_end_read_compressed_page(struct page *page, bool failed,
> -						block_t blkaddr)
> +		block_t blkaddr, bool in_task)
>   {
>   	struct decompress_io_ctx *dic =
>   			(struct decompress_io_ctx *)page_private(page);
> @@ -839,12 +897,12 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
>   
>   	if (failed)
>   		WRITE_ONCE(dic->failed, true);
> -	else if (blkaddr)
> +	else if (blkaddr && in_task)
>   		f2fs_cache_compressed_page(sbi, page,
>   					dic->inode->i_ino, blkaddr);
>   
>   	if (atomic_dec_and_test(&dic->remaining_pages))
> -		f2fs_decompress_cluster(dic);
> +		f2fs_decompress_cluster(dic, in_task);
>   }
>   
>   static bool is_page_in_cluster(struct compress_ctx *cc, pgoff_t index)
> @@ -1552,16 +1610,14 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
>   	return err;
>   }
>   
> -static void f2fs_free_dic(struct decompress_io_ctx *dic);
> -
>   struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
>   {
>   	struct decompress_io_ctx *dic;
>   	pgoff_t start_idx = start_idx_of_cluster(cc);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
>   	int i;
>   
> -	dic = f2fs_kmem_cache_alloc(dic_entry_slab, GFP_F2FS_ZERO,
> -					false, F2FS_I_SB(cc->inode));
> +	dic = f2fs_kmem_cache_alloc(dic_entry_slab, GFP_F2FS_ZERO, false, sbi);
>   	if (!dic)
>   		return ERR_PTR(-ENOMEM);
>   
> @@ -1602,52 +1658,43 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
>   		dic->cpages[i] = page;
>   	}
>   
> +	if (f2fs_prepare_decomp_mem(dic, false))
> +		goto out_free;
> +
>   	return dic;
>   
>   out_free:
> -	f2fs_free_dic(dic);
> +	f2fs_free_dic(dic, true);
>   	return ERR_PTR(-ENOMEM);
>   }
>   
> -static void f2fs_free_dic(struct decompress_io_ctx *dic)
> +static void f2fs_late_free_dic(struct work_struct *work)
>   {
> -	int i;
> -
> -	if (dic->tpages) {
> -		for (i = 0; i < dic->cluster_size; i++) {
> -			if (dic->rpages[i])
> -				continue;
> -			if (!dic->tpages[i])
> -				continue;
> -			f2fs_compress_free_page(dic->tpages[i]);
> -		}
> -		page_array_free(dic->inode, dic->tpages, dic->cluster_size);
> -	}
> -
> -	if (dic->cpages) {
> -		for (i = 0; i < dic->nr_cpages; i++) {
> -			if (!dic->cpages[i])
> -				continue;
> -			f2fs_compress_free_page(dic->cpages[i]);
> -		}
> -		page_array_free(dic->inode, dic->cpages, dic->nr_cpages);
> -	}
> +	struct decompress_io_ctx *dic =
> +		container_of(work, struct decompress_io_ctx, free_work);
>   
> -	page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
> -	kmem_cache_free(dic_entry_slab, dic);
> +	f2fs_free_dic(dic, false);
>   }
>   
> -static void f2fs_put_dic(struct decompress_io_ctx *dic)
> +static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_task)
>   {
> -	if (refcount_dec_and_test(&dic->refcnt))
> -		f2fs_free_dic(dic);
> +	if (refcount_dec_and_test(&dic->refcnt)) {
> +		if (in_task) {
> +			f2fs_free_dic(dic, false);
> +		} else {
> +			INIT_WORK(&dic->free_work, f2fs_late_free_dic);
> +			queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
> +					&dic->free_work);
> +		}
> +	}
>   }
>   
>   /*
>    * Update and unlock the cluster's pagecache pages, and release the reference to
>    * the decompress_io_ctx that was being held for I/O completion.
>    */
> -static void __f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed)
> +static void __f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
> +				bool in_task)
>   {
>   	int i;
>   
> @@ -1668,7 +1715,7 @@ static void __f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed)
>   		unlock_page(rpage);
>   	}
>   
> -	f2fs_put_dic(dic);
> +	f2fs_put_dic(dic, in_task);
>   }
>   
>   static void f2fs_verify_cluster(struct work_struct *work)
> @@ -1685,14 +1732,15 @@ static void f2fs_verify_cluster(struct work_struct *work)
>   			SetPageError(rpage);
>   	}
>   
> -	__f2fs_decompress_end_io(dic, false);
> +	__f2fs_decompress_end_io(dic, false, true);
>   }
>   
>   /*
>    * This is called when a compressed cluster has been decompressed
>    * (or failed to be read and/or decompressed).
>    */
> -void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed)
> +void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
> +				bool in_task)
>   {
>   	if (!failed && dic->need_verity) {
>   		/*
> @@ -1704,7 +1752,7 @@ void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed)
>   		INIT_WORK(&dic->verity_work, f2fs_verify_cluster);
>   		fsverity_enqueue_verify_work(&dic->verity_work);
>   	} else {
> -		__f2fs_decompress_end_io(dic, failed);
> +		__f2fs_decompress_end_io(dic, failed, in_task);
>   	}
>   }
>   
> @@ -1713,12 +1761,12 @@ void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed)
>    *
>    * This is called when the page is no longer needed and can be freed.
>    */
> -void f2fs_put_page_dic(struct page *page)
> +void f2fs_put_page_dic(struct page *page, bool in_task)
>   {
>   	struct decompress_io_ctx *dic =
>   			(struct decompress_io_ctx *)page_private(page);
>   
> -	f2fs_put_dic(dic);
> +	f2fs_put_dic(dic, in_task);
>   }
>   
>   /*
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 7fcbcf979737..c448c3ee7ac3 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -119,7 +119,7 @@ struct bio_post_read_ctx {
>   	block_t fs_blkaddr;
>   };
>   
> -static void f2fs_finish_read_bio(struct bio *bio)
> +static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
>   {
>   	struct bio_vec *bv;
>   	struct bvec_iter_all iter_all;
> @@ -133,8 +133,9 @@ static void f2fs_finish_read_bio(struct bio *bio)
>   
>   		if (f2fs_is_compressed_page(page)) {
>   			if (bio->bi_status)
> -				f2fs_end_read_compressed_page(page, true, 0);
> -			f2fs_put_page_dic(page);
> +				f2fs_end_read_compressed_page(page, true, 0,
> +							in_task);
> +			f2fs_put_page_dic(page, in_task);
>   			continue;
>   		}
>   
> @@ -191,7 +192,7 @@ static void f2fs_verify_bio(struct work_struct *work)
>   		fsverity_verify_bio(bio);
>   	}
>   
> -	f2fs_finish_read_bio(bio);
> +	f2fs_finish_read_bio(bio, true);
>   }
>   
>   /*
> @@ -203,7 +204,7 @@ static void f2fs_verify_bio(struct work_struct *work)
>    * can involve reading verity metadata pages from the file, and these verity
>    * metadata pages may be encrypted and/or compressed.
>    */
> -static void f2fs_verify_and_finish_bio(struct bio *bio)
> +static void f2fs_verify_and_finish_bio(struct bio *bio, bool in_task)
>   {
>   	struct bio_post_read_ctx *ctx = bio->bi_private;
>   
> @@ -211,7 +212,7 @@ static void f2fs_verify_and_finish_bio(struct bio *bio)
>   		INIT_WORK(&ctx->work, f2fs_verify_bio);
>   		fsverity_enqueue_verify_work(&ctx->work);
>   	} else {
> -		f2fs_finish_read_bio(bio);
> +		f2fs_finish_read_bio(bio, in_task);
>   	}
>   }
>   
> @@ -224,7 +225,8 @@ static void f2fs_verify_and_finish_bio(struct bio *bio)
>    * that the bio includes at least one compressed page.  The actual decompression
>    * is done on a per-cluster basis, not a per-bio basis.
>    */
> -static void f2fs_handle_step_decompress(struct bio_post_read_ctx *ctx)
> +static void f2fs_handle_step_decompress(struct bio_post_read_ctx *ctx,
> +		bool in_task)
>   {
>   	struct bio_vec *bv;
>   	struct bvec_iter_all iter_all;
> @@ -237,7 +239,7 @@ static void f2fs_handle_step_decompress(struct bio_post_read_ctx *ctx)
>   		/* PG_error was set if decryption failed. */
>   		if (f2fs_is_compressed_page(page))
>   			f2fs_end_read_compressed_page(page, PageError(page),
> -						blkaddr);
> +						blkaddr, in_task);
>   		else
>   			all_compressed = false;
>   
> @@ -262,15 +264,16 @@ static void f2fs_post_read_work(struct work_struct *work)
>   		fscrypt_decrypt_bio(ctx->bio);
>   
>   	if (ctx->enabled_steps & STEP_DECOMPRESS)
> -		f2fs_handle_step_decompress(ctx);
> +		f2fs_handle_step_decompress(ctx, true);
>   
> -	f2fs_verify_and_finish_bio(ctx->bio);
> +	f2fs_verify_and_finish_bio(ctx->bio, true);
>   }
>   
>   static void f2fs_read_end_io(struct bio *bio)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_P_SB(bio_first_page_all(bio));
>   	struct bio_post_read_ctx *ctx;
> +	bool intask = in_task();

Is there any condition that in_task() is true here? Maybe I'm missing
something here....

Thanks,

>   
>   	iostat_update_and_unbind_ctx(bio, 0);
>   	ctx = bio->bi_private;
> @@ -281,16 +284,29 @@ static void f2fs_read_end_io(struct bio *bio)
>   	}
>   
>   	if (bio->bi_status) {
> -		f2fs_finish_read_bio(bio);
> +		f2fs_finish_read_bio(bio, intask);
>   		return;
>   	}
>   
> -	if (ctx && (ctx->enabled_steps & (STEP_DECRYPT | STEP_DECOMPRESS))) {
> -		INIT_WORK(&ctx->work, f2fs_post_read_work);
> -		queue_work(ctx->sbi->post_read_wq, &ctx->work);
> -	} else {
> -		f2fs_verify_and_finish_bio(bio);
> +	if (ctx) {
> +		unsigned int enabled_steps = ctx->enabled_steps &
> +					(STEP_DECRYPT | STEP_DECOMPRESS);
> +
> +		/*
> +		 * If we have only decompression step between decompression and
> +		 * decrypt, we don't need post processing for this.
> +		 */
> +		if (enabled_steps == STEP_DECOMPRESS &&
> +				!f2fs_low_mem_mode(sbi)) {
> +			f2fs_handle_step_decompress(ctx, intask);
> +		} else if (enabled_steps) {
> +			INIT_WORK(&ctx->work, f2fs_post_read_work);
> +			queue_work(ctx->sbi->post_read_wq, &ctx->work);
> +			return;
> +		}
>   	}
> +
> +	f2fs_verify_and_finish_bio(bio, intask);
>   }
>   
>   static void f2fs_write_end_io(struct bio *bio)
> @@ -2222,7 +2238,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>   
>   		if (f2fs_load_compressed_page(sbi, page, blkaddr)) {
>   			if (atomic_dec_and_test(&dic->remaining_pages))
> -				f2fs_decompress_cluster(dic);
> +				f2fs_decompress_cluster(dic, true);
>   			continue;
>   		}
>   
> @@ -2240,7 +2256,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>   					page->index, for_write);
>   			if (IS_ERR(bio)) {
>   				ret = PTR_ERR(bio);
> -				f2fs_decompress_end_io(dic, ret);
> +				f2fs_decompress_end_io(dic, ret, true);
>   				f2fs_put_dnode(&dn);
>   				*bio_ret = NULL;
>   				return ret;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index fea97093d927..c9a31934b948 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1588,6 +1588,7 @@ struct decompress_io_ctx {
>   	void *private;			/* payload buffer for specified decompression algorithm */
>   	void *private2;			/* extra payload buffer */
>   	struct work_struct verity_work;	/* work to verify the decompressed pages */
> +	struct work_struct free_work;	/* work for late free this structure itself */
>   };
>   
>   #define NULL_CLUSTER			((unsigned int)(~0))
> @@ -4166,9 +4167,9 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
>   bool f2fs_is_compress_backend_ready(struct inode *inode);
>   int f2fs_init_compress_mempool(void);
>   void f2fs_destroy_compress_mempool(void);
> -void f2fs_decompress_cluster(struct decompress_io_ctx *dic);
> +void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task);
>   void f2fs_end_read_compressed_page(struct page *page, bool failed,
> -							block_t blkaddr);
> +				block_t blkaddr, bool in_task);
>   bool f2fs_cluster_is_empty(struct compress_ctx *cc);
>   bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
>   bool f2fs_all_cluster_page_loaded(struct compress_ctx *cc, struct pagevec *pvec,
> @@ -4187,8 +4188,9 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>   				unsigned nr_pages, sector_t *last_block_in_bio,
>   				bool is_readahead, bool for_write);
>   struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc);
> -void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed);
> -void f2fs_put_page_dic(struct page *page);
> +void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
> +				bool in_task);
> +void f2fs_put_page_dic(struct page *page, bool in_task);
>   unsigned int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn);
>   int f2fs_init_compress_ctx(struct compress_ctx *cc);
>   void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse);
> @@ -4234,13 +4236,14 @@ static inline struct page *f2fs_compress_control_page(struct page *page)
>   }
>   static inline int f2fs_init_compress_mempool(void) { return 0; }
>   static inline void f2fs_destroy_compress_mempool(void) { }
> -static inline void f2fs_decompress_cluster(struct decompress_io_ctx *dic) { }
> +static inline void f2fs_decompress_cluster(struct decompress_io_ctx *dic,
> +				bool in_task) { }
>   static inline void f2fs_end_read_compressed_page(struct page *page,
> -						bool failed, block_t blkaddr)
> +				bool failed, block_t blkaddr, bool in_task)
>   {
>   	WARN_ON_ONCE(1);
>   }
> -static inline void f2fs_put_page_dic(struct page *page)
> +static inline void f2fs_put_page_dic(struct page *page, bool in_task)
>   {
>   	WARN_ON_ONCE(1);
>   }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

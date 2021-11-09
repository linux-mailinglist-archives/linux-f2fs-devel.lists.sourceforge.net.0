Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A2744AF39
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Nov 2021 15:10:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mkRpr-0005xS-Ju; Tue, 09 Nov 2021 14:10:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mkRpp-0005xM-N6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 14:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LaPA/H975Q1ITU5F/gaqspTuRjyWo8/YBE637vW7+dU=; b=D5kQDmNh0wln5PttiV8sPbPOiP
 0dgiVc3EgnFE0wrlsxeVpaYYBPPAFpAq4W4f7vUglQFdUWJuarIZy4lOTnd9qBtS7Pd0ndttXJmCj
 zrRCg8m+twYT0pyYViz23/yEiNgMxFPn/Z+CDxN/10LkIgXDz8rIS3dZAx6ZktNZc/8g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LaPA/H975Q1ITU5F/gaqspTuRjyWo8/YBE637vW7+dU=; b=Fp+aHs5svGJVaVZ8LcTtnn2DTy
 Wr8GO1Ag0VUK4N0mIYFeub+uLmQLzVi/P5AgUY4dHrWiFmpmREFhHG8MFfBQxv6rsbxkdV54UTox9
 BuH+1Z74/sdmSnMZMZiuYOExH0RrnqV98BqpKKPA42Mp7e/Wl+FLlZBAXiAv+KPoMpBU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mkRpl-0003AU-0k
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 14:10:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA113611BF;
 Tue,  9 Nov 2021 14:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636467039;
 bh=ho7WS2bTFVw7Lx4J366hoJrc5f6/hJ5tRCKLZtMO544=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XMtjHHRdFgyy0L5hk1YZdK4wVWutZ+DCYLyET9++gE1YK5vCZ7/p39LeYDk1vHovK
 07SkXCVu2mTQIfoPFbNIkgAEB1HXHvcmQaY9LcgN+T7zguaiTwJem0N5SwqP1D74s0
 wtq3GQstjZ7XJ2kISZ55we7/Or6pCjK7AceY1EZgnDnFUw1LMtEmnhZ9r6ToBrcCpr
 yZCVOVdo8Ev/75CPkxHUuVJA8R7uyLbeF9GHItthh/Gb02AlVDsIvom9Xer7S3F9Lc
 6WB+GdrAFBNmJ480GfX2qgMKcmy+dg3UPchg/4VU4uiaIxsRRRX4osNot5bH7FcJ7Z
 Ta1Rq6EPA82vw==
Message-ID: <4a82ca51-3a35-dad9-8c78-c9339f2207d5@kernel.org>
Date: Tue, 9 Nov 2021 22:10:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org
References: <20211109035408.260852-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211109035408.260852-1-changfengnan@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/11/9 11:54, Fengnan Chang wrote: > Don't alloc new
 page pointers array to replace old, just use old, introduce > valid_nr_cpages
 to indicate valid number of page pointers in array, try to > re [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mkRpl-0003AU-0k
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: reduce one page array
 alloc and free when write compressed page
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

On 2021/11/9 11:54, Fengnan Chang wrote:
> Don't alloc new page pointers array to replace old, just use old, introduce
> valid_nr_cpages to indicate valid number of page pointers in array, try to
> reduce one page array alloc and free when write compress page.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/compress.c | 27 +++++++++------------------
>   fs/f2fs/data.c     |  1 +
>   fs/f2fs/f2fs.h     |  1 +
>   3 files changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 9b663eaf4805..28785dd78c6f 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -153,6 +153,7 @@ void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse)
>   	cc->rpages = NULL;
>   	cc->nr_rpages = 0;
>   	cc->nr_cpages = 0;
> +	cc->valid_nr_cpages = 0;
>   	if (!reuse)
>   		cc->cluster_idx = NULL_CLUSTER;
>   }
> @@ -619,7 +620,6 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
>   	const struct f2fs_compress_ops *cops =
>   				f2fs_cops[fi->i_compress_algorithm];
>   	unsigned int max_len, new_nr_cpages;
> -	struct page **new_cpages;
>   	u32 chksum = 0;
>   	int i, ret;
>   
> @@ -634,6 +634,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
>   
>   	max_len = COMPRESS_HEADER_SIZE + cc->clen;
>   	cc->nr_cpages = DIV_ROUND_UP(max_len, PAGE_SIZE);
> +	cc->valid_nr_cpages = cc->nr_cpages;
>   
>   	cc->cpages = page_array_alloc(cc->inode, cc->nr_cpages);
>   	if (!cc->cpages) {
> @@ -684,13 +685,6 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
>   
>   	new_nr_cpages = DIV_ROUND_UP(cc->clen + COMPRESS_HEADER_SIZE, PAGE_SIZE);
>   
> -	/* Now we're going to cut unnecessary tail pages */
> -	new_cpages = page_array_alloc(cc->inode, new_nr_cpages);
> -	if (!new_cpages) {
> -		ret = -ENOMEM;
> -		goto out_vunmap_cbuf;

It removes last user of out_vunmap_cbuf label, so we can remove below
dead codes in error path as well.

out_vunmap_cbuf:
	vm_unmap_ram(cc->cbuf, cc->nr_cpages);

> -	}
> -
>   	/* zero out any unused part of the last page */
>   	memset(&cc->cbuf->cdata[cc->clen], 0,
>   			(new_nr_cpages * PAGE_SIZE) -
> @@ -701,7 +695,6 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
>   
>   	for (i = 0; i < cc->nr_cpages; i++) {
>   		if (i < new_nr_cpages) {
> -			new_cpages[i] = cc->cpages[i];
>   			continue;
>   		}

if (i < new_nr_cpages)
	continue;

>   		f2fs_compress_free_page(cc->cpages[i]);
> @@ -711,9 +704,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
>   	if (cops->destroy_compress_ctx)
>   		cops->destroy_compress_ctx(cc);
>   
> -	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
> -	cc->cpages = new_cpages;
> -	cc->nr_cpages = new_nr_cpages;
> +	cc->valid_nr_cpages = new_nr_cpages;
>   
>   	trace_f2fs_compress_pages_end(cc->inode, cc->cluster_idx,
>   							cc->clen, ret);
> @@ -1288,14 +1279,14 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>   
>   	cic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
>   	cic->inode = inode;
> -	atomic_set(&cic->pending_pages, cc->nr_cpages);
> +	atomic_set(&cic->pending_pages, cc->valid_nr_cpages);
>   	cic->rpages = page_array_alloc(cc->inode, cc->cluster_size);
>   	if (!cic->rpages)
>   		goto out_put_cic;
>   
>   	cic->nr_rpages = cc->cluster_size;
>   
> -	for (i = 0; i < cc->nr_cpages; i++) {
> +	for (i = 0; i < cc->valid_nr_cpages; i++) {
>   		f2fs_set_compressed_page(cc->cpages[i], inode,
>   					cc->rpages[i + 1]->index, cic);
>   		fio.compressed_page = cc->cpages[i];
> @@ -1340,7 +1331,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>   		if (fio.compr_blocks && __is_valid_data_blkaddr(blkaddr))
>   			fio.compr_blocks++;
>   
> -		if (i > cc->nr_cpages) {
> +		if (i > cc->valid_nr_cpages) {
>   			if (__is_valid_data_blkaddr(blkaddr)) {
>   				f2fs_invalidate_blocks(sbi, blkaddr);
>   				f2fs_update_data_blkaddr(&dn, NEW_ADDR);
> @@ -1365,8 +1356,8 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>   
>   	if (fio.compr_blocks)
>   		f2fs_i_compr_blocks_update(inode, fio.compr_blocks - 1, false);
> -	f2fs_i_compr_blocks_update(inode, cc->nr_cpages, true);
> -	add_compr_block_stat(inode, cc->nr_cpages);
> +	f2fs_i_compr_blocks_update(inode, cc->valid_nr_cpages, true);
> +	add_compr_block_stat(inode, cc->valid_nr_cpages);
>   
>   	set_inode_flag(cc->inode, FI_APPEND_WRITE);
>   	if (cc->cluster_idx == 0)
> @@ -1404,7 +1395,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>   	else
>   		f2fs_unlock_op(sbi);
>   out_free:
> -	for (i = 0; i < cc->nr_cpages; i++) {
> +	for (i = 0; i < cc->valid_nr_cpages; i++) {
>   		if (!cc->cpages[i])
>   			continue;

We can remove above cpages check?

Thanks,

>   		f2fs_compress_free_page(cc->cpages[i]);
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index f4fd6c246c9a..4ddc0ba0f2c0 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2934,6 +2934,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   		.rpages = NULL,
>   		.nr_rpages = 0,
>   		.cpages = NULL,
> +		.valid_nr_cpages = 0,
>   		.rbuf = NULL,
>   		.cbuf = NULL,
>   		.rlen = PAGE_SIZE * F2FS_I(inode)->i_cluster_size,
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 039a229e11c9..acb587f054db 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1481,6 +1481,7 @@ struct compress_ctx {
>   	unsigned int nr_rpages;		/* total page number in rpages */
>   	struct page **cpages;		/* pages store compressed data in cluster */
>   	unsigned int nr_cpages;		/* total page number in cpages */
> +	unsigned int valid_nr_cpages;	/* valid page number in cpages */
>   	void *rbuf;			/* virtual mapped address on rpages */
>   	struct compress_data *cbuf;	/* virtual mapped address on cpages */
>   	size_t rlen;			/* valid data length in rbuf */
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

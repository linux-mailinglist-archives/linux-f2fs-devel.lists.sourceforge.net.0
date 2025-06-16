Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A9ADB06E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jun 2025 14:41:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7ZirstpmvDoc0CBTQlkFGPwrK+oDYkw9+ckpEuXDmc=; b=lPCcUv+7kcFLxCvZRaSuQWyJ7P
	sGofr1QgXsw515LMyDI/Kf0SzMCYyg/jc1WDKixLTsFRydzl+h4o/E6cefKvQ/rt4Vn/KbCi1bzx6
	FTlzcXyG0KBbMKfDt1BP4qj3eCB02RhUVL8X4D3vfOvYv0Qb9PB1ubDWdG5//se6k+/Y=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uR99X-0005eH-Rx;
	Mon, 16 Jun 2025 12:41:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uR99W-0005eB-Cq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jun 2025 12:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nKTUHD0+y6cc0B4to/Q4pyw09q71d36uZg4yW+kYf7U=; b=Gfl4pufLOGmjqQh4R0FeGY/fVR
 5hav02eVrfY3v5ERy5RYQvqsXh1B2Mhu3GsfjBecMbDSSh/ACRDoGoiPi1LIok9HLB9ILWg4k+Hfb
 mSKSO6YUr/IpI9k8zy6Y7sRdz9F+2tNTZXU2qBOW/9PMPgcy0TSaDmGYYbrXzHtIYoYQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nKTUHD0+y6cc0B4to/Q4pyw09q71d36uZg4yW+kYf7U=; b=jQz8UDdCdq2ACC4fNv6MH/A4MJ
 doceJBpW7moNPsKyprBFL7O9rXqF+gz3tjkNhC6PD1bGfcKdSL9Yn93olMF5qIiVJei9W3EqZLiIP
 Gy5HGEP4xYagCyLUfmr0qg7UbhOSwcmn3u0fPnPmjQ2pvzdl8Goe43MOAt2/Vz8ERN1Q=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uR99V-0007K1-Qh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jun 2025 12:41:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 303C6A50065;
 Mon, 16 Jun 2025 12:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A704AC4CEEA;
 Mon, 16 Jun 2025 12:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750077683;
 bh=s3XUC5ZWXM/K6AZRHhVnolJzEYw9WXvnLVdXiAdvz5Q=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=qabwE08bVJjjWSGMq50QBauJ7yF9knCpiuVPJfQkNdn2DDIpPu6GGcqG6NFwHQcSb
 GFElvnP1Wfcxj7q23tZUz12NVynchEbJOTUNFP58qWMYmSWWKAqrAHfi8kfMxroEyI
 a2x8gLRxea55N5aZYb+w0YgIV3PkK3BDKPVXnlXOnr1Nz6LwZOuL4GRLdHYInXJP5t
 +A9VUco1g4cexU21IIDpagAth45uTerO3v+hbL7EaLMiQG5OuLGnuMNuT4pq9kmd65
 sblvF13BMjWc/wp7gSKljb++1FHLGUKrtUla2OEJg8T2PAdbKKv41ywAGKtV8UuBqX
 NuIV7b5DtyXDQ==
Message-ID: <0f09a845-fbaf-4ddf-b684-a1182f85a9ff@kernel.org>
Date: Mon, 16 Jun 2025 20:41:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250615144235.1836469-1-chullee@google.com>
 <20250615144235.1836469-2-chullee@google.com>
Content-Language: en-US
In-Reply-To: <20250615144235.1836469-2-chullee@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/15/25 22:42, Daniel Lee wrote: > Bio flags like REQ_PRIO,
 REQ_META, and REQ_FUA, determined by > f2fs_io_flags(), were not being applied
 to direct I/O (DIO) writes. > This meant that DIO writes w [...] 
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
X-Headers-End: 1uR99V-0007K1-Qh
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: Apply bio flags to direct I/O
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/15/25 22:42, Daniel Lee wrote:
> Bio flags like REQ_PRIO, REQ_META, and REQ_FUA, determined by
> f2fs_io_flags(), were not being applied to direct I/O (DIO) writes.
> This meant that DIO writes would not respect filesystem-level hints
> (for REQ_META/FUA) or inode-level hints (like F2FS_IOPRIO_WRITE).
> 
> This patch refactors f2fs_io_flags() to use a direct inode pointer
> instead of deriving it from a page. The function is then called from
> the DIO write path, ensuring that bio flags are handled consistently
> for both buffered and DIO writes.
> 
> Signed-off-by: Daniel Lee <chullee@google.com>
> ---
>  fs/f2fs/data.c | 10 +++++-----
>  fs/f2fs/f2fs.h |  1 +
>  fs/f2fs/file.c | 11 +++++++++++
>  3 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 31e892842625..71dde494b892 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -416,10 +416,9 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
>  	return 0;
>  }
>  
> -static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
> +blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio, struct inode *inode)
>  {
>  	unsigned int temp_mask = GENMASK(NR_TEMP_TYPE - 1, 0);
> -	struct folio *fio_folio = page_folio(fio->page);
>  	unsigned int fua_flag, meta_flag, io_flag;
>  	blk_opf_t op_flags = 0;
>  
> @@ -446,8 +445,8 @@ static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
>  	if (BIT(fio->temp) & fua_flag)
>  		op_flags |= REQ_FUA;
>  
> -	if (fio->type == DATA &&
> -	    F2FS_I(fio_folio->mapping->host)->ioprio_hint == F2FS_IOPRIO_WRITE)
> +	if (inode && fio->type == DATA &&
> +	    F2FS_I(inode)->ioprio_hint == F2FS_IOPRIO_WRITE)
>  		op_flags |= REQ_PRIO;
>  
>  	return op_flags;
> @@ -459,10 +458,11 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
>  	struct block_device *bdev;
>  	sector_t sector;
>  	struct bio *bio;
> +	struct inode *inode = fio->page ? fio->page->mapping->host : NULL;

fio->page will always be true now? We can pass fio->page->mapping->host to f2fs_io_flags()
directly?

Thanks,

>  
>  	bdev = f2fs_target_device(sbi, fio->new_blkaddr, &sector);
>  	bio = bio_alloc_bioset(bdev, npages,
> -				fio->op | fio->op_flags | f2fs_io_flags(fio),
> +				fio->op | fio->op_flags | f2fs_io_flags(fio, inode),
>  				GFP_NOIO, &f2fs_bioset);
>  	bio->bi_iter.bi_sector = sector;
>  	if (is_read_io(fio->op)) {
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9333a22b9a01..3e02687c1b58 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3972,6 +3972,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio);
>  struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
>  		block_t blk_addr, sector_t *sector);
>  int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr);
> +blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio, struct inode *inode);
>  void f2fs_set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
>  void f2fs_update_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
>  int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 696131e655ed..3eb40d7bf602 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -5015,6 +5015,17 @@ static void f2fs_dio_write_submit_io(const struct iomap_iter *iter,
>  	enum log_type type = f2fs_rw_hint_to_seg_type(sbi, inode->i_write_hint);
>  	enum temp_type temp = f2fs_get_segment_temp(sbi, type);
>  
> +	/* if fadvise set to hot, override the temperature */
> +	struct f2fs_io_info fio = {
> +		.sbi = sbi,
> +		.type = DATA,
> +		.op = REQ_OP_WRITE,
> +		.temp = file_is_hot(inode) ? HOT : temp,
> +		.op_flags = bio->bi_opf,
> +		.page = NULL,
> +	};
> +	bio->bi_opf |= f2fs_io_flags(&fio, inode);
> +
>  	bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi, DATA, temp);
>  	submit_bio(bio);
>  }



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

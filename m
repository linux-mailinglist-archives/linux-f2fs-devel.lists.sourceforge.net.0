Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1B7306B2F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Jan 2021 03:46:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4xKC-0001FD-Pr; Thu, 28 Jan 2021 02:46:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1l4xKB-0001Ev-6h
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 02:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vjeR606yjP7M5A4ZgNTKvBxuG55NqTXdvYspWuTTpx4=; b=Lla+l3jQHZHK5uLt/+Cq3witUF
 /cIUzZz+M/HBRr0PD7fyPD4XkEA+PL511SKvGLKjLe+YvtcwGOPurJsBkxv+bTuctiZeGwNbY/kIQ
 tvCMecirJ1iOwyz+qfTJ3L03erktGZGWAGs9f2cQAR8ObSwWwE8ziyGUtzJ/0uF0c4kQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vjeR606yjP7M5A4ZgNTKvBxuG55NqTXdvYspWuTTpx4=; b=bXlH74dTjF3VjRDZa/8CERdL7V
 XfPya6ftNV7u6ba3dT3htWPCFkpDKLM6v/VrbfDCsTtuR6L7bLAuMWyOFBpmD+/XxQt4m54jLmCkV
 Eayhry3yut5XBqC0A/FRdBLujZWPwTvfmW8rc+0Ii6n44td5VAzHzKJ832Fh6W3YfqEQ=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4xK5-00FdRn-4Q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 02:46:23 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DR4Yn1pTxzlBqD;
 Thu, 28 Jan 2021 10:44:29 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 28 Jan
 2021 10:45:59 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210126145247.1964410-1-hch@lst.de>
 <20210126145247.1964410-9-hch@lst.de>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <9625b1bb-e87a-d46b-b934-a017f23f80f4@huawei.com>
Date: Thu, 28 Jan 2021 10:45:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210126145247.1964410-9-hch@lst.de>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1l4xK5-00FdRn-4Q
Subject: Re: [f2fs-dev] [PATCH 08/17] f2fs: remove FAULT_ALLOC_BIO
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

Jaegeuk,

I remember that you concerned about backport issue of bio fault injection
entry removal? IIRC.

If you have no objection on this now, let me Ack f2fs part change on this
series.

Thanks,

On 2021/1/26 22:52, Christoph Hellwig wrote:
> Sleeping bio allocations do not fail, which means that injecting an error
> into sleeping bio allocations is a little silly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   Documentation/filesystems/f2fs.rst |  1 -
>   fs/f2fs/data.c                     | 29 ++++-------------------------
>   fs/f2fs/f2fs.h                     |  1 -
>   fs/f2fs/super.c                    |  1 -
>   4 files changed, 4 insertions(+), 28 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index dae15c96e659e2..624f5f3ed93e86 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -179,7 +179,6 @@ fault_type=%d		 Support configuring fault injection type, should be
>   			 FAULT_KVMALLOC		  0x000000002
>   			 FAULT_PAGE_ALLOC	  0x000000004
>   			 FAULT_PAGE_GET		  0x000000008
> -			 FAULT_ALLOC_BIO	  0x000000010
>   			 FAULT_ALLOC_NID	  0x000000020
>   			 FAULT_ORPHAN		  0x000000040
>   			 FAULT_BLOCK		  0x000000080
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 0cf0c605992431..9fb6be65592b1f 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -50,28 +50,6 @@ void f2fs_destroy_bioset(void)
>   	bioset_exit(&f2fs_bioset);
>   }
>   
> -static inline struct bio *__f2fs_bio_alloc(gfp_t gfp_mask,
> -						unsigned int nr_iovecs)
> -{
> -	return bio_alloc_bioset(gfp_mask, nr_iovecs, &f2fs_bioset);
> -}
> -
> -static struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages,
> -		bool noio)
> -{
> -	if (noio) {
> -		/* No failure on bio allocation */
> -		return __f2fs_bio_alloc(GFP_NOIO, npages);
> -	}
> -
> -	if (time_to_inject(sbi, FAULT_ALLOC_BIO)) {
> -		f2fs_show_injection_info(sbi, FAULT_ALLOC_BIO);
> -		return NULL;
> -	}
> -
> -	return __f2fs_bio_alloc(GFP_KERNEL, npages);
> -}
> -
>   static bool __is_cp_guaranteed(struct page *page)
>   {
>   	struct address_space *mapping = page->mapping;
> @@ -433,7 +411,7 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
>   	struct f2fs_sb_info *sbi = fio->sbi;
>   	struct bio *bio;
>   
> -	bio = f2fs_bio_alloc(sbi, npages, true);
> +	bio = bio_alloc_bioset(GFP_NOIO, npages, &f2fs_bioset);
>   
>   	f2fs_target_device(sbi, fio->new_blkaddr, bio);
>   	if (is_read_io(fio->op)) {
> @@ -1029,8 +1007,9 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
>   	struct bio_post_read_ctx *ctx;
>   	unsigned int post_read_steps = 0;
>   
> -	bio = f2fs_bio_alloc(sbi, min_t(int, nr_pages, BIO_MAX_PAGES),
> -								for_write);
> +	bio = bio_alloc_bioset(for_write ? GFP_NOIO : GFP_KERNEL,
> +			       min_t(int, nr_pages, BIO_MAX_PAGES),
> +			       &f2fs_bioset);
>   	if (!bio)
>   		return ERR_PTR(-ENOMEM);
>   
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 902bd3267c03e1..6c78365d80ceb5 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -43,7 +43,6 @@ enum {
>   	FAULT_KVMALLOC,
>   	FAULT_PAGE_ALLOC,
>   	FAULT_PAGE_GET,
> -	FAULT_ALLOC_BIO,
>   	FAULT_ALLOC_NID,
>   	FAULT_ORPHAN,
>   	FAULT_BLOCK,
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index b4a07fe62d1a58..3a312642907e86 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -45,7 +45,6 @@ const char *f2fs_fault_name[FAULT_MAX] = {
>   	[FAULT_KVMALLOC]	= "kvmalloc",
>   	[FAULT_PAGE_ALLOC]	= "page alloc",
>   	[FAULT_PAGE_GET]	= "page get",
> -	[FAULT_ALLOC_BIO]	= "alloc bio",
>   	[FAULT_ALLOC_NID]	= "alloc nid",
>   	[FAULT_ORPHAN]		= "orphan",
>   	[FAULT_BLOCK]		= "no more block",
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

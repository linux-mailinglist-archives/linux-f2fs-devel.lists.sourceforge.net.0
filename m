Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DD918D829
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2020 20:12:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFN3o-0005Eu-7R; Fri, 20 Mar 2020 19:12:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jFN3m-0005Eg-Oq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 19:11:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cc81QXIto/zoUXUaNwN5oKLIouyiEXDweXz8Xh5O/rc=; b=ePJgOb93o1HZ9h8wAjidIrUprR
 XzkKN3OhAAThj4nWFbvw26GbhENmUGbAyh+8HgY7KqJrflkY/8rX4iDp1PuA2VLZs7KXepqvTcEnW
 mXJTAP7k/tlnYPeCa1y4YASle9x6JZbQ3w6TKvbrDyggYP0D0i883raCqG3SrxV/cc3k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cc81QXIto/zoUXUaNwN5oKLIouyiEXDweXz8Xh5O/rc=; b=dwy3yMZDklyT+mJD1GGjT55/XB
 1eXXy84hY+rGCENYzaTZQwuLrMlcckBAr4iV9N4F1lgdt3FDPbJiel0x7UiejhjS/5cyY1GWOEjCJ
 G8mbezxRMQ3UXsaFN/vk0ppfwiLeqS0zEUyIuWkGYMO/JJmRrKBYHqEI1bFM92aTWthw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFN3k-001hRY-TB
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 19:11:58 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F43B20767;
 Fri, 20 Mar 2020 19:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584731511;
 bh=WHYaY5JGW4wMqTdBEG+VlqBPEPHmHlXETR+cfjM253g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FhaxDy9UC5o6f2YNJzvSSFRn0Ei8VAm6JOOdrhtb8Z0lbMUGXquZQwKz2pk7GOIq3
 6C+Mts/Mhp1wKCnEyWDz7k4Hv1CsqJE++OZo2HGkIPoyBAfMHv9LydSAu7T49LeP+5
 zss4fx8ZDNio623uelHkIPNIpOrsDqf0F5tOMAhE=
Date: Fri, 20 Mar 2020 12:11:49 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200320191149.GL851@sol.localdomain>
References: <20200319115800.108926-1-yuchao0@huawei.com>
 <20200319115800.108926-3-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319115800.108926-3-yuchao0@huawei.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jFN3k-001hRY-TB
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: fix NULL pointer dereference in
 f2fs_verity_work()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 19, 2020 at 07:57:59PM +0800, Chao Yu wrote:
> If both compression and fsverity feature is on, generic/572 will
> report below NULL pointer dereference bug.
> 
>  BUG: kernel NULL pointer dereference, address: 0000000000000018
>  RIP: 0010:f2fs_verity_work+0x60/0x90 [f2fs]
>  #PF: supervisor read access in kernel mode
>  Workqueue: fsverity_read_queue f2fs_verity_work [f2fs]
>  RIP: 0010:f2fs_verity_work+0x60/0x90 [f2fs]
>  Call Trace:
>   process_one_work+0x16c/0x3f0
>   worker_thread+0x4c/0x440
>   ? rescuer_thread+0x350/0x350
>   kthread+0xf8/0x130
>   ? kthread_unpark+0x70/0x70
>   ret_from_fork+0x35/0x40
> 
> There are two issue in f2fs_verity_work():
> - it needs to traverse and verify all pages in bio.
> - if pages in bio belong to non-compressed cluster, accessing
> decompress IO context stored in page private will cause NULL
> pointer dereference.
> 
> Fix them.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/data.c | 35 ++++++++++++++++++++++++++++++-----
>  1 file changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 5c5db09324b7..66e49fc1056e 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -187,12 +187,37 @@ static void f2fs_verify_pages(struct page **rpages, unsigned int cluster_size)
>  
>  static void f2fs_verify_bio(struct bio *bio)
>  {
> -	struct page *page = bio_first_page_all(bio);
> -	struct decompress_io_ctx *dic =
> -			(struct decompress_io_ctx *)page_private(page);
> +	struct bio_vec *bv;
> +	struct bvec_iter_all iter_all;
> +	struct decompress_io_ctx *dic, *pdic = NULL;
> +
> +	bio_for_each_segment_all(bv, bio, iter_all) {
> +		struct page *page = bv->bv_page;
> +
> +		dic = (struct decompress_io_ctx *)page_private(page);
> +
> +		if (dic) {
> +			if (dic != pdic) {
> +				f2fs_verify_pages(dic->rpages,
> +							dic->cluster_size);
> +				f2fs_free_dic(dic);
> +				pdic = dic;
> +			}
> +			continue;
> +		}
> +		pdic = dic;
>  
> -	f2fs_verify_pages(dic->rpages, dic->cluster_size);
> -	f2fs_free_dic(dic);
> +		if (bio->bi_status || PageError(page)) {
> +			ClearPageUptodate(page);
> +			ClearPageError(page);
> +		} else {
> +			if (fsverity_verify_page(page))
> +				SetPageUptodate(page);
> +			else
> +				SetPageError(page);
> +		}
> +		unlock_page(page);
> +	}

I'm a bit confused why you added SetPageError() before unlocking the page.
The other error paths actually clear the Error flag, not set it.  I thought
there's a reason for that?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

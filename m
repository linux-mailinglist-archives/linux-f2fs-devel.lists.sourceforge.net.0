Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3758F1F93E0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2020 11:49:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jklji-00033s-1e; Mon, 15 Jun 2020 09:49:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jkljg-00033O-Jl
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 09:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DAfTLEEf3LnWmAUk6MRmvkiG3ETej98GVuLEc2MGvis=; b=CAQ+kNXotvSgsL9WjFPtfu9jQa
 HsgbuKbnLxfeW8qPnAaO8CPT7/0w6orjojLOgIidjJuhaY2G85pIskuxA9q4YemSws8G6NdVB3V3m
 Rb3NDD5bQcaCgfwAOQ8r+2bHRjotRRDCfpo06Lte9i2i9FObrUbNJ3m/U7pvmiG3ST0k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DAfTLEEf3LnWmAUk6MRmvkiG3ETej98GVuLEc2MGvis=; b=D7cywJdcRUq//OV5/T2PM8y9Mn
 rGtWVODihYhsAh/N7hl/HVRwhzbLoGyDqq72BxdWT7d7x7TC1BpvIuIT6gQ2HhjM9O12Q+h3mQtzB
 9EMLYJLKFpyzNSLxjrIroEKARc1uspAB/qa14wTOBOQr4rbZuzI2j00QruuvSsyphmdM=;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jkljW-006LXO-Iu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 09:49:00 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1592214531; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=DAfTLEEf3LnWmAUk6MRmvkiG3ETej98GVuLEc2MGvis=;
 b=EiMljQXB7gRsqJhWBaLx1aZHOIbeyiY8r6dsnE3nGM0QMTrRmB79ONeXu/Qo22aRq8EwE6Is
 btnbLch1CM/zlpuaCyyukPRUJDMdP3ZCS2UUf4e6C7yA3GCFAPlIN+QhHZrbsw6RC8sCtRxc
 cNJKhV9F9PbMDP0iCrOf/1AmTzs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5ee743e986de6ccd443538e4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Jun 2020 09:48:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 77B6FC433C8; Mon, 15 Jun 2020 09:48:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=ham autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9C71EC433CA;
 Mon, 15 Jun 2020 09:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9C71EC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Mon, 15 Jun 2020 15:18:17 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200615094817.GA2916@codeaurora.org>
References: <1592193588-21701-1-git-send-email-stummala@codeaurora.org>
 <20200615050019.GA3100@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615050019.GA3100@sol.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [69.72.43.7 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [69.72.43.7 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jkljW-006LXO-Iu
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix use-after-free when accessing
 bio->bi_crypt_context
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric,

On Sun, Jun 14, 2020 at 10:00:19PM -0700, Eric Biggers wrote:
> On Mon, Jun 15, 2020 at 09:29:48AM +0530, Sahitya Tummala wrote:
> > There could be a potential race between these two paths below,
> > leading to use-after-free when accessing bio->bi_crypt_context.
> > 
> > f2fs_write_cache_pages
> > ->f2fs_do_write_data_page on page#1
> >   ->f2fs_inplace_write_data
> >     ->f2fs_merge_page_bio
> >       ->add_bio_entry
> > ->f2fs_do_write_data_page on page#2
> >   ->f2fs_inplace_write_data
> >     ->f2fs_merge_page_bio
> >       ->f2fs_crypt_mergeable_bio
> >         ->fscrypt_mergeable_bio
> >   				       f2fs_write_begin on page#1
> > 				       ->f2fs_wait_on_page_writeback
> > 				         ->f2fs_submit_merged_ipu_write
> > 					   ->__submit_bio
> > 					The bio gets completed, calling
> > 					bio_endio
> > 					->bio_uninit
> > 					  ->bio_crypt_free_ctx
> > 	  ->use-after-free issue
> > 
> > Fix this by moving f2fs_crypt_mergeable_bio() check within
> > add_ipu_page() so that it's done under bio_list_lock to prevent
> > the above race.
> > 
> > Fixes: 15e76ad23e72 ("f2fs: add inline encryption support")
> > Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > ---
> > This fix is rebased to the tip of fscrypt git -
> > https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
> > branch - inline-encryption
> > 
> >  fs/f2fs/data.c | 26 ++++++++++++++++++--------
> >  1 file changed, 18 insertions(+), 8 deletions(-)
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 0dfa8d3..3b53554 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -762,9 +762,10 @@ static void del_bio_entry(struct bio_entry *be)
> >  	kmem_cache_free(bio_entry_slab, be);
> >  }
> >  
> > -static int add_ipu_page(struct f2fs_sb_info *sbi, struct bio **bio,
> > -							struct page *page)
> > +static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
> > +				struct page *page, int *bio_needs_submit)
> >  {
> > +	struct f2fs_sb_info *sbi = fio->sbi;
> >  	enum temp_type temp;
> >  	bool found = false;
> >  	int ret = -EAGAIN;
> > @@ -780,6 +781,15 @@ static int add_ipu_page(struct f2fs_sb_info *sbi, struct bio **bio,
> >  				continue;
> >  
> >  			found = true;
> > +			if (*bio && (!page_is_mergeable(sbi, *bio,
> > +					*fio->last_block, fio->new_blkaddr) ||
> > +				    !f2fs_crypt_mergeable_bio(*bio,
> > +					  fio->page->mapping->host,
> > +					  fio->page->index, fio))) {
> > +				ret = 0;
> > +				*bio_needs_submit = 1;
> > +				break;
> > +			}
> >  
> >  			if (bio_add_page(*bio, page, PAGE_SIZE, 0) ==
> >  							PAGE_SIZE) {
> > @@ -864,6 +874,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
> >  	struct bio *bio = *fio->bio;
> >  	struct page *page = fio->encrypted_page ?
> >  			fio->encrypted_page : fio->page;
> > +	int bio_needs_submit = 0;
> >  
> >  	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
> >  			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
> > @@ -872,11 +883,6 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
> >  	trace_f2fs_submit_page_bio(page, fio);
> >  	f2fs_trace_ios(fio, 0);
> >  
> > -	if (bio && (!page_is_mergeable(fio->sbi, bio, *fio->last_block,
> > -				       fio->new_blkaddr) ||
> > -		    !f2fs_crypt_mergeable_bio(bio, fio->page->mapping->host,
> > -					      fio->page->index, fio)))
> > -		f2fs_submit_merged_ipu_write(fio->sbi, &bio, NULL);
> >  alloc_new:
> >  	if (!bio) {
> >  		bio = __bio_alloc(fio, BIO_MAX_PAGES);
> > @@ -886,8 +892,12 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
> >  
> >  		add_bio_entry(fio->sbi, bio, page, fio->temp);
> >  	} else {
> > -		if (add_ipu_page(fio->sbi, &bio, page))
> > +		if (add_ipu_page(fio, &bio, page, &bio_needs_submit))
> > +			goto alloc_new;
> > +		if (bio_needs_submit) {
> > +			f2fs_submit_merged_ipu_write(fio->sbi, &bio, NULL);
> >  			goto alloc_new;
> > +		}
> >  	}
> >  
> >  	if (fio->io_wbc)
> 
> Thanks, I'm still trying to understand this part of the code, but it's looking
> like this is a real bug.  Do you also have a reproducer that produces a KASAN
> report, or did you find this another way?
> 

This was once reported as a stability issue internally on our downstream kernel
having the new FBE patches. I have then reviewed the code and found the issue path.
There is no consistent way to reproduce this problem.

> One comment: add_ipu_page() already submits the bio if it's full.  Wouldn't it
> be better to use that instead of f2fs_submit_merged_ipu_write()?  I.e.:
> 

Your suggestion looks good to me. I will post a v2.

Thanks,

> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index e9dcda80e599..d7a51dbe208b 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -762,9 +762,10 @@ static void del_bio_entry(struct bio_entry *be)
>  	kmem_cache_free(bio_entry_slab, be);
>  }
>  
> -static int add_ipu_page(struct f2fs_sb_info *sbi, struct bio **bio,
> +static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
>  							struct page *page)
>  {
> +	struct f2fs_sb_info *sbi = fio->sbi;
>  	enum temp_type temp;
>  	bool found = false;
>  	int ret = -EAGAIN;
> @@ -780,14 +781,18 @@ static int add_ipu_page(struct f2fs_sb_info *sbi, struct bio **bio,
>  				continue;
>  
>  			found = true;
> -
> -			if (bio_add_page(*bio, page, PAGE_SIZE, 0) ==
> -							PAGE_SIZE) {
> +			if (page_is_mergeable(sbi, *bio, *fio->last_block,
> +					      fio->new_blkaddr) &&
> +			    f2fs_crypt_mergeable_bio(*bio,
> +						      fio->page->mapping->host,
> +						      fio->page->index, fio) &&
> +			    bio_add_page(*bio, page,
> +					 PAGE_SIZE, 0) == PAGE_SIZE) {
>  				ret = 0;
>  				break;
>  			}
>  
> -			/* bio is full */
> +			/* page can't be merged into bio; submit the bio */
>  			del_bio_entry(be);
>  			__submit_bio(sbi, *bio, DATA);
>  			break;
> @@ -872,11 +877,6 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>  	trace_f2fs_submit_page_bio(page, fio);
>  	f2fs_trace_ios(fio, 0);
>  
> -	if (bio && (!page_is_mergeable(fio->sbi, bio, *fio->last_block,
> -				       fio->new_blkaddr) ||
> -		    !f2fs_crypt_mergeable_bio(bio, fio->page->mapping->host,
> -					      fio->page->index, fio)))
> -		f2fs_submit_merged_ipu_write(fio->sbi, &bio, NULL);
>  alloc_new:
>  	if (!bio) {
>  		bio = __bio_alloc(fio, BIO_MAX_PAGES);
> @@ -886,7 +886,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>  
>  		add_bio_entry(fio->sbi, bio, page, fio->temp);
>  	} else {
> -		if (add_ipu_page(fio->sbi, &bio, page))
> +		if (add_ipu_page(fio, &bio, page))
>  			goto alloc_new;
>  	}
>  

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

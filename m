Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AF11F8DC0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2020 08:24:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zAtDzMThUP1wF1tFkBSz6e6PSVk7iDWBF0odU8Oxg6I=; b=O+WkPp4EKXqLrMrU3qB6izxJ/
	+CPNiliDbPSjr6zEtg80jijHjXh6q4t+NAECR8GYRMIvjieitgYDONH4MLVbFC1HWLM+FkJOsEdrT
	vtImVsFfOiOrALBiX23rww7UXgHhv8uLxhajJaZVekSxP1jZNWB4zYqr6j3Sx4k8Rj020=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jkiXP-0006Ed-Ma; Mon, 15 Jun 2020 06:24:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1jkiXM-0006EP-RN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 06:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jQnh8n/QMbG/KY8+2fwcsYdBxm8Yr1sjt67xh0POWuI=; b=U6bVfJEfiyPTgOfJ0UJ04vNNUE
 SIkrCRZc2Rd9LaQTS3XmuXlXDuPBvTGXoMUN1J4uNQMNbBsi8XJJJU0XgxxwlB1VQvuqS3ISf1jMv
 pKlgY1c3+SHnV3rHQIQGqERJgfHGdU8XrTn9RxCfFv9Zo9L3sh5SWvP+C1Z32541ZnEw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jQnh8n/QMbG/KY8+2fwcsYdBxm8Yr1sjt67xh0POWuI=; b=lMFdeh7WCLRLmYl/HdZDIjxcnv
 BmQXX4IB/AcwJf+q84LTQbqqfsxBFOoOCYNa944lygM3hwbctMgriEwJAh23ymz/IQkxnFMLsCDR8
 F5i4RGCmu/PgcA1nDQf7iDNxFBxsB9eBO0iEiijMIp1iPg+iiGgItsIA5JxEMIbJRW6M=;
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jkiXI-0067Pt-Gc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 06:24:04 +0000
Received: by mail-oi1-f194.google.com with SMTP id k4so14919077oik.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 14 Jun 2020 23:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jQnh8n/QMbG/KY8+2fwcsYdBxm8Yr1sjt67xh0POWuI=;
 b=lrKudiPQB0CLKUvJA/TnrAsEFmwty5S59ZooeKMDTbpfrFG3TOapvHtfyv6iQVGUny
 4CYJ0IUmeet7IRcvueAWrLFDM0fRvoxDQm/dmOx7biytr0lEpWOONk87ghRpZy7t2QD3
 pH+u7euAHvDQ15zAY/4wyPu9Q0d+xXIYhPrsONsgMYtbXdvTaNNKkdhb1Er2Bw91agLn
 EwrQ9MT1lEzJpvGHH5enT4AzrCJO9I//dtBXQ5KqAZbG37uuerhinz7i1vuGCqNOiTWJ
 vYMGII5NG+mVdjH9I28c6d6xjLYSgYqkfYr2huOgx1PKJiatReoLpeu6ezkQKXNDV6EN
 OYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jQnh8n/QMbG/KY8+2fwcsYdBxm8Yr1sjt67xh0POWuI=;
 b=BuEf5mUjcnuVB/ORPb02kSsc1+ufuJTdNbbgppdhiw8gLNwySLrFnlXgiAdMiMZo8a
 t/XR4/Kp+7XmZVMad0djJIVtZHEztKmeOIHOOH8x7fDMuaUwowYkoLUX/TzuGuTeK9oN
 aeipgl7w4hkqPylIjRohqcyhqLoY+1S+QNCm6TJ2wJUjXUOlajV2Yv3vKaNs9o6Vuu6O
 02/MhQnGXePgnrMN7HwnoCDQbvUah7+LZIHJB4M0dtRQ9BW2R7bGq2Zk20e8V0406JPi
 lOcbvCnlOBydQNnONDslCA09/fN8t70AoUtcHI6pKp6cMYHU96EqEy5NeVF5OXrU+nmQ
 o0Yg==
X-Gm-Message-State: AOAM533BmldGv+jy6RbvlE2XXrJbbrYBYJtwFJ1+0EhbtrSxh12aRBeZ
 ndSbRb1T1HC8SEviengXDBapDAjq3Eo=
X-Google-Smtp-Source: ABdhPJxYcTZDdnNgTntYrnEdWNaWDVzRwcJjFoDiNqaWBCIpO2i8QPifcl1dDVTPqKQAlZ5ZNXWuRg==
X-Received: by 2002:a17:90a:ae11:: with SMTP id
 t17mr11042311pjq.157.1592201797965; 
 Sun, 14 Jun 2020 23:16:37 -0700 (PDT)
Received: from google.com (124.190.199.35.bc.googleusercontent.com.
 [35.199.190.124])
 by smtp.gmail.com with ESMTPSA id 27sm11621381pjg.19.2020.06.14.23.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 23:16:37 -0700 (PDT)
Date: Mon, 15 Jun 2020 06:16:33 +0000
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200615061633.GA23467@google.com>
References: <1592193588-21701-1-git-send-email-stummala@codeaurora.org>
 <20200615050019.GA3100@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615050019.GA3100@sol.localdomain>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jkiXI-0067Pt-Gc
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.or,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

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
> One comment: add_ipu_page() already submits the bio if it's full.  Wouldn't it
> be better to use that instead of f2fs_submit_merged_ipu_write()?  I.e.:
> 
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
Thanks a lot for looking into this Sahitya! After reading the ipu code,
I do think it's a bug. Regarding the patch itself, I was going to type
out basically the same suggestion as Eric, so I definitely second his
proposal :).

Should I fold this change into the original patch? Or keep it as a
separate patch when I send out the fscrypt/f2fs inline encryption
patches?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

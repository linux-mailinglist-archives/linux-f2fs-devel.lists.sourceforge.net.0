Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EA41FFBCD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 21:28:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jm0Cs-0007gW-Oe; Thu, 18 Jun 2020 19:28:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jm0Cr-0007gP-Na
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 19:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hrS2Z1EpSnpOKPTS98YfLodb27AVlVqlBonM7Hk12hc=; b=MOQmAD3qWeI4gysZX/k54HNOLz
 PBuPlg0y5rFrp/mSdCpzuD2p1qKdBx9SOxmYkOz6zFzLaglUjZNcUfInn3ddnEXc9+uK8sx81ySpd
 PmGrkqEOmT767ZijLqhnZQxelB4SuRc+cO+0zsUH92Hq3IefFGwABjJRV4HWHOjOzfV4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hrS2Z1EpSnpOKPTS98YfLodb27AVlVqlBonM7Hk12hc=; b=XIGiY3tua5QJeM47pBZJg8jL6Z
 gZaMbJehTSRFDCQn8TxfLVklRzzSbDlOD8uFMj/HokqgmX+xzKJc+He4iAWu0eGuA+U2iQVk+nfRV
 fs9/NC975lBqZKsoBH6sBjVs2A9yxB/gUKnxgDu0k+GD1xfnIHmIgOBjz83n/Xe/4kwg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jm0Cq-00B54r-Fd
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 19:28:13 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66FDA2070A;
 Thu, 18 Jun 2020 19:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592508485;
 bh=PYX+wvEdLXT9asd/JVR6QYxU0FAsuBPL/JxOGC1FqOs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TpZxhCB7Ayslf2xLjjGPgT8Yc1BSj7Qge2mxXEWoKqmGa0wmKgShY2L0XouRjKBjP
 hoUYD1fKp48i7FiIpXi+PCbGVKAgQeCp6gcdf9RlJp6Hrnkbyh7cjwaoCrRbEbT0ey
 FJtMsDFr6J+HG4OkHwlF21k6K6koaemA4lIWS9eI=
Date: Thu, 18 Jun 2020 12:28:04 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200618192804.GA139436@google.com>
References: <20200617075732.213198-1-satyat@google.com>
 <20200617075732.213198-4-satyat@google.com>
 <5e78e1be-f948-d54c-d28e-50f1f0a92ab3@huawei.com>
 <20200618181357.GC2957@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618181357.GC2957@sol.localdomain>
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jm0Cq-00B54r-Fd
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: add inline encryption support
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
Cc: Satya Tangirala <satyat@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/18, Eric Biggers wrote:
> Hi Chao,
> 
> On Thu, Jun 18, 2020 at 06:06:02PM +0800, Chao Yu wrote:
> > > @@ -936,8 +972,11 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
> > >  
> > >  	inc_page_count(sbi, WB_DATA_TYPE(bio_page));
> > >  
> > > -	if (io->bio && !io_is_mergeable(sbi, io->bio, io, fio,
> > > -			io->last_block_in_bio, fio->new_blkaddr))
> > > +	if (io->bio &&
> > > +	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
> > > +			      fio->new_blkaddr) ||
> > > +	     !f2fs_crypt_mergeable_bio(io->bio, fio->page->mapping->host,
> > > +				       fio->page->index, fio)))
> > 
> > bio_page->index, fio)))
> > 
> > >  		__submit_merged_bio(io);
> > >  alloc_new:
> > >  	if (io->bio == NULL) {
> > > @@ -949,6 +988,8 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
> > >  			goto skip;
> > >  		}
> > >  		io->bio = __bio_alloc(fio, BIO_MAX_PAGES);
> > > +		f2fs_set_bio_crypt_ctx(io->bio, fio->page->mapping->host,
> > > +				       fio->page->index, fio, GFP_NOIO);
> > 
> > bio_page->index, fio, GFP_NOIO);
> > 
> 
> We're using ->mapping->host and ->index.  Ordinarily that would mean the page
> needs to be a pagecache page.  But bio_page can also be a compressed page or a
> bounce page containing fs-layer encrypted contents.
> 
> Is your suggestion to keep using fio->page->mapping->host (since encrypted pages
> don't have a mapping), but start using bio_page->index (since f2fs apparently
> *does* set ->index for compressed pages, and if the file uses fs-layer
> encryption then f2fs_set_bio_crypt_ctx() won't use the index anyway)?
> 
> Does this mean the code is currently broken for compression + inline encryption
> because it's using the wrong ->index?  I think the answer is no, since
> f2fs_write_compressed_pages() will still pass the first 'nr_cpages' pagecache
> pages along with the compressed pages.  In that case, your suggestion would be a
> cleanup rather than a fix?
> 
> It would be helpful if there was an f2fs mount option to auto-enable compression
> on all files (similar to how test_dummy_encryption auto-enables encryption on
> all files) so that it could be tested more easily.

Eric, you can use "-o compress_extension=*".

> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

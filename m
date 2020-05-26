Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA951E193D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2020 03:57:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jdOq8-0006yp-1W; Tue, 26 May 2020 01:57:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jdOq7-0006yh-BK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 May 2020 01:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oJAKCJkVhSdiVWPsmJLtRftfbGsVb/lELKW6pf25X2A=; b=NnwopS5u8oyeA313+Zme9mSd59
 8uJEb78EtEcm7YIZT0s72L+djarZr9N72HbqELx0/Nxs1Q0PeyrEFs3a9ByMsh3bMCwyDhK+aHjS4
 kB2XXs0wSF8KsexlNsOgfeZf2WMJ7eF3Isk1f1mxKzD55RuwT62LBJZ6mivIKBGXI5p0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oJAKCJkVhSdiVWPsmJLtRftfbGsVb/lELKW6pf25X2A=; b=TaMBQa2Ur9Cn/gVCIl9DUtU5Rx
 7BB5euJzyVKGnqIt0r4TiPazEGRrRWbbmT9eYuCnjTeZRb4QAtj417sljhE39+SzCAXjuRBrQjHjT
 9usyQTydqA0Fny8hDJ/T5Gg/1QtbKQ36epdNlVKdLlOFQPz+3OVjjbUFE2U/e19Dggbw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jdOq4-00G4OL-Fn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 May 2020 01:57:11 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA5982068D;
 Tue, 26 May 2020 01:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590458211;
 bh=hzScoNd2/3SO1/KnojehnqOZFasSdnAL7Ekyg64eR4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a/ggbCG7ghxJZftLEKw0f8J/bL9mpd6zjQaJPGP6nnfvu6ZurUREu8LdAz4yVwdHG
 lm4OdfZufA70y1+3MdaDEiMfo9l3A3l/KT+7alB+iNxLXEX7UOwAXG5NJgInPqQSdY
 LFxKRcXOjtY4cFslb/U45TYcm/u602P8GXxEABL4=
Date: Mon, 25 May 2020 18:56:50 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200526015650.GA207949@google.com>
References: <20200522144752.216197-1-jaegeuk@kernel.org>
 <20200522233243.GA94020@google.com>
 <20200525035655.GA135148@google.com>
 <565af47c-8364-d910-8d1c-93645c12e660@huawei.com>
 <20200525150608.GA55033@google.com>
 <92afae8b-2dd3-171a-562c-404a67f9aab2@huawei.com>
 <a44f9c2e-3859-6c5d-6f06-7c4c6b4c01c5@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a44f9c2e-3859-6c5d-6f06-7c4c6b4c01c5@huawei.com>
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1jdOq4-00G4OL-Fn
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: avoid inifinite loop to wait for
 flushing node pages at cp_error
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/26, Chao Yu wrote:
> On 2020/5/26 9:11, Chao Yu wrote:
> > On 2020/5/25 23:06, Jaegeuk Kim wrote:
> >> On 05/25, Chao Yu wrote:
> >>> On 2020/5/25 11:56, Jaegeuk Kim wrote:
> >>>> Shutdown test is somtimes hung, since it keeps trying to flush dirty node pages
> >>>
> >>> IMO, for umount case, we should drop dirty reference and dirty pages on meta/data
> >>> pages like we change for node pages to avoid potential dead loop...
> >>
> >> I believe we're doing for them. :P
> > 
> > Actually, I mean do we need to drop dirty meta/data pages explicitly as below:
> > 
> > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > index 3dc3ac6fe143..4c08fd0a680a 100644
> > --- a/fs/f2fs/checkpoint.c
> > +++ b/fs/f2fs/checkpoint.c
> > @@ -299,8 +299,15 @@ static int __f2fs_write_meta_page(struct page *page,
> > 
> >  	trace_f2fs_writepage(page, META);
> > 
> > -	if (unlikely(f2fs_cp_error(sbi)))
> > +	if (unlikely(f2fs_cp_error(sbi))) {
> > +		if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
> > +			ClearPageUptodate(page);
> > +			dec_page_count(sbi, F2FS_DIRTY_META);
> > +			unlock_page(page);
> > +			return 0;
> > +		}
> >  		goto redirty_out;
> > +	}
> >  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
> >  		goto redirty_out;
> >  	if (wbc->for_reclaim && page->index < GET_SUM_BLOCK(sbi, 0))
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 48a622b95b76..94b342802513 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -2682,6 +2682,12 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
> > 
> >  	/* we should bypass data pages to proceed the kworkder jobs */
> >  	if (unlikely(f2fs_cp_error(sbi))) {
> > +		if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
> > +			ClearPageUptodate(page);
> > +			inode_dec_dirty_pages(inode);
> > +			unlock_page(page);
> > +			return 0;
> > +		}
> 
> Oh, I notice previously, we will drop non-directory inode's dirty pages directly,
> however, during umount, we'd better drop directory inode's dirty pages as well, right?

Hmm, I remember I dropped them before. Need to double check.

> 
> >  		mapping_set_error(page->mapping, -EIO);
> >  		/*
> >  		 * don't drop any dirty dentry pages for keeping lastest
> > 
> >>
> >>>
> >>> Thanks,
> >>>
> >>>> in an inifinite loop. Let's drop dirty pages at umount in that case.
> >>>>
> >>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> >>>> ---
> >>>> v3:
> >>>>  - fix wrong unlock
> >>>>
> >>>> v2:
> >>>>  - fix typos
> >>>>
> >>>>  fs/f2fs/node.c | 9 ++++++++-
> >>>>  1 file changed, 8 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> >>>> index e632de10aedab..e0bb0f7e0506e 100644
> >>>> --- a/fs/f2fs/node.c
> >>>> +++ b/fs/f2fs/node.c
> >>>> @@ -1520,8 +1520,15 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
> >>>>  
> >>>>  	trace_f2fs_writepage(page, NODE);
> >>>>  
> >>>> -	if (unlikely(f2fs_cp_error(sbi)))
> >>>> +	if (unlikely(f2fs_cp_error(sbi))) {
> >>>> +		if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
> >>>> +			ClearPageUptodate(page);
> >>>> +			dec_page_count(sbi, F2FS_DIRTY_NODES);
> >>>> +			unlock_page(page);
> >>>> +			return 0;
> >>>> +		}
> >>>>  		goto redirty_out;
> >>>> +	}
> >>>>  
> >>>>  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
> >>>>  		goto redirty_out;
> >>>>
> >> .
> >>
> > 
> > 
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

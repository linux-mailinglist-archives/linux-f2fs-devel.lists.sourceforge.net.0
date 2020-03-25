Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DA3191EE6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 03:17:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGvbb-0007RI-8k; Wed, 25 Mar 2020 02:17:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jGvbZ-0007Qs-F6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 02:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pjl3T134tzO++iYjvJwSAr8SJfC1A0FDUVKNhAbPMfE=; b=USa6BPBlsyhZuYxosxRacayw1y
 88QSTbZ7yGmU55neYd+T0rsEw9psIV5087zpntZ5jrLBDirwBrVQMj8Q1bd9RXreeJNsFUV8LOjBj
 Uue1W0SCN+wFGIqIEI3oTESuWP82EPmf5yzuzwwSFF/vyO/FOPspnj2dKJZ41PbfaqLY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pjl3T134tzO++iYjvJwSAr8SJfC1A0FDUVKNhAbPMfE=; b=ltktvnWQ0kAueQpANkJwC5eikG
 tmRpC0NUl3PBEjlLauJxCL7x88DqqW4dUZrJSLo+0JuTdNT4ohGmyxYm3QVbv5feRS4KJ4NKizxMY
 P3bK95ggoBS1yDlQmGXBZ9/TFKODeoVTTNprGHmrodt008RuBlsx8UXiBGv2P0/ehYBk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGvbV-002VUg-4c
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 02:17:17 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7359720722;
 Wed, 25 Mar 2020 02:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585102622;
 bh=XlRkxTBt/TBT87nkAoXqhlaE/B9x/buZGWZ1KNMNLRU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O9hk2njNRPuQj1azXPNGorbu7E4XupFHowJFqGbXkjF2utBsOoDDnzdvRCtT7BXHm
 FaOqc1/TZxq4Ly+kLBbiaR4IPim/Cfc4CzQUL+UmFT4C2Wi0r3FIlGIE6fs5eBheXK
 JyZCgv/goWUMrEjc+UH2q7aebvXWy+5+ClVVEyws=
Date: Tue, 24 Mar 2020 19:17:02 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200325021702.GC198420@google.com>
References: <20200229104906.12061-1-yuchao0@huawei.com>
 <6aab59b9-6e33-5b01-acf8-ccbacd9318e3@huawei.com>
 <20200324154322.GB198420@google.com>
 <b0306fcf-27f2-20ab-9e5b-e54a924d4a61@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0306fcf-27f2-20ab-9e5b-e54a924d4a61@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jGvbV-002VUg-4c
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove redundant compress inode check
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/25, Chao Yu wrote:
> On 2020/3/24 23:43, Jaegeuk Kim wrote:
> > On 03/24, Chao Yu wrote:
> >> Jaegeuk,
> >>
> >> Missed to apply this patch?
> >>
> >> On 2020/2/29 18:49, Chao Yu wrote:
> >>> due to f2fs_post_read_required() has did that.
> >>>
> >>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> >>> ---
> >>>  fs/f2fs/f2fs.h | 2 --
> >>>  1 file changed, 2 deletions(-)
> >>>
> >>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> >>> index f4bcbbd5e9ed..882f9ad3445b 100644
> >>> --- a/fs/f2fs/f2fs.h
> >>> +++ b/fs/f2fs/f2fs.h
> >>> @@ -4006,8 +4006,6 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
> >>>  		return true;
> >>>  	if (f2fs_is_multi_device(sbi))
> >>>  		return true;
> >>> -	if (f2fs_compressed_file(inode))
> >>> -		return true;
> > 
> > I thought that we can keep this to avoid any confusion when porting to old
> > production kernel which uses ICE.
> 
> That old kernel w/ ICE doesn't have f2fs_post_read_required(), right?

We do have.

> 
> I thought we backport features with order of the time fsverity/compression
> feature was introduced, then f2fs_post_read_required() should be there
> when we backport compression feature.
> 
> Thanks,
> 
> > 
> >>>  	/*
> >>>  	 * for blkzoned device, fallback direct IO to buffered IO, so
> >>>  	 * all IOs can be serialized by log-structured write.
> >>>
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

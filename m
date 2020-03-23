Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F6018EED3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 05:16:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGEVr-0006v7-HX; Mon, 23 Mar 2020 04:16:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jGEVr-0006uy-5L
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 04:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7WAchE3q3k7aTmw0mTFTbDByfJS+RczxxN0YTdNnd4Y=; b=LRt6A+pwGYtgoD4DKstNAG7KZ3
 ct1CJvWkImoT6Qa+ryIxLoJT72LWVCp5HwZxMj6XTgoTbcQYTZvRGTDAAlIshSOFwcOn96vhipQre
 bMrqtgwk7LYeXCmPfRIEv109Jz9B1ZXJFY5VXLTr7oeX6eot5JhzINBQiEMRW8aqQ/Z0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7WAchE3q3k7aTmw0mTFTbDByfJS+RczxxN0YTdNnd4Y=; b=kBuDsBMyN+jrQ70bYNm7WLWeIV
 cta96C5KnpD87xIWkYKVYfcDlIoV7+rxTSG28Y4CTRBhCnv0GyxgD51BnRAmbgxvna7gHC8mAVoVQ
 hl9VmYFoFnZY2yfj3PKSjHwcSARpxunhMOgExdvF6PAKdI3NYYIGp3ba0kPL8J6zKvGg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGEVl-00DPk0-UK
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 04:16:31 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4345620719;
 Mon, 23 Mar 2020 04:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584936980;
 bh=2VPoavb3/Nh65+u7sn+FxjbORv9J9qX5wWi4UPuIvng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WUCqFrmJGJ1z6rhNT/5V4ZIUm7ipQ7z18II1tlu9mk47y39o93IYNZvPKW49oB+Y6
 DrH3W2AubwKpH1D9rhGw5sikGCHIczjXruck9FdRpYrS4OgYMjWsRvC35ivB2csZYD
 MKn2DrUYWjISPK69Iz6nh9jvAMJb+kHY9bsheJ30=
Date: Sun, 22 Mar 2020 21:16:19 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200323041619.GD147648@google.com>
References: <20200225101710.40123-1-yuchao0@huawei.com>
 <CAD14+f3pi331-V0gzjtxcMRVaEn3tPacrC20wtRq9+6JY9_HVA@mail.gmail.com>
 <08d03473-9871-ba10-4626-58c4479ef9d1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08d03473-9871-ba10-4626-58c4479ef9d1@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jGEVl-00DPk0-UK
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: use kmem_cache pool during inline
 xattr lookups
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

On 03/19, Chao Yu wrote:
> Hi Ju Hyung,
> 
> On 2020/3/18 20:14, Ju Hyung Park wrote:
> > Hi Chao.
> > 
> > I got the time around to test this patch.
> > The v2 patch seems to work just fine, and the code looks good.
> 
> Thanks a lot for the review and test.
> 
> > 
> > On Tue, Feb 25, 2020 at 7:17 PM Chao Yu <yuchao0@huawei.com> wrote:
> >> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> >> index a3360a97e624..e46a10eb0e42 100644
> >> --- a/fs/f2fs/xattr.c
> >> +++ b/fs/f2fs/xattr.c
> >> @@ -23,6 +23,25 @@
> >>  #include "xattr.h"
> >>  #include "segment.h"
> >>
> >> +static void *xattr_alloc(struct f2fs_sb_info *sbi, int size, bool *is_inline)
> >> +{
> >> +       *is_inline = (size == sbi->inline_xattr_slab_size);
> > 
> > Would it be meaningless to change this to the following code?
> > if (likely(size == sbi->inline_xattr_slab_size))
> >     *is_inline = true;
> > else
> >     *is_inline = false;
> 
> Yup, I guess it's very rare that user will change inline xattr size via remount,
> so I'm okay with this change.

Applied like this. Thanks,

 26 static void *xattr_alloc(struct f2fs_sb_info *sbi, int size, bool *is_inline)
 27 {
 28         if (likely(size == sbi->inline_xattr_slab_size)) {
 29                 *is_inline = true;
 30                 return kmem_cache_zalloc(sbi->inline_xattr_slab, GFP_NOFS);
 31         }
 32         *is_inline = false;
 33         return f2fs_kzalloc(sbi, size, GFP_NOFS);
 34 }

> 
> Jaegeuk,
> 
> Could you please help to update the patch in your git tree directly?
> 
> Thanks,
> 
> > 
> > The above statement seems to be only false during the initial mount
> > and the rest(millions) seems to be always true.
> > 
> > Thanks.
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

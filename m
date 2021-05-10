Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F14A23790E3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 16:36:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg70t-0004iQ-QK; Mon, 10 May 2021 14:36:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lg70s-0004i8-06
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 14:36:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ADiPu4OjTdAnl0Bus8vmTRrzN86ff2iUIlZ1yrcN3oU=; b=N6CI5pun9w92aboPeyFWlh5MjG
 FyTd3PLxG+UjUTAQwnHxrdA0U4kGk/xUXPoo3mWA0bro4ZI8oepZuJcznwYvkrKZ+Tlt5VcVvIZa+
 a9ApYgT6oTLAPBCkBPJf3YZjrW6byXnUb5ih1E9s3YpZnN3Q5bT6pUHkQUggBgVdkCGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ADiPu4OjTdAnl0Bus8vmTRrzN86ff2iUIlZ1yrcN3oU=; b=erf1uTc44tRAC5L0Wc+NMwTD9+
 k1dMbSv0K52n7tkMZencnf2qmI/lHpBdn+U66DGj0MLcBuU1VmIxxEdobt9YNFmC18iZ25fEEQQyH
 y6VakcxQI7b493hcYKmZiTtgU2wAcsrbA2/qOfrFsOhVBKlBvuevCsYmW59NHKAoikhA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lg70o-00270P-TX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 14:36:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60A5161260;
 Mon, 10 May 2021 14:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620657353;
 bh=7+rmrDDH4A6uYJ58L9mxQLde2wCS0ipr0v/8oSvfwtc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qFxZW0z9w0jusStjICTPl/aKhGOUWUVyJDALZOW+6CG+PRlrWU8tMS8RQAc2fGXLP
 ZtV70ikvOz5Htse0Q8nRb7lRL1wEhB3DhVn8xLFydH2UJ+xcsamc29MyxR9e1C646W
 GGzLZCZ7cnPBoWisLWKQX9Mw/SDTqGHFDbLE9Zczzm5WZwAkSejdIpZm3xNfPSuM7g
 51FU5FVUufLz/TTftQca3HRTevyP1H48CJE+VtRBrQrDSv8EhUYLFCf8HFUqTdHtkj
 auSs8GTiTrLayQvxTmZfj+nWrinqjn9Hxl5wsEfOHcNtPPX54Ps062Mh3IQ9I1VVjB
 VtPfKzCpxYUlg==
Date: Mon, 10 May 2021 07:35:51 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YJlEx27aM9oX8H+C@google.com>
References: <YDsleDjeIcpuBXKA@google.com> <YEFBAuP26t0RzVHZ@google.com>
 <01a0ff76-6fa7-3196-8760-e7f6f163ef64@huawei.com>
 <YEa66ekikyuPWSyd@google.com>
 <a40929d4-a8de-98ea-8dd8-6c807d8a6adc@huawei.com>
 <YEkxpAp8FQjRUfm6@google.com>
 <157988c7-079f-0c9f-5cf9-e83bc2f835d1@huawei.com>
 <YID0sDPrUxOJLz+A@google.com>
 <6d574f4e-fed2-ded8-c9d5-4d88bff5d584@huawei.com>
 <3f7ebf46-536e-dc80-ebda-71b2034cb4c9@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f7ebf46-536e-dc80-ebda-71b2034cb4c9@huawei.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lg70o-00270P-TX
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: compress: add compress_inode to
 cache compressed blockst
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

On 05/10, Chao Yu wrote:
> On 2021/4/22 14:07, Chao Yu wrote:
> > On 2021/4/22 11:59, Jaegeuk Kim wrote:
> > > On 04/21, Chao Yu wrote:
> > > > On 2021/3/11 4:52, Jaegeuk Kim wrote:
> > > > > On 03/09, Chao Yu wrote:
> > > > > > On 2021/3/9 8:01, Jaegeuk Kim wrote:
> > > > > > > On 03/05, Chao Yu wrote:
> > > > > > > > On 2021/3/5 4:20, Jaegeuk Kim wrote:
> > > > > > > > > On 02/27, Jaegeuk Kim wrote:
> > > > > > > > > > On 02/04, Chao Yu wrote:
> > > > > > > > > > > Jaegeuk,
> > > > > > > > > > > 
> > > > > > > > > > > On 2021/2/2 16:00, Chao Yu wrote:
> > > > > > > > > > > > -	for (i = 0; i < dic->nr_cpages; i++) {
> > > > > > > > > > > > +	for (i = 0; i < cc->nr_cpages; i++) {
> > > > > > > > > > > >        		struct page *page = dic->cpages[i];
> > > > > > > > > > > 
> > > > > > > > > > > por_fsstress still hang in this line?
> > > > > > > > > > 
> > > > > > > > > > I'm stuck on testing the patches, since the latest kernel is panicking somehow.
> > > > > > > > > > Let me update later, once I can test a bit. :(
> > > > > > > > > 
> > > > > > > > > It seems this works without error.
> > > > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=4e6e1364dccba80ed44925870b97fbcf989b96c9
> > > > > > > > 
> > > > > > > > Ah, good news.
> > > > > > > > 
> > > > > > > > Thanks for helping to test the patch. :)
> > > > > > > 
> > > > > > > Hmm, I hit this again. Let me check w/o compress_cache back. :(
> > > > > > 
> > > > > > Oops :(
> > > > > 
> > > > > Ok, apprantely that panic is caused by compress_cache. The test is running over
> > > > > 24hours w/o it.
> > > > 
> > > > Jaegeuk,
> > > > 
> > > > I'm still struggling troubleshooting this issue.
> > > > 
> > > > However, I failed again to reproduce this bug, I doubt the reason may be
> > > > my test script and environment(device type/size) is different from yours.
> > > > (btw, I used pmem as back-end device, and test w/ all fault injection
> > > > points and w/o write_io/checkpoint fault injection points)
> > > > 
> > > > Could you please share me your run.sh script? and test command?
> > > > 
> > > > And I'd like to ask what's your device type and size?
> > > 
> > > I'm using qemu with 16GB with this script.
> > > https://github.com/jaegeuk/xfstests-f2fs/blob/f2fs/run.sh
> > > 
> > > ./run.sh por_fsstress
> > 
> > Thanks, let me check the difference, and try again.
> 
> Finally, I can reproduce this bug, and after troubleshooting this
> issue, I guess the root cause is not related to this patch, could
> you please test patch "f2fs: compress: fix race condition of overwrite
> vs truncate" with compress_cache enabled? I've ran por_fsstress case
> for 6 hours w/o any problems.

Good, sure. :)

> 
> Thanks,
> 
> > 
> > Thanks,
> > 
> > > 
> > > > 
> > > > Thanks,
> > > > 
> > > > > .
> > > > > 
> > > .
> > > 
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

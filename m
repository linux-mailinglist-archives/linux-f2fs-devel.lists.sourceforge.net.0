Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A37336782A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Apr 2021 06:00:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lZQVo-0003m1-2s; Thu, 22 Apr 2021 04:00:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lZQVl-0003lt-Vm
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Apr 2021 04:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KiX/seWA4jTAXpOVFVXa6cRm+eN/Ngy9j71021TW6HI=; b=eqOE/yrdPVd5rS5UQNZQiVMEaG
 crsGRiHZmVJFYwA6ib6PgdF5HHbZ6WSXIoKs5TGAsy4e3b3X+mbl6B/l5qzFl0R7ZbuyjLBmYz52j
 wiryv3AxKXvJSlFGEzG4qdFHTq3pXUnjtxqFM46DY8rJVKJj+ZBvFiguKuolqAzSBDWs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KiX/seWA4jTAXpOVFVXa6cRm+eN/Ngy9j71021TW6HI=; b=dmywSsiAM2u5PxDss6dsmFU7i7
 k1q9HpBfg4NsPCYQ/dCTKhTpH3Trw+Dx+XMkisFJevQ7RFRgBn9bjPi81L5SGIQ9FRVDTPh8UdmaO
 yHzhhOOA4feOrLH++6vIQuqCNvHO3cQR0hiLQxR+srpS0qQvp3o7LBQ2htAuX8taQwwc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lZQVX-00Av3K-Ff
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Apr 2021 04:00:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD9C460FE8;
 Thu, 22 Apr 2021 03:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619063986;
 bh=sOG50lQx/QyWi7j6X1avXiDvNEAO7rg4qaEucXSQ1Tw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t7ZL6RfSErQPWDiuAw4uHwdubQmq5UUdMNl9yY1psmQ2HkGEGp+aXIDrPz6srDEfy
 aQSN3Y4PnBuDYNrOsyZUVaRpiZ2+BkZlpiiiaxE2ikW1eFASKlWIob8zMukl5HDNdS
 IirlBf+BL2qYWpnMfCw/vbdNIkEGlXqopcGNlnfxurN9dO/s7AG7MrlwCaXsiFnPtg
 CqS7rDPI03c/MMyZCsaM3+HLPDlVl9Y3Hwwmbo2Zrfytq4rvZ17t0jz3KFS2Um1aZ8
 LXXrJuDN74Ktcbssv8ajY5HENCjX41Wm6KKZ5bZ9wUFcxb+zpyXGeqlSf96QJbADev
 SIH49g8EeZN+g==
Date: Wed, 21 Apr 2021 20:59:44 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YID0sDPrUxOJLz+A@google.com>
References: <20210202080056.51658-1-yuchao0@huawei.com>
 <46e9924c-0086-cd2a-2e93-7149b92ba27e@huawei.com>
 <YDsleDjeIcpuBXKA@google.com> <YEFBAuP26t0RzVHZ@google.com>
 <01a0ff76-6fa7-3196-8760-e7f6f163ef64@huawei.com>
 <YEa66ekikyuPWSyd@google.com>
 <a40929d4-a8de-98ea-8dd8-6c807d8a6adc@huawei.com>
 <YEkxpAp8FQjRUfm6@google.com>
 <157988c7-079f-0c9f-5cf9-e83bc2f835d1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157988c7-079f-0c9f-5cf9-e83bc2f835d1@huawei.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1lZQVX-00Av3K-Ff
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

On 04/21, Chao Yu wrote:
> On 2021/3/11 4:52, Jaegeuk Kim wrote:
> > On 03/09, Chao Yu wrote:
> > > On 2021/3/9 8:01, Jaegeuk Kim wrote:
> > > > On 03/05, Chao Yu wrote:
> > > > > On 2021/3/5 4:20, Jaegeuk Kim wrote:
> > > > > > On 02/27, Jaegeuk Kim wrote:
> > > > > > > On 02/04, Chao Yu wrote:
> > > > > > > > Jaegeuk,
> > > > > > > > 
> > > > > > > > On 2021/2/2 16:00, Chao Yu wrote:
> > > > > > > > > -	for (i = 0; i < dic->nr_cpages; i++) {
> > > > > > > > > +	for (i = 0; i < cc->nr_cpages; i++) {
> > > > > > > > >      		struct page *page = dic->cpages[i];
> > > > > > > > 
> > > > > > > > por_fsstress still hang in this line?
> > > > > > > 
> > > > > > > I'm stuck on testing the patches, since the latest kernel is panicking somehow.
> > > > > > > Let me update later, once I can test a bit. :(
> > > > > > 
> > > > > > It seems this works without error.
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=4e6e1364dccba80ed44925870b97fbcf989b96c9
> > > > > 
> > > > > Ah, good news.
> > > > > 
> > > > > Thanks for helping to test the patch. :)
> > > > 
> > > > Hmm, I hit this again. Let me check w/o compress_cache back. :(
> > > 
> > > Oops :(
> > 
> > Ok, apprantely that panic is caused by compress_cache. The test is running over
> > 24hours w/o it.
> 
> Jaegeuk,
> 
> I'm still struggling troubleshooting this issue.
> 
> However, I failed again to reproduce this bug, I doubt the reason may be
> my test script and environment(device type/size) is different from yours.
> (btw, I used pmem as back-end device, and test w/ all fault injection
> points and w/o write_io/checkpoint fault injection points)
> 
> Could you please share me your run.sh script? and test command?
> 
> And I'd like to ask what's your device type and size?

I'm using qemu with 16GB with this script.
https://github.com/jaegeuk/xfstests-f2fs/blob/f2fs/run.sh

./run.sh por_fsstress

> 
> Thanks,
> 
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

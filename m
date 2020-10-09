Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AF6288163
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Oct 2020 06:33:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQk5e-0001Hi-0v; Fri, 09 Oct 2020 04:33:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kQk5c-0001HU-TF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Oct 2020 04:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bj61XLTMVizqlclECCSfQbCgcdIYTvPUgM0XNb/dcZk=; b=VyJk5lfcijv1jCTs2w4x+y9+fw
 Zipi9iPzrl8bZNA087pakD/Hi6VX8GM4WkD9PuAFtU6CE7f8iFy8tkZ1pnyHmepX1pZLrAefW06bb
 rPPa9qnn3JWWUz2mWgG1VG6ghTm3JV3bwRniVGdrT9zGx4Vp/w8+r+3R2Mv7QEB6QeTc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bj61XLTMVizqlclECCSfQbCgcdIYTvPUgM0XNb/dcZk=; b=E1Csx3akq92AfrL9YIXPWLRY3i
 2NGgRy1To5Bqe2Uff88qJP+8WMGK81B6XuBdxwiI0qcG12ADaFzXB0kavYCpb9wBS5Ks7PLTQUqiW
 Dv6Y2/QsxZVB72bkloKOpSH92VrkiztJJkQBpMOccR2vW0ea9qqbROqEFQ396FG81n8k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQk5P-007wkE-MT
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Oct 2020 04:33:08 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30EB12223C;
 Fri,  9 Oct 2020 04:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602217958;
 bh=SdrY3x/AegRW3+Z55+vO/ZT63wJgoZN3xHB0iZxUPJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TaEF/uk2ucCTptiXF1qhWAK0nO4/1eckb6mlwfsk2IF5NFPxgcg3AHiyTgLNAtCW6
 dbNQuYNTtjBe5L9d0nLfA8Ty+2zkIWZkBjiCb8y+s7tdtaaOGJDZtEdcXnuu6GrLTV
 o3yTjJwy3NHqC/rKW5VgqBDe/9nJeDED/YcwNV44=
Date: Thu, 8 Oct 2020 21:32:37 -0700
From: jaegeuk@kernel.org
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201009043237.GB1973455@google.com>
References: <000000000000432c5405b1113296@google.com>
 <20201007213253.GD1530638@gmail.com>
 <20201007215305.GA714500@google.com>
 <c7baef0d-d459-114f-7146-627f0c4159ad@huawei.com>
 <20201009015015.GA1931838@google.com>
 <8fa4f9fe-5ca5-f3a3-c8f4-e800373c1e46@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8fa4f9fe-5ca5-f3a3-c8f4-e800373c1e46@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kQk5P-007wkE-MT
Subject: Re: [f2fs-dev] [f2fs bug] infinite loop in
 f2fs_get_meta_page_nofail()
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
Cc: Eric Biggers <ebiggers@kernel.org>,
 syzbot+ee250ac8137be41d7b13@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/09, Chao Yu wrote:
> On 2020/10/9 9:50, jaegeuk@kernel.org wrote:
> > On 10/09, Chao Yu wrote:
> > > On 2020/10/8 5:53, jaegeuk@kernel.org wrote:
> > > > On 10/07, Eric Biggers wrote:
> > > > > [moved linux-fsdevel to Bcc]
> > > > > 
> > > > > On Wed, Oct 07, 2020 at 02:18:19AM -0700, syzbot wrote:
> > > > > > Hello,
> > > > > > 
> > > > > > syzbot found the following issue on:
> > > > > > 
> > > > > > HEAD commit:    a804ab08 Add linux-next specific files for 20201006
> > > > > > git tree:       linux-next
> > > > > > console output: https://syzkaller.appspot.com/x/log.txt?x=17fe30bf900000
> > > > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=26c1b4cc4a62ccb
> > > > > > dashboard link: https://syzkaller.appspot.com/bug?extid=ee250ac8137be41d7b13
> > > > > > compiler:       gcc (GCC) 10.1.0-syz 20200507
> > > > > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1336413b900000
> > > > > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12f7392b900000
> > > > > > 
> > > > > > The issue was bisected to:
> > > > > > 
> > > > > > commit eede846af512572b1f30b34f9889d7df64c017d4
> > > > > > Author: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > > > Date:   Fri Oct 2 21:17:35 2020 +0000
> > > > > > 
> > > > > >       f2fs: f2fs_get_meta_page_nofail should not be failed
> > > > > > 
> > > > > 
> > > > > Jaegeuk, it looks like the loop you added in the above commit doesn't terminate
> > > > > if the requested page is beyond the end of the device.
> > > > 
> > > > Yes, that will go infinite loop. Otherwise, it will trigger a panic during
> > > > the device reboot. Let me think how to avoid that before trying to get the
> > > > wrong lba access.
> > > 
> > > Delivering f2fs_get_sum_page()'s return value needs a lot of codes change, I think
> > > we can just zeroing sum_page in error case, as we have already shutdown f2fs via
> > > calling f2fs_stop_checkpoint(), then f2fs_cp_error() will stop all updates to
> > > filesystem data including summary pages.
> > 
> > That sounds like one solution tho, I'm afraid of getting another panic by
> > wrong zero'ed summary page.
> 
> What case do you mean? maybe I missed some corner cases?

I sent v2 to fix syzbot issue, which fixes wrong use of
f2fs_get_meta_page_nofail.

> 
> Thanks,
> 
> > 
> > > 
> > > Thoughts?
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > > 
> > > > > - Eric
> > > > 
> > > > 
> > > > _______________________________________________
> > > > Linux-f2fs-devel mailing list
> > > > Linux-f2fs-devel@lists.sourceforge.net
> > > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > > > .
> > > > 
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

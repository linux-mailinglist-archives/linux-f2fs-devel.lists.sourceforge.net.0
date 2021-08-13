Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C4E3EBC49
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Aug 2021 20:56:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mEcLs-0004YS-DX; Fri, 13 Aug 2021 18:56:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1mEcLr-0004YL-Ae
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 18:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GIVk7lT2Bi50cpFHM3Grw7DyAbksPO/2FH2wPlsCJUw=; b=bEgJv187JRgXBkCIfE5L3VnG5Q
 mI3whKniIt1yMdx5W3UwoFUDYGm8xi3pOKxBbUyx6LQPWSCMsvOn55DEfWaxlYiqY7KkflE69Mh+c
 hgONSWmDd85rkZsm+G3xtHWzYSTljc7I20gqJjY4H77MEXNAnxUAgZE6EB6wqvYUUiG8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GIVk7lT2Bi50cpFHM3Grw7DyAbksPO/2FH2wPlsCJUw=; b=WrWliXEgBK9Kp0ajcXxDU+7UPs
 DHkSl8hdXeec82PpxPfsqpuR5ELtBI/AhFrpkgGJPdOZQDNMOOwb/ivbzpCW1Q0w0W+ULT12EjWY1
 ypUutuVWrV9w6/lJET4iDhIS/P4kdpKiieusvjHkVZZAsjFA2IRf4olve56cYKlc3Kvk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mEcLp-005PsX-Rf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 18:56:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7214D6024A;
 Fri, 13 Aug 2021 18:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628880967;
 bh=3uaHgmEvZhNDKI0rrRHd0Jlbqr0chISUgb3mTBGDw1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XbgdhBpClZ7Hi6JQOA6pxuTrCl62aWCa4E3l1zxlnqsyM4lbCXFQJZpVtGxallJU3
 qKyHb52zny5w2E8YGgSQ3k8HUxOPpyqGBkzeAiPmLPdD8Df0su/iWWNdZig7RbF4p6
 d0NzEsgM+Si5sX9ZEtPibMCBS9t8yuYW5z0nQBeTRZmBfyU98Ag0ocQkMgl447Moe+
 oxiijqJo5TobAwmX2uZw2CtkEBKVm8r77ZKsqQtHuWEWNm9Tooe5+ZDvVt3Og0mxy6
 MWCQgDoNZgDnPOYmanRhv2q1tf9bvoENra5qWdPIIPN/fkp9mHIVVAPa8XHNGotdsE
 JgL9uA9NfJTgA==
Date: Fri, 13 Aug 2021 11:56:06 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YRbARsMfs2O2fz2s@google.com>
References: <20210803225542.3487172-1-daeho43@gmail.com>
 <2a79c1c5-366b-92d9-4025-dbda660b1178@kernel.org>
 <YRWKKQe0bcgjKIIA@google.com>
 <b1a7b8a6-89dc-9076-2388-ced59aa8c47c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1a7b8a6-89dc-9076-2388-ced59aa8c47c@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mEcLp-005PsX-Rf
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce periodic iostat io
 latency traces
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/13, Chao Yu wrote:
> On 2021/8/13 4:52, Jaegeuk Kim wrote:
> > On 08/11, Chao Yu wrote:
> > > Hi Daeho,
> > > 
> > > On 2021/8/4 6:55, Daeho Jeong wrote:
> > > > From: Daeho Jeong <daehojeong@google.com>
> > > > 
> > > > Whenever we notice some sluggish issues on our machines, we are always
> > > > curious about how well all types of I/O in the f2fs filesystem are
> > > > handled. But, it's hard to get this kind of real data. First of all,
> > > > we need to reproduce the issue while turning on the profiling tool like
> > > > blktrace, but the issue doesn't happen again easily. Second, with the
> > > > intervention of any tools, the overall timing of the issue will be
> > > > slightly changed and it sometimes makes us hard to figure it out.
> > > > 
> > > > So, I added F2FS_IOSTAT_IO_LATENCY config option to support printing out
> > > > IO latency statistics tracepoint events which are minimal things to
> > > > understand filesystem's I/O related behaviors. With "iostat_enable" sysfs
> > > > node on, we can get this statistics info in a periodic way and it
> > > > would cause the least overhead.
> > > > 
> > > > [samples]
> > > >    f2fs_ckpt-254:1-507     [003] ....  2842.439683: f2fs_iostat_latency:
> > > > dev = (254,11), iotype [peak lat.(ms)/avg lat.(ms)/count],
> > > > rd_data [136/1/801], rd_node [136/1/1704], rd_meta [4/2/4],
> > > > wr_sync_data [164/16/3331], wr_sync_node [152/3/648],
> > > > wr_sync_meta [160/2/4243], wr_async_data [24/13/15],
> > > > wr_async_node [0/0/0], wr_async_meta [0/0/0]
> > > > 
> > > >    f2fs_ckpt-254:1-507     [002] ....  2845.450514: f2fs_iostat_latency:
> > > > dev = (254,11), iotype [peak lat.(ms)/avg lat.(ms)/count],
> > > > rd_data [60/3/456], rd_node [60/3/1258], rd_meta [0/0/1],
> > > > wr_sync_data [120/12/2285], wr_sync_node [88/5/428],
> > > > wr_sync_meta [52/6/2990], wr_async_data [4/1/3],
> > > > wr_async_node [0/0/0], wr_async_meta [0/0/0]
> > > > 
> > > > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > > > 
> > > > ---
> > > > v2: clean up with wrappers and fix a build breakage reported by
> > > >       kernel test robot <lkp@intel.com>
> > > > ---
> > > >    fs/f2fs/Kconfig             |   9 +++
> > > 
> > > I try to apply this patch in my local dev branch, but it failed due to
> > > conflicting with below commit, it needs to rebase this patch to last dev
> > > branch.
> > 
> > I applied this in dev branch. Could you please check?
> 
> Yeah, I see.
> 
> > > > +config F2FS_IOSTAT_IO_LATENCY
> > > > +	bool "F2FS IO statistics IO latency information"
> > > > +	depends on F2FS_FS
> > > > +	default n
> > > > +	help
> > > > +	  Support printing out periodic IO latency statistics tracepoint
> > > > +	  events. With this, you have to turn on "iostat_enable" sysfs
> > > > +	  node to print this out.
> > > 
> > > This functionality looks independent, how about introuducing iostat.h
> > > and iostat.c (not sure, maybe trace.[hc])to include newly added structure
> > > and functions for dispersive codes cleanup.
> 
> Thoughts? this also can avoid using CONFIG_F2FS_IOSTAT_IO_LATENCY in many places.

It seems there's somewhat dependency with iostat which is done by default.
How about adding this by default as well in the existing iostat, and then
covering all together by F2FS_IOSTAT?

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

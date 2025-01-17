Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DAFA15482
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2025 17:40:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tYpOb-0001uD-2H;
	Fri, 17 Jan 2025 16:40:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tYpOY-0001u0-Sk
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 16:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hcimtnLGILviAxlqpwslmiYlBQJ5lH7t+aU9K2U0DN4=; b=gdBus7bFPImQV0nYqBKH96i21v
 r5H5uO+zS2r3wtFo22UH8p+6Fal6sDL7F2B4Ip1U8oCWRdBb56hD1h1yE8w0Kh1FQULVqv5SJGXMN
 YfHv1N0M7XPEW/6KxwlCXXQvSDEChOChysOC3gw9+D1N76zr9rY7oPPvMzTTVxkyQvLY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hcimtnLGILviAxlqpwslmiYlBQJ5lH7t+aU9K2U0DN4=; b=dh8ReZlsAbZvVlRUs5e0oJLf5h
 LzubszypzdaHFiwjRcdGA4t5ouKfu6mDeqn/R1PcFMBiQAMqX5RyesGy386lN1UmxtteJmsH+T6gc
 VHUqVhBb/ttmsz0n+wmtIBDjVMWuEf1cCphi28SoOFIe6S2ZWMlpmDmqY9wmheqNsbpQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tYpOY-0004zD-VC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 16:40:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E813D5C4A0F;
 Fri, 17 Jan 2025 16:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ECF2C4CEDD;
 Fri, 17 Jan 2025 16:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737132025;
 bh=7ia9QXVnyp6GQ8EnTYC/sW6gQbchfcMyF3uTvTk7F1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GZH0mcMpvosStXN/9FVC62YciAJGHG2pEJE+0sQO1U9TzysOa7vH00tqs8Jr9o3Ak
 fKEBgH+wdmobrE8rnLIJwB4lD3YgZ2KWBhTBLCITmGyMHkk0GSMDpdeChrCHUM07Sq
 rfE8Z9z92DZoE+V4MLQcKHJnN1df2M/GpgyPs8tDP7wZqkynBcwOyIe4RK1xD9bF6e
 SPKj2v+Y3Xqhru5enmQke4BZ+vCYK0GOBSwgeL0ih+kLtWxwNIeks0/5fcmXAqVS36
 6JqJSbyeE6du/7Yq5cOuhSQounJEBOscgY4paFrSy511ASq4JdDD8u3lIguYUIkhJj
 9HGSf90IBMItw==
Date: Fri, 17 Jan 2025 16:40:23 +0000
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <Z4qH9wD3oa2hfaLY@google.com>
References: <20250116172438.2143971-1-jaegeuk@kernel.org>
 <Z4oNmx2xPkdzvkUd@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4oNmx2xPkdzvkUd@infradead.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/16, Christoph Hellwig wrote: > Still NAC for sneaking
 in an almost undocumented MM feature into > a file system ioctl. Especially
 while a discussion on that is still > ongoin. > > And it's still [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tYpOY-0004zD-VC
Subject: Re: [f2fs-dev] [PATCH 0/2 v5] add ioctl/sysfs to donate file-backed
 pages
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/16, Christoph Hellwig wrote:
> Still NAC for sneaking in an almost undocumented MM feature into
> a file system ioctl.  Especially while a discussion on that is still
> ongoin.
> 
> And it's still bad that you don't even bother to Cc fsdevel on this,
> nor linux-api or in this case the mm list.

Well, I don't want to bother other groups for random APIs, unless I, myself, am
super confident this is feasible for generic API.
But, let me try to listen to other opinions.

> 
> On Thu, Jan 16, 2025 at 05:19:42PM +0000, Jaegeuk Kim wrote:
> > If users clearly know which file-backed pages to reclaim in system view, they
> > can use this ioctl() to register in advance and reclaim all at once later.
> > 
> > Change log from v4:
> >  - fix range handling
> > 
> > Change log from v3:
> >  - cover partial range
> > 
> > Change log from v2:
> >  - add more boundary checks
> >  - de-register the range, if len is zero
> > 
> > Jaegeuk Kim (1):
> >   f2fs: add a sysfs entry to request donate file-backed pages
> > 
> > Yi Sun (1):
> >   f2fs: Optimize f2fs_truncate_data_blocks_range()
> > 
> >  Documentation/ABI/testing/sysfs-fs-f2fs |  7 ++++++
> >  fs/f2fs/f2fs.h                          |  2 ++
> >  fs/f2fs/file.c                          | 29 +++++++++++++++++++++----
> >  fs/f2fs/shrinker.c                      | 27 +++++++++++++++++++++++
> >  fs/f2fs/sysfs.c                         |  8 +++++++
> >  5 files changed, 69 insertions(+), 4 deletions(-)
> > 
> > -- 
> > 2.48.0.rc2.279.g1de40edade-goog
> > 
> > 
> ---end quoted text---


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

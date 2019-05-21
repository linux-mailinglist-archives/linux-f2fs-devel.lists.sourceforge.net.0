Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C54A5244EF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 May 2019 02:10:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSsM9-0001N1-76; Tue, 21 May 2019 00:10:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hSsM7-0001Mm-QF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 May 2019 00:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E2pq6QeksmIdGGvkynjqmFMFYRz9mpacS6fTkN+Alss=; b=KbIIZeECeKCOZEu2f29+xPoWQd
 8PWMNe+lbmeanBwerfQPRbgj3NQGoi0xiT7kRUk9Jt4PR5OTQACDrn9GcbE6QQpUBP9OfRWAKciNK
 gBQzizOp1VAarlRkzMGBN4AIxN4SPMqzuQK7YPKRMWN0WGvfsm6KyiVgNelhGJAcvzFo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E2pq6QeksmIdGGvkynjqmFMFYRz9mpacS6fTkN+Alss=; b=FHdh+QiWyvxLVMsPbI+ix5HoZq
 lp6hRF1pVOzxo3QD+snT/DwiS4IJD5dkKqHsrBLFQRzS2nqCQqf4QQeg9HqN8N1e8K48py0miuwht
 wLg6rPseqPFIHCUpztHPbHrQFjO+JVaqkTCbn8sUbv+9jEsxEPRe/VZy/5BOs9jjvmwQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSsM6-00CRgY-CV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 May 2019 00:10:11 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 881A320863;
 Tue, 21 May 2019 00:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558397401;
 bh=or21iL4KvipciQ5XyjyEiSvUe5S9vg27M3BVcPAAB7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CNjBqRaeGObXybYSVFPq/wGmuRdedAYx9R1YaosWQZD3SOsuHlUVYV6kLbGJeXmcV
 CgDCXIxqI6cI0YZGizgrPHV4tB1GWpbE90nomGlymwY5BxZJf9JxAqKvUCWX2RQGH+
 2ubg3yUGBG5U2HMDhn9mA4olfqpnYIqf1r0axedc=
Date: Mon, 20 May 2019 17:10:00 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190521001000.GD61195@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190514063623.57162-1-qkrwngud825@gmail.com>
 <81acd624-8698-a584-f298-7e64ad77752d@huawei.com>
 <CAD14+f0Zia3oAi+QO+wCBrbV_=csp1SWB4BE7yN0h+=paZpg=w@mail.gmail.com>
 <8cd6214c-d15d-d6c6-224e-69ad7936605d@huawei.com>
 <CAD14+f2G5M7qqEvztd7nC=MNvSbLtkRKzNA89zGdYSb1FgP6LQ@mail.gmail.com>
 <7d430871-ebae-4ff8-ebeb-1721b8bb90a5@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d430871-ebae-4ff8-ebeb-1721b8bb90a5@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hSsM6-00CRgY-CV
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: remove sleep_time under gc_urgent
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/15, Chao Yu wrote:
> Hi Ju Hyung,
> 
> On 2019/5/14 19:30, Ju Hyung Park wrote:
> > Hi Chao,
> > 
> > On Tue, May 14, 2019 at 8:19 PM Chao Yu <yuchao0@huawei.com> wrote:
> >>> I've been using this(with a slightly different code) for years and yet to notice
> >>> any spikes in lags/slowdowns. Worst scenario, I'd just have to deal with an
> >>> added split second(100ms max?) delay in screen wake-up.
> >>
> >> I'm not sure about why this happened... maybe you need to do some test to
> >> analyse the root cause of it, filesystem/device fragment? too many undiscard
> >> space? or non-storage issue?
> > 
> > Um, I'm not sure you understood what I said.
> > What I meant is that I haven't found any issues with using an approach
> > like this(gc_urgent with 1ms sleep intervals) for years on various
> > Android devices.
> 
> Ah, sorry, I misread what you said.
> 
> > 
> >> I agreed that it should done as soon as possible, but it needs to consider IO
> >> race in between Apps after screen wake-up and BGGC to avoid potential ANR.
> > 
> > I actually need to check whether vold turns off gc_urgent immediately
> > after screen turns itself back on.
> > I don't think we need to take potential ANR in to account *if* vold
> > stops gc_urgent right after screen-on. What do you think?
> 
> What do you mean, I didn't catch it...
> 
> > 
> >> It's userspace strategy, we can change both of them
> >> (vold_wait_time/gc_urgent_sleep_time) in userspace if current value doesn't make
> >> any sense.
> > 
> > Even the user can set the tunables themselves, the default should be
> > sensical imo.
> 
> Agreed, how about adjusting this default value according device type, for fast
> device, like SSD, we can set default interval to very small value.
> 
> Maybe we can implement this base on below commit if you agreed.
> 
> f2fs: support tunning for multiple kind of storage device
> 
> Thanks,
> 
> > An "urgent" GC that only GCs up-to 2 segments per second doesn't sound
> > that "urgent" :p

Yes, it seems I set it too conservatively at that time. It'd be fine to decrease
the default time, but I'd prefer to remain the sysfs entry in order for user to
configure it just in case. It'd be also great to have the above Chao's patch to
have some default values regarding to discard/GC policies.

Thanks,

> > 
> > Thanks.
> > .
> > 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

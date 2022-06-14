Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B3254B70E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jun 2022 19:01:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o19ue-0005BT-RM; Tue, 14 Jun 2022 17:01:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsiangkao@linux.alibaba.com>) id 1o19ub-0005BM-Vd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 17:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iOBSTaLoX5Mc/lpfGYTTyOBWNhWZGkQwzJ+kckmdZcE=; b=cItEeHkO7RQ1xji1QAc4iRe/IH
 qBus6sQH+nBq4JxxNKnTWhaDq84uLFKsMkOJL/rQQBf/vYOFXtmHtSkMdmucea0r/OiCtshQhb4+N
 cMGAtxybJLldsf+e+TchdK3VxtRLHAZotQJFwmT+1dD3gvEeZlD4vsb9aOX//WVZQhZs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iOBSTaLoX5Mc/lpfGYTTyOBWNhWZGkQwzJ+kckmdZcE=; b=P7aeCWRwA+hNDpvjR66L6AswH4
 rUow71t+XdaDnTmxWATZgeWS9nALaFcDuPQU9A4v5qCMbTKMUzmXrHhCK5tINaXTvcSF12JUVFOGR
 8/xUWoBF1vCwODcOfuWo6ioIo9gyL/EpeZwjuoyJCRs/m5TdguqwQKMkFuRi4xggRl/g=;
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o19uW-001cUP-0f
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 17:01:04 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VGOFTul_1655226047; 
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VGOFTul_1655226047) by smtp.aliyun-inc.com;
 Wed, 15 Jun 2022 01:00:49 +0800
Date: Wed, 15 Jun 2022 01:00:47 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <Yqi+vyY4K0mzEdeP@B-P7TQMD6M-0146.local>
References: <20220613155612.402297-1-daeho43@gmail.com>
 <Yqge0XS7jbSnNWvq@sol.localdomain>
 <YqhRBZMYPp/kyxoe@B-P7TQMD6M-0146.local>
 <CACOAw_wjCyTmwusY6S4+NgMuLOZm9fwGfrvCT272GJ01-RP6PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_wjCyTmwusY6S4+NgMuLOZm9fwGfrvCT272GJ01-RP6PQ@mail.gmail.com>
X-Spam-Score: -8.0 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Daeho, On Tue, Jun 14, 2022 at 09:46:50AM -0700, Daeho
 Jeong wrote: > > > > Some my own previous thoughts about this strategy: >
 > > > - If we allocate all memory and map these before I/Os, all inflight
 I/Os [...] 
 Content analysis details:   (-8.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [115.124.30.56 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [115.124.30.56 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
X-Headers-End: 1o19uW-001cUP-0f
Subject: Re: [f2fs-dev] [PATCH] f2fs: handle decompress only post processing
 in softirq
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 Nathan Huckleberry <nhuck@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Daeho,

On Tue, Jun 14, 2022 at 09:46:50AM -0700, Daeho Jeong wrote:
> >
> > Some my own previous thoughts about this strategy:
> >
> >  - If we allocate all memory and map these before I/Os, all inflight I/Os
> >    will keep such temporary pages all the time until decompression is
> >    finished. In contrast, if we allocate or reuse such pages just before
> >    decompression, it would minimize the memory footprints.
> >
> >    I think it will impact the memory numbers at least on the very
> >    low-ended devices with bslow storage. (I've seen f2fs has some big
> >    mempool already)
> >
> >  - Many compression algorithms are not suitable in the softirq contexts,
> >    also I vaguely remembered if softirq context lasts for > 2ms, it will
> >    push into ksoftirqd instead so it's actually another process context.
> >    And it may delay other important interrupt handling.
> >
> >  - Go back to the non-deterministic scheduling of workqueues. I guess it
> >    may be just due to scheduling punishment due to a lot of CPU consuming
> >    due to decompression before so the priority becomes low, but that is
> >    just a pure guess. May be we need to use RT scheduling policy instead.
> >
> >    At least with WQ_HIGHPRI for dm-verity at least, but I don't find
> >    WQ_HIGHPRI mark for dm-verity.
> >
> > Thanks,
> > Gao Xiang
> 
> I totally understand what you are worried about. However, in the real
> world, non-determinism from workqueues is more harsh than we expected.
> As you know, reading I/Os in the system are critical paths most of the
> time and now I/O variations with workqueue are too bad.
> 
> I also think it's better that we have RT scheduling like things here.
> We could think about it more.

Yeah, I heard that you folks are really suffered from the scheduling
issues. But for my own previous experience, extra memory footprints are
really critical in Android low memory scenarios (no matter low-ended
devices or artificial workloads), it tossed me a lot. So I finally 
ntroduced many inplace I/O to handle/minimize that, including inplace
I/O for compressed pages and temporary pages.

But I'm not quite sure what's currently happening now, since we once
didn't have such non-deterministic workqueues, and I don't hear from
other landed vendors.  I think it'd be better to analyse what's going
on for these kworkers from scheduling POV and why they don't schedule
in time.

I also have an idea is much like what I'm doing now for sync
decompression, is that just before lock page and ->read_folio, we can
trigger some decompression in addition to kworker decompression, but it
needs some MM modification, as below:

   !PageUptodate(page)

   some callback to decompress in addition to kworker

   lock_page()
   ->read_folio()

If mm folks don't like it, I think RT thread is also fine after we
analysed the root cause of the kworker delay I think.

Thanks,
Gao Xiang

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C74854B854
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jun 2022 20:10:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1B08-0005uK-QO; Tue, 14 Jun 2022 18:10:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsiangkao@linux.alibaba.com>) id 1o1B07-0005uD-DB
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 18:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bBz3egZk858lzZq8bf+M6/0WMD5VLd4laAeM5EInE6w=; b=nH3G8O4bGltJ32DbSITxyHNSIc
 /C39EC9Y+VjInrCxDNlG51z3ix9kYKdWJM3vGC1j5p41tJk37J+D/BfzFgYRIa5qfQBpTOvH4etNS
 FjyVs8LQ2t9C3ZCPe9H52PVuYybspLtfnEHNnbn9iBamvOEiWXyMcB3S5hZb9TRDI59E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bBz3egZk858lzZq8bf+M6/0WMD5VLd4laAeM5EInE6w=; b=hI2Qj/TFqWUZixSeEtqrE1xKBa
 z35stYG3Up5uGLkUo47iZve/yxqhlYn6i5zY+4Zks88AwpuUVDiwnMbWLT3H3uNPrfDgCgBv+zYBb
 IE+gh6xFLvzdkQk7R8lGZBMQHFmlJ6j/cmoIy7py/4s7oYxlgahzm/o4Rva0lyP3EUk8=;
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o1B02-0000yL-M6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 18:10:52 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R741e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VGONEUp_1655230234; 
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VGONEUp_1655230234) by smtp.aliyun-inc.com;
 Wed, 15 Jun 2022 02:10:36 +0800
Date: Wed, 15 Jun 2022 02:10:34 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <YqjPGpZTUjH4IfZT@B-P7TQMD6M-0146.local>
References: <20220613155612.402297-1-daeho43@gmail.com>
 <Yqge0XS7jbSnNWvq@sol.localdomain>
 <YqhRBZMYPp/kyxoe@B-P7TQMD6M-0146.local>
 <CACOAw_wjCyTmwusY6S4+NgMuLOZm9fwGfrvCT272GJ01-RP6PQ@mail.gmail.com>
 <Yqi+vyY4K0mzEdeP@B-P7TQMD6M-0146.local>
 <CACOAw_xw3jN2KQaiG7AgCttaQr+uqJme=rsj8AT9wdsGWj3iVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_xw3jN2KQaiG7AgCttaQr+uqJme=rsj8AT9wdsGWj3iVQ@mail.gmail.com>
X-Spam-Score: -8.0 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 14, 2022 at 10:49:37AM -0700, Daeho Jeong wrote:
 > > Yeah, I heard that you folks are really suffered from the scheduling
 > > issues. But for my own previous experience, extra memory footp [...] 
 Content analysis details:   (-8.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [115.124.30.42 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
X-Headers-End: 1o1B02-0000yL-M6
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

On Tue, Jun 14, 2022 at 10:49:37AM -0700, Daeho Jeong wrote:
> > Yeah, I heard that you folks are really suffered from the scheduling
> > issues. But for my own previous experience, extra memory footprints are
> > really critical in Android low memory scenarios (no matter low-ended
> > devices or artificial workloads), it tossed me a lot. So I finally
> > ntroduced many inplace I/O to handle/minimize that, including inplace
> > I/O for compressed pages and temporary pages.
> >
> > But I'm not quite sure what's currently happening now, since we once
> > didn't have such non-deterministic workqueues, and I don't hear from
> > other landed vendors.  I think it'd be better to analyse what's going
> > on for these kworkers from scheduling POV and why they don't schedule
> > in time.
> >
> > I also have an idea is much like what I'm doing now for sync
> > decompression, is that just before lock page and ->read_folio, we can
> > trigger some decompression in addition to kworker decompression, but it
> > needs some MM modification, as below:
> >
> >    !PageUptodate(page)
> >
> >    some callback to decompress in addition to kworker
> >
> >    lock_page()
> >    ->read_folio()
> >
> > If mm folks don't like it, I think RT thread is also fine after we
> > analysed the root cause of the kworker delay I think.
> >
> > Thanks,
> > Gao Xiang
> >
> > >
> > > Thanks,
> 
> I don't think this is not a problem with most devices, since the
> allocated memory is not too big and it'll be kept just as long as I/O
> processing is on. However, I still understand what you're worried
> about, so I think I can make a new mount option like "memory=low",
> which can be used to give a hint to F2FS to have a priority on as
> little memory as possible. In this mode, we will try to keep minimal
> memory and we can use the previous implementation for decompression.

Okay, one of our previous tests was that how many applications are
still there after many other applications boot. That makes sense since
most users need to leave as many apps as possible, I know for now we
have swap-like thing, but once it was done without swap. If you reserve
too much memory (with page mempool or even for inflight I/O), it will
impact the alive app numbers compared to uncompressed cases for all
devices (even high-ended devices).

BTW, most crypto algorithms have hardware instructions to boost up,
actually we have some in-house neon lz4 assembly as well. but it still
somewhat slow than crypto algorithms, not to mention some algorithms
like zstd or lzma. Anyway, I personally prefer RT Thread way since it's
more flexible, also for dm-verity at least try with WQ_HIGHPRI, and I've
seen:
https://android-review.googlesource.com/c/kernel/common/+/204421

But I'm not sure why it wasn't upstreamed though.

Thanks,
Gao Xiang

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

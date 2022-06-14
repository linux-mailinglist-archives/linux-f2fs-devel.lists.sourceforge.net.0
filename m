Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFFE54AE38
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jun 2022 12:23:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o13i4-0004N8-Ou; Tue, 14 Jun 2022 10:23:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsiangkao@linux.alibaba.com>) id 1o13i3-0004Mq-4k
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 10:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+zppifxoZfPdvbi7pyGEYqceTOfNNwGdpFm0NHpRf9Q=; b=RXeZzkDTwX9LyYleiRSCzHQDjm
 fQk4Xa9FyyoWt7qc9sf97k+eYO4L/McoiQZxwIsuAGgHTKNUnDIjOeUayF3nKHx/8kDEkT7Gsg7n7
 b4mHBTHjG/A8riACfTt4cbdaHjDhJf2efWv/zl12T5YIQUYP77xpEZxKPn7JLeKJ6jW8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+zppifxoZfPdvbi7pyGEYqceTOfNNwGdpFm0NHpRf9Q=; b=NtdyjUk7qggfFzHg4Ge/pFK6+o
 rBWU++Mm9k2N8UKY09tf5n+KuPbkfOxRZTXzSPFveu08v8xv1SO5dbAibBXK51Ttj7sWXAqSgXvYR
 GfC/cOJTKArLax1xUA/yXLmY2w/dVD2VOI+AQLBbeWr5XxTxjkoRADJiqjswIHklxrPk=;
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o13hy-001BBw-1m
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 10:23:43 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R381e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=7; SR=0; TI=SMTPD_---0VGMmk6n_1655197957; 
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VGMmk6n_1655197957) by smtp.aliyun-inc.com;
 Tue, 14 Jun 2022 17:12:39 +0800
Date: Tue, 14 Jun 2022 17:12:37 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YqhRBZMYPp/kyxoe@B-P7TQMD6M-0146.local>
References: <20220613155612.402297-1-daeho43@gmail.com>
 <Yqge0XS7jbSnNWvq@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yqge0XS7jbSnNWvq@sol.localdomain>
X-Spam-Score: -8.0 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, On Mon, Jun 13, 2022 at 10:38:25PM -0700,
 Eric Biggers
 wrote: > [+Cc Nathan Huckleberry who is looking into a similar problem in
 dm-verity] > > On Mon, Jun 13, 2022 at 08:56:12AM -0700, Daeho Jeong wr [...]
 Content analysis details:   (-8.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [115.124.30.57 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 welcome-list
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1o13hy-001BBw-1m
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
 linux-f2fs-devel@lists.sourceforge.net, Nathan Huckleberry <nhuck@google.com>,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi all,

On Mon, Jun 13, 2022 at 10:38:25PM -0700, Eric Biggers wrote:
> [+Cc Nathan Huckleberry who is looking into a similar problem in dm-verity]
> 
> On Mon, Jun 13, 2022 at 08:56:12AM -0700, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> > 
> > Now decompression is being handled in workqueue and it makes read I/O
> > latency non-deterministic, because of the non-deterministic scheduling
> > nature of workqueues. So, I made it handled in softirq context only if
> > possible.
> > 
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>

...

> 
> One question: is this (the bio endio callback) actually guaranteed to be
> executed from a softirq?  If you look at dm-crypt's support for workqueue-less
> decryption, for example, it explicitly checks 'in_hardirq() || irqs_disabled()'
> and schedules a tasklet if either of those is the case.
> 
> - Eric
> 

Some my own previous thoughts about this strategy:

 - If we allocate all memory and map these before I/Os, all inflight I/Os
   will keep such temporary pages all the time until decompression is
   finished. In contrast, if we allocate or reuse such pages just before
   decompression, it would minimize the memory footprints.

   I think it will impact the memory numbers at least on the very
   low-ended devices with bslow storage. (I've seen f2fs has some big
   mempool already)

 - Many compression algorithms are not suitable in the softirq contexts,
   also I vaguely remembered if softirq context lasts for > 2ms, it will
   push into ksoftirqd instead so it's actually another process context.
   And it may delay other important interrupt handling.

 - Go back to the non-deterministic scheduling of workqueues. I guess it
   may be just due to scheduling punishment due to a lot of CPU consuming
   due to decompression before so the priority becomes low, but that is
   just a pure guess. May be we need to use RT scheduling policy instead.

   At least with WQ_HIGHPRI for dm-verity at least, but I don't find
   WQ_HIGHPRI mark for dm-verity.

Thanks,
Gao Xiang


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

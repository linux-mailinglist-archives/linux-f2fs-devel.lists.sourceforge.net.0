Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F0C7A00F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jul 2019 06:36:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hsJsT-0002K1-Cq; Tue, 30 Jul 2019 04:36:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hsJsQ-0002Jg-WB
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jul 2019 04:36:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CZOc0O/UielP4GF8ZNlYbpU4ZsGMAmhD58W0GFCGJME=; b=PHDEjxqIpal3abLA7imf9FIsnJ
 eC8Zh1JgPy/wo6AT0lfL29JjWVW7Z8LwBX4Zw43zr0MhpvYS13HKtJIqmZWnO5RVYfMopqL+BvOSF
 GlER38D0PSY8Gclql0tD1NcNzVxE4weJJ5TZ7HkXibzrN0JqCAlAfv8Jv1+jXRZhaxtE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CZOc0O/UielP4GF8ZNlYbpU4ZsGMAmhD58W0GFCGJME=; b=D2gadHcU83pSS0ZI/+rHUSCHyC
 4VzvDrezS2414BPmHk6nTsSe4fXdvw98fWA6RvOY8hMqv8NvHgquao/9wsUZEn5XadftdBdrY/ReB
 o/i1QHwDJWoHcn8XMw4bGmPXXVF4teJL0+x+e2qJcMgUj8GkzPrjNgDdQxXnyXTvo4c8=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hsJsP-00H4Qv-PA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jul 2019 04:36:42 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 32BF260592; Tue, 30 Jul 2019 04:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1564461396;
 bh=AgW8T/aFOLgGFp497+tsPv5AXD39QeiyHoimN2WKVE4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dPVIznaXzpPkaXTocG74aVUxQ+XzM8yeP4kHYLzdBIK8lDZHEks99KCvfqTP8hUsL
 /JGqh72utOqTcB1oXL12CIqx5loQTe/4vPUfan60lARz7epIIUJSWHOKIQJhBtNLeX
 WPcpRrqKQFwBc6jH0L8PRJpfK4TFbG5mMgyN4r4Y=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: stummala@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 924966021A;
 Tue, 30 Jul 2019 04:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1564461395;
 bh=AgW8T/aFOLgGFp497+tsPv5AXD39QeiyHoimN2WKVE4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PlMzf4+nENUjFBIdUJU/p4cI6jhCwMJrLbp1LhEC/33eZ20pfcEnFWFMxYEAnRdKJ
 C6NWipbd1AmXdfMYzUyq3ktTmIvfZdzg/UWbC4PUpDT9gov1CDvSue4qvu1YusM/y2
 novZAhzDXI9bMsMGuuzKPthOh44gOTwDv4CmuU1M=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 924966021A
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Tue, 30 Jul 2019 10:06:30 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20190730043630.GG8289@codeaurora.org>
References: <1564377626-12898-1-git-send-email-stummala@codeaurora.org>
 <a5acb5cb-2e77-902f-0a5e-063f7cbd0643@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5acb5cb-2e77-902f-0a5e-063f7cbd0643@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hsJsP-00H4Qv-PA
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix indefinite loop in f2fs_gc()
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

On Tue, Jul 30, 2019 at 12:00:45AM +0800, Chao Yu wrote:
> Hi Sahitya,
> 
> On 2019-7-29 13:20, Sahitya Tummala wrote:
> > Policy - foreground GC, LFS mode and greedy GC mode.
> > 
> > Under this policy, f2fs_gc() loops forever to GC as it doesn't have
> > enough free segements to proceed and thus it keeps calling gc_more
> > for the same victim segment.  This can happen if the selected victim
> > segment could not be GC'd due to failed blkaddr validity check i.e.
> > is_alive() returns false for the blocks set in current validity map.
> > 
> > Fix this by not resetting the sbi->cur_victim_sec to NULL_SEGNO, when
> > the segment selected could not be GC'd. This helps to select another
> > segment for GC and thus helps to proceed forward with GC.
> > 
> > Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > ---
> >  fs/f2fs/gc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index 8974672..7bbcc4a 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -1303,7 +1303,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
> >  		round++;
> >  	}
> >  
> > -	if (gc_type == FG_GC)
> > +	if (gc_type == FG_GC && seg_freed)
> >  		sbi->cur_victim_sec = NULL_SEGNO;
> 
> In some cases, we may remain last victim in sbi->cur_victim_sec, and jump out of
> GC cycle, then SSR can skip the last victim due to sec_usage_check()...
> 

I see. I have a few questions on how to fix this issue. Please share your
comments.

1. Do you think the scenario described is valid? It happens rarely, not very
easy to reproduce.  From the dumps, I see that only block is set as valid in
the sentry->cur_valid_map for which I see that summary block check is_alive()
could return false. As only one block is set as valid, chances are there it
can be always selected as the victim by get_victim_by_default() under FG_GC.

2. What are the possible scenarios where summary block check is_alive() could
fail for a segment?

3. How does GC handle such segments?

Thanks,

> Thanks,
> 
> >  
> >  	if (sync)
> > 

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

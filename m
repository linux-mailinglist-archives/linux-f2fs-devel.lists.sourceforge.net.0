Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A54952E9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2019 03:00:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzsVN-0005NR-7Y; Tue, 20 Aug 2019 01:00:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hzsVM-0005NF-G2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 01:00:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gwgc3ZJr4NkmKAJ26RhpTUQ2I0vGE7pRfPFOFidEa7w=; b=eiDgQhj7sSjFO3Y5007hX0zYrv
 REkS2H6OoPvvyBYTyQzRcgm3/NEO6C26M2xh4b68qpy2qvFz4FIsEdgefpyA4WC41vAZ/K/5cxQR7
 FpxgOVkTiokwW4Z/QtD6jw4Iev6kCtQrKFro3fcIyw0pXBGKvYxv/cjppvrwq0atdnyY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gwgc3ZJr4NkmKAJ26RhpTUQ2I0vGE7pRfPFOFidEa7w=; b=lUY+HaUM/Ek2z1vpvXUhXCgRCh
 riBwrA/7HA0Rp5MMjXeHZIHePRKMYM8vepFIm19S4RW39DB5V+a0wpIt9gX2LZZn+kRPEzsR9jsHM
 nEe79SrdThkGoI6n6mq8O14XplY8CeaEUtUFg/YRxveYpErYjXLmygsPubRBILLA0RH0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzsVL-009FuT-AS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 01:00:08 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B2F322CE8;
 Tue, 20 Aug 2019 01:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566262801;
 bh=3k09FSAiN1EmDJYOwHzqIY0z6rdM/xIPz2fJfXY0Jd0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kUAUu8VZBvG8TphqNQTLtnrtRoyjj9IAiv0JICGK8sVXH8kfovJr0OYIWhDXlU/kO
 Ra2ZbTLGqBu6qfYh0SaXYzLXT6+WwcVwzI6wccUMKh3be1h/qrXcDI9mEcSpGoVyYE
 PZpZcRfLUwHiS2krWglhoAYamsiI9UEtADMq1Has=
Date: Mon, 19 Aug 2019 18:00:00 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190820010000.GA45681@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190816030334.81035-1-yuchao0@huawei.com>
 <3349ceea-85ac-173a-81a4-1188ce3804ca@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3349ceea-85ac-173a-81a4-1188ce3804ca@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hzsVL-009FuT-AS
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid data corruption by
 forbidding SSR overwrite
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

On 08/19, Chao Yu wrote:
> On 2019/8/16 11:03, Chao Yu wrote:
> > There is one case can cause data corruption.
> > 
> > - write 4k to fileA
> > - fsync fileA, 4k data is writebacked to lbaA
> > - write 4k to fileA
> > - kworker flushs 4k to lbaB; dnode contain lbaB didn't be persisted yet
> > - write 4k to fileB
> > - kworker flush 4k to lbaA due to SSR
> > - SPOR -> dnode with lbaA will be recovered, however lbaA contains fileB's
> > data
> > 
> > One solution is tracking all fsynced file's block history, and disallow
> > SSR overwrite on newly invalidated block on that file.
> > 
> > However, during recovery, no matter the dnode is flushed or fsynced, all
> > previous dnodes until last fsynced one in node chain can be recovered,
> > that means we need to record all block change in flushed dnode, which
> > will cause heavy cost, so let's just use simple fix by forbidding SSR
> > overwrite directly.
> > 
> 
> Jaegeuk,
> 
> Please help to add below missed tag to keep this patch being merged in stable
> kernel.
> 
> Fixes: 5b6c6be2d878 ("f2fs: use SSR for warm node as well")

Done.

> 
> Thanks,
> 
> > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > ---
> >  fs/f2fs/segment.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 9d9d9a050d59..69b3b553ee6b 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -2205,9 +2205,11 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
> >  		if (!f2fs_test_and_set_bit(offset, se->discard_map))
> >  			sbi->discard_blks--;
> >  
> > -		/* don't overwrite by SSR to keep node chain */
> > -		if (IS_NODESEG(se->type) &&
> > -				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
> > +		/*
> > +		 * SSR should never reuse block which is checkpointed
> > +		 * or newly invalidated.
> > +		 */
> > +		if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
> >  			if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
> >  				se->ckpt_valid_blocks++;
> >  		}
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

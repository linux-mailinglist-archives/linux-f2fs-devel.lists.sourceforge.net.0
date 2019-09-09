Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF88AD879
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2019 14:04:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i7IPe-0002gZ-OS; Mon, 09 Sep 2019 12:04:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i7IPe-0002gT-3z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 12:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MR3aaNIpDHFxzPvYYJOupc9Xx4OY/goS2zSm9lBMuQs=; b=bknNt4VeKQpyBshF2Fzkbq6ruR
 2sggNyC97EAj2NLb1kfkTH5gclc01+5fid+Gw7zuJsiH/LPdmZoKh0uFwDU+8enqyfgD/DKQ4/2E6
 dp4QnqKvMKeZbqgSDBRL2Tk1BR3nrSq7fEGobJCBggJAeQmmot69dSrzEaPZu//NSZrw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MR3aaNIpDHFxzPvYYJOupc9Xx4OY/goS2zSm9lBMuQs=; b=FgCwL+RMOYbuv4WPpu6Wr0+KdK
 DZZ6z7AgOwx99hsXbTxmAVs2QESk/OEtyakqF0VBHLohfTCHPX380WuQV82woZ107IBjQbswim5UI
 AHOIN4Lik+iv2IIMef5CBC75/EqPWSPV18i+92q2tjI8kJQrtz4d+Iz05az4LU7UNSEw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i7IPc-00F3Rw-8P
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 12:04:54 +0000
Received: from localhost (unknown [148.69.85.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28BD82067B;
 Mon,  9 Sep 2019 12:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568030686;
 bh=9b/8IY4QOe0LwdrOWJ2ftTvFx8mgPq5bP/abAgWH+0Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hg+y8W+vKwgkCTchcgPlYP+HxphpgwrPcPZ/0M+tRDuKTjIpACy6zxOY4caDcM9JN
 yRRLQTNTL5dPIzmtwh2Letb8gNbTQ3XUHLI2XQrOSiiKvpedAD1FZ2KE0e3Qxalosk
 AI3g57p16XzVXxvOIczb2SrDXjwqRbG7rpueyzKA=
Date: Mon, 9 Sep 2019 13:04:43 +0100
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190909120443.GA31108@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190909012532.20454-1-jaegeuk@kernel.org>
 <69933b7f-48cc-47f9-ba6f-b5ca8f733cba@huawei.com>
 <20190909080654.GD21625@jaegeuk-macbookpro.roam.corp.google.com>
 <97237da2-897a-8420-94de-812e94aa751f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <97237da2-897a-8420-94de-812e94aa751f@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i7IPc-00F3Rw-8P
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: do not select same victim right
 again
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

On 09/09, Chao Yu wrote:
> On 2019/9/9 16:06, Jaegeuk Kim wrote:
> > On 09/09, Chao Yu wrote:
> >> On 2019/9/9 9:25, Jaegeuk Kim wrote:
> >>> GC must avoid select the same victim again.
> >>
> >> Blocks in previous victim will occupy addition free segment, I doubt after this
> >> change, FGGC may encounter out-of-free space issue more frequently.
> > 
> > Hmm, actually this change seems wrong by sec_usage_check().
> > We may be able to avoid this only in the suspicious loop?
> > 
> > ---
> >  fs/f2fs/gc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index e88f98ddf396..5877bd729689 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -1326,7 +1326,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
> >  		round++;
> >  	}
> >  
> > -	if (gc_type == FG_GC)
> > +	if (gc_type == FG_GC && seg_freed)
> 
> That's original solution Sahitya provided to avoid infinite loop of GC, but I
> suggest to find the root cause first, then we added .invalid_segmap for that
> purpose.

I've checked the Sahitya's patch. So, it seems the problem can happen due to
is_alive or atomic_file.

> 
> Thanks,
> 
> >  		sbi->cur_victim_sec = NULL_SEGNO;
> >  
> >  	if (sync)
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

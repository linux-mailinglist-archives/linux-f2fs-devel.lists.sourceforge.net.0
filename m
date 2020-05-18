Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 695A81D822F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 May 2020 19:54:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jajxr-0002df-0T; Mon, 18 May 2020 17:54:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jajxp-0002dG-OO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 May 2020 17:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rik9AjREJ8Zw+GwFtnQnVJuu6aWcJW/PaAkQTnnqj6Q=; b=N3xHm3Pujyj9u1KBFgmg0XZrjd
 27Pjsc+34A9wRORTfQrNmhp5ZaIxy3WAMDZQ0DJiJ6tYXqoVhnZ9TcJsCsCo2Diyo1BtuBdnpRfv4
 ArkL8pzWK1NakZxtZbxqvuVyVvu4REi+M/v1LAwomCgeRB0CXLzSfBVZUNz9vQJEql5I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rik9AjREJ8Zw+GwFtnQnVJuu6aWcJW/PaAkQTnnqj6Q=; b=ZuLANFI5OUmJX4YwhpdXpktklx
 mp/fMkJC67Viprhl8dOaK4i0F83SL0Xa6PTiUqKdKylelwJcSBshSCZTxoT1tL7CvPPwliazpZEw9
 kLbSjZpQq68fT9iwgGkX7O7ib3ekIgsLAnw/v1W3ZrWiOsnSOFgoL2jk43dpnCGzymXU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jajxo-00EDsc-1L
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 May 2020 17:54:09 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB45220826;
 Mon, 18 May 2020 17:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589824441;
 bh=FGetf+iVgy0vcrFX5izmqoZB7XMZZxHn5IEkcjsJXMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nyph8D8EtgCp2cujLjccSTM+tAFK5nAoCfNCnEw1Hu786e9LMfic2dssZoVavfoEx
 LhGiKRQxbUfg1E+TjlgUbRoRTdasRXmGPceJ9d2dxt5nn4hsvEWAGsuSt3JLOTVpuO
 aVjJOs7d0f3qaMejLDDZFFUKGak54OZHObqMUKBw=
Date: Mon, 18 May 2020 10:54:00 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200518175400.GA218254@google.com>
References: <20200515021554.226835-1-jaegeuk@kernel.org>
 <9ba6e5ef-068d-a925-1eb9-107b0523666c@huawei.com>
 <20200515144509.GA46028@google.com>
 <cd964a56-b2a7-48de-97a6-5d89d9a590a3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd964a56-b2a7-48de-97a6-5d89d9a590a3@huawei.com>
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jajxo-00EDsc-1L
Subject: Re: [f2fs-dev] [PATCH] f2fs: flush dirty meta pages when flushing
 them
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/18, Chao Yu wrote:
> On 2020/5/15 22:45, Jaegeuk Kim wrote:
> > On 05/15, Chao Yu wrote:
> >> On 2020/5/15 10:15, Jaegeuk Kim wrote:
> >>> Let's guarantee flusing dirty meta pages to avoid infinite loop.
> >>
> >> What's the root cause? Race case or meta page flush failure?
> > 
> > Investigating, but at least, this can avoid the inifinite loop there.
> 
> Hmm... this fix may cover the root cause..

We're getting reached out to one related to this issue where single SSA
page is dirtied at the moment. Anyway, I think it'd be fine to get this
as we can detect any fs consistency issue by fsck. So far, I haven't seen
any problem in all my local stress tests.

> 
> Thanks,
> 
> > 
> > V2:
> > 
> >>From c60ce8e7178004fd6cba96e592247e43b5fd98d8 Mon Sep 17 00:00:00 2001
> > From: Jaegeuk Kim <jaegeuk@kernel.org>
> > Date: Wed, 13 May 2020 21:12:53 -0700
> > Subject: [PATCH] f2fs: flush dirty meta pages when flushing them
> > 
> > Let's guarantee flusing dirty meta pages to avoid infinite loop.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fs/f2fs/checkpoint.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > index 620a386d82c1a..3dc3ac6fe1432 100644
> > --- a/fs/f2fs/checkpoint.c
> > +++ b/fs/f2fs/checkpoint.c
> > @@ -1266,6 +1266,9 @@ void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
> >  		if (unlikely(f2fs_cp_error(sbi)))
> >  			break;
> >  
> > +		if (type == F2FS_DIRTY_META)
> > +			f2fs_sync_meta_pages(sbi, META, LONG_MAX,
> > +							FS_CP_META_IO);
> >  		io_schedule_timeout(DEFAULT_IO_TIMEOUT);
> >  	}
> >  	finish_wait(&sbi->cp_wait, &wait);
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

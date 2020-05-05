Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F861C4CA5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 May 2020 05:24:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jVoBj-00023J-GN; Tue, 05 May 2020 03:24:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jVoBi-000231-Pz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 03:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GXCBQfFN33uQ9CRfSYSznh2cNmqeUwFTGB2BpvZM62U=; b=YK2QBUo/MlqkZ1PggGUN8DFvQ+
 WAWyjS4I2YCDcUnbMe8A98Ma4b4vg5jKht+lH8nbirRcjUF6nfgO3FS8AO4Qar0dQaMC0lyzopyZ7
 s+QktKGUuJrIFw7MkiU3sgs1C9/CpzoRu19sadMlBjdiQ1+V8tpN16DCFG3hVqtpsv4g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GXCBQfFN33uQ9CRfSYSznh2cNmqeUwFTGB2BpvZM62U=; b=dZfE8j7lXKlM1OqDVl8dSYLqE0
 ak1IsOvvPnTl9OJL74MqPWDwuF2Ob2hKOi23qSgMUU+k9BGdk1UQeignSd/75vkNJaF+ZrDBKnhkc
 O6w8TDyunwmCmSz2sotAYXg0L37SIEnOWfLnuMWJhwwseCEh9OiAHCDWVPR/MU7N36Zs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jVoBg-007k2a-MN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 03:24:06 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C3B2820663;
 Tue,  5 May 2020 03:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588649038;
 bh=fGAHGaEt2j3gLtKzmqvCyvgyxN3s0CESFCq+IQi+R54=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JTgWWppOLTMzQME6ZKTNNccGCOrFdc11JW6VwM5LEfQfqml0Rth1qPIbdQ5MR5bSo
 EIzDc2+5BBb9Z/jR1WUTsVshIm1s0J6h9qO+hejNhHBGc5CfnFfNUl/H0HYW6AruCu
 ZjROhd+Md9S7OMFSAY+KVrfTENh0/1x/CxGY2SD8=
Date: Mon, 4 May 2020 20:23:58 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20200505032358.GA136485@google.com>
References: <20200504143538.159967-1-jaegeuk@kernel.org>
 <b18c4be5-b56d-6b6e-3f99-d2fe05d330eb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b18c4be5-b56d-6b6e-3f99-d2fe05d330eb@kernel.org>
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
X-Headers-End: 1jVoBg-007k2a-MN
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove redundant check in
 f2fs_force_buffered_io
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

On 05/05, Chao Yu wrote:
> On 2020-5-4 22:35, Jaegeuk Kim wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> > 
> > We already checked whether the file is compressed or not in
> > f2fs_post_read_required(). So removed f2fs_compressed_file()
> > in f2fs_force_buffered_io().
> 
> Agreed, since I have sent similar patch before:
> 
> https://lkml.org/lkml/2020/3/24/1819

Heh, as I couldn't find yours, I was actually waiting for you to point out. :)

> 
> Just want to know what's the change of backport concern now.

Old ICE support had to decouple f2fs_post_read_required() and
f2fs_forced_buffered_io(). Now, I decide to manage this as we
need to manage this for one kernel version only.

Thanks,

> 
> Thanks,
> 
> > 
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fs/f2fs/f2fs.h | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 6b7b963641696..01a00fc808361 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -4064,8 +4064,6 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
> >  		return true;
> >  	if (f2fs_is_multi_device(sbi))
> >  		return true;
> > -	if (f2fs_compressed_file(inode))
> > -		return true;
> >  	/*
> >  	 * for blkzoned device, fallback direct IO to buffered IO, so
> >  	 * all IOs can be serialized by log-structured write.
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

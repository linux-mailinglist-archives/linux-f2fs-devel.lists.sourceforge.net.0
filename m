Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A34134168
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jan 2020 13:04:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ipA51-0001en-6r; Wed, 08 Jan 2020 12:04:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ipA4z-0001eb-Pc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 12:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H6DMmvtSkJrGXz7FDceasztVCwwZj6CKH3COvQITZ0I=; b=AG8ofWmiSJ2fXWfLVkuwOrA8f8
 r4ELzZrI2g4LoPz/JWxK6bE0kgMyRFmC1trD5fvcXZZFAOiFLIknXRS3KUa5iUxdRyvcSgF6mm1gM
 2dOVQKrBOs9TGKiHGNdmIpd2XVvJ4NJYCUZoqrW1UYqII397FkFrbG/vStQWq+IOxvms=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H6DMmvtSkJrGXz7FDceasztVCwwZj6CKH3COvQITZ0I=; b=LxCyeBpHDpXZY7mPD56Rp7eQ39
 SY0R2nWESpxo70Hih+hdeTv21apegafBVQsTXCTBjlBbj9z6FELs111ButPucr7xPEPVjQDVIZJaQ
 zY3tpUe3YnLtbFa7rQZPX6kirNgTZpG8j7b+aCBWcfVmXDE9u1neOxIEto25zGpiYn/4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ipA4w-00DP7j-LH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 12:04:53 +0000
Received: from localhost (c-98-234-77-170.hsd1.ca.comcast.net [98.234.77.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0270C206DA;
 Wed,  8 Jan 2020 12:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578485085;
 bh=8Ibxjwt6kC+hGFr1IDrRoG3a1vKrpplBnsa/l24ADGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qqe7RbJUrhsfFDWUr1VAjV9s+B+nCgyhyRUUxC3WVvcThiR+pl5QeR+MkEMuYDolu
 NdYxE5lfSt6NpK3W8TY3uKgGk2GxMNbf9s7SBlfxye4Qhy9ijEnjMaXdkFxMI6EOdK
 gK9SGEFaHxbXxvyd0XTkOZyI8j3pFaBXLm6oCSc0=
Date: Wed, 8 Jan 2020 04:04:44 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200108120444.GC28331@jaegeuk-macbookpro.roam.corp.google.com>
References: <20200107020709.73568-1-jaegeuk@kernel.org>
 <afddac87-b7c5-f68c-4e55-3705be311cf6@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afddac87-b7c5-f68c-4e55-3705be311cf6@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ipA4w-00DP7j-LH
Subject: Re: [f2fs-dev] [PATCH] f2fs: add a way to turn off ipu bio cache
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

On 01/08, Chao Yu wrote:
> On 2020/1/7 10:07, Jaegeuk Kim wrote:
> > Setting 0x40 in /sys/fs/f2fs/dev/ipu_policy gives a way to turn off
> > bio cache, which is useufl to check whether block layer using hardware
> > encryption engine merges IOs correctly.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  Documentation/filesystems/f2fs.txt | 1 +
> >  fs/f2fs/segment.c                  | 2 +-
> >  fs/f2fs/segment.h                  | 1 +
> >  3 files changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
> > index 41b5aa94b30f..cd93bcc34726 100644
> > --- a/Documentation/filesystems/f2fs.txt
> > +++ b/Documentation/filesystems/f2fs.txt
> > @@ -335,6 +335,7 @@ Files in /sys/fs/f2fs/<devname>
> >                                 0x01: F2FS_IPU_FORCE, 0x02: F2FS_IPU_SSR,
> >                                 0x04: F2FS_IPU_UTIL,  0x08: F2FS_IPU_SSR_UTIL,
> >                                 0x10: F2FS_IPU_FSYNC.
> 
> . -> ,

Actually, we can't do it. I revised it a bit instead.

> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks,
> 
> > +			       0x40: F2FS_IPU_NOCACHE disables bio caches.
> >  
> >   min_ipu_util                 This parameter controls the threshold to trigger
> >                                in-place-updates. The number indicates percentage
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index a9519532c029..311fe4937f6a 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -3289,7 +3289,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
> >  
> >  	stat_inc_inplace_blocks(fio->sbi);
> >  
> > -	if (fio->bio)
> > +	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 << F2FS_IPU_NOCACHE)))
> >  		err = f2fs_merge_page_bio(fio);
> >  	else
> >  		err = f2fs_submit_page_bio(fio);
> > diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > index a1b3951367cd..02e620470eef 100644
> > --- a/fs/f2fs/segment.h
> > +++ b/fs/f2fs/segment.h
> > @@ -623,6 +623,7 @@ enum {
> >  	F2FS_IPU_SSR_UTIL,
> >  	F2FS_IPU_FSYNC,
> >  	F2FS_IPU_ASYNC,
> > +	F2FS_IPU_NOCACHE,
> >  };
> >  
> >  static inline unsigned int curseg_segno(struct f2fs_sb_info *sbi,
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0101621980B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jul 2020 07:39:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtPHj-0000fm-VL; Thu, 09 Jul 2020 05:39:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jtPHi-0000fc-LZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 05:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ybPb9YGpS26jLz7d9whzYvLJneH+JoiXowC+GvOHffc=; b=m9gCzezypkkX4LBj0ROmuDMmw/
 gippfKISou+KFxxCb4og4vtlqnR2Klt+Yx00RBPdMQK9puDbHlNJNjs/7CfMyulXyyn+RwI8LAwxI
 ma5uKmd1KaDZxfcX5qqm9kp9WRKrjdcyYGqv7zhe8nlQ48q7uNMuwseeC/wsrn116zPc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ybPb9YGpS26jLz7d9whzYvLJneH+JoiXowC+GvOHffc=; b=dbesop5H9HeeQ9htsvqRQzBYP8
 qFfRfG0Bm8cll0T0yqVjQt2M++GUYwbTFCVtchZgJvT8FKaudcvAm1ODzJyiuxFSttdvSQLkWdS3J
 2X5kf8ruPE7c3bGrORsuoAkDFxDOxUHrL/Lpndo/FXa0A05fi4BMIwEYYmkTL9egtdu0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtPHh-00Bnrh-EI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 05:39:50 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E301B20657;
 Thu,  9 Jul 2020 05:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594273184;
 bh=u4VGfYmxoQQo8VoSbT3epFWuRgc3syhk7PNc7fYiTNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rjm7KOItMNWn+yWPSIAoI2JEoMgXWBvZ4eFFL0SdpUT2G0k2HiFsYfQ3Ix4QMXbz0
 1Xr6jRWPWqbWETfjvqy1NqHaupnEclhSr6yGCVR+x90g+svQ4ZcgPH1tj+vmsCKA3L
 LrQH2XCEI6C+PtLzu7s7PLYexvW7eN2CCBHN8ysI=
Date: Wed, 8 Jul 2020 22:39:43 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200709053943.GA352648@google.com>
References: <20200709015739.1653668-1-daeho43@gmail.com>
 <619af72b-2f8a-4a84-f73e-ac49989ba79f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <619af72b-2f8a-4a84-f73e-ac49989ba79f@huawei.com>
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
X-Headers-End: 1jtPHh-00Bnrh-EI
Subject: Re: [f2fs-dev] [PATCH] f2fs: ignore when len of range in
 f2fs_sec_trim_file is zero
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/09, Chao Yu wrote:
> On 2020/7/9 9:57, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> > 
> > When end_addr comes to zero, it'll trigger different behaviour.
> > To prevent this, we need to ignore the case of that range.len is
> > zero in the function.
> > 
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >  fs/f2fs/file.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 368c80f8e2a1..98b0a8dbf669 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -3813,15 +3813,14 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
> >  	file_start_write(filp);
> >  	inode_lock(inode);
> >  
> > -	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
> > +	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode) ||
> > +			range.start >= inode->i_size) {
> >  		ret = -EINVAL;
> >  		goto err;
> >  	}
> >  
> > -	if (range.start >= inode->i_size) {
> > -		ret = -EINVAL;
> > +	if (range.len == 0)
> >  		goto err;
> > -	}
> >  
> >  	if (inode->i_size - range.start < range.len) {
> >  		ret = -E2BIG;
> 
> How about the case trimming last partial written block?
> 
> i_size = 8000
> range.start = 4096
> range.len = 4096
> 
> Do we need to roundup(isize, PAGE_SIZE) before comparison?

If we want to trim whole file, do we need to give the exact i_size?
Wouldn't it be better to give trim(0, -1)?

> 
> Thanks,
> 
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

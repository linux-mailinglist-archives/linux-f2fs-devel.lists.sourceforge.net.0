Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C293532A6FF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Mar 2021 18:05:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lH8Sb-00078i-Ev; Tue, 02 Mar 2021 17:05:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lH8SZ-00078a-EC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 17:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iwW35ITG9Djbu6v8pSlRaf5fZJ4uqak5RPpuDxPk5io=; b=epHWH0GNfVuNueDceKI3yWvo8E
 Mm/RlP9XlP1q7wIFYKVnRG8wa1Iz5vZTatCA54YrZeXi2Pbeahl9xxSnZelmHZJeKWVSRSe+8X0KV
 bDRZ7L/vD4B+eo4iCUyYvML7Yhjyo00jRsQvHXNkUM1qrPn4zEuC8ngKsGFzU9a5j1Wo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iwW35ITG9Djbu6v8pSlRaf5fZJ4uqak5RPpuDxPk5io=; b=HCu16+uQYhlOiPqCCEMl3m6ke8
 qFQgPgxljIWk64pmVQstGv+imfjKjwdSg699tr8ha9ZNGIMwCZ+cVZYzvLV9WIQYnDKn7fESc7ZH3
 5XeigUcXEzO2HExlCkNXc/FPz2HDL4FOCaHA/PkAEzCwK/eMnrmOC+IO90N0LrcLCnJo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lH8SU-00BTKF-4l
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 17:05:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAE6B601FB;
 Tue,  2 Mar 2021 17:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614704707;
 bh=apE6atfdCU5ynjww5gGzXPVqWZw4OaO9hE7kK5VtJI8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LJcRlj9re5bdGrm9vdA9SqBxE7WtM7/5azxcG7xoPjFZrl2mqlocqbIEkWl4gBLqL
 ozsszbnW0UxEf7FUs1Bz4wqzURZOkTwLLyMFvcYimjspOiv5qSwuG8URNyaNtwcxhr
 yGpUqqpyGbgXI2o60vmo6RzDdjT5iryfKtwJPCxbi460cbnRIhsF4P5CTnXDUwVtEe
 zL4vfY7RogF9MpvJGUYEelMZFcBbdhKvpFs7polpISSlE8uIbosCTrC9OFgNhp4Lym
 xZjX5eRWThag92bgmkvMW8QjxS4AdRzTW8ph3xhqkNwu3EUGL2hef775cBEu6gCWiE
 i8w5v3zU12oEg==
Date: Tue, 2 Mar 2021 09:05:05 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YD5wQRX+HnltBvEM@google.com>
References: <20210302054233.3886681-1-jaegeuk@kernel.org>
 <920469a9-45d3-68e3-1f8d-a436bdd60cfe@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <920469a9-45d3-68e3-1f8d-a436bdd60cfe@huawei.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lH8SU-00BTKF-4l
Subject: Re: [f2fs-dev] [PATCH] f2fs: expose # of overprivision segments
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

On 03/02, Chao Yu wrote:
> On 2021/3/2 13:42, Jaegeuk Kim wrote:
> > This is useful when checking conditions during checkpoint=disable in Android.
> 
> This sysfs entry is readonly, how about putting this at
> /sys/fs/f2fs/<disk>/stat/?

Urg.. "stat" is a bit confused. I'll take a look a better ones.

> 
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   fs/f2fs/sysfs.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index e38a7f6921dd..254b6fa17406 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -91,6 +91,13 @@ static ssize_t free_segments_show(struct f2fs_attr *a,
> >   			(unsigned long long)(free_segments(sbi)));
> >   }
> > +static ssize_t ovp_segments_show(struct f2fs_attr *a,
> > +		struct f2fs_sb_info *sbi, char *buf)
> > +{
> > +	return sprintf(buf, "%llu\n",
> > +			(unsigned long long)(overprovision_segments(sbi)));
> > +}
> > +
> >   static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
> >   		struct f2fs_sb_info *sbi, char *buf)
> >   {
> > @@ -629,6 +636,7 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
> >   F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
> >   F2FS_GENERAL_RO_ATTR(dirty_segments);
> >   F2FS_GENERAL_RO_ATTR(free_segments);
> > +F2FS_GENERAL_RO_ATTR(ovp_segments);
> 
> Missed to add document entry in Documentation/ABI/testing/sysfs-fs-f2fs?

Yeah, thanks.

> 
> Thanks,
> 
> >   F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
> >   F2FS_GENERAL_RO_ATTR(features);
> >   F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

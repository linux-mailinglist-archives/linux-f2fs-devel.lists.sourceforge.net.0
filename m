Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C69C2784C6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 07:57:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hryfN-0004tg-Jm; Mon, 29 Jul 2019 05:57:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hryfM-0004tT-Iy
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 05:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZDsvrIFGtacmn+ahgUJv3r26AbPV5jWcaVhqk591MEw=; b=hijwQs5qj348MYjdIukcYoWAPy
 H4m8asIyxB/6EeTAAkE6itkq0cAwjorS4bqvOX8BUK9j2aPieqEg+c8Z2CkUAt5/GbQd2EBm2fK1v
 Gpr5LgIh79IS9sieGU9u3AECzesVzyXz4eaeIvoVIDNwTJ/EESVBW7a1mhCkozjt21LM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZDsvrIFGtacmn+ahgUJv3r26AbPV5jWcaVhqk591MEw=; b=SHBYfpVyx6vTk0/0eVJC9oMwQq
 WP3QKPTqMGjKdnTgq7vwgB6p2pc1tD9nmbDvrWKRSssLE5MXFG7guHObl8y2Q156uBa6Kzeid0iIn
 v26Q8Gm9NfDJ+J/G3fBq2yNycj31UVgnhuIZVZTvQbTK0VVybBBZLEuIyAF2KusUNZWU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hryfL-002dws-CL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 05:57:48 +0000
Received: from localhost (c-98-234-77-170.hsd1.ca.comcast.net [98.234.77.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A83620659;
 Mon, 29 Jul 2019 05:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564379859;
 bh=PhSHlhIS9VKFJ8gwpW+agWY0U+46xjbFGMKruAXIFWU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UOYkVNL8o2BXVoPhIwFjJFchlGzf25+EJgTifEuJtWDralbq4fllM9zumTFgj07+7
 PoIyMplcVVpQZ4tC7D5AxlCPt08F7pT+PYHarHJ/8G5y1JzLElh7TKBdcKsAoCxE1o
 PffBEGF+z5SluAjyPEtjaeJk4NwI3Pj772KClnx4=
Date: Sun, 28 Jul 2019 22:57:38 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190729055738.GA95664@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190719073903.9138-1-yuchao0@huawei.com>
 <20190723023640.GC60778@jaegeuk-macbookpro.roam.corp.google.com>
 <d4d064a2-2b3c-3536-6488-39e7cfdb1ea4@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4d064a2-2b3c-3536-6488-39e7cfdb1ea4@huawei.com>
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
X-Headers-End: 1hryfL-002dws-CL
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: separate NOCoW and pinfile semantics
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

On 07/23, Chao Yu wrote:
> On 2019/7/23 10:36, Jaegeuk Kim wrote:
> > On 07/19, Chao Yu wrote:
> >> Pinning a file is heavy, because skipping pinned files make GC
> >> running with heavy load or no effect.
> > 
> > Pinned file is a part of NOCOW files, so I don't think we can simply drop it
> > for backward compatibility.
> 
> Yes,
> 
> But what I concerned is that pin file is too heavy, so in order to satisfy below
> demand, how about introducing pin_file_2 flag to triggering IPU only during
> flush/writeback.

That can be done by cold files?

> 
> > 
> >>
> >> So that this patch propose to separate nocow and pinfile semantics:
> >> - NOCoW flag can only be set on regular file.
> >> - NOCoW file will only trigger IPU at common writeback/flush.
> >> - NOCow file will do OPU during GC.
> >>
> >> For the demand of 1) avoid fragment of file's physical block and
> >> 2) userspace don't care about file's specific physical address,
> >> tagging file as NOCoW will be cheaper than pinned one.
> 
> ^^^
> 
> Thanks,
> 
> >>
> >> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> >> ---
> >> v2:
> >> - rebase code to fix compile error.
> >>  fs/f2fs/data.c |  3 ++-
> >>  fs/f2fs/f2fs.h |  1 +
> >>  fs/f2fs/file.c | 22 +++++++++++++++++++---
> >>  3 files changed, 22 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> >> index a2a28bb269bf..15fb8954c363 100644
> >> --- a/fs/f2fs/data.c
> >> +++ b/fs/f2fs/data.c
> >> @@ -1884,7 +1884,8 @@ static inline bool check_inplace_update_policy(struct inode *inode,
> >>  
> >>  bool f2fs_should_update_inplace(struct inode *inode, struct f2fs_io_info *fio)
> >>  {
> >> -	if (f2fs_is_pinned_file(inode))
> >> +	if (f2fs_is_pinned_file(inode) ||
> >> +			F2FS_I(inode)->i_flags & F2FS_NOCOW_FL)
> >>  		return true;
> >>  
> >>  	/* if this is cold file, we should overwrite to avoid fragmentation */
> >> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> >> index 596ab3e1dd7b..f6c5a3d2e659 100644
> >> --- a/fs/f2fs/f2fs.h
> >> +++ b/fs/f2fs/f2fs.h
> >> @@ -2374,6 +2374,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
> >>  #define F2FS_NOATIME_FL			0x00000080 /* do not update atime */
> >>  #define F2FS_INDEX_FL			0x00001000 /* hash-indexed directory */
> >>  #define F2FS_DIRSYNC_FL			0x00010000 /* dirsync behaviour (directories only) */
> >> +#define F2FS_NOCOW_FL			0x00800000 /* Do not cow file */
> >>  #define F2FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
> >>  
> >>  /* Flags that should be inherited by new inodes from their parent. */
> >> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> >> index 7ca545874060..ae0fec54cac6 100644
> >> --- a/fs/f2fs/file.c
> >> +++ b/fs/f2fs/file.c
> >> @@ -1692,6 +1692,7 @@ static const struct {
> >>  	{ F2FS_NOATIME_FL,	FS_NOATIME_FL },
> >>  	{ F2FS_INDEX_FL,	FS_INDEX_FL },
> >>  	{ F2FS_DIRSYNC_FL,	FS_DIRSYNC_FL },
> >> +	{ F2FS_NOCOW_FL,	FS_NOCOW_FL },
> >>  	{ F2FS_PROJINHERIT_FL,	FS_PROJINHERIT_FL },
> >>  };
> >>  
> >> @@ -1715,7 +1716,8 @@ static const struct {
> >>  		FS_NODUMP_FL |		\
> >>  		FS_NOATIME_FL |		\
> >>  		FS_DIRSYNC_FL |		\
> >> -		FS_PROJINHERIT_FL)
> >> +		FS_PROJINHERIT_FL |	\
> >> +		FS_NOCOW_FL)
> >>  
> >>  /* Convert f2fs on-disk i_flags to FS_IOC_{GET,SET}FLAGS flags */
> >>  static inline u32 f2fs_iflags_to_fsflags(u32 iflags)
> >> @@ -1753,8 +1755,6 @@ static int f2fs_ioc_getflags(struct file *filp, unsigned long arg)
> >>  		fsflags |= FS_ENCRYPT_FL;
> >>  	if (f2fs_has_inline_data(inode) || f2fs_has_inline_dentry(inode))
> >>  		fsflags |= FS_INLINE_DATA_FL;
> >> -	if (is_inode_flag_set(inode, FI_PIN_FILE))
> >> -		fsflags |= FS_NOCOW_FL;
> >>  
> >>  	fsflags &= F2FS_GETTABLE_FS_FL;
> >>  
> >> @@ -1794,6 +1794,22 @@ static int f2fs_ioc_setflags(struct file *filp, unsigned long arg)
> >>  	if (ret)
> >>  		goto out;
> >>  
> >> +	if ((fsflags ^ old_fsflags) & FS_NOCOW_FL) {
> >> +		if (!S_ISREG(inode->i_mode)) {
> >> +			ret = -EINVAL;
> >> +			goto out;
> >> +		}
> >> +
> >> +		if (f2fs_should_update_outplace(inode, NULL)) {
> >> +			ret = -EINVAL;
> >> +			goto out;
> >> +		}
> >> +
> >> +		ret = f2fs_convert_inline_inode(inode);
> >> +		if (ret)
> >> +			goto out;
> >> +	}
> >> +
> >>  	ret = f2fs_setflags_common(inode, iflags,
> >>  			f2fs_fsflags_to_iflags(F2FS_SETTABLE_FS_FL));
> >>  out:
> >> -- 
> >> 2.18.0.rc1
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A792E37B0FB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 23:47:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgaE7-0003sK-LX; Tue, 11 May 2021 21:47:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lgaE6-0003s6-CV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 21:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wphS/Ppa0NQatcu2LQxO6kv9TxOd7L5oiyfiBtnk5RQ=; b=I7fOPVIL9DQrvYZcEfXTxsZ/S3
 UIFyH/XoFXOyYBt0ms7gFD1HbCaTp3kSg6auggzL+46zHRwkJ7tCOXAkQtGp9ggS9Ags8kY3qrOch
 hbnFcuhMgMiDDtniRl4F58aux9C+4B1gk+Z4EpapEedD77elDz9ZbTiO94EpC3oT1dy4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wphS/Ppa0NQatcu2LQxO6kv9TxOd7L5oiyfiBtnk5RQ=; b=gUlj0sR7p1SS/rHyEfZnel8CTp
 03ZzKCUU2VnyY5ZhNwMNkf2ttx2peOcF8gNJezmH9VXMJ0pE+NGMBrxJm5v9QSWLA9uP6fSErmI3F
 VXVCkbteal9dQxFqPHPMsQ+exOaAXOAKWJdo4k54iTAWXLMGijuLaVYKQcJWhxdEyIJo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgaDx-0003Bm-Cx
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 21:47:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84F26611F1;
 Tue, 11 May 2021 21:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620769644;
 bh=ETXRZR/HWxVHGLjQE9b0GOv3YJdjBNysrbBoj0QJ/6o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UmJFotuJwk2WmkbYL5Kt2j3aShJLYIDMBGhT5K4Mocz8QoSUTyFA7Pj1fyITdGoz6
 4VUdVeXSQnAPgJ04SZwzGktrX+h+zYebkQ3C6CpJDirIp2XQfOz8HnqzfIkBalnUWb
 f9CyuxpSJwBehh4+ttZgOneF+z1IBXhNjDvo0+Ac0WStE1lkJx76nZ0/FoU8ydPnXI
 PGrqgQ/oH00u4r/g8ZDq3yNNOTWpZ7BchBDUd+IZ+wYFC0BWHHrUVNsdVUDNEulTer
 Ce8Ak7VFG8eYqMy8DUhQMDux/tUVs9Mv9oVvppELuFSmdLNQT2WSecSqZNEfJp0/yu
 JUSH7WZLAI5Bg==
Date: Tue, 11 May 2021 14:47:23 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YJr7axIRZcTDrAWE@google.com>
References: <20210429062005epcms2p352ef77f96ab66cbffe0c0ab6c1b62d8a@epcms2p3>
 <3a0ab201-9546-d523-abc7-79df5f637f14@huawei.com>
 <YJN0nTgadoq8vDaG@google.com>
 <bd0fa15b-01c3-9f70-3eb8-ec2b54a0ee8f@huawei.com>
 <YJlHmP/ej8/IsHL3@google.com>
 <6e95edca-4802-7650-4771-5389067935dc@huawei.com>
 <YJoRcIpW1g/OgHZn@google.com>
 <CGME20210429062005epcms2p352ef77f96ab66cbffe0c0ab6c1b62d8a@epcms2p1>
 <20210511064156epcms2p1351480bea36733f2e00022bd295e829e@epcms2p1>
 <771a05fe-e26f-d635-5f8d-5be72f82345f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <771a05fe-e26f-d635-5f8d-5be72f82345f@huawei.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lgaDx-0003Bm-Cx
Subject: Re: [f2fs-dev] [PATCH] f2fs: set file as cold when file
 defragmentation
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/11, Chao Yu wrote:
> On 2021/5/11 14:41, Daejun Park wrote:
> > > On 2021/5/11 13:09, Jaegeuk Kim wrote:
> > > > On 05/11, Chao Yu wrote:
> > > > > On 2021/5/10 22:47, Jaegeuk Kim wrote:
> > > > > > On 05/06, Chao Yu wrote:
> > > > > > > On 2021/5/6 12:46, Jaegeuk Kim wrote:
> > > > > > > > On 05/06, Chao Yu wrote:
> > > > > > > > > On 2021/4/29 14:20, Daejun Park wrote:
> > > > > > > > > > In file defragmentation by ioctl, all data blocks in the file are
> > > > > > > > > > re-written out-of-place. File defragmentation implies user will not update
> > > > > > > > > > and mostly read the file. So before the defragmentation, we set file
> > > > > > > > > > temperature as cold for better block allocation.
> > > > > > > > > 
> > > > > > > > > I don't think all fragmented files are cold, e.g. db file.
> > > > > > > > 
> > > > > > > > I have a bit different opinion. I think one example would be users want to
> > > > > > > > defragment a file, when the they want to get higher read bandwidth for
> > > > > > > 
> > > > > > > Multimedia file was already defined as cold file now via default extension
> > > > > > > list?
> > > > > > 
> > > > > > I just gave an example. And default is default.
> > > > > > 
> > > > > > > 
> > > > > > > > usually multimedia files. That's likely to be cold files. Moreover, I don't
> > > > > > > > think they want to defragment db files which will be fragmented soon?
> > > > > > > 
> > > > > > > I guess like db files have less update but more access?
> > > > > > 
> > > > > > I think both, and we set it as hot.
> > > > > 
> > > > > Then hot and cold bit will set to the same db file after defragmentation?
> > > > 
> > > > Do you set cold bit to db files? I mean, generally db is not cold, but hot.
> > > 
> > > I never set cold bit to db files, I mean if we defragment db file which
> > > has less update and more access, db file may have bot hot and cold bit.
> > > 
> > > To Daejun, may I ask that is Samsung planning to use this defragment ioctl
> > > in products? what's the user scenario?
> > 
> > It is just my idea for defragmentation, not Samsung.
> 
> Alright,
> 
> > I think the user will call the defrag ioctl for the files that have been updated.
> 
> Sadly, I don't see there is any user of this defragment interface since it was
> been introduced... so I really don't know the real use scenario of this interface
> now.
> 
> > 
> > On the other hand, I think FS should be able to support defrag file even
> > when in-place update is applied. What do you think?
> 
> bool f2fs_should_update_inplace(struct inode *inode, struct f2fs_io_info *fio)
> {
> 	if (f2fs_is_pinned_file(inode))
> 		return true;
> 
> 	/* if this is cold file, we should overwrite to avoid fragmentation */
> 	if (file_is_cold(inode))
> 		return true;
> 
> If cold bit was set, later rewrite in defragment interface can only trigger
> IPU due to above IPU policy check, so after this interface, file is still
> fragmented... what's the difference compared to just setting cold bit via
> setxattr?
> 
> And if user know that he will trigger less update and more read in the file,
> why not just calling setxattr("system.advise", cold_bit) to set the file as
> cold before it becomes fragmented, e.g. at the time of file creation?

yea, actually user can set it whatever they want after defragment. :P

> 
> Thanks,
> 
> > 
> > Thanks,
> > Daejun
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > > 
> > > > > Thanks,
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > Thanks,
> > > > > > > 
> > > > > > > > 
> > > > > > > > > 
> > > > > > > > > We have separated interface (via f2fs_xattr_advise_handler, e.g. setfattr -n
> > > > > > > > > "system.advise" -v value) to indicate this file is a hot/cold file, so my
> > > > > > > > > suggestion is after file defragmentation, if you think this file is cold, and
> > > > > > > > > use setxattr() to set it as cold.
> > > > > > > > > 
> > > > > > > > > Thanks,
> > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Daejun Park <daejun7.park@samsung.com>
> > > > > > > > > > ---
> > > > > > > > > >       fs/f2fs/file.c | 3 +++
> > > > > > > > > >       1 file changed, 3 insertions(+)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > > > > > > > > index d697c8900fa7..dcac965a05fe 100644
> > > > > > > > > > --- a/fs/f2fs/file.c
> > > > > > > > > > +++ b/fs/f2fs/file.c
> > > > > > > > > > @@ -2669,6 +2669,9 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
> > > > > > > > > >               map.m_len = pg_end - pg_start;
> > > > > > > > > >               total = 0;
> > > > > > > > > > +        if (!file_is_cold(inode))
> > > > > > > > > > +                file_set_cold(inode);
> > > > > > > > > > +
> > > > > > > > > >               while (map.m_lblk < pg_end) {
> > > > > > > > > >                       pgoff_t idx;
> > > > > > > > > >                       int cnt = 0;
> > > > > > > > > > 
> > > > > > > > .
> > > > > > > > 
> > > > > > .
> > > > > > 
> > > > .
> > > > 
> > > 
> > > 
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

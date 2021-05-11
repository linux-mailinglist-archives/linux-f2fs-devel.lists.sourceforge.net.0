Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E352379F01
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 07:09:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgKdx-0006eA-98; Tue, 11 May 2021 05:09:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lgKdv-0006dv-L5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 05:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=40TAxam/bhj8coi4NyyONEybvAu++FeB0BuAlvpZ91I=; b=nMLISqxJjgqHX7zpKc3LBWQLjj
 XtLTSUm7RQyG1fjHgesJT6tO7q50UrJzriQ7j8ODYVESgTZFu9sV1JsYjPoaWHgqFhga4hUq9PDlB
 727WaiLo9vqQHLLraEslN+T0QHpDsIQ0KRsYCVmH5FJOk+eQTLu0Y58uraB7SOo5ETLY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=40TAxam/bhj8coi4NyyONEybvAu++FeB0BuAlvpZ91I=; b=Ls4PDZfGvQfAFgOk8SxWjlHO/x
 HnDIRI9wkFAosE/2l+YtVHZ79jOZLZIBsTLLdd+601Sp14k6EPbMEv3UwEP5Ib6httE+Sb/P3P6Ds
 0OOSVidEFSonh9rY96B/CVSBNnpXhq/8CIHOfMdCrg2lHLOd2p7Hhi45uVeaBPCM5EhE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgKds-0004Ae-AT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 05:09:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6141A6187E;
 Tue, 11 May 2021 05:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620709746;
 bh=uDrTLbqjHBuDV27sGnx7o+4XL3ViZ8fFjVCDhBcvXxY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X0JIL5Kjhnm/lPR4LxScLrwHwFlTpddi/MLDiSFUaHa7YcnWQXMCM1ZpkqNWeE0HR
 AP6LvUHICb5x6XqGVaQMLg6g30axgSDLU9lioo3BVgldLxn/VFPDyoc5gkSIlDyrF7
 gd/QUhzZamRuPhpcEOibs6b6Bm+Wt4brNMEIxs0dlW3kaKHx7KeHj2JWNtZixqSSb+
 YwIMmwy6cRMrXCl7sdI1b3R+yqDOeovPSu9mIyUuIv/s2e1n/IkiZBNhuhRUnYiESl
 JoZfcE5n1l2bxcNXaiqAHEkO0N+4WfhutdO2FdIC7YT2zLL4uVuh+QSLhw0Ac7QLYO
 PNVmqROVGvqDA==
Date: Mon, 10 May 2021 22:09:04 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YJoRcIpW1g/OgHZn@google.com>
References: <CGME20210429062005epcms2p352ef77f96ab66cbffe0c0ab6c1b62d8a@epcms2p3>
 <20210429062005epcms2p352ef77f96ab66cbffe0c0ab6c1b62d8a@epcms2p3>
 <3a0ab201-9546-d523-abc7-79df5f637f14@huawei.com>
 <YJN0nTgadoq8vDaG@google.com>
 <bd0fa15b-01c3-9f70-3eb8-ec2b54a0ee8f@huawei.com>
 <YJlHmP/ej8/IsHL3@google.com>
 <6e95edca-4802-7650-4771-5389067935dc@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e95edca-4802-7650-4771-5389067935dc@huawei.com>
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
X-Headers-End: 1lgKds-0004Ae-AT
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
> On 2021/5/10 22:47, Jaegeuk Kim wrote:
> > On 05/06, Chao Yu wrote:
> > > On 2021/5/6 12:46, Jaegeuk Kim wrote:
> > > > On 05/06, Chao Yu wrote:
> > > > > On 2021/4/29 14:20, Daejun Park wrote:
> > > > > > In file defragmentation by ioctl, all data blocks in the file are
> > > > > > re-written out-of-place. File defragmentation implies user will not update
> > > > > > and mostly read the file. So before the defragmentation, we set file
> > > > > > temperature as cold for better block allocation.
> > > > > 
> > > > > I don't think all fragmented files are cold, e.g. db file.
> > > > 
> > > > I have a bit different opinion. I think one example would be users want to
> > > > defragment a file, when the they want to get higher read bandwidth for
> > > 
> > > Multimedia file was already defined as cold file now via default extension
> > > list?
> > 
> > I just gave an example. And default is default.
> > 
> > > 
> > > > usually multimedia files. That's likely to be cold files. Moreover, I don't
> > > > think they want to defragment db files which will be fragmented soon?
> > > 
> > > I guess like db files have less update but more access?
> > 
> > I think both, and we set it as hot.
> 
> Then hot and cold bit will set to the same db file after defragmentation?

Do you set cold bit to db files? I mean, generally db is not cold, but hot.

> 
> Thanks,
> 
> > 
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > > 
> > > > > We have separated interface (via f2fs_xattr_advise_handler, e.g. setfattr -n
> > > > > "system.advise" -v value) to indicate this file is a hot/cold file, so my
> > > > > suggestion is after file defragmentation, if you think this file is cold, and
> > > > > use setxattr() to set it as cold.
> > > > > 
> > > > > Thanks,
> > > > > 
> > > > > > 
> > > > > > Signed-off-by: Daejun Park <daejun7.park@samsung.com>
> > > > > > ---
> > > > > >     fs/f2fs/file.c | 3 +++
> > > > > >     1 file changed, 3 insertions(+)
> > > > > > 
> > > > > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > > > > index d697c8900fa7..dcac965a05fe 100644
> > > > > > --- a/fs/f2fs/file.c
> > > > > > +++ b/fs/f2fs/file.c
> > > > > > @@ -2669,6 +2669,9 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
> > > > > >     	map.m_len = pg_end - pg_start;
> > > > > >     	total = 0;
> > > > > > +	if (!file_is_cold(inode))
> > > > > > +		file_set_cold(inode);
> > > > > > +
> > > > > >     	while (map.m_lblk < pg_end) {
> > > > > >     		pgoff_t idx;
> > > > > >     		int cnt = 0;
> > > > > > 
> > > > .
> > > > 
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

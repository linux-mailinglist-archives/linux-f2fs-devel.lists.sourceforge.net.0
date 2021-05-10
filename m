Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC02637913D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 16:48:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg7Ca-0005L7-R7; Mon, 10 May 2021 14:48:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lg7CY-0005Kw-5r
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 14:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RsG0lqRedzUe0rqGCW+xMZt7nh5oNpAqzfSP+gJFUpA=; b=gFre4ekLzZw3PFyWHY0gIqvSRz
 eiVn15Ai6u5vM8WCiswwuQf2RWCs5snykOPOuAlXGbKBi/g9DZBHOSuYSUrS55rzDeWb7W09CyUd/
 9M+og6enYqFnfiKoL9+l2go672SA4KboNtCxavxS6DJj3NZtOZR2xg/hXza+qt0B8oNY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RsG0lqRedzUe0rqGCW+xMZt7nh5oNpAqzfSP+gJFUpA=; b=gRbg5MAiIcNZi5dAzrkFiYMueM
 3o364401ftoQ/h4I9pHvWCkSxThIdhBzUGnPNfFQtTiBg2ci3moDP1TwJQnrofwS3ePhdYIUtUIwW
 du3NeDj+eV8V8ScfejOsdjOt8wECaPpdlAg++yCwHhf/YSkNtdNtCU6k+zf2Yrkb9BYc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lg7CQ-0007dV-Pq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 14:48:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D39C6613EE;
 Mon, 10 May 2021 14:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620658074;
 bh=U1Sin8G9z22lt/bG16uwURi9Dx9x0iPEy+hh0JwsyFU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=keNT+x7eXINKGEsJIphXo/QIJgeq7qQ7hSW/4o7eDnsiV3M2kbnWFnQjxQfNNkWOP
 QRFQwO6m1qJm8z23q27NduE8oC6dFpzAC1BCf6M/FVBiJHjTYBIqkmybdCi5D4A8Zp
 te+AzqDsju6ArT4jrY4sjg4XMZpRNE52wLzW+PGfn6EEREeA1MiQIDgA3lsqX8bzld
 NjG5MlM3PZ5XtO+OAndj28ryhCy2Bqsz3+ds+olNXNzWkdA9HHq+ZcrWe51Ef5i218
 xM+l2lg9lOKjZUxMfOCZHTQyNPHue+mjAiDJ7I9iq4bA+TCE2GJsbVQpjv+8Z90Rz9
 sn2IV4Q8m8O3A==
Date: Mon, 10 May 2021 07:47:52 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YJlHmP/ej8/IsHL3@google.com>
References: <CGME20210429062005epcms2p352ef77f96ab66cbffe0c0ab6c1b62d8a@epcms2p3>
 <20210429062005epcms2p352ef77f96ab66cbffe0c0ab6c1b62d8a@epcms2p3>
 <3a0ab201-9546-d523-abc7-79df5f637f14@huawei.com>
 <YJN0nTgadoq8vDaG@google.com>
 <bd0fa15b-01c3-9f70-3eb8-ec2b54a0ee8f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd0fa15b-01c3-9f70-3eb8-ec2b54a0ee8f@huawei.com>
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
X-Headers-End: 1lg7CQ-0007dV-Pq
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

On 05/06, Chao Yu wrote:
> On 2021/5/6 12:46, Jaegeuk Kim wrote:
> > On 05/06, Chao Yu wrote:
> > > On 2021/4/29 14:20, Daejun Park wrote:
> > > > In file defragmentation by ioctl, all data blocks in the file are
> > > > re-written out-of-place. File defragmentation implies user will not update
> > > > and mostly read the file. So before the defragmentation, we set file
> > > > temperature as cold for better block allocation.
> > > 
> > > I don't think all fragmented files are cold, e.g. db file.
> > 
> > I have a bit different opinion. I think one example would be users want to
> > defragment a file, when the they want to get higher read bandwidth for
> 
> Multimedia file was already defined as cold file now via default extension
> list?

I just gave an example. And default is default.

> 
> > usually multimedia files. That's likely to be cold files. Moreover, I don't
> > think they want to defragment db files which will be fragmented soon?
> 
> I guess like db files have less update but more access?

I think both, and we set it as hot.

> 
> Thanks,
> 
> > 
> > > 
> > > We have separated interface (via f2fs_xattr_advise_handler, e.g. setfattr -n
> > > "system.advise" -v value) to indicate this file is a hot/cold file, so my
> > > suggestion is after file defragmentation, if you think this file is cold, and
> > > use setxattr() to set it as cold.
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > Signed-off-by: Daejun Park <daejun7.park@samsung.com>
> > > > ---
> > > >    fs/f2fs/file.c | 3 +++
> > > >    1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > > index d697c8900fa7..dcac965a05fe 100644
> > > > --- a/fs/f2fs/file.c
> > > > +++ b/fs/f2fs/file.c
> > > > @@ -2669,6 +2669,9 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
> > > >    	map.m_len = pg_end - pg_start;
> > > >    	total = 0;
> > > > +	if (!file_is_cold(inode))
> > > > +		file_set_cold(inode);
> > > > +
> > > >    	while (map.m_lblk < pg_end) {
> > > >    		pgoff_t idx;
> > > >    		int cnt = 0;
> > > > 
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF2980FA36
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Dec 2023 23:22:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDB8d-0007Dq-Q9;
	Tue, 12 Dec 2023 22:22:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rDB8b-0007Db-R3
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Dec 2023 22:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pVrSr6bNJeVpfrr5ICOyKAq0iljDemzyh1mRptPccMw=; b=V8igrmryxIiiQAK2ygdLBeQXbm
 fflZpNnqmh2wWvxAOAsBEXpcxv4GeSPBZGIFTPjnh8yHnMm/jIXZFQoEwMlu/1biiq+QXIyAe32DL
 34iPBu5JMPcp1+MN0Cif8k+Eo4F2B6IDnZCiiG8d2D40wAd1IYMliIbmYqlRjBD7TPgI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pVrSr6bNJeVpfrr5ICOyKAq0iljDemzyh1mRptPccMw=; b=IpV+HgWoLhN+TinHi8Z+n2auB6
 10WjoOeWLXWfRlcMvGMOFpbbXUy/zmRTHwDlIrbBQ7/W49fNgiH1BE0yZMs5O02wNzJgP3dVvL4EA
 qWLeOHhSLXln1MgN1VE79K8XWBQqhwDouOgBQrhYPT8hrhL/cs+0KTIEgstmQ61ign0c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rDB8Y-0001WZ-Pe for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Dec 2023 22:22:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F1A15617D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Dec 2023 22:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC89C433C8;
 Tue, 12 Dec 2023 22:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702419710;
 bh=7cFmARrm89ttXaBnHHYYiLAUlMe92Q5W0oinMKe/Nkw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dcVIj+O5K6fJib72hHCkhW8pY6ilbGEl1+BDS7PkuYLwv8FPD136erGw3w/y1gvJe
 Lu1p1PPwCsnYxvsBkSOmMoKkt6NAa4mrFPwg5rGPr1KyDTTVVE6y+Dli0Y+YeFMT6J
 e8/mO/DEm0mmiKKVLb4seY7iYuhO0Ey9S5YxfGNFt2tN/NC8F9fMgm67DSEpt8nnyz
 WNaZNHaUSk7dJieU7LoPmqg8ca0aiAO/JlvkIckHVT07l6nWBowIWUS/uSrNvCQtgU
 ASkxWyE5FRrQFmZQhBCPD/IZf2ujOnjGThHfTuXHxiugSS2ZConsrC+A/RU/WS0myL
 CsqwKnEcu9u7A==
Date: Tue, 12 Dec 2023 14:21:48 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZXjc_I6__dijbwvN@google.com>
References: <20231210113547.3412782-1-chao@kernel.org>
 <20231210113547.3412782-5-chao@kernel.org>
 <ZXeJKCNrxcit0eTC@google.com>
 <5884e300-5384-4a49-9f8d-8cced50f4e6d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5884e300-5384-4a49-9f8d-8cced50f4e6d@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/12, Chao Yu wrote: > On 2023/12/12 6:11, Jaegeuk Kim
 wrote: > > On 12/10, Chao Yu wrote: > > > This patch adds i_size check during
 compress inode conversion in order > > > to avoid .page_mkwrite [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rDB8Y-0001WZ-Pe
Subject: Re: [f2fs-dev] [PATCH 5/6] f2fs: fix to restrict condition of
 compress inode conversion
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

On 12/12, Chao Yu wrote:
> On 2023/12/12 6:11, Jaegeuk Kim wrote:
> > On 12/10, Chao Yu wrote:
> > > This patch adds i_size check during compress inode conversion in order
> > > to avoid .page_mkwrite races w/ conversion.
> > 
> > Which race condition do you see?
> 
> Something like:
> 
> - f2fs_setflags_common
>  - check S_ISREG && F2FS_HAS_BLOCKS
> 					- mkwrite
> 					 - f2fs_get_block_locked
> 					  : update metadata in old inode's disk layout

Don't we need to prevent setting this for mmapped file?

>  - set_compress_context
> 
> Thanks,
> 
> > 
> > > 
> > > Fixes: 4c8ff7095bef ("f2fs: support data compression")
> > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > ---
> > >   fs/f2fs/f2fs.h | 8 +++++++-
> > >   fs/f2fs/file.c | 5 ++---
> > >   2 files changed, 9 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > index 65294e3b0bef..c9b8a1953913 100644
> > > --- a/fs/f2fs/f2fs.h
> > > +++ b/fs/f2fs/f2fs.h
> > > @@ -4397,13 +4397,19 @@ static inline int set_compress_context(struct inode *inode)
> > >   #endif
> > >   }
> > > +static inline bool inode_has_data(struct inode *inode)
> > > +{
> > > +	return (S_ISREG(inode->i_mode) &&
> > > +		(F2FS_HAS_BLOCKS(inode) || i_size_read(inode)));
> > > +}
> > > +
> > >   static inline bool f2fs_disable_compressed_file(struct inode *inode)
> > >   {
> > >   	struct f2fs_inode_info *fi = F2FS_I(inode);
> > >   	if (!f2fs_compressed_file(inode))
> > >   		return true;
> > > -	if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))
> > > +	if (inode_has_data(inode))
> > >   		return false;
> > >   	fi->i_flags &= ~F2FS_COMPR_FL;
> > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > index 1a3c29a9a6a0..8af4b29c3e1a 100644
> > > --- a/fs/f2fs/file.c
> > > +++ b/fs/f2fs/file.c
> > > @@ -1922,8 +1922,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
> > >   			f2fs_down_write(&F2FS_I(inode)->i_sem);
> > >   			if (!f2fs_may_compress(inode) ||
> > > -					(S_ISREG(inode->i_mode) &&
> > > -					F2FS_HAS_BLOCKS(inode))) {
> > > +					inode_has_data(inode)) {
> > >   				f2fs_up_write(&F2FS_I(inode)->i_sem);
> > >   				return -EINVAL;
> > >   			}
> > > @@ -3996,7 +3995,7 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
> > >   		goto out;
> > >   	}
> > > -	if (F2FS_HAS_BLOCKS(inode)) {
> > > +	if (inode_has_data(inode)) {
> > >   		ret = -EFBIG;
> > >   		goto out;
> > >   	}
> > > -- 
> > > 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

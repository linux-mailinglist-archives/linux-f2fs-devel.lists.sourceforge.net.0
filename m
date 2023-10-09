Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4A37BE8C2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Oct 2023 19:57:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qpuUw-00067G-SZ;
	Mon, 09 Oct 2023 17:56:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qpuUu-000674-J6
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Oct 2023 17:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZRt/+3mgSIEWQipS3FEkc0c87GqDD6cp+NOxAG0+0wQ=; b=aeTCp2g9j8/zJa8poYVXVKxjuN
 z2u85FRMK4IFvnSgX9Cv6i+AaZlgLGQZ6BJ3FECxEiKkTm4aRSWHC1WTBuyQz5uPEExc4Fjz3l+oP
 bbLTxSrvaEaUU7xkxUvI8cAaVXZ7JFqaevYje3AIqZRlZ9b79V1WnxscxEUCrJZPD1NM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZRt/+3mgSIEWQipS3FEkc0c87GqDD6cp+NOxAG0+0wQ=; b=jo9n+d/Kqf0AhG/mn2AWuvzug3
 QA+CbIevE6DpkHE1cWedaDIp59livGhJh4sLEJiiUWy8LFIrkaXSBTUs0Fe4TwwlJviEbnGuAxXV/
 VPdIIhLa/uMfdGHI5lzESpJdVayJecX42zQ5NylTywnWUd1fo0FgjjZk5EH7IjNZmQLM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qpuUs-00041G-Pr for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Oct 2023 17:56:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D0295B81210
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  9 Oct 2023 17:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC9EC433C7;
 Mon,  9 Oct 2023 17:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696874203;
 bh=4MAFR8eRn/jRjp4WwCXLLtnADd0TxOn+fdtPOWOfo7M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V2sw+VQv8f0ozr2rncMF7mI6tyJRl5QaqR2TC6GSo7A46dLZWJfthNAfmMJPf2pzs
 LnkTwKxODVo0wJPr9zWjy/9DzNSr1GdbFBxM49MC9kbCTGnS2gVAUmxNTrKwwCFjez
 5Wzcx/ZFFu6UD1dBBwH9OLFFgSOvBazQLPUZodcV2Y1XAnrdh5i61qGvluVxkrAgvb
 Gh3392etim9H6xDIBoo83BngdlVLuBPzwR3kXPM40jG2XyuXtJ8Y9hyjnY/8Kl7cIm
 ELuUvZRTewhsRPf95y1sFBxzaD6Ez73MZGX5BugS6xiEXOoBKvUlk5ttjEjv7mAHPh
 YQXwK1lGvVZEA==
Date: Mon, 9 Oct 2023 10:56:41 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZSQ-2aH7qN_ILfEg@google.com>
References: <20231003225208.1936359-1-jaegeuk@kernel.org>
 <c70b330a-b5f5-72d9-1190-fe1a6872919d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c70b330a-b5f5-72d9-1190-fe1a6872919d@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/07, Chao Yu wrote: > On 2023/10/4 6:52, Jaegeuk Kim
 wrote: > > Let's avoid unnecessary f2fs_map_block calls to load extents. >
 > > > # f2fs_io fadvise willneed 0 4096 /data/local/tmp/test > > > [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qpuUs-00041G-Pr
Subject: Re: [f2fs-dev] [PATCH] f2fs: stop iterating f2fs_map_block if hole
 exists
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

On 10/07, Chao Yu wrote:
> On 2023/10/4 6:52, Jaegeuk Kim wrote:
> > Let's avoid unnecessary f2fs_map_block calls to load extents.
> > 
> >   # f2fs_io fadvise willneed 0 4096 /data/local/tmp/test
> > 
> >    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 386, start blkaddr = 0x34ac00, len = 0x1400, flags = 2,
> >    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 5506, start blkaddr = 0x34c200, len = 0x1000, flags = 2,
> >    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 9602, start blkaddr = 0x34d600, len = 0x1200, flags = 2,
> >    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 14210, start blkaddr = 0x34ec00, len = 0x400, flags = 2,
> >    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 15235, start blkaddr = 0x34f401, len = 0xbff, flags = 2,
> >    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 18306, start blkaddr = 0x350200, len = 0x1200, flags = 2
> >    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 22915, start blkaddr = 0x351601, len = 0xa7d, flags = 2
> >    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 25600, start blkaddr = 0x351601, len = 0x0, flags = 0
> >    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 25601, start blkaddr = 0x351601, len = 0x0, flags = 0
> >    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 25602, start blkaddr = 0x351601, len = 0x0, flags = 0
> >    ...
> >    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 1037188, start blkaddr = 0x351601, len = 0x0, flags = 0
> >    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 1038206, start blkaddr = 0x351601, len = 0x0, flags = 0
> >    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 1039224, start blkaddr = 0x351601, len = 0x0, flags = 0
> >    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 2075548, start blkaddr = 0x351601, len = 0x0, flags = 0
> 
> Jaegeuk,
> 
> Not sure, but it looks it's due to f2fs_precache_extents() will traverse file
> w/ range [0, max_file_blocks), since data which exceeds EOF will always be zero,
> so it's not necessary to precache its mapping info, so we'd better adjust upper
> boundary to i_size rather than max_file_blocks().
> 
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   fs/f2fs/file.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 161826c6e200..2403fd1de5a0 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -3270,7 +3270,7 @@ int f2fs_precache_extents(struct inode *inode)
> >   		f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
> >   		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_PRECACHE);
> >   		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> > -		if (err)
> > +		if (err || !map.m_len)
> Well, if there is a hole in the head of file, it may break here rather
> than precaching following valid map info.
> 
> What about passing parameter offset|len from f2fs_file_fadvise() to
> f2fs_precache_extents(), and then precaching mapping info on demand.

I'd rather stop reading metadata if it meets a hole within i_size, since this
gives benefits when reading the entire non-hole case, FWIW. Rather than that,
I think generic readahead flow can hide the metadata loading.

> 
> Thanks,
> 
> >   			return err;
> >   		map.m_lblk = m_next_extent;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

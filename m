Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E0A822500
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jan 2024 23:55:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rKner-0000Oq-Lb;
	Tue, 02 Jan 2024 22:54:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rKnep-0000Ok-CP
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jan 2024 22:54:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h1X/84htCZ575AaXOT+M/zBMWZKy475Eu6Bpdscy1Ng=; b=E1ARvL9+lDE5+v7G/q2r+cz7rS
 KqXmeJ8oKY/Lrxbebit8O2Qw9phYhWkMdIcmY1u+IG/tzRoPKkH7f4bVT61GalCkgg5veBdkfGc3k
 LQ4QPzfbpXxaB+QsLBO+Y3XiQitgh8P+KODIJZEOb0O5WFpJZ7TqzRKLghQt8/3Djq9U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h1X/84htCZ575AaXOT+M/zBMWZKy475Eu6Bpdscy1Ng=; b=DwJQ81aNghjaoXHfFg8452KwJC
 tJaOKMrbSP93yAMglp68VkRU/9IcBSASHMAKcuJK2jODPWjaJZ5QdSNNoCtQYDiiOnOX1cuLRqDqp
 z1Y4Ovjg7PlqOw2pytSFadwBP1dr/G6m+H+89xqBjwgel9nAIv1yDvMbtjDczZkF5Lxg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rKneo-0002tc-Vr for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jan 2024 22:54:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 29AB06128B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Jan 2024 22:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF529C433C8;
 Tue,  2 Jan 2024 22:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704236072;
 bh=BDXXal94Su2uaDJCUkGS/5w9XDeM8Wk9XYBMyM7Nyy8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rXIgUSAJIPast68Xs9QUwtAwEb5+BSCr0TB1o421tQFL8+5pnfBL1zyQa6b9v9egD
 3OtmvJtck58DraxnNCz4+sbVzG/n/crMV/TeApm0tS+7MBFBEFhe+6FV7+YERN5ggb
 O9duCK94c/aiKjVE6EmgUCFcthIM8pEVIdrObN/JBVT9qMjkwqs3Ml1jA2A+0k5pK7
 136xGm69qonnce23kOtiZjXXbpGHVSx8sLEzkGGbaLRKERbD0b19NarsLRDaogT3qI
 +Qdv7c6W59mlzJuzA0TsDff2dBCHdGWSVKuFgVCleyCQo6S0gxFNuPGDshRh5Qsvo/
 FSVgUYqNGJ8XA==
Date: Tue, 2 Jan 2024 14:54:31 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZZSUJxtwahorNVj5@google.com>
References: <20231210113547.3412782-1-chao@kernel.org>
 <20231210113547.3412782-5-chao@kernel.org>
 <ZXeJKCNrxcit0eTC@google.com>
 <5884e300-5384-4a49-9f8d-8cced50f4e6d@kernel.org>
 <ZXjc_I6__dijbwvN@google.com>
 <19a1340f-0a0d-40a0-9d00-0faf171480f2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19a1340f-0a0d-40a0-9d00-0faf171480f2@kernel.org>
X-Spam-Score: -7.4 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/28, Chao Yu wrote: > On 2023/12/13 6:21, Jaegeuk Kim
 wrote: > > On 12/12, Chao Yu wrote: > > > On 2023/12/12 6:11, Jaegeuk Kim
 wrote: > > > > On 12/10, Chao Yu wrote: > > > > > This patch adds i [...]
 Content analysis details:   (-7.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rKneo-0002tc-Vr
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

On 12/28, Chao Yu wrote:
> On 2023/12/13 6:21, Jaegeuk Kim wrote:
> > On 12/12, Chao Yu wrote:
> > > On 2023/12/12 6:11, Jaegeuk Kim wrote:
> > > > On 12/10, Chao Yu wrote:
> > > > > This patch adds i_size check during compress inode conversion in order
> > > > > to avoid .page_mkwrite races w/ conversion.
> > > > 
> > > > Which race condition do you see?
> > > 
> > > Something like:
> > > 
> > > - f2fs_setflags_common
> > >   - check S_ISREG && F2FS_HAS_BLOCKS
> > > 					- mkwrite
> > > 					 - f2fs_get_block_locked
> > > 					  : update metadata in old inode's disk layout
> > 
> > Don't we need to prevent setting this for mmapped file?
> 
> Oh, we have used i_sem lock to prevent such race case, however
> we missed f2fs_disable_compressed_file():
> 
> - f2fs_disable_compressed_file
>  - check inode_has_data
> 						- f2fs_file_mmap
> 						- mkwrite
> 						 - f2fs_get_block_locked
> 						 : update metadata in compressed
> 						   inode's disk layout
>  - fi->i_flags &= ~F2FS_COMPR_FL
>  - clear_inode_flag(inode, FI_COMPRESSED_FILE);

So, needing i_sem for disabling it on mmapped file? It seems i_size would not
be enough?

> 
> Thanks,
> 
> > 
> > >   - set_compress_context
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > > 
> > > > > Fixes: 4c8ff7095bef ("f2fs: support data compression")
> > > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > > ---
> > > > >    fs/f2fs/f2fs.h | 8 +++++++-
> > > > >    fs/f2fs/file.c | 5 ++---
> > > > >    2 files changed, 9 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > > > index 65294e3b0bef..c9b8a1953913 100644
> > > > > --- a/fs/f2fs/f2fs.h
> > > > > +++ b/fs/f2fs/f2fs.h
> > > > > @@ -4397,13 +4397,19 @@ static inline int set_compress_context(struct inode *inode)
> > > > >    #endif
> > > > >    }
> > > > > +static inline bool inode_has_data(struct inode *inode)
> > > > > +{
> > > > > +	return (S_ISREG(inode->i_mode) &&
> > > > > +		(F2FS_HAS_BLOCKS(inode) || i_size_read(inode)));
> > > > > +}
> > > > > +
> > > > >    static inline bool f2fs_disable_compressed_file(struct inode *inode)
> > > > >    {
> > > > >    	struct f2fs_inode_info *fi = F2FS_I(inode);
> > > > >    	if (!f2fs_compressed_file(inode))
> > > > >    		return true;
> > > > > -	if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))
> > > > > +	if (inode_has_data(inode))
> > > > >    		return false;
> > > > >    	fi->i_flags &= ~F2FS_COMPR_FL;
> > > > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > > > index 1a3c29a9a6a0..8af4b29c3e1a 100644
> > > > > --- a/fs/f2fs/file.c
> > > > > +++ b/fs/f2fs/file.c
> > > > > @@ -1922,8 +1922,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
> > > > >    			f2fs_down_write(&F2FS_I(inode)->i_sem);
> > > > >    			if (!f2fs_may_compress(inode) ||
> > > > > -					(S_ISREG(inode->i_mode) &&
> > > > > -					F2FS_HAS_BLOCKS(inode))) {
> > > > > +					inode_has_data(inode)) {
> > > > >    				f2fs_up_write(&F2FS_I(inode)->i_sem);
> > > > >    				return -EINVAL;
> > > > >    			}
> > > > > @@ -3996,7 +3995,7 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
> > > > >    		goto out;
> > > > >    	}
> > > > > -	if (F2FS_HAS_BLOCKS(inode)) {
> > > > > +	if (inode_has_data(inode)) {
> > > > >    		ret = -EFBIG;
> > > > >    		goto out;
> > > > >    	}
> > > > > -- 
> > > > > 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

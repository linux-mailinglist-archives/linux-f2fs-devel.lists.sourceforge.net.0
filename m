Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8480737911E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 16:40:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg74k-0004wR-BM; Mon, 10 May 2021 14:40:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lg74i-0004w6-SS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 14:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bQ0Yj5B86242/pbEg/VnC4G/UOlQLsp9iEFP9FYFBg0=; b=X7JE1pNxUVonK8Rq5f4u3FDUq1
 /Tjdq5XxUbcerKNtMO6o93Yob0AewrJSjzvSiaDdFDulf4shXPga5vsom2XdOHy9z0r+zyqgqawon
 kT0aCR+XAiOgf1Y1VF7D18r9bH9iFg15hGxQYoSzp4QDuH/YOMU7eB7OBQoKa2kC8pGk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bQ0Yj5B86242/pbEg/VnC4G/UOlQLsp9iEFP9FYFBg0=; b=m2B9cqEQcv5KijxHaiwvVm1zC5
 ftWkpX2fAXZ77QcfhMuRrDgmyPf6Om9dCoYxnkeoZNT4F0+wmgj9vMvrqJ1uWZl6WQCOzbl45RpiU
 ORC7qsRijjoZEYnuN6bgBToFoZc5vFMhC0afEYIUzb6JAUydpyOQ4IGHITYsmvnedddo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lg74c-0005yE-1P
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 14:40:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EF7C61260;
 Mon, 10 May 2021 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620657589;
 bh=WEU1Fz1WVVlBrDEmLzTut6W259LIfPZaGoCmipxoj9A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iQLjEKR/Z9hHUOet3dMWHFOy/rKhovLY82BUH+pra2hIL5CJQK+wQRX8/JtMToNqv
 7e/GoAo16+7l2oN9X9+TSMSxDYV8zxGIol4UCe43kVIfCXRkROQF7+fexBL2ddEeGl
 Bn6mbL6A67AQH5ozJRLkW4/Ozzd/xQZveI29S2UGghndLhbbEBBrElzgOiXar+/FZj
 iqLaaD68an9ncgYuVBgxO+G6+Ow15CAM1X4SWKdKMNeicQSUoqw/KmptSAOysqgaAO
 AtPFRbLSI2drpriwcyi/zKyefOud7ozRJ+TXF6q3+dhg/XbcPUXNz37qxA2Yw5ihtR
 Uu0fRFZR0zGlQ==
Date: Mon, 10 May 2021 07:39:47 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YJlFs5DLGifyBR2G@google.com>
References: <20210506191347.1242802-1-jaegeuk@kernel.org>
 <YJTdp0Rj170TYm24@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJTdp0Rj170TYm24@sol.localdomain>
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
X-Headers-End: 1lg74c-0005yE-1P
Subject: Re: [f2fs-dev] [PATCH] f2fs: return -EPERM given generic mask
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

On 05/06, Eric Biggers wrote:
> On Thu, May 06, 2021 at 12:13:47PM -0700, Jaegeuk Kim wrote:
> > In f2fs_fileattr_set(),
> > 
> > 	if (!fa->flags_valid)
> > 		mask &= FS_COMMON_FL;
> > 
> > In this case, we should not allow to set FS_COMPR_FL, instead of BUG_ON.
> > 
> > /* Flags shared betwen flags/xflags */
> > 	(FS_SYNC_FL | FS_IMMUTABLE_FL | FS_APPEND_FL | \
> > 	 FS_NODUMP_FL |	FS_NOATIME_FL | FS_DAX_FL | \
> > 	 FS_PROJINHERIT_FL)
> > 
> > Fixes: 4c5b47997521 ("vfs: add fileattr ops")
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fs/f2fs/file.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index e01ce802cf10..38015ef84893 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -1817,7 +1817,9 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
> >  	struct f2fs_inode_info *fi = F2FS_I(inode);
> >  	u32 masked_flags = fi->i_flags & mask;
> >  
> > -	f2fs_bug_on(F2FS_I_SB(inode), (iflags & ~mask));
> > +	/* mask can be shrunk by flags_valid selector */
> > +	if (iflags & ~mask)
> > +		return -EPERM;
> >  
> >  	/* Is it quota file? Do not allow user to mess with it */
> >  	if (IS_NOQUOTA(inode))
> > -- 
> > 2.31.1.607.g51e8a6a459-goog
> 
> This looks like the wrong fix.  AFAICS, 'mask' is the set of inode flags that
> the specific ioctl (FS_IOC_SETFLAGS or FS_IOC_FSSETXATTR) can potentially
> modify, while 'iflags' is the new set of inode flags among the set that either
> ioctl can potentially modify.  So this change will stop FS_IOC_FSSETXATTR from
> working on files that have already flags set which are only modifiable by
> FS_IOC_SETFLAGS, e.g. the compression flag.
> 
> I think the correct fix would be to just do something like 'iflags &= mask'.

Thanks. Let me send v2.

> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF6CB3C3E8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Aug 2025 22:47:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+gu5jtD0J9DCGk6rZOIE3IcrvawoMVOEdM8tdC/ZkA=; b=joGLi88GQNYpGW2OFq1S9vj/rI
	Ey20OQVPB3fdbCm78W3JEyOJtCYc0rcSAoyryVD/Eqy021/rkK1dCy1Pw09Ckx87FZKqy/TDuvt05
	WJifWCVpYfom4V2p4vWZXn2XSlzthCbzq+DtOg2/9D15cG7JD7B1qZEKUc+vFkM+lnqQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1us60j-00006X-OU;
	Fri, 29 Aug 2025 20:47:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1us60i-00006P-E4
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Aug 2025 20:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QLOsPeBpppHqu1k1gYSMhywn36ZN3NJtoUWb0HClT7k=; b=L1F5WeCciTJJPangNLe/RzBWBi
 kG/f1bFbVO2uRbWwrQiZnMKfYgO5SrgTikEycEhY0i4B+dRBlQZ2eMd5uIfNeKAQaks46/dJimGAd
 3/ocg69t3Cenm/VuZT3+xMJ6tsI70TrVQaKRbfRPoLHTSl61UamW3kriARE7iguKDJgo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QLOsPeBpppHqu1k1gYSMhywn36ZN3NJtoUWb0HClT7k=; b=HpSiYzu1t189esbQ0YXASU5TES
 KKPF6oYG3WkXGyGlUzVxpmEr5JGP+nu848XSLXhHxhFr6z/zRHXvxkOd+MfOWwENcLljFMpcTMSUg
 Wp0ESd0l91t/E2zZmf3BP/+PrYjXEZAnEySpgHrp8Ys35uCyvwxhOVCnapawNa71sDSA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1us60i-0007de-2O for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Aug 2025 20:47:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6B3A860142
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Aug 2025 20:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2965C4CEF0;
 Fri, 29 Aug 2025 20:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756500462;
 bh=F7fZbKF+Hhm6Gj12IyHGEeCDC6NcPiaP7jk7hL0CUx4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gO6RcUPdD6Sr/1T6nxF3eQx7oOBz3hVuMlPGNctbxpsU8M0jFcnVplvJxVR8xGCd7
 PdzZbp4n7jpG41CPMyU55n8Yj6nhNX6n26rVhYYYbN6cyhKos/tJC420fFE50vF8Fk
 XjAXWQcxGV7m9Kgkz2xYOIPm5BqBAV5wIYYTN+QZWfUJRkT4+MiX0dDNSgs7Vmua5/
 w1Vl4f6sP0MikljP/RQIqnJBiWpl1TeRxCsgU4ABI7Zb7dbVo2SiHq6H3ZRWUT1i22
 sk+M4QbiIi8qvtr2fVHSJQuoX0CDVEdiTwmHXvz+BpPfFpBLTp+xK5ktg6sulc7QGL
 3jbbiuAc+R2Xw==
Date: Fri, 29 Aug 2025 20:47:40 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aLIR7BaaAizkdzgl@google.com>
References: <20250827215222.1615844-1-jaegeuk@kernel.org>
 <bfbd5db4-c103-4a08-8568-1d27c8eba676@kernel.org>
 <aLB0XeQh_tm2tXIA@google.com>
 <c7a0afdc-3f33-4de7-b36d-b0d5f55216e2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c7a0afdc-3f33-4de7-b36d-b0d5f55216e2@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/29, Chao Yu wrote: > On 8/28/2025 11:23 PM, Jaegeuk
 Kim wrote: > > On 08/28, Chao Yu wrote: > > > On 8/28/25 05:52, Jaegeuk Kim
 via Linux-f2fs-devel wrote: > > > > Let's split IPU writes in hot [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1us60i-0007de-2O
Subject: Re: [f2fs-dev] [PATCH] f2fs: allocate HOT_DATA for IPU writes
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/29, Chao Yu wrote:
> On 8/28/2025 11:23 PM, Jaegeuk Kim wrote:
> > On 08/28, Chao Yu wrote:
> > > On 8/28/25 05:52, Jaegeuk Kim via Linux-f2fs-devel wrote:
> > > > Let's split IPU writes in hot data area to improve the GC efficiency.
> > > 
> > > I didn't get it, IPU may be not friendly for migrating data along w/ write in
> > > hot area?
> > 
> > This deals with IPU in the LFS mode.
> 
> Okay, so, we missed to add f2fs_lfs_mode() condition, right?

Why do we need that?

> 
> Thanks,
> 
> > 
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > ---
> > > >   fs/f2fs/segment.c | 3 ++-
> > > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > > index e0f6589c6a1c..bb79dad55ac9 100644
> > > > --- a/fs/f2fs/segment.c
> > > > +++ b/fs/f2fs/segment.c
> > > > @@ -3688,7 +3688,8 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
> > > >   		if (file_is_hot(inode) ||
> > > >   				is_inode_flag_set(inode, FI_HOT_DATA) ||
> > > > -				f2fs_is_cow_file(inode))
> > > > +				f2fs_is_cow_file(inode) ||
> > > > +				is_inode_flag_set(inode, FI_NEED_IPU))
> > > >   			return CURSEG_HOT_DATA;
> > > >   		return f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
> > > >   						inode->i_write_hint);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

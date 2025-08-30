Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 085D7B3D03A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 31 Aug 2025 01:55:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kbs3ssfq1Uegv3nVNI3YtiLzWinEsCE1heBDBVwNn4=; b=jO7LUVxOwLG/jPkVhS9jecc+1h
	2xqdCxWkEQ/bpwOd+ShdD5VPffXeSz0fBgIXhJgkO5fYsoDHopWf9YCp3soYbnchPylYRkFcZ98Oj
	Z4rIK4UY4CpXTMWEE1kXlbn4E7/BhNzUiGYs11Coxl2Aer2Kgf4GYhYlkYKjg5tXqTKY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1usVPI-0003Lc-W4;
	Sat, 30 Aug 2025 23:54:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1usVPH-0003LT-HO
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 30 Aug 2025 23:54:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eKwQmTUajqZRiN9irUeLlwwVEKv1+eguB6z4+kGamvU=; b=GtDS3936whD8S4FchMoDtE2mji
 97zUmkaz1oapFIqwfMjHGD6AellcIrCYOh06KVOx2J+POhcqX/qMyyaWWiq9u+2ViUgs0cQq+Icb4
 69Y+gR3Lfpff9vnFBwVyaBPKOrFZYbj0ZVAUJ/Ckp4OWHXj7aQ9+KqaoYx6K4pqP5PFs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eKwQmTUajqZRiN9irUeLlwwVEKv1+eguB6z4+kGamvU=; b=Q5GME0TuPscnIgdRJXqlUsH1Jj
 3tJ4p1a80vNi8t+fdrW5VVZetU9VSPFCLjAkU7oMqx7qs0N3nFBc6Orv6shvQ4c+EgenkGzeAsYN+
 fpSLB+cQEEq7VFDEypIotbEXvmSjoL+vlZgpnB6NlRVyPhVvoyUfhZYMBeQz4uFA7GFE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1usVPH-0001d3-48 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 30 Aug 2025 23:54:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5607F60147
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Aug 2025 23:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A29C4CEEB;
 Sat, 30 Aug 2025 23:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756598079;
 bh=yiM/nH2gzgtH53jxXENxccB6CslYME6YX4Xg/Vk/cQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L78t2IZpSo8BksZBMYTPlOHbVtePgR8X/WzoZc34TdErJbBgK4eKzCJVt7yj4tr9b
 5ZoSZMC/ygt6V3JI7Vke67ucYvsAXYau2IHKL3rPG8rl3JzA97RcgoThxgcBHPPa6R
 v66KCzxjKtgoWQX1VMm1IXr74/RUIReD2UZbkA13W4cdEiekJcwgyKUFB0iUZbo6iC
 f48ecbykBotIHIWSVTeTwIvoBmCYqFCzb8Sj07GEPe3aNAamOlThaCtVdPSrmBpyd8
 MmQdBjDVAhqNtUPQIbp6Wb/PFdNDmSy7vdur5oMGvt1UFemXI6Ka+PsiZD6UkPKUN5
 ZlpvGvlVUbWwQ==
Date: Sat, 30 Aug 2025 23:54:37 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aLOPPQFJEqoYQg24@google.com>
References: <20250827215222.1615844-1-jaegeuk@kernel.org>
 <bfbd5db4-c103-4a08-8568-1d27c8eba676@kernel.org>
 <aLB0XeQh_tm2tXIA@google.com>
 <c7a0afdc-3f33-4de7-b36d-b0d5f55216e2@kernel.org>
 <aLIR7BaaAizkdzgl@google.com>
 <d0357cd2-5435-4d99-af31-cc56fc05ce9a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0357cd2-5435-4d99-af31-cc56fc05ce9a@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/30, Chao Yu wrote: > On 8/30/2025 4:47 AM, Jaegeuk Kim
 wrote: > > On 08/29, Chao Yu wrote: > > > On 8/28/2025 11:23 PM, Jaegeuk
 Kim wrote: > > > > On 08/28, Chao Yu wrote: > > > > > On 8/28/25 0 [...] 
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
X-Headers-End: 1usVPH-0001d3-48
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

On 08/30, Chao Yu wrote:
> On 8/30/2025 4:47 AM, Jaegeuk Kim wrote:
> > On 08/29, Chao Yu wrote:
> > > On 8/28/2025 11:23 PM, Jaegeuk Kim wrote:
> > > > On 08/28, Chao Yu wrote:
> > > > > On 8/28/25 05:52, Jaegeuk Kim via Linux-f2fs-devel wrote:
> > > > > > Let's split IPU writes in hot data area to improve the GC efficiency.
> > > > > 
> > > > > I didn't get it, IPU may be not friendly for migrating data along w/ write in
> > > > > hot area?
> > > > 
> > > > This deals with IPU in the LFS mode.
> > > 
> > > Okay, so, we missed to add f2fs_lfs_mode() condition, right?
> > 
> > Why do we need that?
> 
> As you mentioned above, this deals w/ IPU in the LFS mode. Am I missing
> something?

The IPU flag indicates the data is hot. In lfs_mode, we missed to allocate
it into HOT_DATA. In normal mode, IPU will update the data in place, which
doesn't affect anything, while newly create data is also good to store in
HOT_DATA as well. So, I think we don't need other condition here.

> 
> Thanks,
> 
> > 
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > > 
> > > > > Thanks,
> > > > > 
> > > > > > 
> > > > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > > > ---
> > > > > >    fs/f2fs/segment.c | 3 ++-
> > > > > >    1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > > > > index e0f6589c6a1c..bb79dad55ac9 100644
> > > > > > --- a/fs/f2fs/segment.c
> > > > > > +++ b/fs/f2fs/segment.c
> > > > > > @@ -3688,7 +3688,8 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
> > > > > >    		if (file_is_hot(inode) ||
> > > > > >    				is_inode_flag_set(inode, FI_HOT_DATA) ||
> > > > > > -				f2fs_is_cow_file(inode))
> > > > > > +				f2fs_is_cow_file(inode) ||
> > > > > > +				is_inode_flag_set(inode, FI_NEED_IPU))
> > > > > >    			return CURSEG_HOT_DATA;
> > > > > >    		return f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
> > > > > >    						inode->i_write_hint);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

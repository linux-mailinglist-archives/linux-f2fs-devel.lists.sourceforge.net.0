Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C0C2F20A9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jan 2021 21:24:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kz3jR-0001if-05; Mon, 11 Jan 2021 20:24:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kz3jP-0001iQ-6u
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 20:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OGupJZqMipXHR+QD3GXHFTQbgGli0bw/Aana2Vtbh+4=; b=fY8YwCBtu2tl+0n0Jt+MZIXHRo
 g6a4Ort60tFC9dNuObxOKTRMvfxlJ3emdp4qO3EogFffWmmF9REY6Mkd5mz8xWj7zATW/SPBDWrlg
 LSGKul5PfATysBxgj6jL+Z4HflnGFjpgpJSEi2kB3KiHmhxfOgEE4mYSR7l2+rfWcb30=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OGupJZqMipXHR+QD3GXHFTQbgGli0bw/Aana2Vtbh+4=; b=YMm3C36aAVY5RKJ6gB7Udenq0x
 DUV3r2RpPiKwWnzTtvHQrS/KzVloPdYyQGuLu24H9wuAVnVF2erSQtvnhnfdmugzAoCvUoOXoL0Vw
 TQhVLBw5s+CzpRfmU2a+FkJnoVvPSXh1sJ86dNkuMly5McC04Ims/oRtHsA4mu+uOu28=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kz3jG-001ywW-Nt
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 20:24:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADBE1225AC;
 Mon, 11 Jan 2021 20:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610396621;
 bh=GuikJIMMynj1JoVdFBbBDyTl6eY4ObOVr2EhJzbluqU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h9UJs0tr0HoLvfoM0v704ZMwvpGKTk+NgiLZEjtFVRGKupALugn+LTjpCVAzgGoDt
 fnvgqZCF48gZoGU8LQOWMLdCBR5SUO9onTJHG74h3wmPwtP+ZqD8Uc1bVk8LPSBTxa
 yUdoD94NOU5fUPYrHZIa26l1w+y22BfW7zuWvitBcnnpKeJZ5tWmMijqpzTW2T8RBB
 v9/ZLCNXfoJCPVqOY000S6pHMovE+IDHJouQmhR6KR2ZjYAtHmgJcISwR8/kY3ESw+
 cTvhL/H7nkTKjLz0FryNvH1qL4khOQKIgNyGy1b/Ygf2RyfL1stItYLsoFgFUCLJgg
 u5yjhlG30NShA==
Date: Mon, 11 Jan 2021 12:23:40 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <X/yzzKhysdFUY/6o@sol.localdomain>
References: <20210109075903.208222-1-ebiggers@kernel.org>
 <20210109075903.208222-12-ebiggers@kernel.org>
 <20210111105342.GE2502@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210111105342.GE2502@lst.de>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kz3jG-001ywW-Nt
Subject: Re: [f2fs-dev] [PATCH v2 11/12] ext4: simplify i_state checks in
 __ext4_update_other_inode_time()
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 11, 2021 at 11:53:42AM +0100, Christoph Hellwig wrote:
> On Fri, Jan 08, 2021 at 11:59:02PM -0800, Eric Biggers wrote:
> >  	if ((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
> > -			       I_DIRTY_INODE)) ||
> > -	    ((inode->i_state & I_DIRTY_TIME) == 0))
> > +			       I_DIRTY_TIME)) != I_DIRTY_TIME)
> >  		return;
> >  
> >  	spin_lock(&inode->i_lock);
> > -	if (((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
> > -				I_DIRTY_INODE)) == 0) &&
> > -	    (inode->i_state & I_DIRTY_TIME)) {
> > +	if ((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
> > +			       I_DIRTY_TIME)) == I_DIRTY_TIME) {
> 
> I think a descriptively named inline helper in fs.h would really improve
> this..

Do you want this even though it is specific to how ext4 opportunisticly updates
other inodes in the same inode block as the inode being updated?  That's the
only reason that I_FREEING|I_WILL_FREE|I_NEW need to be checked; everywhere else
justs want I_DIRTY_TIME.

We could add:

	static inline bool other_inode_has_dirtytime(struct inode *inode)
	{
		return (inode->state & (I_FREEING | I_WILL_FREE |
					I_NEW | I_DIRTY_TIME)) == I_DIRTY_TIME;
	}

But it seems a bit weird when it's specific to ext4 at the moment.

Are you thinking that other filesystems will implement the same sort of
opportunistic update, so we should add the helper now?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

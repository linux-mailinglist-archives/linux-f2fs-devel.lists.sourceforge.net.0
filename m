Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE592ED742
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Jan 2021 20:10:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kxag6-0002qN-0x; Thu, 07 Jan 2021 19:10:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kxag4-0002qF-Pw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jan 2021 19:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8cXvA0qY3ExeTqFee+9RP9TR8md6kCEtn3skU4MKRCA=; b=ji+YpE1FmsLm5MwRoBnYVWxCiV
 EgEeDvWTrPapq5yEAmIryHvMYablDUio7nLSmzQYbN2Xm6OL+DQUYcTDZnqnDkg0I1K2AO6utwaf3
 Bs0PpkiIDpSiZR4LoaBBTPlFvUBo6SzNJiYKR1Bzu5+y/Q1wgDJCDkT9dckc8PVZ/F8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8cXvA0qY3ExeTqFee+9RP9TR8md6kCEtn3skU4MKRCA=; b=eVLcy8hD8XHVSVqYLj3/NBCoV3
 F8xqL8bMjSplCfRY4KfpRX/HUSxuxfGrZtcWhkqwCN15B6PTNKy6tXnIAq3sNWveQrTLDPRqxNUTc
 DL6TV+nU/szH0+uT3iGhEbfglskP+kZXhaJCoFlLe02dP5Hjkg35P+imbSW1NZANW23k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kxag0-005plr-Ph
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jan 2021 19:10:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6CB4123432;
 Thu,  7 Jan 2021 19:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610046609;
 bh=ugnw0oxMzEvCu/VUG9GeA+AsDxtnUhs9qU+595smXXc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uzAA66kWcPLR+x63v+LqKAzMM+XIi7OLLeFPJnrnJr8HiXBD0cpnycMS7Qc3/itD4
 1RahCBIag+8k6tMafM4Y6NrdDnUHTWzvpcpEc1udfzBenqBXNFs4UGnN9lm1A4Oem7
 1zXX31jYIsOi8AHDvw1+aGei6dLaXkMaNRx1hI2k2adYhVV31wF9S1l6aUn9WcGniB
 L71IfDgf/Tdi4KOkiOr/3HXW06QcTVpFyeTERgdtUitkJHusKeFuTeIpGveCOYzBYJ
 ayT/ALAvXzfY/PMg8U8pR2z1cMP4KHNCDQljnu9ApQ7gmO/B+3I2E+vZlMWLLNT9+3
 bV5gdGJokgPkg==
Date: Thu, 7 Jan 2021 11:10:07 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <X/dcjzkF0Ac4t66J@gmail.com>
References: <20210105005452.92521-1-ebiggers@kernel.org>
 <20210105005452.92521-5-ebiggers@kernel.org>
 <20210107131328.GC12990@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107131328.GC12990@quack2.suse.cz>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kxag0-005plr-Ph
Subject: Re: [f2fs-dev] [PATCH 04/13] fat: only specify I_DIRTY_TIME when
 needed in fat_update_time()
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 07, 2021 at 02:13:28PM +0100, Jan Kara wrote:
> On Mon 04-01-21 16:54:43, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > As was done for generic_update_time(), only pass I_DIRTY_TIME to
> > __mark_inode_dirty() when the inode's timestamps were actually updated
> > and lazytime is enabled.  This avoids a weird edge case where
> > I_DIRTY_TIME could be set in i_state when lazytime isn't enabled.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> ...
> > +	if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
> > +		dirty_flags |= I_DIRTY_SYNC;
> >  
> > -	if (dirty)
> > -		iflags |= I_DIRTY_SYNC;
> >  	__mark_inode_dirty(inode, iflags);
> 				  ^^^ dirty_flags here?
> 
> Otherwise the change looks good to me.

Yeah, I'll fix that.  I accidentally didn't have CONFIG_FAT_FS enabled.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

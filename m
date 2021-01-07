Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A81742ED726
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Jan 2021 20:07:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kxaci-0005Je-UC; Thu, 07 Jan 2021 19:07:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kxach-0005JX-LD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jan 2021 19:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2/v1BqO/mLBmXs8aohWePC7KZ85MTGX/YyHi3Yum6x8=; b=dP/Ypv+0LHxgbM4SFc5bARf8nd
 kLfNI2oSsaCwIh5MRXmBU/gORUWH3GHmFjirRENEMNYx+xD85+feSEezN1W6vchcDsvcWcoTVqvi4
 g8L/6QvRcOlyFrpQEh6w5QfAgNtEzFXt2eHf/wmH45kHl64p8wIhuEGzbT+YsRPZkCU8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2/v1BqO/mLBmXs8aohWePC7KZ85MTGX/YyHi3Yum6x8=; b=F//r4P0qUf2shLsXPGEgtvcq1u
 I2dAZfNtGUvAVJD6+eR0+7qBcQEnp0GQkPgksJvgWRRNtEftPTrmh0M6OD6lxnW50dGjv788+GXhq
 grRtIRKLHGklVXUgfvI0SqKttfAB8CIK500wVzov1MymrBE/ScFHiqu1+ZFjYaRkpga4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kxacc-00CW9M-Id
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jan 2021 19:07:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C66ED2343E;
 Thu,  7 Jan 2021 19:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610046413;
 bh=TozHh8L5vYEuR54Tj/jUaA6Qe0QF9OsgDOXAbm07fiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q8xVK9Z8yvGQiz7qgq4RnAT33rH+kBsUlJ4SJZhUcUlZ6xyWlpOb0gNuTMgxqoICc
 fPXQ9k7hD9U5EC2IHF1mmAwr4hjUUptnniBEZV2T7PUV1jTIO6yerBkcQhNByM91gS
 mnu3XB+t9CAlLXDQdVaGyPtWIW8RGcmRVmCA3SpeFtmY5AmpnQywDN4T8d7XU2KoI7
 J2Qa2lG3n5UYUbEObzt4d0xd52mFrgpzIBF4hVCVd/9gSN3+TZ5AE3pVnFQ4vRvzd0
 6woZyzRvt2oZbwmqEuZn79y+dpKpfqnnQ0EnqQi2uWCc+4CeP0ZZml/sOnapbgUFDR
 eI/4T7W3lJrOQ==
Date: Thu, 7 Jan 2021 11:06:51 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <X/dbyxqr9iyf7ZbO@gmail.com>
References: <20210105005452.92521-1-ebiggers@kernel.org>
 <20210105005452.92521-9-ebiggers@kernel.org>
 <20210107132412.GE12990@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107132412.GE12990@quack2.suse.cz>
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
X-Headers-End: 1kxacc-00CW9M-Id
Subject: Re: [f2fs-dev] [PATCH 08/13] ext4: simplify i_state checks in
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 07, 2021 at 02:24:12PM +0100, Jan Kara wrote:
> On Mon 04-01-21 16:54:47, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Since I_DIRTY_TIME and I_DIRTY_INODE are mutually exclusive in i_state,
> > there's no need to check for I_DIRTY_TIME && !I_DIRTY_INODE.  Just check
> > for I_DIRTY_TIME.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  fs/ext4/inode.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> > 
> > diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> > index 4cc6c7834312f..9e34541715968 100644
> > --- a/fs/ext4/inode.c
> > +++ b/fs/ext4/inode.c
> > @@ -4962,14 +4962,12 @@ static void __ext4_update_other_inode_time(struct super_block *sb,
> >  		return;
> >  
> >  	if ((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
> > -			       I_DIRTY_INODE)) ||
> > -	    ((inode->i_state & I_DIRTY_TIME) == 0))
> > +			       I_DIRTY_TIME)) != I_DIRTY_TIME)
> >  		return;
> 
> This is OK.
> 
> >  	spin_lock(&inode->i_lock);
> > -	if (((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
> > -				I_DIRTY_INODE)) == 0) &&
> > -	    (inode->i_state & I_DIRTY_TIME)) {
> > +	if ((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
> > +			       I_DIRTY_TIME)) != I_DIRTY_TIME) {
> 
> But this condition is negated AFAICT. We should have == I_DIRTY_TIME here
> AFAICT.

Indeed, I'll fix that.  Thanks for catching this!

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E75D18333A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2020 15:35:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jCOvJ-00024z-EL; Thu, 12 Mar 2020 14:34:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+35fce02af4e3b44874e6+6045+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jCOvH-00024m-Ov
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Mar 2020 14:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XjjsJbDLkOShvptxU5Ne7nBEmoit/32pztmYgg0aAjg=; b=O25LwqcFp0q+R8K+6D1gPjkIu2
 MsRNY0VLT70RjFRlUmsAda0/QKrl/8U37FMvCjHKN+EImZbh4NZjy3HpJRxOJL9mKTeGamsfJfSmo
 lfelMXEko1oSBrN3jgOaAoLu7hPQ1Kiv+Qj1wQh4DaY1u5+OSqpJ7nvBD9PMXxmfWljA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XjjsJbDLkOShvptxU5Ne7nBEmoit/32pztmYgg0aAjg=; b=Q6yIimFKGAphiJBdyAma3C5qlU
 ala0PSCv32G1tWB1Hf7dIX9RAge8SDx0dlFHr/Qeh1NU3aHDrKc7YKJdTJQ5Yu3m93b3WLyonyJgF
 +tErLvJG/fiJKUr0oZ5JPKmzo9mmo9WwuDUn+j6XWooL29L5YW9fEI9L9+GugbuHSWpY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jCOvF-009RQF-HZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Mar 2020 14:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XjjsJbDLkOShvptxU5Ne7nBEmoit/32pztmYgg0aAjg=; b=Pd1MoWSQWbi78Y4pPu0KzufhEa
 7Zt3mPjqti/7DDBkb8nEXmSsKHQH6XREEfBpYVRqalmz2jDk8k8s1EBBEmt/SBsI8g3zWV9gqjA7i
 T4KGOCQcu1cl3AHXSNmCfCNcufyv9a617K5Ylr7prB9mIm1+M/tFWneAwqHScbNM9Jmwlblj5iqv3
 W9Y6aNPz2J+fdNZIItWN4kJxYcKM/4zb2MXuiSFiIN/k36EfG5CRmuBmsZRCYu/wbClHiqdh5Q9vX
 PFYSMYiwcijhgiO+t82o8et0GFhgSaGt3twHO0dgZghFX+AMC7XdgovyDdtcx7KO6vRKghZQmNzqP
 Bdjm7Q8g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jCOv7-00055v-W4; Thu, 12 Mar 2020 14:34:45 +0000
Date: Thu, 12 Mar 2020 07:34:45 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200312143445.GA19160@infradead.org>
References: <20200306004555.GB225345@gmail.com>
 <20200307020043.60118-1-tytso@mit.edu>
 <20200311032009.GC46757@gmail.com> <20200311125749.GA7159@mit.edu>
 <20200312000716.GY10737@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312000716.GY10737@dread.disaster.area>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jCOvF-009RQF-HZ
Subject: Re: [f2fs-dev] [PATCH] writeback: avoid double-writing the inode on
 a lazytime expiration
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
Cc: linux-xfs@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 Linux Filesystem Development List <linux-fsdevel@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 12, 2020 at 11:07:17AM +1100, Dave Chinner wrote:
> > That's true, but when the timestamps were originally modified,
> > dirty_inode() will be called with flag == I_DIRTY_TIME, which will
> > *not* be a no-op; which is to say, XFS will force the timestamps to be
> > updated on disk when the timestamps are first dirtied, because it
> > doesn't support I_DIRTY_TIME.
> 
> We log the initial timestamp change, and then ignore timestamp
> updates until the dirty time expires and the inode is set
> I_DIRTY_SYNC via __mark_inode_dirty_sync(). IOWs, on expiry, we have
> time stamps that may be 24 hours out of date in memory, and they
> still need to be flushed to the journal.
> 
> However, your change does not mark the inode dirtying on expiry
> anymore, so...
> 
> > So I think we're fine.
> 
> ... we're not fine. This breaks XFS and any other filesystem that
> relies on a I_DIRTY_SYNC notification to handle dirty time expiry
> correctly.

I haven't seen the original mail this replies to, but if we could
get the lazytime expirty by some other means (e.g. an explicit
callback), XFS could opt out of all the VFS inode tracking again,
which would simplify a few things.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

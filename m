Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 022961923ED
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 10:21:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jH2Dp-0000sd-Jq; Wed, 25 Mar 2020 09:21:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+51ae3af3ded1af5ce3db+6058+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jH2Do-0000sJ-0T
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 09:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ihmJv1brBj6wrslrN130WrjYRLeKs/TEzo95JedDuQE=; b=EjrQDirz9CQvrP4f/EfUsDXXhp
 XUz47nCG0STSRdk0wsDhzNSc7ou4FYQGZj1eNgUBi0QzrasYl5/Fjgxq9EnS8CG4hS48iIkVMPyXF
 4bMCxjdl6UTXePjZiz0GQe1sIUJ4KYvfP/4Mdk160lvjOfAmWi06UxW8xNrFfJDzARJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ihmJv1brBj6wrslrN130WrjYRLeKs/TEzo95JedDuQE=; b=TEZwOIPjg1MoYvD0dEHloITv2l
 LX/6Dx6sn/qQFpg9jsGInrddCuFQIrzurR7hcg1FgxY8Rm9wXvWeomJ6gYbH/dVOUjkkhF/0HQyYh
 Za2FTXbqNdzCJvK1OqNBeehqJunDYBgTzpXLhWR+bc8H6rIHGGD6tZyuJkT01GmXmCQw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jH2Dl-002lKv-U2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 09:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ihmJv1brBj6wrslrN130WrjYRLeKs/TEzo95JedDuQE=; b=VVlJCPTl9HltfIO3OxAs3HGKKD
 He4wfn0kQ0/ruQxdwMVfjLoSAGF7abkRzLDEAJB1mHKK41KXdDr7w9ypakrVILxJ+sWAA6BGQgp1B
 tIaSkl4ws+rsTbDsYee8L8j7aKDEmsLPPvI1LHL6KbYqsDvr/hRDlV2R4mjpKG4u1OLGOXcfPIZDw
 dokRf09ZHgKcM51G5iRWjzAjQfzZTtOtNgWZLBvecwCJEHRAJicb8A5+fCHJKSLdE8A/Prekl5ST/
 kpzaVDgGq+zc7FTuc5VDR3oZQyrCmn28eJV4L+rs2N0OSzexbC7zy1S32sZBkZVVhCqRpvJc1U3z9
 NNqrU3gA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jH2DZ-0002sC-3w; Wed, 25 Mar 2020 09:20:57 +0000
Date: Wed, 25 Mar 2020 02:20:57 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20200325092057.GA25483@infradead.org>
References: <20200320024639.GH1067245@mit.edu>
 <20200320025255.1705972-1-tytso@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320025255.1705972-1-tytso@mit.edu>
L: linux-mtd@lists.infradead.org
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
X-Headers-End: 1jH2Dl-002lKv-U2
Subject: Re: [f2fs-dev] [PATCH 1/2] writeback: avoid double-writing the
 inode on a lazytime expiration
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
Cc: linux-xfs@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>  	spin_unlock(&inode->i_lock);
>  
> -	if (dirty & I_DIRTY_TIME)
> -		mark_inode_dirty_sync(inode);
> +	/* This was a lazytime expiration; we need to tell the file system */
> +	if (dirty & I_DIRTY_TIME_EXPIRED && inode->i_sb->s_op->dirty_inode)
> +		inode->i_sb->s_op->dirty_inode(inode, I_DIRTY_SYNC);

I think this needs a very clear comment explaining why we don't go
through __mark_inode_dirty.

But as said before I'd rather have a new lazytime_expired operation that
makes it very clear what is happening.  We currenly have 4 file systems
(ext4, f2fs, ubifs and xfs) that support lazytime, so this won't really
be a major churn.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

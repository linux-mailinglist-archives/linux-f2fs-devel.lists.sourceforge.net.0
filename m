Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2791717058C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Feb 2020 18:07:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j709q-0007EX-IJ; Wed, 26 Feb 2020 17:07:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+7931773228f1d9803703+6030+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j709p-0007EQ-4v
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Feb 2020 17:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZJi9hC4ehvqCcf6BlT7xvIkRN9seHzpJl6dLbb5ZRoM=; b=OgtgYw0SM2o21Hxe8yUj6eh3DQ
 4hQCZ6PYJdQFtmoG4bkPpYWywskoNLQAt6D5hbJ06pmO2PYTRQChiPEv5TtNMI4JaDEH0Ni7NSCQ0
 KKE1+PuBW+XfmFZvx+/blcDGv4Cs75vbj63XtS8xg76zxxECWMQg4s8nAp2x61h2vIjU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZJi9hC4ehvqCcf6BlT7xvIkRN9seHzpJl6dLbb5ZRoM=; b=Ar+sOIPMT6is929iB/UmOQpXaq
 kk6HJR6pK7On9GN2oPJzIut76z5bY4HvnAJqzYBKk4mEzrdpOLS6MClUJoFeKcefH+4Q3/Z6YTBg9
 nlrDH14Y4jUpF1qWu8x9tW4RwHNVua82ZejG/tbeuKnZKqVQBFfVlo/6d6oNVNjuDXJo=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j709o-006utf-53
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Feb 2020 17:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZJi9hC4ehvqCcf6BlT7xvIkRN9seHzpJl6dLbb5ZRoM=; b=EiR9E4pRiVBrxOAfbZhMffZ3+i
 Ol5Ip+ZZrYlhL+mB+pu99N95gdjW/F3y2Z7IeerpE6EtJ/VNYQv1iUIDYr8VvaaTT4WkF8sR/2nun
 0ZPWOfMsbneBeAeCiTcC3tCwOzHeSTU7/DdSdBD9VKqHiUOBtS2uIfDf1EEdnlG9b7LBySCXHHftT
 +j5GVuJjDmc8eW8b59vJiYX/4jB/OVr6jjD2TFu5q9GUn+qXyZ5V1hyexGPIjhtsfiJbZ5SD+mfwO
 mRMegtoRIZ6mD01bXz8gces8xrJ2v4xWcOwg0hb2antvlx/u9r+GdNEECP/xbVSRsWYq6k0zUWzqu
 GwB/MpMA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j709g-0008JU-1v; Wed, 26 Feb 2020 17:07:28 +0000
Date: Wed, 26 Feb 2020 09:07:28 -0800
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20200226170728.GD22837@infradead.org>
References: <20200225214838.30017-1-willy@infradead.org>
 <20200225214838.30017-26-willy@infradead.org>
 <20200226170425.GD8045@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226170425.GD8045@magnolia>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j709o-006utf-53
Subject: Re: [f2fs-dev] [PATCH v8 25/25] iomap: Convert from readpages to
 readahead
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Feb 26, 2020 at 09:04:25AM -0800, Darrick J. Wong wrote:
> > @@ -456,15 +435,8 @@ iomap_readpages(struct address_space *mapping, struct list_head *pages,
> >  			unlock_page(ctx.cur_page);
> >  		put_page(ctx.cur_page);
> >  	}
> > -
> > -	/*
> > -	 * Check that we didn't lose a page due to the arcance calling
> > -	 * conventions..
> > -	 */
> > -	WARN_ON_ONCE(!ret && !list_empty(ctx.pages));
> > -	return ret;
> 
> After all the discussion about "if we still have ctx.cur_page we should
> just stop" in v7, I'm surprised that this patch now doesn't say much of
> anything, not even a WARN_ON()?

The code quoted above puts the cur_page reference.  By dropping the
odd refactoring patch there is no need to check for cur_page being
left as a special condition as that still is the normal loop exit
state and properly handled, just as in the original iomap code.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

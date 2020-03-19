Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A327018B2C7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2020 12:57:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jEtnX-0005af-9t; Thu, 19 Mar 2020 11:57:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jEtnW-0005aN-8q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 11:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zSKNJpg3bSHQZrR6eSGgkELs7AnAMsGUFTR84vG8N+Q=; b=i/YPNh+kQrtcacBylF00DFYqCe
 003oDGJtSvws37rMxPl/BfmpXFjzeWmWBJl1xsuOr8/BZQ2UAlsmUPKOZhMEvKa7UarGPZcIaPvJE
 bWvbp+eY2beqkIZo13z1E9sC1LQMfrB7p7wNQl+hg4yEQ026v+qXnfdLBjQpDhyPA+Ps=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zSKNJpg3bSHQZrR6eSGgkELs7AnAMsGUFTR84vG8N+Q=; b=XGctmnTbS4qjK7iYIufVvudYxH
 SOM/d2ComQIZzJSAUkV9pYmcyEKiX+tuRUxAjjBGP2PPXw880CSTCReOY9DcooveT4vot/NuQA84M
 MhaoB76mhmzag8xTawzTmzLYscU8cht8wTghEhuK1pEhdlByhFe/MT+9zcab2+HCKxb0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jEtnU-00E6fy-CL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 11:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zSKNJpg3bSHQZrR6eSGgkELs7AnAMsGUFTR84vG8N+Q=; b=taEbISgvSjSBP5vFWW8bUzGpnP
 MKArSkuRIrMUVzeknqF5IG82BQ0rRpdBkhyPwGJUstzncqnKATxyqnIPY7+1YlPamettzIY62SIOe
 NjePxFuSuYvIN1CyExl08KgCgVOKlBp6PwGzsLBofMZTKcaPyXK6XFyVMrgf7MonLR3osphoWenlX
 sundTKrs1nNxBZQfX9U36K6/ARMpgehcUsyKFiio1oi1/7QqJNa7OAtqjBW7hTx52h5XWExEECCbA
 ybmTAPaH80ciWSV+Cg1RcHvxXwu291GiNoqQjE6jJmuU2a2XkiCwZXJKbC6saBE1jZ5T2EQuOpNT9
 kqks7pWQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jEtnJ-0000ue-IU; Thu, 19 Mar 2020 11:57:01 +0000
Date: Thu, 19 Mar 2020 04:57:01 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20200319115701.GJ22433@bombadil.infradead.org>
References: <20200225214838.30017-1-willy@infradead.org>
 <20200319102038.GE3590@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319102038.GE3590@infradead.org>
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
X-Headers-End: 1jEtnU-00E6fy-CL
Subject: Re: [f2fs-dev] [PATCH v8 00/25] Change readahead API
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
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 19, 2020 at 03:20:38AM -0700, Christoph Hellwig wrote:
> Any plans to resend this with the little nitpicks fixed?  I'd love to
> get this series into 5.7..

The only nitpick I see left is the commit comment in the btrfs patch,
and a note from Dave Sterba that he intends to review it.  I can collect
up the additional Reviewed-by tags and repost the series.

I'm assuming it'll go through Andrew's tree?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

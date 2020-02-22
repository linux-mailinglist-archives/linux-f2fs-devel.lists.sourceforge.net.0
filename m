Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A55CA168B74
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Feb 2020 02:10:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5JJ4-0000WF-2c; Sat, 22 Feb 2020 01:10:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j5JJ1-0000W5-1D
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 01:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LTbHwE3lV5WpQLB0ParYWcM6AZYImdA7UZTzC3wnNNM=; b=NLHPaPjM8WlPyKZLxR8uoi3p5k
 R58Kd7nyxyct9EXmsb/srdSBc9kNTDC6q2HUSUIHYQDmViaF+qnn/u+jrsjJtDABIgwt0VyjGLS54
 RvLYC4TVHc3ftMijPAXTW9GepMhVYmKnbcV+3ojIUSUUFp2sMBZYWEkFIaFGztAx0KTI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LTbHwE3lV5WpQLB0ParYWcM6AZYImdA7UZTzC3wnNNM=; b=Z3SFoqZOGl2v/r+1mEUYRdwgjA
 vUOQzrl9w7nRDh1+bHNGJKQPqTTw3cxJmwS+7WGo+wBgbzsCaXgpRXcmKsR1LzflkiCf6ejMPrEH5
 f8j+EdSjJ6qXpNtrW9QGtktLgB8gmyaiOsa68gfcH8ysYAthvwhjCufpAy0Fz1ChOSCU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5JIx-0007XP-Vw
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 01:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LTbHwE3lV5WpQLB0ParYWcM6AZYImdA7UZTzC3wnNNM=; b=HxlPeagSzuLkYzLyiVln93VTqs
 DQf8NkG8id/IIioBHSJQxg+7evdNclgsrQfEVae/L0LZ6sfBMKjmeqbPkksobYexii4tyONiw5EAZ
 sEaBLhd+8jfqTUccvHA1MgjSUKBJuuGyMNcCMkpdIBB1lbDL0OymyffvYjXtOCO6dFExQoozYbGcn
 oJu3YBehtzxbJZ+ZUq8Yj/qpbrYfoMw39UZf64ZxGDPIvFxbX+rZLmrWRlE1w8VENg+bcszs1dHag
 i01SPalc2Elw9mcsf7AR8otZiQptnBizcOAPG7xvVEhHuBMRLzowFDYtKtveM6VzI5G54hBH72if4
 UZahGLFQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j5JIp-00024B-DB; Sat, 22 Feb 2020 01:09:55 +0000
Date: Fri, 21 Feb 2020 17:09:55 -0800
From: Matthew Wilcox <willy@infradead.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20200222010955.GG24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-23-willy@infradead.org>
 <20200222010353.GI9506@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200222010353.GI9506@magnolia>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j5JIx-0007XP-Vw
Subject: Re: [f2fs-dev] [PATCH v7 22/24] iomap: Convert from readpages to
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
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 21, 2020 at 05:03:53PM -0800, Darrick J. Wong wrote:
> On Wed, Feb 19, 2020 at 01:01:01PM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > 
> > Use the new readahead operation in iomap.  Convert XFS and ZoneFS to
> > use it.
> > 
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> 
> Ok... so from what I saw in the mm patches, this series changes
> readahead to shove the locked pages into the page cache before calling
> the filesystem's ->readahead function.  Therefore, this (and the
> previous patch) are more or less just getting rid of all the iomap
> machinery to put pages in the cache and instead pulling them out of the
> mapping prior to submitting a read bio?

Correct.

> Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

Thanks!


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

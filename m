Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE61C1620FF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2020 07:37:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3wVq-0000Uz-Vu; Tue, 18 Feb 2020 06:37:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1j3wVp-0000Ur-0J
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 06:37:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qip1ASNnx9rCm/D7QaeHVOnGLnYcD1eJMVNnAUQGUOY=; b=axH0GKXk3F1xHynqxf0HNhzjGX
 avR7kwaBrgi1RBY5jL1Su5yQYX+woGMOqHUWlFPb12/lpF2tYSG4C1Y/hI8Mb92FUbmOo4B3BHjDu
 43dYiN5OBrH86dPTwSnIGqZInGiSFn5X75D4kz/C/nbYDKSON0P26T+DVelyjMt49HsA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qip1ASNnx9rCm/D7QaeHVOnGLnYcD1eJMVNnAUQGUOY=; b=DbBeqXLL3eQXgQoPOnRdjlK0i6
 lJ8wbqI6C/lvqXukt7gwbZT4Yv3JQ9gTCqHSHc/UwqLhU8xlB9oGNZvnWOF0yFB0TI6vQlGhufElo
 Au2eHSxu05hbq9bRhowWalAy/TqTkrcSDISblBICi/hRijUQGZ1JUnX+leW5HftBqckg=;
Received: from mail104.syd.optusnet.com.au ([211.29.132.246])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1j3wVn-0075Gi-LR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 06:37:40 +0000
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
 [49.179.138.28])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 76F237EA064;
 Tue, 18 Feb 2020 17:37:33 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1j3wVg-0006PR-Ey; Tue, 18 Feb 2020 17:37:32 +1100
Date: Tue, 18 Feb 2020 17:37:32 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200218063732.GP10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-18-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217184613.19668-18-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
 a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=7-415B0cAAAA:8
 a=VP4A6UuYfbXrVXFT8kYA:9 a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22
 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j3wVn-0075Gi-LR
Subject: Re: [f2fs-dev] [PATCH v6 10/19] fs: Convert mpage_readpages to
 mpage_readahead
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
Cc: linux-xfs@vger.kernel.org, Junxiao Bi <junxiao.bi@oracle.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 17, 2020 at 10:45:58AM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> Implement the new readahead aop and convert all callers (block_dev,
> exfat, ext2, fat, gfs2, hpfs, isofs, jfs, nilfs2, ocfs2, omfs, qnx6,
> reiserfs & udf).  The callers are all trivial except for GFS2 & OCFS2.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Junxiao Bi <junxiao.bi@oracle.com> # ocfs2
> ---
>  drivers/staging/exfat/exfat_super.c |  7 +++---
>  fs/block_dev.c                      |  7 +++---
>  fs/ext2/inode.c                     | 10 +++-----
>  fs/fat/inode.c                      |  7 +++---
>  fs/gfs2/aops.c                      | 23 ++++++-----------
>  fs/hpfs/file.c                      |  7 +++---
>  fs/iomap/buffered-io.c              |  2 +-
>  fs/isofs/inode.c                    |  7 +++---
>  fs/jfs/inode.c                      |  7 +++---
>  fs/mpage.c                          | 38 +++++++++--------------------
>  fs/nilfs2/inode.c                   | 15 +++---------
>  fs/ocfs2/aops.c                     | 34 ++++++++++----------------
>  fs/omfs/file.c                      |  7 +++---
>  fs/qnx6/inode.c                     |  7 +++---
>  fs/reiserfs/inode.c                 |  8 +++---
>  fs/udf/inode.c                      |  7 +++---
>  include/linux/mpage.h               |  4 +--
>  mm/migrate.c                        |  2 +-
>  18 files changed, 73 insertions(+), 126 deletions(-)

That's actually pretty simple changeover. Nothing really scary
there. :)

Reviewed-by: Dave Chinner <dchinner@redhat.com>

-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

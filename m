Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08978A3953D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 09:26:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkIvs-0001LH-UO;
	Tue, 18 Feb 2025 08:26:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+6c050134ec875dc6ffdb+7849+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1tkIvq-0001LB-PL for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 08:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FkUCjxz9vjqxLei0utw3tRN3Rl77dSlMqLgpoQD9LSw=; b=KTXTeAjXoN0hBvRWgH0MGe2yBU
 0E6RU6RNDSTe4dq+VuaSSLcx/8BaL5jnTBGHcSX4tC5mlbfYCFIFmpKMAcBMhWprClNPqTQDG7wAt
 ynCA0/V5XjSeYIjwVAsk/bz9JezJdy8EdEDzk5gIMLi3ay6DvyXbQnJccen+89uweBNs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FkUCjxz9vjqxLei0utw3tRN3Rl77dSlMqLgpoQD9LSw=; b=C
 42+HyqXnvPWzA92R8eJYRiTWe7sOKLBOPLrmyp8rPS4DWkNmRnvtD2khDsUN6V7fdr1IM2YT63UWd
 VInx27ngYJLPzMvv6StfwJfO2v0rPK7WrNy1fh4TqvexFCd1h8StM/44rACtcOaoTaUX60iW+jmOv
 U02XMq2UNxheAdyQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkIvo-0006RR-Qb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 08:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:References;
 bh=FkUCjxz9vjqxLei0utw3tRN3Rl77dSlMqLgpoQD9LSw=; b=zhUQ+e6HSttPyyE2/vmwfPYv33
 X+w/gXVba5sH/Xs9XQ6XLUasYNrzvNvxOvX7Nb/XdZlh4iIa94HDOCqLQ+o/ZIVmxhCScLRN/MzTw
 YxQy84GMZef8zz4k+rqrdU5SeKL29sLd3kN1Ez5nhGt39B+KHRdlw5Wgx89hjcwDX55Oev9byfxVQ
 ko5eHRSUOjD80H85xR8DfMNvPlQRqotlBiVOgI2YbOZDuzxYfHaI1V0xUklb6YTAQpVD2p3GTLDH2
 44PtrClYGsMkeWE0CHFmCANkhTCwyZs4rxxz8RR8mhke5UaII8tGB9vd1jJxb7c1JfQouNLYAxfZt
 0tWPxfew==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkIve-00000007GjS-2N6c; Tue, 18 Feb 2025 08:26:06 +0000
Date: Tue, 18 Feb 2025 00:26:06 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Z7REHrJ3ImdrF476@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250212023518.897942-1-jaegeuk@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This still has a file system sysfs HACK, you're still not
 Ccing the right list, etc. Can you pleae at least try to get it right? On
 Wed, Feb 12, 2025 at 02:31:55AM +0000, Jaegeuk Kim wrote: > This patch series
 does not add new API, but implements POSIX_FADV_NOREUSE where > it keeps
 the page ranges in the f2fs superblock and add [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1tkIvo-0006RR-Qb
Subject: Re: [f2fs-dev] [PATCH 0/2 v9] reclaim file-backed pages given
 POSIX_FADV_NOREUSE
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This still has a file system sysfs HACK, you're still not Ccing the
right list, etc.

Can you pleae at least try to get it right?

On Wed, Feb 12, 2025 at 02:31:55AM +0000, Jaegeuk Kim wrote:
> This patch series does not add new API, but implements POSIX_FADV_NOREUSE where
> it keeps the page ranges in the f2fs superblock and add a way for users to
> reclaim the pages manually.
> 
> Change log from v8:
>  - remove new APIs, but use fadvise(POSIX_FADV_NOREUSE)
> 
> Jaegeuk Kim (2):
>   f2fs: keep POSIX_FADV_NOREUSE ranges
>   f2fs: add a sysfs entry to reclaim POSIX_FADV_NOREUSE pages
> 
>  Documentation/ABI/testing/sysfs-fs-f2fs |  7 ++
>  fs/f2fs/debug.c                         |  3 +
>  fs/f2fs/f2fs.h                          | 14 +++-
>  fs/f2fs/file.c                          | 60 +++++++++++++++--
>  fs/f2fs/inode.c                         | 14 ++++
>  fs/f2fs/shrinker.c                      | 90 +++++++++++++++++++++++++
>  fs/f2fs/super.c                         |  1 +
>  fs/f2fs/sysfs.c                         | 63 +++++++++++++++++
>  8 files changed, 246 insertions(+), 6 deletions(-)
> 
> -- 
> 2.48.1.601.g30ceb7b040-goog
> 
> 
---end quoted text---


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

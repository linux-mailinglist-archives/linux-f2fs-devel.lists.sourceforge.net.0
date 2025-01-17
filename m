Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D357DA14A89
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2025 08:58:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tYhFP-0001rk-Dc;
	Fri, 17 Jan 2025 07:58:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+61d77501dfe03cdea103+7817+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1tYhFO-0001re-0A for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 07:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LQ42ND+TX3qpDyiAWyJ76CfupWCuVxganJhxdwzevX0=; b=frp08k3utKGGCfCmZYb4rxLGO8
 OrU94mb2ZtpmDxot8xGeR3JG53Y3TGlAb9abHNN82+3pc50oXSFI7NIXkbsSTZvy4JUI5FLNhnFjg
 dHvw0TvdI6KQ+gQ9JgMFmj4qvMr093T3PE326mYmAf1knf4qparspm7hJr8uAu4VNw3c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LQ42ND+TX3qpDyiAWyJ76CfupWCuVxganJhxdwzevX0=; b=IVwxxHE/4hz0yZ2om3cQxCFZXm
 mwMqGSHE+5h4pqcc9LzIxrTEkIbZ42W49F2q8jES21tztVi6OpvhMMZXGgn/s0UMMMrYljPZ+6Pre
 eNyvlF0FoiDrb0CNGhLIAKnTgUc0pwEH+jc+mU9DRZbba3omYr0jbZ+qz96ivZEJdq1U=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tYhFO-0008BD-6Y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 07:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LQ42ND+TX3qpDyiAWyJ76CfupWCuVxganJhxdwzevX0=; b=vJiz8AY34X+KOCo0spNITWZaj4
 nyqSeLwMHApV3IHW2rf1+oZmz4wulZukRDDfC57q4xe8ZAEdCPId6LmWtB5zHDCkM0zV3wja5zdZG
 3ulpxzRWjwvJ5EQ2GxsNiZO9j3q9F+bACioDK3njoL2Gq0wo7ZIvSepj0Y2BYx9Xdh7wm0+lhE6xi
 I58ckZ8qXgVy8KiD8VjwXqlOnKLvYY6a/T/5KT+RrrTQWDA38DQaXm3mis9s6BTUJUS7bPbRXxwyl
 6J6WRy/82HDyHmHVVYBlxqN0j/XgcxZgrv10iOMJkpBWgRdIyz4XpYwT4B0Wnu78TafHiQXKRDvdY
 V1FlrTIw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tYhFE-0000000HGTr-04Lm; Fri, 17 Jan 2025 07:58:20 +0000
Date: Thu, 16 Jan 2025 23:58:19 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Z4oNmx2xPkdzvkUd@infradead.org>
References: <20250116172438.2143971-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250116172438.2143971-1-jaegeuk@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Still NAC for sneaking in an almost undocumented MM feature
 into a file system ioctl. Especially while a discussion on that is still
 ongoin. And it's still bad that you don't even bother to Cc fsdevel on this,
 nor linux-api or in this case the mm list. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tYhFO-0008BD-6Y
Subject: Re: [f2fs-dev] [PATCH 0/2 v5] add ioctl/sysfs to donate file-backed
 pages
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
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Still NAC for sneaking in an almost undocumented MM feature into
a file system ioctl.  Especially while a discussion on that is still
ongoin.

And it's still bad that you don't even bother to Cc fsdevel on this,
nor linux-api or in this case the mm list.

On Thu, Jan 16, 2025 at 05:19:42PM +0000, Jaegeuk Kim wrote:
> If users clearly know which file-backed pages to reclaim in system view, they
> can use this ioctl() to register in advance and reclaim all at once later.
> 
> Change log from v4:
>  - fix range handling
> 
> Change log from v3:
>  - cover partial range
> 
> Change log from v2:
>  - add more boundary checks
>  - de-register the range, if len is zero
> 
> Jaegeuk Kim (1):
>   f2fs: add a sysfs entry to request donate file-backed pages
> 
> Yi Sun (1):
>   f2fs: Optimize f2fs_truncate_data_blocks_range()
> 
>  Documentation/ABI/testing/sysfs-fs-f2fs |  7 ++++++
>  fs/f2fs/f2fs.h                          |  2 ++
>  fs/f2fs/file.c                          | 29 +++++++++++++++++++++----
>  fs/f2fs/shrinker.c                      | 27 +++++++++++++++++++++++
>  fs/f2fs/sysfs.c                         |  8 +++++++
>  5 files changed, 69 insertions(+), 4 deletions(-)
> 
> -- 
> 2.48.0.rc2.279.g1de40edade-goog
> 
> 
---end quoted text---


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

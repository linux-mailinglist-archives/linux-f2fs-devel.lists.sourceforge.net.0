Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F13BA26B88
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Feb 2025 06:49:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tfBoh-0001XP-6g;
	Tue, 04 Feb 2025 05:49:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+ea2238c820210655d397+7835+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1tfBog-0001XI-15 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Feb 2025 05:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s5Zhk5Xv/to3IdCo2qfEM3Rd+KIEFauoYnzDJ0mZZUM=; b=IY5pgR7frECZy9DFxanaCzd3rS
 th5WdL7Bx7OHgynTz5lm6WdnNOXKQxYBGz/+YfYCVWohAdeuISe3aIk+TkIBMfUeV+am4eg6J0lIk
 ObMH/8bsvZi2B9SPITLEijMIZY0OgDTk9BYhtgk2MtknUJ31se6DrxjTq81BSTH8JR7A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s5Zhk5Xv/to3IdCo2qfEM3Rd+KIEFauoYnzDJ0mZZUM=; b=FpmWhnHSA7upUGjZNZLfGlLmpA
 N3pnUanK+4qA8Zhs+m6zlGlo3p36UlEIcdDGMrsi+tqfFBN0aVQ/rNYUiKIzAgXv9ew7dcloXL4+t
 e7n1rg70lKWO2T4BQ3QIMh8iGTMC9Ihz7daT6OaLvAC+GfWWW2G3Nw3UIPnkie7IfGS4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tfBod-000137-7v for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Feb 2025 05:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=s5Zhk5Xv/to3IdCo2qfEM3Rd+KIEFauoYnzDJ0mZZUM=; b=2teENuLyXvCrs6O7KUZeOOB4IB
 Bn2GJi+MbkopSRPect/FNTGL5iDJOzvTmAoo0YT3ykWhkSffKRAZdI2SL9SPX3PfcKh9fCpWcmN4d
 W+K9CnK+Qb7vzSYoz9fB4ZyA2+6QnfieF+7nheA1bWJ1Wid2Cs/PU5NqTptK7SYqS2w+5X4xBc/fS
 mnfThaeA2Xm3zjtcU25OnvMxrhrsD4F1kBYMXY3lLX2X1NEcdfMqZnWbqS883n5GeNzNlasdXmudK
 8uUsWqpbESK+d8HEyHAPmiPoaTqjf7d5mgO/eQ52PqS2rmEZvpziJMquLjq0xEfLeiT61Nnx7ULit
 yCIzlXZg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tfBoS-0000000HIzb-0ClL; Tue, 04 Feb 2025 05:49:32 +0000
Date: Mon, 3 Feb 2025 21:49:32 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Z6GqbJxJAsRPQ4uQ@infradead.org>
References: <20250131222914.1634961-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250131222914.1634961-1-jaegeuk@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 31, 2025 at 10:27:55PM +0000, Jaegeuk Kim wrote:
 > Note, let me keep improving this patch set,
 while trying to get some feedbacks
 > from MM and API folks from [1]. Please actually drive it instead of only
 interacting once after I told you to. The feedback is clearly that it is
 a MM thing, so please drive it forward instead of going back to the hacky
 file system [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tfBod-000137-7v
Subject: Re: [f2fs-dev] [PATCH 0/2 v8] add ioctl/sysfs to donate file-backed
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 31, 2025 at 10:27:55PM +0000, Jaegeuk Kim wrote:
> Note, let me keep improving this patch set, while trying to get some feedbacks
> from MM and API folks from [1].

Please actually drive it instead of only interacting once after
I told you to.  The feedback is clearly that it is a MM thing, so please
drive it forward instead of going back to the hacky file system version.

> 
> If users clearly know which file-backed pages to reclaim in system view, they
> can use this ioctl() to register in advance and reclaim all at once later.
> 
> I'd like to propose this API in F2FS only, since
> 1) the use-case is quite limited in Android at the moment. Once it's generall
> accepted with more use-cases, happy to propose a generic API such as fadvise.
> Please chime in, if there's any needs.
> 
> 2) it's file-backed pages which requires to maintain the list of inode objects.
> I'm not sure this fits in MM tho, also happy to listen to any feedback.
> 
> [1] https://lore.kernel.org/lkml/Z4qmF2n2pzuHqad_@google.com/
> 
> Change log from v7:
>  - change the sysfs entry to reclaim pages in all f2fs mounts
> 
> Change log from v6:
>  - change sysfs entry name to reclaim_caches_kb
> 
> Jaegeuk Kim (2):
>   f2fs: register inodes which is able to donate pages
>   f2fs: add a sysfs entry to request donate file-backed pages
> 
> Jaegeuk Kim (2):
>   f2fs: register inodes which is able to donate pages
>   f2fs: add a sysfs entry to request donate file-backed pages
> 
>  Documentation/ABI/testing/sysfs-fs-f2fs |  7 ++
>  fs/f2fs/debug.c                         |  3 +
>  fs/f2fs/f2fs.h                          | 14 +++-
>  fs/f2fs/file.c                          | 60 +++++++++++++++++
>  fs/f2fs/inode.c                         | 14 ++++
>  fs/f2fs/shrinker.c                      | 90 +++++++++++++++++++++++++
>  fs/f2fs/super.c                         |  1 +
>  fs/f2fs/sysfs.c                         | 63 +++++++++++++++++
>  include/uapi/linux/f2fs.h               |  7 ++
>  9 files changed, 258 insertions(+), 1 deletion(-)
> 
> -- 
> 2.48.1.362.g079036d154-goog
> 
> 
---end quoted text---


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9DBA2771C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Feb 2025 17:26:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tfLkf-0000m0-E7;
	Tue, 04 Feb 2025 16:26:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tfLke-0000ls-1F
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Feb 2025 16:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ba6Xpky8Fyf3+tO4aMJ/oeHU/41orspz9L/3yBudjhI=; b=k2ud4bb/NaUYKAzKw/M1BG29LI
 i1BXFQEL/qKSnUoiO7QSAAhmfKwcw3C0+NaP8I2FxUajgKl1onAkgYnPp/XlEnJpAcrCwkG6qd9dK
 5Dgn8K7oPNAI8pbLZhhJl8IrxeoaBhPpLMAR3rbds/PhFqZtp8H0VrvguBhCjENZekoc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ba6Xpky8Fyf3+tO4aMJ/oeHU/41orspz9L/3yBudjhI=; b=GlNFN7jWtZSNjopc7RBi9HC7Zn
 /bBPefeeEx5+Q7pwNdwG2lTxWkwkXGm8m63N1dBSqtw+vR2I49ebSnAwA5miANHMzxeHQK+dqr//4
 +xm8AJ9mHKXd3BOWYrb8abCHf01pvwGQIfVzn1t0OJsHvSy36ddUQoUg3554r2cC4icY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tfLkc-0006U7-NP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Feb 2025 16:26:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D3ADDA429BB;
 Tue,  4 Feb 2025 16:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA35C4CEDF;
 Tue,  4 Feb 2025 16:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738686363;
 bh=L54LXQnOXWaBaK5VCO3A3bjxwgajDXv30wjGTPt+098=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B2pPWBAh1vII7IozOG5m4s4KE4imJgEszqsdtJdsekdCwiDT/t2ls283r81dquCQy
 gB1rTpS+CFvmUFelHBeZoYpCEh89ao9CHqq3XOIYDoPOEqj3+CuEcEERLhpzkoyjWB
 HUWB5UH+krcTGZNezD1SBnuhzPkUJZ+Gu/SSKlXOzUKJLizTPVox1e2h5VKIKl83Ty
 IJFA93WwuupUf57V/AjeGQSPMM9b2fbMA/1a3qU06TSqWQToSwJG8RdikVMJweUYcl
 KPRnZC0kmQh2NWWMqLbmehulmnBU4qVT4rtOJHvwmyvOlvTAIkWKDB79cpO+H5cnJ9
 XStY6fB0R/a8Q==
Date: Tue, 4 Feb 2025 16:26:01 +0000
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <Z6I_mb7Y0QSWqtro@google.com>
References: <20250131222914.1634961-1-jaegeuk@kernel.org>
 <Z6GqbJxJAsRPQ4uQ@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z6GqbJxJAsRPQ4uQ@infradead.org>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/03, Christoph Hellwig wrote: > On Fri, Jan 31, 2025
 at 10:27:55PM +0000, Jaegeuk Kim wrote: > > Note, let me keep improving this
 patch set, while trying to get some feedbacks > > from MM and API [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tfLkc-0006U7-NP
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/03, Christoph Hellwig wrote:
> On Fri, Jan 31, 2025 at 10:27:55PM +0000, Jaegeuk Kim wrote:
> > Note, let me keep improving this patch set, while trying to get some feedbacks
> > from MM and API folks from [1].
> 
> Please actually drive it instead of only interacting once after
> I told you to.  The feedback is clearly that it is a MM thing, so please
> drive it forward instead of going back to the hacky file system version.

I keep saying working in parallel for production. And, no worries, I won't
merge this to -next until I get the feedback from the MM folks. I was
waiting for a couple of weeks before bothering them, so will ping there.

> 
> > 
> > If users clearly know which file-backed pages to reclaim in system view, they
> > can use this ioctl() to register in advance and reclaim all at once later.
> > 
> > I'd like to propose this API in F2FS only, since
> > 1) the use-case is quite limited in Android at the moment. Once it's generall
> > accepted with more use-cases, happy to propose a generic API such as fadvise.
> > Please chime in, if there's any needs.
> > 
> > 2) it's file-backed pages which requires to maintain the list of inode objects.
> > I'm not sure this fits in MM tho, also happy to listen to any feedback.
> > 
> > [1] https://lore.kernel.org/lkml/Z4qmF2n2pzuHqad_@google.com/
> > 
> > Change log from v7:
> >  - change the sysfs entry to reclaim pages in all f2fs mounts
> > 
> > Change log from v6:
> >  - change sysfs entry name to reclaim_caches_kb
> > 
> > Jaegeuk Kim (2):
> >   f2fs: register inodes which is able to donate pages
> >   f2fs: add a sysfs entry to request donate file-backed pages
> > 
> > Jaegeuk Kim (2):
> >   f2fs: register inodes which is able to donate pages
> >   f2fs: add a sysfs entry to request donate file-backed pages
> > 
> >  Documentation/ABI/testing/sysfs-fs-f2fs |  7 ++
> >  fs/f2fs/debug.c                         |  3 +
> >  fs/f2fs/f2fs.h                          | 14 +++-
> >  fs/f2fs/file.c                          | 60 +++++++++++++++++
> >  fs/f2fs/inode.c                         | 14 ++++
> >  fs/f2fs/shrinker.c                      | 90 +++++++++++++++++++++++++
> >  fs/f2fs/super.c                         |  1 +
> >  fs/f2fs/sysfs.c                         | 63 +++++++++++++++++
> >  include/uapi/linux/f2fs.h               |  7 ++
> >  9 files changed, 258 insertions(+), 1 deletion(-)
> > 
> > -- 
> > 2.48.1.362.g079036d154-goog
> > 
> > 
> ---end quoted text---


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

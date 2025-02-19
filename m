Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9E2A3BA06
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2025 10:38:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkgXN-0001iY-8F;
	Wed, 19 Feb 2025 09:38:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tkgXL-0001iR-Tj
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Feb 2025 09:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c/CteVhV3+o2NFoojWeZ9o5NAWQUMvgTRUAkB89CE3w=; b=MZofaklqdrFkfNaBxZQl4mRUDj
 tQoizMAUDEoLC+SZPU8Lmpi99qEVAGAdWGX+laydA1gg62jV4RazE9MPG3gz+fquaM1riQl8u7+1K
 7Sf1l9HmDfYQeD+/f60B/QbC5iqJbal4xWi2cuNUrAJNm2IoJZDRhfJcE+lWOMCFK7Ic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c/CteVhV3+o2NFoojWeZ9o5NAWQUMvgTRUAkB89CE3w=; b=Y5fuK0xtOr6ZKJY4p5iLar7txd
 DdRYq3LDXNYnpe7LxNr+oEzqW+JKt58i0JPFBs44jAUXylFVAemDcIzwfT9mJoqNn6kn/64XuB2Cc
 gftO90KGDUtUwm7+i/4ldS0YVErkcXWYz9ItH3Rh6BZtLccf3qHqzHOCtPvOLoz5O6FA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkgXK-0002uc-Cy for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Feb 2025 09:38:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CDCD65C5687;
 Wed, 19 Feb 2025 09:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3B1C4CED1;
 Wed, 19 Feb 2025 09:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739957903;
 bh=80I3NFEQ9dB3idbQ3rrlutO1WpxNEwV3ESxpvEHssw8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mk4X7I+4NK641JPh0lH3mxXQjPoMemeHNJVvxuFmmLHC/ixCa1WumSq6dDN+UTlpw
 zpUgxeiJXqYBElyQ0DUuYW0guCtjDYpCi78mBTZdKc1ZYh1YOvEi9mJvXP9b6EHWlm
 YQERNL01Ou2rIWZUSUECfVGTKQQXNoBJ3nDyfpn9bhl6froDTMMH46SmIILX7oxuAg
 Gc9nPV0WuyOoDvloGJC95f13CxxB9MO5/fFpM0spaDwQ25NgZy/oitF3thNmdPPSOc
 4MrXUl8X5T49bOg9sM1P1IOiNOngbfg1IgoTW8bfr/EAseOp0qJHA7zCpi7XDqslBr
 ZZRGTJCy24gpQ==
Date: Wed, 19 Feb 2025 09:38:21 +0000
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <Z7WmjagtARpTA781@google.com>
References: <20250212023518.897942-1-jaegeuk@kernel.org>
 <Z7REHrJ3ImdrF476@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z7REHrJ3ImdrF476@infradead.org>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/18, Christoph Hellwig wrote: > This still has a file
 system sysfs HACK, you're still not Ccing the > right list, etc. > > Can
 you pleae at least try to get it right? I was modifying the patch having 1)
 declaring a static global list, 2) adding some fields to superblock and inode
 structures to keep the given range in the inode through fadvise, 3) adding
 hooks in ev [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tkgXK-0002uc-Cy
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/18, Christoph Hellwig wrote:
> This still has a file system sysfs HACK, you're still not Ccing the
> right list, etc.
> 
> Can you pleae at least try to get it right?

I was modifying the patch having 1) declaring a static global list, 2) adding
some fields to superblock and inode structures to keep the given range in the
inode through fadvise, 3) adding hooks in evict_inode to handle the list, 4)
exploring which sysfs entry in MM to reclaim them explicitly.

But, I stopped at some point, as it looks not good at all. Moreover, I started
to be questioning why not just doing in F2FS back, given sementically I didn't
change anything  on general behavior of fadvise(POSIX_FADV_NOREUSE), IIUC, which
moves pages back to LRU. In addiiton to that, I'd like to keep the range hint in
a filesystem and provide a sysfs entry to manage the hints additionally.
In addition, I don't think there's rule that filesystem cannot reclaim file-back
pages, as it just uses the exported symbol that all filesystems are using in
various different purpose. Hence, I don't get the point which is wrong.

Thanks,

> 
> On Wed, Feb 12, 2025 at 02:31:55AM +0000, Jaegeuk Kim wrote:
> > This patch series does not add new API, but implements POSIX_FADV_NOREUSE where
> > it keeps the page ranges in the f2fs superblock and add a way for users to
> > reclaim the pages manually.
> > 
> > Change log from v8:
> >  - remove new APIs, but use fadvise(POSIX_FADV_NOREUSE)
> > 
> > Jaegeuk Kim (2):
> >   f2fs: keep POSIX_FADV_NOREUSE ranges
> >   f2fs: add a sysfs entry to reclaim POSIX_FADV_NOREUSE pages
> > 
> >  Documentation/ABI/testing/sysfs-fs-f2fs |  7 ++
> >  fs/f2fs/debug.c                         |  3 +
> >  fs/f2fs/f2fs.h                          | 14 +++-
> >  fs/f2fs/file.c                          | 60 +++++++++++++++--
> >  fs/f2fs/inode.c                         | 14 ++++
> >  fs/f2fs/shrinker.c                      | 90 +++++++++++++++++++++++++
> >  fs/f2fs/super.c                         |  1 +
> >  fs/f2fs/sysfs.c                         | 63 +++++++++++++++++
> >  8 files changed, 246 insertions(+), 6 deletions(-)
> > 
> > -- 
> > 2.48.1.601.g30ceb7b040-goog
> > 
> > 
> ---end quoted text---


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3D76EB234
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Apr 2023 21:20:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ppwJS-0000g7-HB;
	Fri, 21 Apr 2023 19:20:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ppwJR-0000g1-Nu
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Apr 2023 19:20:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bpmaIptl9dDh9yAGIGoWN1o28NbeUw4gkBHBUd6D/7k=; b=Ydsg29mYdfzhhAqads9q1EV9BF
 zsRs4q1dhxuEieLS1Quj8KA+wmmvgGzJBaNFOHQWCUwN/urPDMoJkLUgZw1e0cvwuIZl6MsPpXdv8
 ISxCVyLOBSVEZMbBZX8F95Ei0r+rhQz0ENE4hr0cuRdTXUQG9uXfiti7Ny5vvai2V1a0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bpmaIptl9dDh9yAGIGoWN1o28NbeUw4gkBHBUd6D/7k=; b=mTfT+3P7y0k389dPfFhH2eJS+Z
 /Eyx5HgM1C5bnatDdcM2h2H2X2ohLjlNXoVY+q6khQDxICrlXkGpK+vNBTmI//l72uP65UDjhNr69
 CQVKjOLeBycR+6JG6v6Tlu3125uFQsE8RBstkX6GLbjLWUWEAQnM1tTQmUBFkbXEZFJo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ppwJR-00FDtq-DX for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Apr 2023 19:20:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BDCDD63E0C;
 Fri, 21 Apr 2023 19:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCA5C433D2;
 Fri, 21 Apr 2023 19:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682104844;
 bh=wWIVV152heDSTzGxHtKa1x8+4IzsoyUehlTc8SPXpR0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dQdgmTqgPqnhOS0oj1RMYI3mGHcsg1Hx5B4RzKQHRComC2VLxhZUhMgCuxAADdNrW
 0T3S3dnz+rl77xP8U5SAGNgmOUkrzp0JtTZdjmbbRlh+zANXO2PNAADL4nuQN/4hSP
 UxuzdPBkFJdFDhNmGR9VEY5+RJz8Hg6VboOP9dtfXrheKVWpR51liALk1XG332pQ8l
 UoCow/DGF/WES57XGj9YoOBrmDfNIv4p1F7fxFDiidQ5Z4ADpGdl8Co30sZVxXUtoZ
 TAIGuhx9NkRM+WeM88PRcKHy/ZR3gJpGccEAcQ4B8kROiX6+GgOsP+95FRcv2N+1dQ
 EB52MWCrG4+Bg==
Date: Fri, 21 Apr 2023 12:20:42 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZELiCve2x31uJFhM@google.com>
References: <20230418060954.67585-1-hanqi@vivo.com>
 <b031f528-f3dd-44ed-5370-2133a74f9332@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b031f528-f3dd-44ed-5370-2133a74f9332@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/21, Chao Yu wrote: > On 2023/4/18 14:09, Qi Han wrote:
 > > This comment make no sense and is in the wrong place, so let's > > remove
 it. > > > > Signed-off-by: Qi Han <hanqi@vivo.com> > > --- > [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ppwJR-00FDtq-DX
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unnessary comment in
 __may_age_extent_tree
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
Cc: Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/21, Chao Yu wrote:
> On 2023/4/18 14:09, Qi Han wrote:
> > This comment make no sense and is in the wrong place, so let's
> > remove it.
> > 
> > Signed-off-by: Qi Han <hanqi@vivo.com>
> > ---
> >   fs/f2fs/extent_cache.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> > index 28b12553f2b3..1f6d7de35794 100644
> > --- a/fs/f2fs/extent_cache.c
> > +++ b/fs/f2fs/extent_cache.c
> > @@ -86,7 +86,6 @@ static bool __may_age_extent_tree(struct inode *inode)
> >   	if (!test_opt(sbi, AGE_EXTENT_CACHE))
> >   		return false;
> > -	/* don't cache block age info for cold file */
> >   	if (is_inode_flag_set(inode, FI_COMPRESSED_FILE))
> >   		return false;
> 
> Should move it here instead of removal?
> 
> /* don't cache block age info for cold file */

Not worth to comment this, as the code is exactly saying that.

> 
> >   	if (file_is_cold(inode))


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

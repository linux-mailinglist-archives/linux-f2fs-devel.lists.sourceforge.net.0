Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF71294787
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Oct 2020 06:53:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kV67c-0008EC-OV; Wed, 21 Oct 2020 04:53:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kV67b-0008E1-9I
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Oct 2020 04:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QzVy02rz/R8AWIaTwnjHayt1MdHuFzNS5Poi8ZMTdmc=; b=gJ6IMG35NPGqk9d8JnjthJ95Y/
 GWjHG9uNNQYTqlQibmkYPTH1FdixdqHlrh5gM816nY6ibTuZG9GIXJWA/y0wQHbbobEOD16d6cnhJ
 L4A8bTkH6q7fToSvGeZ4lDVCx97tghGpL76kgm37siYRdjTgOrYelF+JC1YMjDYpjq2c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QzVy02rz/R8AWIaTwnjHayt1MdHuFzNS5Poi8ZMTdmc=; b=G4O0RAWaXJcGRHubwnJyU2xs6K
 5Otlmt5qUsICNIHOYGk3SxOKIigVGu8K337UYi/kGdjPyNvIbvgeNu7933qhrMHwBqhU1OjY7XSoR
 lAYqVQWlvLqtendlfuRlP4IE+wIP6UE12LulHPiDmfEI5juzilSLw79fDXXRxAj4AMsQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kV67T-006ZNh-BP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Oct 2020 04:53:11 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A664C207FF;
 Wed, 21 Oct 2020 04:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603255977;
 bh=UraehopB91mJB0sVQ3c9WR4rOSBImtDbOcY3TERhXzY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jzl/5GKkO/PhDhfyZu328++s/nVgy36QFKK22ppo1rhvoc1zgHe/EnBUycMrPUDAS
 i3Zg8DC1oamM9qGPQlZWVqiQwOD8+fbK7fdU6vHAcqnzJ+/U2lctcou2YzNghVDlBA
 qGWKjMHG494eqO6sf5GjzZWFgxt7GYtY3UFUV34I=
Date: Tue, 20 Oct 2020 21:52:57 -0700
From: jaegeuk@kernel.org
To: Can Guo <cang@codeaurora.org>
Message-ID: <20201021045257.GC3004521@google.com>
References: <20201020195258.2005605-1-jaegeuk@kernel.org>
 <20201020195258.2005605-4-jaegeuk@kernel.org>
 <d6e794548891f81a579cda138cd1529e@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d6e794548891f81a579cda138cd1529e@codeaurora.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kV67T-006ZNh-BP
Subject: Re: [f2fs-dev] [PATCH v2 3/5] scsi: ufs: use WQ_HIGHPRI for gating
 work
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
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Avri Altman <avri.altman@wdc.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/21, Can Guo wrote:
> On 2020-10-21 03:52, Jaegeuk Kim wrote:
> > From: Jaegeuk Kim <jaegeuk@google.com>
> > 
> > Must have WQ_MEM_RECLAIM
> > ``WQ_MEM_RECLAIM``
> >   All wq which might be used in the memory reclaim paths **MUST**
> >   have this flag set.  The wq is guaranteed to have at least one
> >   execution context regardless of memory pressure.
> > 
> 
> You misunderstood my point. I meant you need to give more info about why
> we are adding WQ_HIGHPRI flag but not why WQ_MEM_RECLAIM must be there.

Oh, I thought that WQ_HIGHPRI is telling everything tho.

> 
> Thanks,
> 
> Can Guo.
> 
> > Cc: Alim Akhtar <alim.akhtar@samsung.com>
> > Cc: Avri Altman <avri.altman@wdc.com>
> > Cc: Can Guo <cang@codeaurora.org>
> > Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
> > ---
> >  drivers/scsi/ufs/ufshcd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > index feb10ebf7a35..0858c0b55eac 100644
> > --- a/drivers/scsi/ufs/ufshcd.c
> > +++ b/drivers/scsi/ufs/ufshcd.c
> > @@ -1867,7 +1867,7 @@ static void ufshcd_init_clk_gating(struct ufs_hba
> > *hba)
> >  	snprintf(wq_name, ARRAY_SIZE(wq_name), "ufs_clk_gating_%d",
> >  		 hba->host->host_no);
> >  	hba->clk_gating.clk_gating_workq = alloc_ordered_workqueue(wq_name,
> > -							   WQ_MEM_RECLAIM);
> > +					WQ_MEM_RECLAIM | WQ_HIGHPRI);
> > 
> >  	hba->clk_gating.is_enabled = true;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

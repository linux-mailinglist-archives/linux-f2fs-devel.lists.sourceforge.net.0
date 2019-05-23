Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3D927F1D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2019 16:08:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hToOK-00087L-PK; Thu, 23 May 2019 14:08:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hToOJ-00087E-AE
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 14:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z76wFSudoZLjBOdhDsm65Lankh2oI62Gm5xciJyM06Y=; b=GcNIQXykG0iTkZnm7Ik4azA6TT
 C1NxDADc65towKrViBdQWUsVtECTh4njnsNjDpTaXLLrRYjovv7J9nXp2JmhW3vgVDpfYBRqP33Nb
 DbPEU2ynrnyJ3iEDUFkk8nLemw/gReY6DPnVcb5LtOsdIB+3NZhPX6+fK3aSiS3AGJ3g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z76wFSudoZLjBOdhDsm65Lankh2oI62Gm5xciJyM06Y=; b=HPU02aU5OHBfdwOpbOP0No2J16
 GibIvStq3QRHAjRT6Dc4EttyeLwN2o23oFE6x4Aw1yc0rsbzJUjBR7PIXcy/XOnK5ZQ2aZMOOxsBJ
 5sgvR09UBLvBV48xfzpQPfUVaRmIuv5Ekscoh4DE9r9ehzB53iMaI6WOpZP5kzqu0khI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hToOI-002QAr-5f
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 14:08:19 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8844120863;
 Thu, 23 May 2019 14:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558620492;
 bh=VUHfy4LRmGh59gHjSqL5Ztx0yYJRubYvN4l6Lg1h0Qw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aLSO3TH/vYR+sMNt0w7Gh87iVgNkgWmBcgZI+U4uNgHf1NYzk+nJf1sx8GcY8nkvt
 xuZsa0fW6AaU5k0Dw/5d+CLypMvq21W+rXz1Dw+f0HRcviPJmklgr4JB9wM0VyCwDs
 ie7pFpfqn+g02pBikS8KEV00xz3PgSKbR0pjyKh4=
Date: Thu, 23 May 2019 07:08:11 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20190523140811.GB10954@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190522194141.91216-1-jaegeuk@kernel.org>
 <86b041c4-301b-40b3-d293-ca5365c87600@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86b041c4-301b-40b3-d293-ca5365c87600@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hToOI-002QAr-5f
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: show elapsed time of full scan
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/23, Chao Yu wrote:
> On 2019-5-23 3:41, Jaegeuk Kim wrote:
> > This patch introduces the elapsed time of fsck.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fsck/main.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fsck/main.c b/fsck/main.c
> > index d844820..9aca024 100644
> > --- a/fsck/main.c
> > +++ b/fsck/main.c
> > @@ -18,6 +18,7 @@
> >  #include "fsck.h"
> >  #include <libgen.h>
> >  #include <ctype.h>
> > +#include <time.h>
> >  #include <getopt.h>
> >  #include "quotaio.h"
> >  
> > @@ -745,6 +746,7 @@ int main(int argc, char **argv)
> >  {
> >  	struct f2fs_sb_info *sbi;
> >  	int ret = 0;
> > +	clock_t start = clock();
> >  
> >  	f2fs_init_configuration();
> >  
> > @@ -853,7 +855,7 @@ retry:
> >  	if (ret < 0)
> >  		return ret;
> >  
> > -	printf("\nDone.\n");
> > +	printf("\nDone: %lf secs\n", (clock() - start) / (double)CLOCKS_PER_SEC);
> 
> Minor, as comment log says it's only for fsck.

I think it doesn't matter for other use cases, even though main reason was for
fsck.

> 
> if (c.func == FSCK)
> 	printf();
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks,
> 
> >  	return 0;
> >  
> >  out_err:
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

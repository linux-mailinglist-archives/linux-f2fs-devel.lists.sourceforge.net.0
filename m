Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E541B59A976
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Aug 2022 01:34:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oPBVB-00082J-BW;
	Fri, 19 Aug 2022 23:34:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oPBV9-00082D-NV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 23:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gE/hT9hdXBiNtSAc+O8g2i8pjZsTs6m2LlGl0n3rZJc=; b=nFT1KgRjhMLk6V8pkN9i9Sh+Fc
 LgXvOlwZwp88aTpTgDqTLrxsQJGpif08QWldA1fS9oKKuXl6Y5qieAUFdSWZjEfg4v646qPnV/am3
 Q3ZeDk0TiIOpqlAniBJFlQ8fkifC5yY1lEe3dbr5vp9QnBrC3iup3bJlZTMhg5IZ3b38=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gE/hT9hdXBiNtSAc+O8g2i8pjZsTs6m2LlGl0n3rZJc=; b=CT63a0wY3aS2djTtAtLNRw3h8c
 JEXCFF22hsbU1oR58N/dpgstH7RDLlak2aqJOvkdoEKWpF0UNNOcl9GEqTUSge0O54CCCc5DL17lM
 3CC8zAhSbwe46fOfH5CLSJAQDMvMx3sL0cSxQkLpxhbWwW9Kv3+xxxmgXM961WanbsN0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oPBV9-0000XC-5e for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 23:34:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C94536189D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 19 Aug 2022 23:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A77DC433C1;
 Fri, 19 Aug 2022 23:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660952041;
 bh=1ex3S37pImaGea2RTEMBFJZL5Q2Fyharq5elZu5Uhrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tlYQ3GLsCqHp+8R2FdtK2KF1FHDfPHqeM4x5wTW92kUkID0q4IY7pDyh0p6c1uB1C
 uZ+UNFZEuMy2VrYCeItpESw3GshHZgSsZvPqZh8tEqNblOtYkD4DR7mr5Hm+/w9Xi2
 g1/8UAMMRsKAamDhUDFvvGYyrE61GvVm9KuuErHrBCPQJl7XbCb3SPMortDNAJ+nNQ
 /zuBSEGy/xGkCoHpGGU4ZyHA1/Gav4O2GyN7Bf5Sz47inlRZ4Z1mHsAKC1/a3q8qpX
 DzkXZ9RakQubhCCx5K0udEAdJd7s0Y0Otu0jVK0qZtk7IbR1RvzTVCZ3hXYrHRREd0
 yN3MFc60VCeIQ==
Date: Fri, 19 Aug 2022 16:33:59 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YwAd5wyhXIs1n108@google.com>
References: <20220813143709.11909-1-jaegeuk@kernel.org>
 <65562b32-505f-796e-305a-d1b03baeb388@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65562b32-505f-796e-305a-d1b03baeb388@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/15, Chao Yu wrote: > On 2022/8/13 22:37, Jaegeuk Kim
 wrote: > > We should decrease the frozen counter. > > > > Cc:
 stable@kernel.org
 > > Fixes: 325163e9892b ("f2fs: add gc_urgent_high_remaining [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oPBV9-0000XC-5e
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix wrong continue condition in GC
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
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/15, Chao Yu wrote:
> On 2022/8/13 22:37, Jaegeuk Kim wrote:
> > We should decrease the frozen counter.
> > 
> > Cc: stable@kernel.org
> > Fixes: 325163e9892b ("f2fs: add gc_urgent_high_remaining sysfs node")
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   fs/f2fs/gc.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index 6da21d405ce1..7e4b41240d59 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -102,7 +102,7 @@ static int gc_thread_func(void *data)
> >   					sbi->gc_urgent_high_limited = false;
> >   					spin_unlock(&sbi->gc_urgent_high_lock);
> >   					sbi->gc_mode = GC_NORMAL;
> > -					continue;
> > +					goto next;
> >   				}
> >   				sbi->gc_urgent_high_remaining--;
> >   			}
> 
> Why not:
> 
> 	if (!sbi->gc_urgent_high_remaining) {
> 		sbi->gc_urgent_high_limited = false;
> 		spin_unlock(&sbi->gc_urgent_high_lock);

Should not call spin_unlock, if so. Anyway, let me send v2.

> 		sbi->gc_mode = GC_NORMAL;
> 	} else {
> 		sbi->gc_urgent_high_remaining--;
> 	}
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

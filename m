Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7EDA27726
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Feb 2025 17:29:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tfLo4-0002mw-V4;
	Tue, 04 Feb 2025 16:29:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tfLo3-0002md-0Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Feb 2025 16:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eGKnZEBzwOCVWLka0oS0eRGR1huPQaMQKiqVkul1+UQ=; b=Nq4R7a45aEtgbXEzUmZNMZAz/h
 fyGX7N5xbGTxHSaSPEidaKZTna55QfkD4R3EZGNqg9W7ZDNkFMBgvCfP1p9WzegxyurvSnLLg2Yvz
 9hcAcWjGT0vJjQ1U/3X1E6YvpxVd3amWO7c7SawGbCtmjJdWJtLNGaiBSpVinmnwX4cY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eGKnZEBzwOCVWLka0oS0eRGR1huPQaMQKiqVkul1+UQ=; b=UHcamQxpIth2bJbAu17TIfatpX
 U94Wol/dGYtT083z4CdjM3MiY/jDWfp9VC976a6llov2ByaA6lccROFDxolRSGv0hr4Slg3I1Nh3k
 PE0hVpKxZaao1IU5LvDIR43M09trq8hnzORCYqd3QCQoxdkASbv4iiGWEUBuj13IbztQ=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tfLo2-0006fn-CC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Feb 2025 16:29:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8D29DA429E1;
 Tue,  4 Feb 2025 16:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17810C4CEE8;
 Tue,  4 Feb 2025 16:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738686580;
 bh=Qs6e0KJlL+rHWKqr6JOBVAvvD5sz4CzA9l65oUAebTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JdBUBIq2xMKlpcYxMCmcKUd8j1Xq6x+z+tYS1Ajbxt/YfVapIZXoDhF+iiNxkpWA/
 7RdPXRapN18qMjALO09/YSt9NZBvTyHpBFUsT9YIk9oL65epwkfwZPOsheVyOQqGSY
 goNCRj4deYMxVLxFJmJb/jAXmLG44wXfsGUFTJrq/JWFkoL5NLkIvvfOrUfWPvE9hK
 B1+I1FKLgtRQsVOlRerK33LV11JwmXezP4Rc3sKRMzNx/MRLdPQGl+lJaB55d0VEL+
 hgzbWmQypQ56XtjWEgnBXxcAw/BSYHHSYhN1jAUisrCepGafrZcgKUOvquOVi0x1iB
 165DdMvrdH+2A==
Date: Tue, 4 Feb 2025 16:29:38 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Z6JAcsAOCCWp-y66@google.com>
References: <20250117164350.2419840-1-jaegeuk@kernel.org>
 <Z4qb9Pv-mEQZrrXc@casper.infradead.org>
 <Z4qmF2n2pzuHqad_@google.com>
 <Z4qpurL9YeCHk5v2@casper.infradead.org>
 <Z4q_cd5qNRjqSG8i@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4q_cd5qNRjqSG8i@google.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/17, Jaegeuk Kim wrote: > On 01/17,
 Matthew Wilcox wrote:
 > > On Fri, Jan 17, 2025 at 06:48:55PM +0000, Jaegeuk Kim wrote: > > > >
 I don't understand how this is different from MADV_COLD. Please [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tfLo2-0006fn-CC
Subject: Re: [f2fs-dev] [PATCH 0/2 v6] add ioctl/sysfs to donate file-backed
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/17, Jaegeuk Kim wrote:
> On 01/17, Matthew Wilcox wrote:
> > On Fri, Jan 17, 2025 at 06:48:55PM +0000, Jaegeuk Kim wrote:
> > > > I don't understand how this is different from MADV_COLD.  Please
> > > > explain.
> > > 
> > > MADV_COLD is a vma range, while this is a file range. So, it's more close to
> > > fadvise(POSIX_FADV_DONTNEED) which tries to reclaim the file-backed pages
> > > at the time when it's called. The idea is to keep the hints only, and try to
> > > reclaim all later when admin expects system memory pressure soon.
> > 
> > So you're saying you want POSIX_FADV_COLD?
> 
> Yeah, the intention looks similar like marking it cold and paging out later.

Kindly ping, for the feedback on the direction. If there's demand for something
generalized api, I'm happy to explore.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

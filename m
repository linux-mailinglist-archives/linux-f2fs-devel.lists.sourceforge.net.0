Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DF1A1564A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2025 19:05:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tYqjA-0005or-8p;
	Fri, 17 Jan 2025 18:05:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tYqj8-0005ok-30
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 18:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=crFctZGK1/RGRGxYEhsR3mb5wLIScLWaRkZC5BjZqXk=; b=JvkyiQSEhpHA/bhN57BPjlgEts
 8oxWjYb1Z7dHnDrDTlatT8KF6JxXOC7FuHnn1CBgE/WdozYDYr6XV4u3gbjdYAxpnG2SIG4POjBcZ
 pvSOPbSFg5HA4hhpS/jxQqHK2wyJdJSnO0tKsMJfVU3SUIRvxGVyhqbXYWqhRWYxOlWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=crFctZGK1/RGRGxYEhsR3mb5wLIScLWaRkZC5BjZqXk=; b=i4u/LQz5ASJsSYTwEqq99TL878
 9rh3xvwPIz8+W1TAVGaeL32CflDDlvriaDToTbeLGLCNWmr0ZPT28n+yDUE4Gsi01cWNmjQTxlH4s
 k3OOhweT62P17kQh4iB3fi6tQHgIO616xhAo84L84iJmZxoib2ieHi7i5jGtt8ADFg3w=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tYqj6-0003u0-4F for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 18:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=crFctZGK1/RGRGxYEhsR3mb5wLIScLWaRkZC5BjZqXk=; b=wTSkYsV8/8R1DPP5PTZSUbjVKt
 7SS02vKzNybTsz2f3gvUwRlTvGiIqDZDxf+2n/CMCjPNyVCHDRGMaKZITpxBfeLwIXHaE/UJF0lBz
 GAThwEcXWIzsXt0qOaJgQM/YwROOAmwwccTqwBiRhP0mKcZWB8ViXJHTsVl8jB+hhXCgYzgz4vtmh
 hKDEtcxTTdU3BvOkD8n7wEXkhElCCWVnPlmkI0HtoJGO3FDupKSC9hU1DiQOooccul5xicwqscQ3s
 wQYZcQopSoGqedln7PIeVUAwtvLsvPoB+6/D92xP4ShbH1xO59NBPMx5E2OLv3l+RpsBSm4NSRTc2
 nEieqEpQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tYqiy-00000000UqK-17Vc; Fri, 17 Jan 2025 18:05:40 +0000
Date: Fri, 17 Jan 2025 18:05:40 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Z4qb9Pv-mEQZrrXc@casper.infradead.org>
References: <20250117164350.2419840-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250117164350.2419840-1-jaegeuk@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 17, 2025 at 04:41:16PM +0000, Jaegeuk Kim wrote:
 > If users clearly know which file-backed pages to reclaim in system view,
 they > can use this ioctl() to register in advance and reclaim a [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tYqj6-0003u0-4F
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 17, 2025 at 04:41:16PM +0000, Jaegeuk Kim wrote:
> If users clearly know which file-backed pages to reclaim in system view, they
> can use this ioctl() to register in advance and reclaim all at once later.
> 
> To MM and others,
> 
> I'd like to propose this API in F2FS only, since
> 1) the use-case is quite limited in Android at the moment. Once it's generall
> accepted with more use-cases, happy to propose a generic API such as fadvise.
> Please chime in, if there's any needs.
> 
> 2) it's file-backed pages which requires to maintain the list of inode objects.
> I'm not sure this fits in MM tho, also happy to listen to any feedback.

You didn't cc the patches to linux-mm, so that's a bad start.

I don't understand how this is different from MADV_COLD.  Please
explain.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

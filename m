Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6088183CECE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jan 2024 22:45:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rT7XR-0003Q2-Be;
	Thu, 25 Jan 2024 21:45:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mcgrof@infradead.org>) id 1rT7XP-0003Po-Do
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 21:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tz6CP5gYVtr2hsAPEJmAbiZv1JPJpw3XqQureOu159Q=; b=hce3vGMK8YjjKNDsjB/iIP1WI1
 SSzcAUAq7lTZkZkL3GPyRclyBr12KQU6oPMtr4e6RrE/dUKT8vQ7ZQztWeJitzoVHnPr/pOd4Jyjs
 Td1lxD3F7K3pkz3UcMU2QXcCcmmlB6ggy4+TzWFplRh2MwtQEweJZkNGVG6i7AcHh1ZU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tz6CP5gYVtr2hsAPEJmAbiZv1JPJpw3XqQureOu159Q=; b=ZFsTGVJTZIkRszSl/pPElPXlQ6
 PKV439iGk1N2k8BpwVvXWigbl3dyaRHEVYskLfGZUZo/yjM6uaqoVPqQjM5zbqXTKjMj9Gow6i4FL
 3zNZDs/1vHwaSTnjnEDLg+BQ+dGPpts2GunZsoiQMCtju1f0EtK1cYvEgm+ClmbBwmC4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rT7XO-0007g5-21 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 21:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Tz6CP5gYVtr2hsAPEJmAbiZv1JPJpw3XqQureOu159Q=; b=CqEVduGLAuMeeUplttS7hkZf+M
 ARBHuFerXe35IHjO42C6S1B0EDsCMhqjU6pxm+6j+mHod3KOpZWXVJKQQrnmfIy1qVhgYThXZ0q7R
 sj53FQwtZ90BmdDY0DgU+eGjnWcMhvOVQfpgu4mBdtTIQOHmNNC+K3467DnMaOMIzn7GDLHNL9Wuk
 OJYfbEg8TGc1nuFRdsGViSzFuTkPKKzOd1qlLqQnSjwxO2Ej9eIreBV0SbFYApYkqIl11rvL/lUIG
 cTSJWmCB+01gy8HPPW6OJwASeW3W5sYAl4Sb2F/KxV5+0BIKNB3NabjdbWBh/x1VRcoEu5oaC6P5e
 zJM6sq1A==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2
 (Red Hat Linux)) id 1rT6kJ-00000001s6s-0kYz;
 Thu, 25 Jan 2024 20:54:47 +0000
Date: Thu, 25 Jan 2024 12:54:47 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <ZbLKl25vxw0eTzGE@bombadil.infradead.org>
References: <Y4ZaBd1r45waieQs@casper.infradead.org>
 <20221130124804.79845-1-frank.li@vivo.com>
 <Y4d0UReDb+EmUJOz@casper.infradead.org>
 <Y5D8wYGpp/95ShTV@bombadil.infradead.org>
 <ZbLI63UHBErD6_L2@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZbLI63UHBErD6_L2@casper.infradead.org>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 25, 2024 at 08:47:39PM +0000,
 Matthew Wilcox wrote:
 > On Wed, Dec 07, 2022 at 12:51:13PM -0800, Luis Chamberlain wrote: > > On
 Wed, Nov 30, 2022 at 03:18:41PM +0000, Matthew Wilcox wrote: [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rT7XO-0007g5-21
Subject: Re: [f2fs-dev] [PATCH] f2fs: Support enhanced hot/cold data
 separation for f2fs
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
Cc: Pankaj Raghav <p.raghav@samsung.com>, Yangtao Li <frank.li@vivo.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 vishal.moola@gmail.com, linux-mm@kvack.org,
 Adam Manzanares <a.manzanares@samsung.com>,
 Javier =?iso-8859-1?Q?Gonz=E1lez?= <javier.gonz@samsung.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 25, 2024 at 08:47:39PM +0000, Matthew Wilcox wrote:
> On Wed, Dec 07, 2022 at 12:51:13PM -0800, Luis Chamberlain wrote:
> > On Wed, Nov 30, 2022 at 03:18:41PM +0000, Matthew Wilcox wrote:
> > > From a filesystem point of view, you need to ensure that you handle folios
> > > larger than PAGE_SIZE correctly.  The easiest way is to spread the use
> > > of folios throughout the filesystem.  For example, today the first thing
> > > we do in f2fs_read_data_folio() is convert the folio back into a page.
> > > That works because f2fs hasn't told the kernel that it supports large
> > > folios, so the VFS won't create large folios for it.
> > > 
> > > It's a lot of subtle things.  Here's an obvious one:
> > >                         zero_user_segment(page, 0, PAGE_SIZE);
> > > There's a folio equivalent that will zero an entire folio.
> > > 
> > > But then there is code which assumes the number of blocks per page (maybe
> > > not in f2fs?) and so on.  Every filesystem will have its own challenges.
> > > 
> > > One way to approach this is to just enable large folios (see commit
> > > 6795801366da or 8549a26308f9) and see what breaks when you run xfstests
> > > over it.  Probably quite a lot!
> > 
> > Me and Pankaj are very interested in helping on this front. And so we'll
> > start to organize and talk every week about this to see what is missing.
> > First order of business however will be testing so we'll have to
> > establish a public baseline to ensure we don't regress. For this we intend
> > on using kdevops so that'll be done first.
> > 
> > If folks have patches they want to test in consideration for folio /
> > iomap enhancements feel free to Cc us :)
> > 
> > After we establish a baseline we can move forward with taking on tasks
> > which will help with this conversion.
> 
> So ... it's been a year.  How is this project coming along?  There
> weren't a lot of commits to f2fs in 2023 that were folio related.

The review at LSFMM revealed iomap based filesystems were the priority
and so that has been the priority. Once we tackle that and get XFS
support we can revisit which next fs to help out with. Testing has been
a *huge* part of our endeavor, and naturally getting XFS patches up to
what is required has just taken a bit more time. But you can expect
patches for that within a month or so.

  Luis


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

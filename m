Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 740099FB35E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Dec 2024 17:57:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tPlkY-0006TM-Hy;
	Mon, 23 Dec 2024 16:57:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tPlkX-0006TA-I3
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 16:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yEjayENDt6uv1kSu9Z9p1ZM63ZPQhxfKSotkBDsQcVk=; b=Dh9RklRop546zwZr/7bkBbCQDB
 iSG1HPQ9A2rQxPCs6/tL8VfAAu9R7bEb14cf2iXR7HWM4revz7Sro/KntfKXRsu3AwA0t58gHNi0D
 PQKN+N1Mq5cj9oMN4rTo/sJoXL75+jh1FmwjbuX6CWMFmQo27hmm4hz8AZSzMaqUJNF4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yEjayENDt6uv1kSu9Z9p1ZM63ZPQhxfKSotkBDsQcVk=; b=bVxnmYiX58E5XZ5lKILH7ueSEc
 Kq4KmzqA70v/u5bBlFqfrY/4pgr0S+61BYfMT4wfVOK5/E92k7sSKMkZH5rt/I9+TUp0LygsjxqPb
 UuaEKTOhtiDcMvKPjM/t16yjVut1C0mDhUdP21dFccCR0+p0t14R5WuFkR5kZTAhAvfw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tPlkV-0005Gx-OF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 16:57:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 92BDC5C5508;
 Mon, 23 Dec 2024 16:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFEF8C4CED3;
 Mon, 23 Dec 2024 16:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734973058;
 bh=suJKEELLjfIb0NZM91eAN6mxVZbvUuX/H4WKfj61aTA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qq33b6xSnm4jrv51fJzEUr+E2jm9XFVNGLdZkIURKSMA8TRh6NjyEMwtSYG+u0fnq
 fp3JjOHE8ePOdyrwfTtMY1wRDfjJ2tDQbhqjgO3b/SDt0xENIO+r2w4PuTUdtaNYj6
 DvEHu0AsQW4eKmYDPUPNJjFwBRHTyEzibk2iJ+7/sC/uHTWAc6UoKy4TjtyHwr/CGr
 GfQOSAX7APY8H8jIyPoomkCStvgFYr2fmNy0hsYZ1LGe3OJYwmLNdhv5c8d/55D5ZM
 eMPiehl/q+Y3LdrlCiUtaOW6LzKRFiDwMhBbZ4rL03d5XV0IIlAdvyPuhTxmW7IRkS
 pq0mM7+RcPTjw==
Date: Mon, 23 Dec 2024 16:57:35 +0000
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <Z2mWf-pghAlHYJ8o@google.com>
References: <20241220172136.1028811-1-chullee@google.com>
 <Z2ketmZiWmUVddpt@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z2ketmZiWmUVddpt@infradead.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/23, Christoph Hellwig wrote: > On Fri, Dec 20, 2024
 at 09:21:36AM -0800, Daniel Lee wrote: > > This patch addresses an issue where
 some files in case-insensitive > > directories become inaccessi [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tPlkV-0005Gx-OF
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Introduce linear search for dentries
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/23, Christoph Hellwig wrote:
> On Fri, Dec 20, 2024 at 09:21:36AM -0800, Daniel Lee wrote:
> > This patch addresses an issue where some files in case-insensitive
> > directories become inaccessible due to changes in how the kernel function,
> > utf8_casefold(), generates case-folded strings from the commit 5c26d2f1d3f5
> > ("unicode: Don't special case ignorable code points").
> 
> That also breaks all other direct hashed and needs to be fixed.
> 
> > 
> > F2FS uses these case-folded names to calculate hash values for locating
> > dentries and stores them on disk. Since utf8_casefold() can produce
> > different output across kernel versions, stored hash values and newly
> > calculated hash values may differ. This results in affected files no
> > longer being found via the hash-based lookup.
> > 
> > To resolve this, the patch introduces a linear search fallback.
> > If the initial hash-based search fails, F2FS will sequentially scan the
> > directory entries.
> 
> That means you have really bad worst case behavior for negative lookups.
> I don' think this is in any way a good idea.

No surprise. Please check:
https://lore.kernel.org/lkml/Z1mzu4Eg6CPURra3@google.com/


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

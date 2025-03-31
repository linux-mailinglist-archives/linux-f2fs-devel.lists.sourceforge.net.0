Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 941C3A75E41
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 05:43:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tz63d-0000qG-6T;
	Mon, 31 Mar 2025 03:43:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tz63Z-0000q6-8s
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 03:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dm5KQvuKAe45rSOrP0QEIxdo3sVriBsLRLTNjI2jscE=; b=MP/JFoTWhLgMeD5pmr4Uva3A2V
 sx0J9a1ubdrmdtWbb4xKvvWoejL5bqbiWbMfarcDXkffhyAwSe0E5MYD7sXNrWSRHh3rUP/n1btdD
 MHV5s25FEZjTD2RDTsqYGqDAG2q3dS10tb890F58mhXh6TXTbZs/9hBXV2C9Eb18Ilnw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dm5KQvuKAe45rSOrP0QEIxdo3sVriBsLRLTNjI2jscE=; b=LF0PYaTy9gGd0oFv+Cuzb/TnF1
 cVFkgD0phhL08mo8EvoYAavWOMnRh5snPMoAkZ9avm5KwDAg8lwtvbznYRkrXf3/0EvsuAZ2VCjm8
 cSflOqI0jk2X7zY3J0zioH6ZoZrDfnLgpk1+0oGbvZWJiifuFWdS6EaM237woomgrOWE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tz63W-0006jD-FR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 03:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dm5KQvuKAe45rSOrP0QEIxdo3sVriBsLRLTNjI2jscE=; b=YR4duR3gTwmaLOMOuKe0zSaiD0
 epYrg02vbHDPhLE42u6v5qEleDL+Flxbjc4UnaUYHCh3aeHvZvey91But3rtlt8PJwqrhP9qmBFJK
 SrpNBPGrAQoq54rHKASIGHqWf7Y5fQlEhTDdX9Tb4pN01UPGBrM82zzeN1Br85xoaTlvxXIcBqH19
 B3Q5/OJpbq4GhbmKOGKz2+1XH1B3of2vO1O9zimWPPa9HXTawcmkdvVZ2RKcqyskvFWLXVV+wxbWn
 AoRG4lTv2dJpUVLOWjH48WRieVgVvaLkks0YcCIvEktbuqK0pczknVDdV1/3o0UXbk0nzSyIDx5cv
 C63+xY6A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tz63J-0000000Djf8-3M9T;
 Mon, 31 Mar 2025 03:43:09 +0000
Date: Mon, 31 Mar 2025 04:43:09 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Message-ID: <Z-oPTUrF7kkhzJg_@casper.infradead.org>
References: <CAMLCH1E_cayyv6y8w=u3i+VTgnJmtw7+_K3X23=6w7jKDWbmTw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMLCH1E_cayyv6y8w=u3i+VTgnJmtw7+_K3X23=6w7jKDWbmTw@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Mar 30, 2025 at 10:38:37AM +0800, Nanzhe Zhao wrote:
 > I have been considering potential solutions to address this. Two >
 approaches
 I've explored are: > Either modifying the f2fs dirty page w [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tz63W-0006jD-FR
Subject: Re: [f2fs-dev] [DISCUSSION]:f2fs:Approachs to address write
 amplification in current aops->dirty_folio
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
Cc: jaegeuk@kernel.org, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Mar 30, 2025 at 10:38:37AM +0800, Nanzhe Zhao wrote:
> I have been considering potential solutions to address this. Two
> approaches I've explored are:
>  Either modifying the f2fs dirty page writeback function to manually
> mark individual sub-pages within a folio as dirty, rather than relying
> on the folio-level dirty flag.

Just so you know, the per-page dirty flag is not in fact per page.
If you call SetPageDirty() on a tail page, it will set the dirty flag
on the head page (ie the same bit that is used by folio_set_dirty()).
This is intentional as we do not intend for there to be a per-page flags
field in the future.

> Or utilizing the per-block dirty state tracking feature introduced in
> kernel 6.6 within the iomap framework. This would involve using the
> iomap_folio_state structure to track the dirty status of each block
> within a folio.

The challenge with that is that iomap does not support all the
functionality that f2fs requires.  The iomap data structure could
be duplicated inside f2fs, but then we hit the problem that f2fs
currently stores other information in folio->private.  So we'd need
to add a flags field to iomap_folio_state to store that information
instead.

See the part of f2fs.h from PAGE_PRIVATE_GET_FUNC to the end of
clear_page_private_all().

You're right that f2fs needs per-block dirty tracking if it is to
support large folios.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

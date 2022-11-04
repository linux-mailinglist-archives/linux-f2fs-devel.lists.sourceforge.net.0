Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E626D61A1E6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Nov 2022 21:07:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1or2y8-0001h7-4a;
	Fri, 04 Nov 2022 20:07:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1or2y6-0001gz-40
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Nov 2022 20:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s2O/qvDFRXf6wsYKSZLjcNGb+D8yn522RgYWCb7F9IA=; b=ju4xGUvqTy79QBLmdUAqLc8q2V
 vS/osOWunv9WADlBRVNMFAiRPoi3e0VX7GdVUF8J7vDvqdUMcwDya3MJyofutr7HnZR/Izt9T3FCH
 c1pYCfsPUcxrU4U9uDHJv1RkrjqH2I5EzzzmqnIHyTAZdoSM74voxF+r3kfPCecRRCIY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s2O/qvDFRXf6wsYKSZLjcNGb+D8yn522RgYWCb7F9IA=; b=eYF4dndqUFNUgm9vHKpw0scx4p
 FtFwRWw1OgxCO1pBw6rNHxrTMOAZj/JnZS/nxHrfp+NogIFc9Xpd8UStOpVbetudp9zTAKhhiophO
 utC1Zo0wqAk6iyo/GuY158P0gh47ihtFKy/P1gDv1rqT/oUpKBC38F88xNVvbCiKy74k=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1or2y1-00C2V2-E8 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Nov 2022 20:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=s2O/qvDFRXf6wsYKSZLjcNGb+D8yn522RgYWCb7F9IA=; b=GtnDjMYQ5z4Z0YK9fPQqghVAUu
 S1NnClGtXQ3weaDOyQ9V0+0Pia32moBZqAjUYqkInOBGfZeixA7s3fZHLaEqsaXw7xHFxvuj7Bk2D
 NGp2vaLcYpNUIXvducZ7V1dGW0tYCtdUikNkvwwd0nwwxQ2w6UAsvh2cvrULg6KAH8QmFp7WA2c2t
 AZc9EHn3KODznyd/NQ3mZ8pYJ2EjOwTOoAkuCzZ9oZmGEy5PBpIJLR/l0lQMr9fYyRC55QvSOvYxC
 AH/s8bS6XlEJM43lfJ6ozC36C89WNlhsRSaVoZT4F4UNLptNZsF/H6SfN7ucyrFXy4U6Q8jCS/It+
 hkGNj1Ng==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1or2xl-007dIx-Tf; Fri, 04 Nov 2022 20:06:49 +0000
Date: Fri, 4 Nov 2022 20:06:49 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <Y2Vw2UBkti7MeG5U@casper.infradead.org>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-5-vishal.moola@gmail.com>
 <20221018210152.GH2703033@dread.disaster.area>
 <Y2RAdUtJrOJmYU4L@fedora>
 <20221104003235.GZ2703033@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221104003235.GZ2703033@dread.disaster.area>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Nov 04, 2022 at 11:32:35AM +1100, Dave Chinner wrote:
 > At minimum, it needs to be documented, though I'd much prefer that > we
 explicitly duplicate write_cache_pages() as write_cache_folios() [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1or2y1-00C2V2-E8
Subject: Re: [f2fs-dev] [PATCH 04/23] page-writeback: Convert
 write_cache_pages() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Vishal Moola <vishal.moola@gmail.com>, linux-mm@kvack.org,
 linux-nilfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 04, 2022 at 11:32:35AM +1100, Dave Chinner wrote:
> At minimum, it needs to be documented, though I'd much prefer that
> we explicitly duplicate write_cache_pages() as write_cache_folios()
> with a callback that takes a folio and change the code to be fully
> multi-page folio safe. Then filesystems that support folios (and
> large folios) natively can be passed folios without going through
> this crappy "folio->page, page->folio" dance because the writepage
> APIs are unaware of multi-page folio constructs.

There are a lot of places which go through the folio->page->folio
dance, and this one wasn't even close to the top of my list.  That
said, it has a fairly small number of callers -- ext4, fuse, iomap,
mpage, nfs, orangefs.  So Vishal, this seems like a good project for you
to take on next -- convert write_cache_pages() to write_cache_folios()
and writepage_t to write_folio_t.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

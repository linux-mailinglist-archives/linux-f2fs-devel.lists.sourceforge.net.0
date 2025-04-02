Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D58CA786C0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Apr 2025 05:11:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzoVZ-0002uu-R7;
	Wed, 02 Apr 2025 03:11:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzoVX-0002ul-T4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Apr 2025 03:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rHBpRMhMd4e9ZA248Jg6tHY4xx+UFwF4Ug2t9CRPn/I=; b=Qv31t/1NGyPH5d9VKKrDOvNrVg
 acPpJcOESj/cVV2pcAok7AyIz7jQJroc6q6/2ZAtFSgW9Ul7fIulcrN1+Wi2lfYXjfrxNqB0lEUek
 aSbVCiOPSib1TyjoViXLA6LyD3YJjjL92n1as4GcMi19AcKO4Zjfnw7C3tUUf4xEBuCw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rHBpRMhMd4e9ZA248Jg6tHY4xx+UFwF4Ug2t9CRPn/I=; b=hgHDNOKeLn56I1bZn5s+OGRm5U
 GAtKdKCkbNWY8EvkZxGEAAq5S7PES6lmGqqJTgnRz0KbqeCEmO0gA/MbGALJCCOKCdH+qHTNAJBgJ
 S9y2aSiwdSPuoM1jI2vhyeht9LNDxegZGsuRKQj8SAUjaO1czkDHsrLS024wyafy0xKc=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzoVG-0006U1-4j for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Apr 2025 03:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rHBpRMhMd4e9ZA248Jg6tHY4xx+UFwF4Ug2t9CRPn/I=; b=ekFbKOPnBKwQEmiYAwB1VBUYGa
 rvakAVNd6rxJQV2xKYSEYOIhH71iTN3BGXr4StYvykiTlMBuXIkPtwHTFRhg6Ol6E77EJ8PND+Yyd
 4kkijVu5dBPjjIWqBfXD21/M4Y2LpdlTYIXJ4iheetZWxXqkhw2N064Y+4nXL6TMzdumcna84Hr+B
 eG3+rsenjfhjT7qTgOsSbQFxUVzqggHxjuYjV6XBtkfNCx7O7dt0vEpbg2cn7oOGGMzaqFMw4/G2u
 5CSSS9scfphRuLWyuzGrkoyQWdjVcQ2J4g0WvxZaP+/t6PwY3ouVcH3r7GMdt2DltTp3WBdz5PwSr
 ZT0xFUcA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzoV9-00000008eyq-2ijD;
 Wed, 02 Apr 2025 03:10:51 +0000
Date: Wed, 2 Apr 2025 04:10:51 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Message-ID: <Z-yqu2zuoX4OIn14@casper.infradead.org>
References: <CAMLCH1E_cayyv6y8w=u3i+VTgnJmtw7+_K3X23=6w7jKDWbmTw@mail.gmail.com>
 <Z-oPTUrF7kkhzJg_@casper.infradead.org>
 <CAMLCH1HTSXrK_qmPi9vzGFd4t1=EuQ4uc35rm4cQ6u-nDKw_Qg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMLCH1HTSXrK_qmPi9vzGFd4t1=EuQ4uc35rm4cQ6u-nDKw_Qg@mail.gmail.com>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 01, 2025 at 10:17:42PM +0800, Nanzhe Zhao wrote:
 > Based on my understanding after studying the code related to F2FS's > use
 of the private field of the page structure, it appears that F2F [...] 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1tzoVG-0006U1-4j
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
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 01, 2025 at 10:17:42PM +0800, Nanzhe Zhao wrote:
> Based on my understanding after studying the code related to F2FS's
> use of the private field of the page structure, it appears that F2FS
> employs this field in a specific way. If the private field is not
> interpreted as a pointer, it seems it could be used to store
> additional flag bits. A key observation is that these functions seem
> to apply to tail pages as well. Therefore, as you mentioned, if we are
> using folios to manage multiple pages, it seems reasonable to consider
> adding a similar field within the iomap_folio_state structure. This
> would be analogous to how it currently tracks the uptodate and dirty
> states for each subpage, allowing us to track the state of these
> private fields for each subpage as well. Because it looks just like
> F2FS is utilizing the private field as a way to extend the various
> state flags of a page in memory. Perhaps it would be more appropriate
> to directly name this new structure f2fs_folio_state? This is because
> I'm currently unsure whether it will interact with existing iomap APIs
> or if we will need to develop F2FS-specific APIs for it.

At this point, f2fs has no concept of head/tail pages.  Because it
doesn't tell the VFS that it can handle large folios, it will only see
order-0 pages.  The page->private member will go away, so filesystems
cannot depend on being able to access it.  They only get folio->private,
and it's recommended (but not required) that they use that to point to
their own private per-folio struct.

I do think the best approach is to extend iomap and then have f2fs use
iomap, but I appreciate that is several large jobs.  It's worth it
because it completely insulates f2fs from having to deal with
pages/folios (except for metadata)

> > You're right that f2fs needs per-block dirty tracking if it is to
> > support large folios.
> 
> I feel that we need to consider more than just this aspect. In fact,
> it might be because we are still in the early stages of F2FS folio
> support,so it leaves me the impression that the current F2FS folio
> implementation is essentially just replacing struct page at the
> interface level. It effectively acts just like a single page, or in
> other words, a folio of order 0.

Right, that's the current approach.  We're taking it because the page
APIs are being removed.  The f2fs developers have chosen to work on other
projects instead of supporting large folios (which is their right),
but they can't hold up the conversion of the entire filesystem stack
from pages to folios, so they're getting the minimal conversion and can
work on large folios when they have time.

> As you can see in f2fs_mpage_readpages, after each folio is processed
> in the loop, the nr_pages counter is only decremented by 1. Therefore,
> it's clear that when the allocated folios in the page cache are all
> iterated through, nr_pages still has remaining value, and the loop
> continues. This naturally leads to a segmentation fault at index =
> folio_index(folio); due to dereferencing a null pointer. Furthermore,
> only the first page of each folio is submitted for I/O; the remaining
> pages are not filled with data from disk.

Yes, there are lots of places in f2fs that assume a folio only has a
single page.

> I am planning to prepare patches to address these issues and submit
> them soon. I noticed you recently submitted a big bunch of patches on
> folio. I would like to debug and test based on your patch.Therefore, I
> was wondering if it would be possible for you to share your modified
> F2FS code directly, or perhaps provide a link to your Git repository?
> Manually copying and applying so many patches from the mailing list
> would be quite cumbersome.

Ah, you need a tool called b4.  Your distro may have it packaged,
or you can get it from:

https://git.kernel.org/pub/scm/utils/b4/b4.git


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E6D151F1A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Feb 2020 18:17:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iz1oq-0004rO-GX; Tue, 04 Feb 2020 17:17:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1iz1oo-0004r8-NM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Feb 2020 17:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3NMwJ5AxeA2DxLtwDwGHd3oNGbv+NT9nGn8qTgTw24Y=; b=hcLuNJBqX2ai4SBi5JXeJ3KndR
 uE1LeVaWWBwI42v76VSp0y7AwxGom8X59Y/cR9ozAQrcolcw/DSpkboxDj7Hr6zNVBxZaaAOSNgsQ
 ff4O+Sxl8TZHKTxrzdrvUeHQisLa9EcxaCSaL9Q0gAdCzEVhNT1Nn7pOzSHQwUTtr91A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3NMwJ5AxeA2DxLtwDwGHd3oNGbv+NT9nGn8qTgTw24Y=; b=OIs6Qa9YeDNCSBmCic6AhoFs9l
 CfXNJX/XvDmc2Lx0hRZCfEiSqMe31dVe1KNsaU/PVwAPJ5/bSDMRD0sCunZiATIIanCJJJmQXVt5Z
 /n4wnIyLiIQKuD3QU8+0AjxfB4eat/fWAG23aRdwQCaJV4C8mg0IId07tn0kdeBCpHvc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iz1ok-00Grxv-UP
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Feb 2020 17:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3NMwJ5AxeA2DxLtwDwGHd3oNGbv+NT9nGn8qTgTw24Y=; b=KvUEDJeoNCmLGpgVORZ1wzUvhJ
 wIAGhqJxfoOzPQ81fRuNGE10yA3XKfb/XFoGImLuak/cMOfZTUmObg0Isl2d2H0xUOSKupB0K5WcM
 sKxT2uMCKsc4W81B/oIY7Nq/C5eF5mKX/mpXbcr6o6ZfTyX9aekNmNh3gtOEhVHyRyRFOjLmBOoAV
 w/5nCLaExb6rBxUuDMer/dCqVGMYPxFJFfEgIYZLwmM129d6OhQkvQzzrkTlvB2JCwmIwlAncUOBt
 f+hfqZM2PPSztiwr4r/vdc/oOP6H8o9d+EufWbh/gPVAF/VnEbBn1Z6Mr84omAyvjNDVJTZNQSeyL
 y2yx+ifA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iz1oN-0000iE-LX; Tue, 04 Feb 2020 17:16:31 +0000
Date: Tue, 4 Feb 2020 09:16:31 -0800
From: Matthew Wilcox <willy@infradead.org>
To: dsterba@suse.cz, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 cluster-devel@redhat.com, ocfs2-devel@oss.oracle.com
Message-ID: <20200204171631.GM8731@bombadil.infradead.org>
References: <20200201151240.24082-1-willy@infradead.org>
 <20200204153227.GF2654@twin.jikos.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204153227.GF2654@twin.jikos.cz>
X-Spam-Score: 2.2 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 2.5 URIBL_DBL_ABUSE_MALW   Contains an abused malware URL listed in the
 Spamhaus DBL blocklist [URIs: infradead.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iz1ok-00Grxv-UP
Subject: Re: [f2fs-dev] [PATCH v4 00/12] Change readahead API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Feb 04, 2020 at 04:32:27PM +0100, David Sterba wrote:
> On Sat, Feb 01, 2020 at 07:12:28AM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > 
> > I would particularly value feedback on this from the gfs2 and ocfs2
> > maintainers.  They have non-trivial changes, and a review on patch 5
> > would be greatly appreciated.
> > 
> > This series adds a readahead address_space operation to eventually
> > replace the readpages operation.  The key difference is that
> > pages are added to the page cache as they are allocated (and
> > then looked up by the filesystem) instead of passing them on a
> > list to the readpages operation and having the filesystem add
> > them to the page cache.  It's a net reduction in code for each
> > implementation, more efficient than walking a list, and solves
> > the direct-write vs buffered-read problem reported by yu kuai at
> > https://lore.kernel.org/linux-fsdevel/20200116063601.39201-1-yukuai3@huawei.com/
> > 
> > v4:
> >  - Rebase on current Linus (a62aa6f7f50a ("Merge tag 'gfs2-for-5.6'"))
> 
> I've tried to test the patchset but haven't got very far, it crashes at boot
> ritht after VFS mounts the root. The patches are from mailinglist, applied on
> current master, bug I saw the same crash with the git branch in your
> repo (probably v1).

Yeah, I wasn't able to test at the time due to what turned out to be
the hpet bug in Linus' tree.  Now that's fixed, I've found & fixed a
couple more bugs.  There'll be a v5 once I fix the remaining problem
(looks like a missing page unlock somewhere).



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

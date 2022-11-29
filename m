Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E89063C7E7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Nov 2022 20:14:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p063z-0001y2-Jo;
	Tue, 29 Nov 2022 19:14:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1p063w-0001xv-Ee
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Nov 2022 19:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZT8K1y0fomD3ovOrP25q9qXv8/nKa1NepgBkRGQnx/c=; b=C1HGa8XcWzJybpRNaTe9V16dfd
 /KOUCPT5bbGFxKJKLCkq34cbDnKKHpLCrL/N55nkGLxiqOFnM/rSjGGo8hYQqTvI8wa8xAf6my24r
 B36McE5y6duqV0OQ4NMPRN63UMLGrkjUY2rA9rNcmnUTlP5wDkYfOsVKsq3epiE8WaUU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZT8K1y0fomD3ovOrP25q9qXv8/nKa1NepgBkRGQnx/c=; b=Gzdz8JePw14M4E39/Mx2uTkYen
 9NyLX5ugY9GyOliJekzWFsyCqyVJg7mH/F7+BofG7CCd2U/ea++l8VWRq3P+ZviOW+aiJkY6V1dH6
 xGgb5/vKOjv21rja4azxKW+76up4ZeE2Xo8PgbLhOa3LBewpXDBsIieGHElhWO7BeVEY=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p063r-000WvR-Mj for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Nov 2022 19:14:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZT8K1y0fomD3ovOrP25q9qXv8/nKa1NepgBkRGQnx/c=; b=P5TK2Cg/ft8uEaGWEYuJOx2nTq
 ++BNFtjzHpjkmt+xbZUJCENMP4R5NzonRN+VWLuix+EnM8rejebY5irBlL/lS7/8qJ4JwyL7mm6Gs
 Z95A632AvwDYz+7Tn2OT3VQF/DrUt32Mq0M6G00VDaVqx1aEoepS1pnx7ZWlQCKxp1ULw+zClGfna
 pZ9ewuMH+VcS13cN4AxOLfReKqlmfrysPRifXYSfYsE9d3fKQ9pgLpTO+1D8BEQDMLByyRV+p+4am
 zZbjZlYckPTU2LVb9gfIG0G8RjJfMNxmyXhZk1lhP13nNA8/S4+xUdQxOs/k4FANWCFTxbCvah0RJ
 mlwkiT4Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p063Z-00E7rA-Hi; Tue, 29 Nov 2022 19:14:13 +0000
Date: Tue, 29 Nov 2022 19:14:13 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y4ZaBd1r45waieQs@casper.infradead.org>
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-15-vishal.moola@gmail.com>
 <9c01bb74-97b3-d1c0-6a5f-dc8b11113e1a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c01bb74-97b3-d1c0-6a5f-dc8b11113e1a@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 14, 2022 at 03:02:34PM +0800, Chao Yu wrote: >
 On 2022/10/18 4:24, Vishal Moola (Oracle) wrote: > > Converted the function
 to use a folio_batch instead of pagevec. This is in > > preparati [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p063r-000WvR-Mj
Subject: Re: [f2fs-dev] [PATCH v3 14/23] f2fs: Convert
 f2fs_write_cache_pages() to use filemap_get_folios_tag()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 14, 2022 at 03:02:34PM +0800, Chao Yu wrote:
> On 2022/10/18 4:24, Vishal Moola (Oracle) wrote:
> > Converted the function to use a folio_batch instead of pagevec. This is in
> > preparation for the removal of find_get_pages_range_tag().
> > 
> > Also modified f2fs_all_cluster_page_ready to take in a folio_batch instead
> > of pagevec. This does NOT support large folios. The function currently
> 
> Vishal,
> 
> It looks this patch tries to revert Fengnan's change:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=01fc4b9a6ed8eacb64e5609bab7ac963e1c7e486
> 
> How about doing some tests to evaluate its performance effect?
> 
> +Cc Fengnan Chang

Thanks for reviewing this.  I think the real solution to this is
that f2fs should be using large folios.  That way, the page cache
will keep track of dirtiness on a per-folio basis, and if your folios
are at least as large as your cluster size, you won't need to do the
f2fs_prepare_compress_overwrite() dance.  And you'll get at least fifteen
dirty folios per call instead of fifteen dirty pages, so your costs will
be much lower.

Is anyone interested in doing the work to convert f2fs to support
large folios?  I can help, or you can look at the work done for XFS,
AFS and a few other filesystems.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

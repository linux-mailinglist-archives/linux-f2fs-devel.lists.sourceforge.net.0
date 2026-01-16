Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFDDD2B85C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jan 2026 05:41:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sul42dMwhKyYEgEWnzO6JRRn1OpCy0MPB5wU8gpJ0+Q=; b=KvJrDY52AoWJpooUb/oSYxTa6K
	DbPDcNDzxePxnEbvy5ghmBnAP28BUMTfckd+9jb5kYvIl5Q4d1fFcFiK3g40NsKwPSTIG+C5wmb14
	ZASrhtij6jAv5AMQLKboReyKxzaQ+9Ar6SNLYfADlDa7kbGyTmyzAnKlnq7oVeiMLv04=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgbeA-0006ei-Lp;
	Fri, 16 Jan 2026 04:41:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vgbe9-0006ec-3j
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 04:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SDlH9tX7unbKRHpcn7Hphf6tOM03vv012UyJB8wboew=; b=MYcB16/+1OTk59AHNePOkTKnw7
 FyYPDxFowK7xkJciTwIHtlliCye3BJt7vMXSRe2xP6h7c77ghGuwkIG3sHLvSw7QoeUSQRnGcVPjN
 uMvt1RJcgKVDkGhGTdgWZ2LSaqNnHQi8/Eu6TNbkAN/ObsRQRkrNG0bXX+Lli4z9qdfw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SDlH9tX7unbKRHpcn7Hphf6tOM03vv012UyJB8wboew=; b=Swvv40ZYuOKev6p4P1wZpLdLDu
 5ks1fGanoPJYbXKrKQvRS3knJW438nYzprMWlqc8hx1J90zGAYTLgOI1tmx4CDR1i73CYh7sk/l8l
 1hqq9AwMItldO5x/eEegaGzIn4xQWwIlMxnv/MyIKKCVzCjXS1PeV5rXRipY2SeIv8mE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgbe8-0004Ax-N0 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 04:41:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E022A60167;
 Fri, 16 Jan 2026 04:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5CDC116C6;
 Fri, 16 Jan 2026 04:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768538465;
 bh=ZpX22eDLuTWlfJ8zNQ8HMDTydSL8IN69+Vb9901rPJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kL1nLktgpPSzsoZkwKWH3GeDy7wYPC21Oo5Rfw6Lo7zSaJ/w1EP4VjBbcTkDEZO8j
 3HdKlwpvaovQqSM81fyFkVPNczcO/kfAFaS6gV9te0MIERnOTLmyMg8DqKWywfVg/9
 rDVjaAqCwgD7vBbrt1sNDgz9JYc7qbDkpi3WBEPr8qW8l2Ho8OnNUZGc2yzwNa7NMj
 f09F3KrlLMVpPDEMeKEewJ/SfMci4K6TRiwPWUm9khhCJEXfln9mcgmg5jz8dmOBOq
 Lc1SQQbGXNX61tPpRDgQp0HMjT8PN7CVOQFKuXSab4AhlQGfAMLQH37lWR7MUw9Buz
 mamjg+1UBgElw==
Date: Fri, 16 Jan 2026 04:41:03 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <aWnBX07vqjKAV4De@google.com>
References: <20251202013212.964298-1-jaegeuk@kernel.org>
 <20251202013212.964298-4-jaegeuk@kernel.org>
 <aS9uod21hG_qq7Rd@casper.infradead.org>
 <aTCJ0Js4X7qlqzDZ@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aTCJ0Js4X7qlqzDZ@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/03, Jaegeuk Kim wrote: > On 12/02,
 Matthew Wilcox wrote:
 > > On Tue, Dec 02, 2025 at 01:30:13AM +0000, Jaegeuk Kim wrote: > > > @@
 -627,7 +628,7 @@ void page_cache_sync_ra(struct readahead_contr [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgbe8-0004Ax-N0
Subject: Re: [f2fs-dev] [PATCH 3/3] mm/readahead: try to allocate high order
 pages for FADVISE_FAV_WILLNEED
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
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/03, Jaegeuk Kim wrote:
> On 12/02, Matthew Wilcox wrote:
> > On Tue, Dec 02, 2025 at 01:30:13AM +0000, Jaegeuk Kim wrote:
> > > @@ -627,7 +628,7 @@ void page_cache_sync_ra(struct readahead_control *ractl,
> > >  	ra->size = min(contig_count + req_count, max_pages);
> > >  	ra->async_size = 1;
> > >  readit:
> > > -	ra->order = 0;
> > > +	ra->order = mapping_max_folio_order(ractl->mapping);
> > >  	ractl->_index = ra->start;
> > >  	page_cache_ra_order(ractl, ra);
> > >  }
> > 
> > I suspect this is in the wrong place, but I'm on holiday and not going
> > to go spelunking through the readahead code looking for the right place.
> > 
> > Also, going directly to max folio order is wrong, we should use the same
> > approach as the write order code, encapsulated in filemap_get_order().
> > See 4f6617011910
> 
> It seems the key is page_cache_ra_order() which allocates pages by
> ra_alloc_folio() given ra->order. FWIW, madvise() and fault() readahead
> takes page_cache_async_ra(), while fadvise() takes page_cache_sync_ra().
> And, the former one has a logic to bump up the ra->order += 2 by f838ddf8cef5.
> I think it'd make sense to match that behavior?

Comment by any chance?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

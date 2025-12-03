Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE9ECA13E7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 03 Dec 2025 20:05:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/34cQTXTgJZVRNrLH4aGKJ9PKs9/Hc4zb9yqL+WaTg=; b=idibkUlTSlh5vNMwOotHui8WUM
	dPaVM+47MA9gwbJ9XpTYkGnRvnLHBVY8OUmzA5kzHnltiqXwOLe9ViohN802wJB7jvFV2LLParfKb
	TB1PeBKlyca7beJzdK2XCrTIMwTzHvf+0Bb9BixiRb5LFcFt5gO3afZrYcedMc4b18EM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQs9p-0001qZ-Ue;
	Wed, 03 Dec 2025 19:04:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vQs9o-0001qO-5k
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Dec 2025 19:04:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OkF7XjYEuAYSUNSGU1CpHQtXjuz9vNG1pHPsljnvij8=; b=Zu7rFtOIO3RB7A8NtfKDTthHod
 wnPNWhXk90WvmDLXsDoCVzTGV5r1fepuyByMvjJ5MT0xivwHJGtJVrt11+4o0iVRO8P1uHD/wdX3w
 jf17O24Q3/+l1dtFCct6sSNr3dCUeCJQXf8RMPq7GC6cquM4amIYR+Mfal+3cYYPpdeA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OkF7XjYEuAYSUNSGU1CpHQtXjuz9vNG1pHPsljnvij8=; b=XYLXWEixYbCVLsquVf1dotVG6h
 gcFa0VR0dCWt4QmXk95NIL0Ppw07jTeoPXpp6khjj2Jmfkv6OG+PjZuZh/K41wFuziLrwA3K/xjVS
 75xwUNBW86qJ0El0TRruw+Bsx5A9M9M2MZBLvU+0aTYZy1Y3+XAqFiWet5U3Yod3FcQ0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQs9n-00016i-Kz for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Dec 2025 19:04:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 47568442E4;
 Wed,  3 Dec 2025 19:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1386C113D0;
 Wed,  3 Dec 2025 19:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764788690;
 bh=aGzbRJbeT3IOWtWgKv9SQeyNm/6DptS3SWAhcU/89oM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eZAsd+uiYiYijRM/xndKWYV/dH/Ysd8e6EGy32Ezg5DJnhjZP0auJVPTpr1Rx6PWi
 nkJQ5sFfxsdhhHmX5p/kWicdMjuwqody2RxrzcUYpM/Ang7BJToUQfmvlPnmsS+Z5x
 3z7Y9aztneDJbGimGlAT5vLYCKFKDhar33VyOnS10ElJBiPkFRzeX/NFPCi4nrJUYs
 X9lvlQjGsbWDjYlZrLUi8TJSQDbaacDjmVEhwZA7UYAXbeKLRJXno5J1mZZTJCJaKW
 jAKTpD2hZz6YVfLbfbpI/TukHoD9tqawayqTdawOGonDc9o57z5jIyUcu6bt++D4Fi
 5K0SNhq5gBMSg==
Date: Wed, 3 Dec 2025 19:04:48 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <aTCJ0Js4X7qlqzDZ@google.com>
References: <20251202013212.964298-1-jaegeuk@kernel.org>
 <20251202013212.964298-4-jaegeuk@kernel.org>
 <aS9uod21hG_qq7Rd@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aS9uod21hG_qq7Rd@casper.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/02, Matthew Wilcox wrote: > On Tue, Dec 02, 2025 at
 01:30:13AM +0000, Jaegeuk Kim wrote: > > @@ -627, 7 +628,
 7 @@ void page_cache_sync_ra(struct
 readahead_control *ractl, > > ra->size = min(conti [...] 
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
X-Headers-End: 1vQs9n-00016i-Kz
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

On 12/02, Matthew Wilcox wrote:
> On Tue, Dec 02, 2025 at 01:30:13AM +0000, Jaegeuk Kim wrote:
> > @@ -627,7 +628,7 @@ void page_cache_sync_ra(struct readahead_control *ractl,
> >  	ra->size = min(contig_count + req_count, max_pages);
> >  	ra->async_size = 1;
> >  readit:
> > -	ra->order = 0;
> > +	ra->order = mapping_max_folio_order(ractl->mapping);
> >  	ractl->_index = ra->start;
> >  	page_cache_ra_order(ractl, ra);
> >  }
> 
> I suspect this is in the wrong place, but I'm on holiday and not going
> to go spelunking through the readahead code looking for the right place.
> 
> Also, going directly to max folio order is wrong, we should use the same
> approach as the write order code, encapsulated in filemap_get_order().
> See 4f6617011910

It seems the key is page_cache_ra_order() which allocates pages by
ra_alloc_folio() given ra->order. FWIW, madvise() and fault() readahead
takes page_cache_async_ra(), while fadvise() takes page_cache_sync_ra().
And, the former one has a logic to bump up the ra->order += 2 by f838ddf8cef5.
I think it'd make sense to match that behavior?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

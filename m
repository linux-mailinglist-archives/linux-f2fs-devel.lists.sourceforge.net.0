Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C70EC9D3F5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 02 Dec 2025 23:57:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MskE4RFEbgmmLTJv4lrae0ayutUuGUEyuhOnLNCK3q8=; b=ci40RznJ9awTfufY5yxKNxcdsO
	gO+u0fKlG2JD0EBOa7O4iQNWkBPum5HsQjpV9xN0rG3qMZigVN/IPY3T/NX0/YeBXZjL/w3msyTQy
	B8oYsN7QwmMIhS++L1tUTUzOyidF6zuRJuoJAQj2f3lLXTg/Ha3GIn0IQIGyBl50VBfs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQZIf-0002Gc-HS;
	Tue, 02 Dec 2025 22:56:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1vQZId-0002GT-AK
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 22:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/gOBQqE/HyGqpgfqgim1hZAdMA8Tl09+44pTCSGAB7A=; b=lf6yF76T2fV6LDQwmj2Toacmj1
 N+dWpbEl3aOfUWP2X8XESS/Sa3grYTMsDdAXddpewu5b3kR5LSkyvQLcIqlkUAd0E3+22LARcusDM
 cXCTpJSH1d++9Y7VfvoJPr4x7SLRa6iDBnRAf7QLevPf9sKyOoyohrASQwRRu0He28F4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/gOBQqE/HyGqpgfqgim1hZAdMA8Tl09+44pTCSGAB7A=; b=H79wkHlF3+nLI2bQkFekRAl0yy
 m0MwQU2yt1kWVVDkExMBbyw2YqH1yu7Klve9mCe0o2exCVQTIOYPb6MkxnMmFZtIgsSVVQnXpDiZA
 FfUq/F/F0JmuTxpMwHGluaiGO8YiTV0J0tko/nwsjHVbP+PxMxCgM2W+gBBJjSwZvynQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQZIc-0005Xe-F1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 22:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/gOBQqE/HyGqpgfqgim1hZAdMA8Tl09+44pTCSGAB7A=; b=eGR1Ms5bvq4eQIpTsJqVcmrbsR
 s6CfxzUISzPI4tVx6/cUxHWayuqHm3crBH0ilaQ8GehgOb5zUZu4CfoXpizymJOVr5Ifc1eGZ4+KD
 7yJ++EdZnpwZkUAdXps40p/xitjdwv4kl/hbmoFoNix7IIvOsv3NO0GwU4yEVBdgt9ph2JQNBsJie
 gAF66dMBTQ8pZ1ZifgQgveYCDZevgeedk0Zi9MDIMRUfr5AOTEgz+JzuV3NC5gNv4OjS77UrggpmN
 gu8nWRugQSqCV4tA6V88rgrutCw75dV6+7BQIJiz3lVnZRmKepIZqErUu0zBjt/i4SnHOT1AomzOU
 m5kWT8oQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vQZIP-00000001tG7-48Vi;
 Tue, 02 Dec 2025 22:56:34 +0000
Date: Tue, 2 Dec 2025 22:56:33 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <aS9uod21hG_qq7Rd@casper.infradead.org>
References: <20251202013212.964298-1-jaegeuk@kernel.org>
 <20251202013212.964298-4-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251202013212.964298-4-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Dec 02, 2025 at 01:30:13AM +0000, Jaegeuk Kim wrote:
 > @@ -627, 7 +628, 7 @@ void page_cache_sync_ra(struct readahead_control *ractl,
 > ra->size = min(contig_count + req_count, max_pages); > ra- [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vQZIc-0005Xe-F1
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
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Dec 02, 2025 at 01:30:13AM +0000, Jaegeuk Kim wrote:
> @@ -627,7 +628,7 @@ void page_cache_sync_ra(struct readahead_control *ractl,
>  	ra->size = min(contig_count + req_count, max_pages);
>  	ra->async_size = 1;
>  readit:
> -	ra->order = 0;
> +	ra->order = mapping_max_folio_order(ractl->mapping);
>  	ractl->_index = ra->start;
>  	page_cache_ra_order(ractl, ra);
>  }

I suspect this is in the wrong place, but I'm on holiday and not going
to go spelunking through the readahead code looking for the right place.

Also, going directly to max folio order is wrong, we should use the same
approach as the write order code, encapsulated in filemap_get_order().
See 4f6617011910


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC51695ABAD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Aug 2024 05:05:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgy8s-0005Fv-TC;
	Thu, 22 Aug 2024 03:05:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1sgy8r-0005Fo-Ss
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 03:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/39cXkFQGxlaFd0Pa67D2DLMvy/gj6d8MFLoE30g3zQ=; b=U6AobW6Dypetj1cmAihanDFznw
 ohqSkOVu4RRoRemFPljWWgvU4ihoX1Np1Sia5itSGUVxzcK0alWOnL2NBqNy+M+CV11nrYyop5h2m
 HP7sLalZn5z5FpEfj4A99lgxoR59Vgl59mTl56x9yzcgGY2m30F/7va7mewvwfnq9OfM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/39cXkFQGxlaFd0Pa67D2DLMvy/gj6d8MFLoE30g3zQ=; b=MoZBTmXZnykMPA1Zo1zN0oZ9KA
 4NekxKQacCcmRI8abALCMG06J3xPIsplumvC461v03okj+ppwRPAJclfFSHSkVMTzD+vAUShxd4yD
 YA2i+aEb+NXTrnHNtj68WbIP6t8XEBFLIplvcursqdvtOng6kKHg1rbnWy5FKvQ3VgZs=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgy8r-0001so-8r for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 03:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/39cXkFQGxlaFd0Pa67D2DLMvy/gj6d8MFLoE30g3zQ=; b=DkjUvQVwSOMWvwftwO2L7k0+H/
 K0eMeRkzxxIFu25jCjiOAKwGKBrMfrgMlB65XjSoZotPwvwqppZPsM2NMOHduHlaGlqfbxbAi0sPG
 3k0L/uFoCbD4W9uRVvDuK7KRigMwbebQJTlKSlbkZOnkufEhFasrnP0qSEIXNHKwJuFIj6mncPd7d
 c1WMTyYhmB4rhrXHRh60IxNGUJs+ufrTqFAX4M5R/CPnj9U80zSJ5Owpz1jit5EkcRXTAHAXQquqD
 +e9ISWApA7e8vRqnwxFrZjS5iO03ye/FRk7T1Erx5BDH7IzuEga86Hf/BadfuoDCLgMa/qFnEdWop
 dJ8zZ2KA==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sgy8j-0000000A0xp-1qAc;
 Thu, 22 Aug 2024 03:05:33 +0000
Date: Thu, 22 Aug 2024 04:05:33 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <Zsaq_QkyQIhGsvTj@casper.infradead.org>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
 <20240822013714.3278193-3-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822013714.3278193-3-lizetao1@huawei.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Aug 22, 2024 at 09:37:02AM +0800, Li Zetao wrote:
 > static struct extent_buffer *get_next_extent_buffer( > - const struct
 btrfs_fs_info
 *fs_info, struct page *page, u64 bytenr) > + const struc [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sgy8r-0001so-8r
Subject: Re: [f2fs-dev] [PATCH 02/14] btrfs: convert
 get_next_extent_buffer() to take a folio
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
Cc: josef@toxicpanda.com, linux-f2fs-devel@lists.sourceforge.net, clm@fb.com,
 terrelln@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Aug 22, 2024 at 09:37:02AM +0800, Li Zetao wrote:
>  static struct extent_buffer *get_next_extent_buffer(
> -		const struct btrfs_fs_info *fs_info, struct page *page, u64 bytenr)
> +		const struct btrfs_fs_info *fs_info, struct folio *folio, u64 bytenr)
>  {
>  	struct extent_buffer *gang[GANG_LOOKUP_SIZE];
>  	struct extent_buffer *found = NULL;
> -	u64 page_start = page_offset(page);
> -	u64 cur = page_start;
> +	u64 folio_start = folio_pos(folio);
> +	u64 cur = folio_start;
>  
> -	ASSERT(in_range(bytenr, page_start, PAGE_SIZE));
> +	ASSERT(in_range(bytenr, folio_start, PAGE_SIZE));
>  	lockdep_assert_held(&fs_info->buffer_lock);
>  
> -	while (cur < page_start + PAGE_SIZE) {
> +	while (cur < folio_start + PAGE_SIZE) {

Presumably we want to support large folios in btrfs at some point?
I certainly want to remove CONFIG_READ_ONLY_THP_FOR_FS soon and that'll
be a bit of a regression for btrfs if it doesn't have large folio
support.  So shouldn't we also s/PAGE_SIZE/folio_size(folio)/ ?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

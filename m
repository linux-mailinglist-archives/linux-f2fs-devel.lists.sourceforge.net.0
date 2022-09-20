Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 069855BD8E7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Sep 2022 02:51:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oaRTm-0008Lg-5v;
	Tue, 20 Sep 2022 00:51:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oaRTl-0008La-AE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Sep 2022 00:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ToPfnxF2NxQ2HGUaHBvaCuziGYRm0Sf9SFgkXvvGB3Q=; b=OVxmveaGwqLGFmVgDPJ5pFLdv7
 U9DJeKrdy0poJOyW369N1iWqquVKjcQYFBU2vqsp+8d0HrgjjbvOS5gXpT3puncPQqdHgsOWAHJNS
 rYahZzFLAm7tY/3vPX/sh81tO/oD9M+0XfT4wVCdZ8dNyiE+rhCLb1WYn+aqje1qt3h0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ToPfnxF2NxQ2HGUaHBvaCuziGYRm0Sf9SFgkXvvGB3Q=; b=SZL4mGnMQ77wO8p2nuZIoy+27X
 9IjLctTKrQISGK6+7YHpOIO6FWibEwGEhxgFNxMCUMDTKJaapJt5ilj9jRYIakF+T0BV9fvfqxxva
 9NKH288XcDIEJ16jYbJmynD6uQcyaI3krhOjaLJ/KQL+MpE3f4w5MklG6+hvzr+uuqek=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oaRTg-0002Ya-No for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Sep 2022 00:51:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5917561949;
 Tue, 20 Sep 2022 00:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D37C433D6;
 Tue, 20 Sep 2022 00:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663635054;
 bh=yOberSEUqwdenP4n+exju7j3AQ6fgojCHFFpQfJqfKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Je46AiyUGmzY04wq9Golwz6HFn+OrAQtxFRzSKNyTFGArWtb7ykqgHE7oIGhNFS2G
 4Unv8apLY8M+VxzCmLlw8sT0TVljgLcZ5NQG6JuzUGeOwh8cgazsinaxP7jiFKnNOP
 ACh2b6ffK2p1tVTVqn8zhyKkPIHIS78EyaQxVkQdV3eDZ0u3RZBH4yCKHoknUg7z1x
 sh679JxGCwq+blNutBoUwu8svYvi68eZbhhqVuL3fBlmDALkUCHQSu/2G/ipxUKLPD
 0vcW3bYsUrhKrwpOaRrGnDUGfnm23p+P3sgLbwIxMylQCs9e9TVRQdaDoOZ2wC23J3
 qWmwYh5sUdc8w==
Date: Mon, 19 Sep 2022 17:50:52 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Wu Bo <bo.wu@vivo.com>
Message-ID: <YykObKyz+XT1QCyh@google.com>
References: <20220914040423.539-1-bo.wu@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220914040423.539-1-bo.wu@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/14, Wu Bo wrote: > As Philippe De Muyter reported: >
 https://lore.kernel.org/linux-f2fs-devel/20220913224908.GA25100@172.21.0.10/T/#u
 > > The warning log showed that when finding a new space for [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oaRTg-0002Ya-No
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: fix to check space of current
 segment journal
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
Cc: Philippe De Muyter <phdm@macq.eu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/14, Wu Bo wrote:
> As Philippe De Muyter reported:
> https://lore.kernel.org/linux-f2fs-devel/20220913224908.GA25100@172.21.0.10/T/#u
> 
> The warning log showed that when finding a new space for nat the journal
> space turned out to be full. This because the journal_rwsem is not
> locked before the journal space checking. The journal space may become
> full just after we check it.
> 
> Reported-by: Philippe De Muyter <phdm@macq.eu>
> Signed-off-by: Wu Bo <bo.wu@vivo.com>
> ---
>  fs/f2fs/node.c    |  6 +++---
>  fs/f2fs/segment.c | 10 +++++-----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index e06a0c478b39..971d8b9ccdf1 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2995,13 +2995,13 @@ static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
>  	 * #1, flush nat entries to journal in current hot data summary block.
>  	 * #2, flush nat entries to nat page.
>  	 */
> +	down_write(&curseg->journal_rwsem);
>  	if ((cpc->reason & CP_UMOUNT) ||
>  		!__has_cursum_space(journal, set->entry_cnt, NAT_JOURNAL))

I think this is for NAT which was covered by nat_tree_lock. So, we don't need
this under journal_rwsem.

>  		to_journal = false;
>  
> -	if (to_journal) {
> -		down_write(&curseg->journal_rwsem);
> -	} else {
> +	if (!to_journal) {
> +		up_write(&curseg->journal_rwsem);
>  		page = get_next_nat_page(sbi, start_nid);
>  		if (IS_ERR(page))
>  			return PTR_ERR(page);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 0de21f82d7bc..d545032d2f6f 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3914,13 +3914,13 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
>  			if (le32_to_cpu(nid_in_journal(journal, i)) == val)
>  				return i;
>  		}
> -		if (alloc && __has_cursum_space(journal, 1, NAT_JOURNAL))
> +		if (alloc)
>  			return update_nats_in_cursum(journal, 1);
>  	} else if (type == SIT_JOURNAL) {
>  		for (i = 0; i < sits_in_cursum(journal); i++)
>  			if (le32_to_cpu(segno_in_journal(journal, i)) == val)
>  				return i;
> -		if (alloc && __has_cursum_space(journal, 1, SIT_JOURNAL))
> +		if (alloc)
>  			return update_sits_in_cursum(journal, 1);
>  	}
>  	return -1;
> @@ -4085,13 +4085,13 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  						(unsigned long)MAIN_SEGS(sbi));
>  		unsigned int segno = start_segno;
>  
> +		down_write(&curseg->journal_rwsem);
>  		if (to_journal &&
>  			!__has_cursum_space(journal, ses->entry_cnt, SIT_JOURNAL))
>  			to_journal = false;
>  
> -		if (to_journal) {
> -			down_write(&curseg->journal_rwsem);
> -		} else {
> +		if (!to_journal) {
> +			up_write(&curseg->journal_rwsem);
>  			page = get_next_sit_page(sbi, start_segno);
>  			raw_sit = page_address(page);
>  		}
> -- 
> 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

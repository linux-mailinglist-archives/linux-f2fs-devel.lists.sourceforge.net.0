Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E93959F166
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Aug 2022 04:27:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oQg6e-0000ok-ON;
	Wed, 24 Aug 2022 02:27:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oQg6d-0000oe-0n
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 02:26:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KViMWwTMz0hHM/CO95GteLH5w6vtiDwThI8XfAlRhsw=; b=R4AQe4Stm5+cHj9YpsAH2caTh1
 7yDH/VXmeZ2tykA9odOu+DDZleJKb4L3Q4qBfV9tbuyMUkLUO12sxT2QIqQ0T2WDuzjsQ8J6dwwA2
 h/Y+ITNh6u2XMaIwo+++A+eGL8RJ2DRnNEvHYQ96rbhOiHWQM4A42LsBDKeXgv5NWTFQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KViMWwTMz0hHM/CO95GteLH5w6vtiDwThI8XfAlRhsw=; b=M3nSmhTwN320xZHhq0T/zJdxh3
 WrdiYsCTukSEEfOVpCoBgrnYeBVGKA/xnqaN/OVQj2awVBzlbSwalMbM5/KN6SZbrI92Vj360ysGd
 ctfG6s/pKVQ7evrUAwinZnxy9ZBh7Y/4nuJfCB+0T1YWZFs06u/JmbdEd2KVEZHuDpgI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oQg6c-00078I-Ac for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 02:26:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB898617C3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Aug 2022 02:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43180C433D6;
 Wed, 24 Aug 2022 02:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661308012;
 bh=Nav42ddGiLpWaB9oN10SoZfmDlr6BuD4LK5Oxn/MhMk=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=TufyI7wCRgTbbSTpo0Xi9ntkhTHjjIHMm0BlDkJNCellUCpmOADVv4YNAxiWP1WTj
 lhFKaDHoQsU4hgOYluZw75GL15EHQi11t4Gk9gtpqcoHO2Jow8Oe01n6GSfEOVHGYz
 MaiKnvomYv9mcrklaBK+ccnSqrIvXCikC9y0oiyM3iAG4SDlz0VmX0TjfXgWQiqgnH
 sqKuDmmiuzR81xUhIaFPNK+XXYCtp5VXJLkDKKZksRWQHiRfkWm7eK7llBTPDE0/+Q
 f/qWfjI7zzoVLgEOF4pioTCxE5OIfmYKCvTqADcDbdu7JJJrySfqR4D44SI9ylxkJU
 B3OwxRpYC9R4g==
Date: Tue, 23 Aug 2022 19:26:50 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YwWMavPwLhAcUklv@google.com>
References: <20220823172124.2285995-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220823172124.2285995-1-jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/23,
 Jaegeuk Kim wrote: > This patch increases the threshold
 that limits the reserved root space from 0.2% > to 12.5% by using simple
 shift operation. > > Typically Android sets 128MB, but if the [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oQg6c-00078I-Ac
Subject: Re: [f2fs-dev] [PATCH] f2fs: increase the limit for reserve_root
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

On 08/23, Jaegeuk Kim wrote:
> This patch increases the threshold that limits the reserved root space from 0.2%
> to 12.5% by using simple shift operation.
> 
> Typically Android sets 128MB, but if the storage capacity is 32GB, 0.2% which is
> around 64MB becomes too small. Let's relax it.
> 

Added:

Reported-by: Aran Dalton <arda@allwinnertech.com>

Thanks,

> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/super.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 09972b709cdd..d1b4de5b4083 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -301,10 +301,10 @@ static void f2fs_destroy_casefold_cache(void) { }
>  
>  static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
>  {
> -	block_t limit = min((sbi->user_block_count << 1) / 1000,
> +	block_t limit = min((sbi->user_block_count >> 3),
>  			sbi->user_block_count - sbi->reserved_blocks);
>  
> -	/* limit is 0.2% */
> +	/* limit is 12.5% */
>  	if (test_opt(sbi, RESERVE_ROOT) &&
>  			F2FS_OPTION(sbi).root_reserved_blocks > limit) {
>  		F2FS_OPTION(sbi).root_reserved_blocks = limit;
> -- 
> 2.37.1.595.g718a3a8f04-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

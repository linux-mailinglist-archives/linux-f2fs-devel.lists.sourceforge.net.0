Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E062C9643
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Dec 2020 05:09:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kjwzA-0003io-CS; Tue, 01 Dec 2020 04:09:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kjwz8-0003i5-Sn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Dec 2020 04:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I5NGBCYlQHyFj322eEmEf7IPRCi8siqfkuaC0jt39Ig=; b=OrV3p35G0mW8EjVYXVLHjAcfb8
 wzh5RXaCV/TKWN0f6uw7DxqbO0WytbUh0iDYG+FjsTFeFT5wG2gLu0X8sUbXesU8ao55EeT7T6vl7
 lCAki4M9IhNrMIDWpgNamPqvuulX2y0RkTYN8OKkrWsSv/nHnC5yVwo4UTP+U2NcXZQ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I5NGBCYlQHyFj322eEmEf7IPRCi8siqfkuaC0jt39Ig=; b=fZAroMeSmGGtrlHF2Jzp/zfJ3+
 d0tqNUWyppDt75cWx1vnW1RkbOKyc2hIsTLW+Pj1FJRWYHbr0alN7zRKzjEN5Tchbg07Dy0CBUXDm
 rnidJ5vFUp2TzZPNHnkWo9BJOLUPIyLqiMOzZEzeLtmfYBP5xlecXXMA5Ryg393uuscc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kjwz0-008N4P-I4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Dec 2020 04:09:47 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D236920796;
 Tue,  1 Dec 2020 04:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606795777;
 bh=IDSdg+guasLBTGEvPlqfaxTayjeUYhY516Z8N9vIwFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yW0yy1dUB3OUyKbX0TGGC6bn4IixF3TN4vPNqoRlbzJ147/dyQs91/q/qwAza0c2Z
 cU5Wf2QutdXkdWMYyAftvxdWP+vEfBgCIWsbP/XkVeTze9QwEvI7eJtIheAOdMZbZv
 KIxj7MQigS30NaeDTbg8OG8fY5Ie7buw4kWimqFM=
Date: Mon, 30 Nov 2020 20:09:35 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, kernel-team@android.com
Message-ID: <20201201040935.GC3858797@google.com>
References: <20201126022416.3068426-1-jaegeuk@kernel.org>
 <20201126022416.3068426-3-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126022416.3068426-3-jaegeuk@kernel.org>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kjwz0-008N4P-I4
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: fix wrong block count instead of
 bytes
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
Cc: Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/25, Jaegeuk Kim wrote:
> We should convert cur_lblock, a block count, to bytes for len.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/data.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index a84e5bc09337..e49c14ccfafe 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3893,7 +3893,7 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
>  	sector_t highest_pblock = 0;
>  	int nr_extents = 0;
>  	unsigned long nr_pblocks;
> -	unsigned long len;
> +	u64 len;
>  	int ret;
>  
>  	/*
> @@ -3911,7 +3911,7 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
>  		cond_resched();
>  
>  		memset(&map_bh, 0, sizeof(struct buffer_head));
> -		map_bh.b_size = len - cur_lblock;
> +		map_bh.b_size = len - blks_to_bytes(inode, cur_lblock);
>  
>  		ret = get_data_block(inode, cur_lblock, &map_bh, 0,
>  					F2FS_GET_BLOCK_FIEMAP, &next_pgofs);
> -- 
> 2.29.2.454.gaff20da3a2-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED7678D661
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Aug 2023 16:05:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qbLoz-0004N8-Ju;
	Wed, 30 Aug 2023 14:05:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qbLoy-0004N2-0L
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Aug 2023 14:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qLtUAFqHq7BUFGYFQWuJu2rrOmYJjuqjvk8z1yFuitM=; b=mxx6OzYoatTw7LT7sdzXAp+1Av
 Nngiu+v2Tv4n4CzpZ02kpX/Wq2YmQoRgDmwLqVIWiYis79EtXn1SCaw3cHznRgYlX3iWrglkIRHA8
 H2tfaTyLR/3uCrgK3w2F2iz3MPU3w2zWpzIqgpOD3yhfOKsjjz66Zmy9P/2lh+IQmShA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qLtUAFqHq7BUFGYFQWuJu2rrOmYJjuqjvk8z1yFuitM=; b=Mix+frR5Xte0+R0QFVRPn1vGu5
 r2xxnXSXnrKbf2lsGFOb4SaVG3378lcowHIWt6FhLLLQWx/1e/b+9GkmW0ss4xPx8Q2Tuo5B489cD
 O5E8YTujCuAlOwTcD24QsDntfjfS5HOzJaOcifK73KjVZUiBwyemJVmD60KQgDVEDgE4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qbLov-0004tA-0W for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Aug 2023 14:05:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 75F6660BA0;
 Wed, 30 Aug 2023 14:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB29C433C7;
 Wed, 30 Aug 2023 14:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693404314;
 bh=JI+eB0h4KCK57zv/Cn29stcoz2S2ibRVvWbrnO+A4B0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VjEoqGtAOR+M77pGguxBYDWP7o5NrltSEDoUgCg08t+8xmZ6mVJPwWCd7ag/hy1WD
 OXvEsFze1nFH8mQjR8crz8PYIMuq3k5GkPL0ZzIvlJC1W2dlvMvBOQ/VM33ijrtFET
 kQ0XPOX3nFp5yH+zXKe2kKKncmQddG1VvbYh2F4Eb1PaA/018Am+8yMPW06h2sHjwh
 NDOPVdJ5unIjpsROoHLwK8gF/EtU0HjKIdW0NqmG3wTj1i3ZSVk4BGpWgY6BGhxxvC
 LhNdM2jxjUUyxMhvtWFB5Od+GIfFzmCy9yh3HpefKEubx10E9wGJgDHcd2nKgt2vwS
 g0xHTaL7Ha9Ig==
Message-ID: <eb97c111-4ea8-787c-b3e3-ce02909e1f3d@kernel.org>
Date: Wed, 30 Aug 2023 22:05:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Chunhai Guo <guochunhai@vivo.com>, jaegeuk@kernel.org
References: <20230830035248.4051323-1-guochunhai@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230830035248.4051323-1-guochunhai@vivo.com>
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/8/30 11:52,
 Chunhai Guo wrote: > The commit 344150999b7f
 ("f2fs: fix to avoid potential deadlock") only > requires unplugging
 current->plug.
 Using blk_finish_plug() is unnecessary > as it sets [...] 
 Content analysis details:   (-6.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -1.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qbLov-0004tA-0W
Subject: Re: [f2fs-dev] [PATCH] f2fs: replace blk_finish_plug() with
 blk_flush_plug()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/8/30 11:52, Chunhai Guo wrote:
> The commit 344150999b7f ("f2fs: fix to avoid potential deadlock") only
> requires unplugging current->plug. Using blk_finish_plug() is unnecessary
> as it sets current->plug as NULL and prevents wb_writeback() from using
> plug in subsequent loops. Instead, use blk_flush_plug() as a replacement.
> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> ---
>   fs/f2fs/data.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 5d9697717353..936a95464186 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3343,8 +3343,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,

It missed to cover f2fs_write_node_pages()?

Thanks,

>   		atomic_inc(&sbi->wb_sync_req[DATA]);
>   	else if (atomic_read(&sbi->wb_sync_req[DATA])) {
>   		/* to avoid potential deadlock */
> -		if (current->plug)
> -			blk_finish_plug(current->plug);
> +		blk_flush_plug(current->plug, false);
>   		goto skip_write;
>   	}
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

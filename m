Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E66E4B0A2A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Feb 2022 11:02:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nI6Hh-0004LK-UP; Thu, 10 Feb 2022 10:02:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jack@suse.cz>) id 1nI6Hf-0004LA-OD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Feb 2022 10:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lcBtRTov0U4scR5M2Iy2myhqZeOwAIyV54RcClAbhV4=; b=It0eVeQ3hfDphtF1JOtweV9Auu
 VChCzaRfGCLpnfGcUf+azmRmpdgC7/c06L3jFK7RQMgFFoCHlJBfQtJjVBeh2EyocP/hv6Xr1iaWg
 3kWzdcoTaBIxmVvLxy4mr14t5FOX7GOyLMM4GM8AlKco/lWuvRJXmg03s1LwANd3Yx8o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lcBtRTov0U4scR5M2Iy2myhqZeOwAIyV54RcClAbhV4=; b=CZ6e3i9L9ywyx+fxF9L9lrnSzM
 jqwJb289Z1a2PvE2k1Ui85XcLd4pxhVjJF0VycZ5WBa+U/5VAtBunZfUZshGvrw2gqCMBqO088odQ
 DBVG81QvhJ7X2mGvPlcoaNbbY8OziOWRGFWR3GCXJdPt189SMkjUf3nudgmYImYiyY4c=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nI6HW-0005vs-V6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Feb 2022 10:02:38 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 775E721115;
 Thu, 10 Feb 2022 10:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644487344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lcBtRTov0U4scR5M2Iy2myhqZeOwAIyV54RcClAbhV4=;
 b=UVJHxaJMKmE/DO/JZe3iVbVw3GQe2kQmip1zYFYiRYyI1pZTASyk8ODPUH85ZCuqzCIWsi
 rV6USU5SNQRHNVVtN7czjs/tg9jgYBrlYPUuVDHO/aShUUH/4xIgSIpkWiWmMUD14J4lqn
 gHBmV7fgdq0Mk5zS8kvpWhMAHojnEdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644487344;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lcBtRTov0U4scR5M2Iy2myhqZeOwAIyV54RcClAbhV4=;
 b=3uOBgMN4Wr+d5mCyhO6cp6IQhYZtOH8ULuhOgZdIotrLORbzqWHkWV4veZpJWP42oTgmJG
 NOB6bjhLKtWqFVCQ==
Received: from quack3.suse.cz (unknown [10.163.28.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 0BE01A3B97;
 Thu, 10 Feb 2022 10:02:23 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id BEB02A05BC; Thu, 10 Feb 2022 11:02:22 +0100 (CET)
Date: Thu, 10 Feb 2022 11:02:22 +0100
From: Jan Kara <jack@suse.cz>
To: NeilBrown <neilb@suse.de>
Message-ID: <20220210100222.f2nmwwb5pcfmejvw@quack3.lan>
References: <164447124918.23354.17858831070003318849.stgit@noble.brown>
 <164447147264.23354.2763356897218946255.stgit@noble.brown>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <164447147264.23354.2763356897218946255.stgit@noble.brown>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 10-02-22 16:37:52, NeilBrown wrote: > bfq_get_queue()
 expects a "bool" for the third arg,
 so pass "false" > rather than "BLK_RW_ASYNC"
 which will soon be removed. > > Acked-by: Jens Axboe <axbo [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nI6HW-0005vs-V6
Subject: Re: [f2fs-dev] [PATCH 10/11] block/bfq-iosched.c: use "false"
 rather than "BLK_RW_ASYNC"
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
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, drbd-dev@lists.linbit.com,
 Paolo Valente <paolo.valente@linaro.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 linux-block@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 linux-nfs@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Jeff Layton <jlayton@kernel.org>, Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Wu Fengguang <fengguang.wu@intel.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu 10-02-22 16:37:52, NeilBrown wrote:
> bfq_get_queue() expects a "bool" for the third arg, so pass "false"
> rather than "BLK_RW_ASYNC" which will soon be removed.
> 
> Acked-by: Jens Axboe <axboe@kernel.dk>
> Signed-off-by: NeilBrown <neilb@suse.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  block/bfq-iosched.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/bfq-iosched.c b/block/bfq-iosched.c
> index 0c612a911696..4e645ae1e066 100644
> --- a/block/bfq-iosched.c
> +++ b/block/bfq-iosched.c
> @@ -5448,7 +5448,7 @@ static void bfq_check_ioprio_change(struct bfq_io_cq *bic, struct bio *bio)
>  	bfqq = bic_to_bfqq(bic, false);
>  	if (bfqq) {
>  		bfq_release_process_ref(bfqd, bfqq);
> -		bfqq = bfq_get_queue(bfqd, bio, BLK_RW_ASYNC, bic, true);
> +		bfqq = bfq_get_queue(bfqd, bio, false, bic, true);
>  		bic_set_bfqq(bic, bfqq, false);
>  	}
>  
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D3E57D8AF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jul 2022 04:40:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oEiaq-0000HW-51; Fri, 22 Jul 2022 02:40:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1oEiao-0000HJ-Ue
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 02:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r+rXKtPo4MF3SpxvNtgjKofkmE4EB33VA1sK+j3CBPA=; b=TKEapHcuS9NqCz0Al8D2PB6URm
 e9DhEWcRjvWGD6y9Fk5ZmLe4BpkWdxjDxwZvNkxSzgnkkdsVrEH8dQkO1wCKGLCDnKOz/gVc8805r
 8zsr0I3P49/6zEWGTFN3W/B+J644R95Fe9cHlXPxeenFIFq6HRDxgGpYOW+n2Oo4Wtv0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r+rXKtPo4MF3SpxvNtgjKofkmE4EB33VA1sK+j3CBPA=; b=ciiNfKePkTx4ylqjGTJ+L5IeZ2
 H87RJ1ikpCEL/vVHuK5q3RZflIu1os8QvwZGEOdlnCAIq0yaUZ9i+PYlhwp7lPGc468JIpa7rkLk/
 wLzqs06EFNco76DXk6DqE5KVgQ5ICVsohwxtZOTUl6XP893SlvYpzS2qNvFjE+lpfBFU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oEial-006SXQ-8C
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 02:40:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A31961CBF;
 Fri, 22 Jul 2022 02:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2A4C3411E;
 Fri, 22 Jul 2022 02:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658457628;
 bh=Wn1u6B/xfUl/2b0bhdy5Fr/2eJgUIwE/bEPRZRruJoc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LZFfLUsy9qZqbHKi6XrAE/EpBL1lnqcs51szMvueTGmi7tclnWxjJvs+n6hWye6uu
 jjtGXxNz6n5tyC/JUDb6RF1AtlDDS6YL+7jleQpRCX8T9/hm8Kk28n1uvK405+ePQx
 aIjBeuBVV6SDM6Lq9vthMPguwOcbnseZGdEXDrMqrLruKigtXz8VlChJVxV2ZLLLLw
 TdfSsf7dGk1rM953YmrWAIF7BQ8jJL9SnmNu8Mc7cc7LTm4TIGGPz8FnFGsY0E9kO5
 eTY4z4NjnchHAxoDfEZfKTUhomu6ZjrO7ATplCYMMI7p21/umhy4qv3Ud6Go0JVkm+
 LfacgfYjZn7KA==
Date: Thu, 21 Jul 2022 19:40:26 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: qixiaoyu1 <qxy65535@gmail.com>
Message-ID: <YtoOGu/wyqKBJd1v@google.com>
References: <20220718032840.9653-1-qixiaoyu1@xiaomi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220718032840.9653-1-qixiaoyu1@xiaomi.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/18,
 qixiaoyu1 wrote: > f2fs_gc returns -EINVAL via f2fs_balance_fs
 when there is enough free > secs after write checkpoint, but with gc_merge
 enabled, it will cause > the sleep time of gc thread [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oEial-006SXQ-8C
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't bother wait_ms by foreground gc
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
Cc: qixiaoyu1 <qixiaoyu1@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/18, qixiaoyu1 wrote:
> f2fs_gc returns -EINVAL via f2fs_balance_fs when there is enough free
> secs after write checkpoint, but with gc_merge enabled, it will cause
> the sleep time of gc thread to be set to no_gc_sleep_time even if there
> are many dirty segments can be selected.
> 
> Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
> ---
>  fs/f2fs/gc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index d5fb426e0747..cb8ca992d986 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -150,8 +150,12 @@ static int gc_thread_func(void *data)
>  		gc_control.nr_free_secs = foreground ? 1 : 0;
>  
>  		/* if return value is not zero, no victim was selected */
> -		if (f2fs_gc(sbi, &gc_control))
> -			wait_ms = gc_th->no_gc_sleep_time;
> +		if (f2fs_gc(sbi, &gc_control)) {
> +			/* don't bother wait_ms by foreground gc */
> +			if (!foreground) {
> +				wait_ms = gc_th->no_gc_sleep_time;
> +			}

I applied without {} to match the coding style.

Thanks,

> +		}
>  
>  		if (foreground)
>  			wake_up_all(&gc_th->fggc_wq);
> -- 
> 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

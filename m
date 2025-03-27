Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC50AA72A0E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Mar 2025 07:02:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txgJj-0001Ab-Or;
	Thu, 27 Mar 2025 06:02:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1txgJi-0001AV-Bj
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 06:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B0ptYrp9IhDUxV74NX577IjwwJL8bm2aQ+7FPfnIBak=; b=cGsB4M+6DzCvcbDcdy4h09Uogc
 D5l5SNTRNofaHRgiccg4w6w0oCUjVTMphp3kRnLi//xCDFAKtXiiKCGmI36/nS9sU/SPwbLtHj1Ia
 6T6PhrCK+5cr8ZIo++xvafV1qXZGFbc72Ira7adauHo/zDflUiQ4lhQQQUqth4TiCwdU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B0ptYrp9IhDUxV74NX577IjwwJL8bm2aQ+7FPfnIBak=; b=CMbYTf0pRkDwAJKprJeY9DAcfE
 KzgJ4hrAScA2zWXEl1Iws1Ga9vr2DK+uElVLiGTOEnhcIg0JZ9QqTdTgUrdG+r3WiW2UScLbWXRuR
 G5Fl0oT2gELDMJoe26qr2GmHakmSdMvgL5gVLuZtCfXlXAYXS9+baYiGqNn3FnZkC2vI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txgJh-00066r-1T for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 06:02:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6989860008;
 Thu, 27 Mar 2025 06:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA18C4CEDD;
 Thu, 27 Mar 2025 06:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743055326;
 bh=cOARddFxtT4x6J653OMfN+s3lEmPCGmX0P+GzDTJSZg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=QUBt3OTTRe3hCvzR5e2P+5+9zIq+D4SJaNWRR2gcrUokGy0d0AgEchHFfzB7cY9x2
 q1H1km3xKPRs2La7nOcyQbBSlJnmBtFs+KT0xwADcUtD+5W3HEOn12YXayAC/rZaFS
 7RvcOVp22fOyEwUPfUiv0/OOS90kqFum7E67KBBbyK0VqkKrsgoZbaXwuEd7UtnlHD
 Q6K4DvbfpHzFvlqyXhgJvaxWlMgPwtNGGTNAgU7W3gNWc7QbnpEt6LQIJniqPOJtdq
 /cEmjWjQIDPqdZ7z70rk/iH5G7T6wjP4ikWm95rxePhFuwCdGHTPL1JB1Bs68yPU0w
 mlT9C8ptvLUMw==
Message-ID: <bf3f571c-a6bf-4a17-8745-039b37ac4f48@kernel.org>
Date: Thu, 27 Mar 2025 14:02:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yohan Joung <jyh429@gmail.com>, jaegeuk@kernel.org, daeho43@gmail.com
References: <20250326141428.280-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250326141428.280-1-yohan.joung@sk.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/26/25 22:14,
 Yohan Joung wrote: > When selecting a victim
 using next_victim_seg in a large section, the > selected section might already
 have been cleared and designated as the > new current sect [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1txgJh-00066r-1T
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent the current section from being
 selected as a victim during garbage collection
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/26/25 22:14, Yohan Joung wrote:
> When selecting a victim using next_victim_seg in a large section, the
> selected section might already have been cleared and designated as the
> new current section, making it actively in use.
> This behavior causes inconsistency between the SIT and SSA.

Hi, does this fix your issue?

https://lore.kernel.org/linux-f2fs-devel/20250325080646.3291947-2-chao@kernel.org

Thanks,

> 
> Signed-off-by: Yohan Joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/gc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 2b8f9239bede..4b5d18e395eb 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1926,6 +1926,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>  		goto stop;
>  	}
>  
> +	if (__is_large_section(sbi) &&
> +			IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno)))
> +		goto stop;
> +
>  	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type,
>  				gc_control->should_migrate_blocks,
>  				gc_control->one_time);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

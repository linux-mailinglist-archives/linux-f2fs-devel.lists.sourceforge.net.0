Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A14938742
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jul 2024 03:33:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sVhvW-00004w-UJ;
	Mon, 22 Jul 2024 01:33:22 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sVhvV-0008WV-7Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jul 2024 01:33:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i6DVL6IzukrbXPN2gSZHICIAIbD1bC5ZAvmxw89OI8o=; b=fRVQjyKCENrXMx8Kfc5Owg/zOq
 LRAZ/xkosKzbRFHigy24aBWrXlscH54Xab+kzEb+mcWgoQ2bsdnxMnbKCJcBf1n0q8js2W0gYm7HP
 LLAAm3LHDCNQIuxd1g5d6MYs4pOrP8yfsQJxbJr8Tban+2Fzdo/Q41u8YHWeVY3vxWv4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i6DVL6IzukrbXPN2gSZHICIAIbD1bC5ZAvmxw89OI8o=; b=geqaAeV1zhu5qKWzL3essxChKM
 k85DAsYU7YMOd4odbwItYHRkrrBFy2ukU6SXZ7v3PI628HoTa7BUATAILy20yDi6M8tZpqb1KbM9v
 pPzTdMTKR/QU41o1vPn7IQJakFgtUxV/U6MRBM3zdudNs922wR7BP91FbZ+grXGnPqeg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sVhvT-0006HA-UL for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jul 2024 01:33:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 944036018B;
 Mon, 22 Jul 2024 01:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87130C116B1;
 Mon, 22 Jul 2024 01:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721611989;
 bh=geRHbZXYxJmcU+dSjYb97LW5TXGffziEs/IWYtN7scA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=k1VCN62E7J9nxFkZSCL98xIE3XAR9v+oaCuFgy0ozSHD8pE+NkdVRBV1aZ07AUnDj
 pZ0y3IZSkvXHNpZjF2pAx0slCRYRhtWQhIF4+kKF/nmonk1jNYAD7XRNSIBWFuzqv4
 exqov3uw6N5QEf2aFFhw2420YBGMHURI0su+A0H+9xQayjvh1ajYLEvhQPxcfUBRtr
 VScJJYOVd6XBkM7aw87q+LoE7tUnnMKG4xOdpbBj8VQlTngzcNTIffs1Fm68wrGjx8
 4QkGxQoAYCkwI0+4vkSDr3SEe+6Pe5VqkS8peHxF/aR3lE90HIqdMHejPlG86Q5+CQ
 VWIHH3avLcEhw==
Message-ID: <0df662f4-e003-40fb-883d-fab8c21be092@kernel.org>
Date: Mon, 22 Jul 2024 09:33:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julian Sun <sunjunchao2870@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240721131739.260027-1-sunjunchao2870@gmail.com>
 <20240721131739.260027-2-sunjunchao2870@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240721131739.260027-2-sunjunchao2870@gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/21 21:17,
 Julian Sun wrote: > The macro stat_inc_cp_count
 accepts a parameter si, > but it was not used, rather the variable sbi was
 directly used, > which may be a local variable inside a f [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sVhvT-0006HA-UL
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: fix macro definition
 stat_inc_cp_count
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
Cc: jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/21 21:17, Julian Sun wrote:
> The macro stat_inc_cp_count accepts a parameter si,
> but it was not used, rather the variable sbi was directly used,
> which may be a local variable inside a function that calls the macros.
> 
> Signed-off-by: Julian Sun <sunjunchao2870@gmail.com>
> ---
>   fs/f2fs/f2fs.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 8a9d910aa552..c9925d1ca2df 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3987,7 +3987,7 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
>   
>   #define stat_inc_cp_call_count(sbi, foreground)				\
>   		atomic_inc(&sbi->cp_call_count[(foreground)])
> -#define stat_inc_cp_count(si)		(F2FS_STAT(sbi)->cp_count++)
> +#define stat_inc_cp_count(_sbi)		(F2FS_STAT(_sbi)->cp_count++)

Let's use sbi instead of _sbi.

Thanks,

>   #define stat_io_skip_bggc_count(sbi)	((sbi)->io_skip_bggc++)
>   #define stat_other_skip_bggc_count(sbi)	((sbi)->other_skip_bggc++)
>   #define stat_inc_dirty_inode(sbi, type)	((sbi)->ndirty_inode[type]++)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

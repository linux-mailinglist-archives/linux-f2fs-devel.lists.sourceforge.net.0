Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5D38A0BF2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Apr 2024 11:09:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruqQd-0004H6-Ap;
	Thu, 11 Apr 2024 09:09:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ruqQb-0004H0-VI
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Apr 2024 09:09:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KxG3EKF4cEGeX1eST9FopihR1Nmy2PG2Jhy5I2BcKYQ=; b=FKrpEZdY+wF0gyxjxeH0iklRIv
 4kHBbOI635T45OibinDecKEp/0E1rAM5r2R3CtwS80glLjWD0PzNjeyEbp2WrBsqZ8ji6cxkw6VmV
 /BTpzBSxIkYoNKERYXjtiEAdicz0SMRhLhwsOZ36kL4nn0FLs+brzkdCLn0C0OMxYghE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KxG3EKF4cEGeX1eST9FopihR1Nmy2PG2Jhy5I2BcKYQ=; b=MNOrV7zFYkQRzV+InYL3RqwqLk
 FZb4ntfsxeeqlYGsAk6s1zkGBBBMT9brtfc60WIWkwpXcLo4N4ASOVis4IaNuuhQIVTe0I7Bwsqvl
 GSq4UWHg6bj/dbbiu6Cv1ho2dL8sUHTrScBmCQ1aG4MhEiS8jzgnomQDTg1xaltuKeR0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruqQb-0000O3-9F for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Apr 2024 09:09:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C2089CE2F9D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Apr 2024 09:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D39EC433C7;
 Thu, 11 Apr 2024 09:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712826533;
 bh=Gquqvt7BvCwmrUDfJeZHRdOZSEe4nCpSW+y74D7X5l4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=PGxYfEmGT3OK5xL+K/YyXcML/1FxTeRlfwW75CrszzB7DodFlhnw9jzcb1WhYzzC0
 yXgigb+cnU9UUP68/x0Cqv9C0/E57xUGBv0fzKgTIQccjkrUOoAuXickdEierJQkG6
 VxiLB0bp6wVNwOYkLcR4TEStKzOXtLTDS4c0SzSEcBEH/ZnS9BcLzLNneI913N+Suc
 eSUir1ojQf7qEYjimqjEDSFRI12LyFd9AQJTYGUs8FxJgXMzrpQE4OOQk4SOD1X1XY
 /0fjRHzaYY+Mjzgb6j9c9i29IewVLuhySLkEdxmAJtkYNvlHyqI7cWBk8WZBNGTtj0
 iIA20elY4C6Cw==
Message-ID: <050a93dc-d9a8-44bd-9a83-83718e95f04d@kernel.org>
Date: Thu, 11 Apr 2024 17:08:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240409203411.1885121-1-jaegeuk@kernel.org>
 <20240409203411.1885121-3-jaegeuk@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240409203411.1885121-3-jaegeuk@kernel.org>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/10 4:34, Jaegeuk Kim wrote: > f2fs_ra_meta_pages
 can try to read ahead on invalid block address which is > not the corruption
 case. In which case we will read ahead invalid meta pages? recovery w/
 META_POR?
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -2.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ruqQb-0000O3-9F
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: fix false alarm on invalid block
 address
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/4/10 4:34, Jaegeuk Kim wrote:
> f2fs_ra_meta_pages can try to read ahead on invalid block address which is
> not the corruption case.

In which case we will read ahead invalid meta pages? recovery w/ META_POR?

Thanks,

> 
> Fixes: 31f85ccc84b8 ("f2fs: unify the error handling of f2fs_is_valid_blkaddr")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/checkpoint.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index eac698b8dd38..b01320502624 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -179,22 +179,22 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>   		break;
>   	case META_SIT:
>   		if (unlikely(blkaddr >= SIT_BLK_CNT(sbi)))
> -			goto err;
> +			goto check_only;
>   		break;
>   	case META_SSA:
>   		if (unlikely(blkaddr >= MAIN_BLKADDR(sbi) ||
>   			blkaddr < SM_I(sbi)->ssa_blkaddr))
> -			goto err;
> +			goto check_only;
>   		break;
>   	case META_CP:
>   		if (unlikely(blkaddr >= SIT_I(sbi)->sit_base_addr ||
>   			blkaddr < __start_cp_addr(sbi)))
> -			goto err;
> +			goto check_only;
>   		break;
>   	case META_POR:
>   		if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
>   			blkaddr < MAIN_BLKADDR(sbi)))
> -			goto err;
> +			goto check_only;
>   		break;
>   	case DATA_GENERIC:
>   	case DATA_GENERIC_ENHANCE:
> @@ -228,6 +228,7 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>   	return true;
>   err:
>   	f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
> +check_only:
>   	return false;
>   }
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

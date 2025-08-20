Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 362FFB2D225
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 04:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjuplkqU7r3Us2ifjL1VU1QCzy/+KcGa0SnBNnAfGhM=; b=kUiBxeUQNspLh46lFpC6r4EJLT
	ZcjhxIInMjHEo7yy2QWnX1TPXBkwziVdsQmm9GZf0e/ZjuWFrS38+09D90BdIbZ5faW6z2hxA2uiH
	J7uttoD9CdHTD86+D82o/5ApPmmn/V1VO3dbIM3fKCwmAsRZzEoqP/n2+Q/BTmN5Uw8U=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoZ2O-000648-1O;
	Wed, 20 Aug 2025 02:58:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uoZ2M-00063u-UK
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 02:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ui8EwnvhxBhLX+viI+0x0menalDMTme/fjqyPNxWEfA=; b=KwLei89MFEwb5D0RoD4K3Wcmq0
 Uoo/M+fzU5aoWGMkV2SgjbklYIp9uvAfpcVpqJ0GVrX6PZuQRi1lsX3MGBSp+l6rDjPEwpR7plf7j
 GeGJbmo2Ol1hj8TjidPtR4jkWlRtjoDUq+01hsKHXDPoC6XHZjquMokEHO2KaKmPWPlg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ui8EwnvhxBhLX+viI+0x0menalDMTme/fjqyPNxWEfA=; b=NV3Glj4JOEa9sDgu9gHRGEiFqu
 U+jmg5L9fdyGDz70SM9oWS6293JqRtIyrYA2LS5shfcDKL4aExnFV89WhvTvKfJMaiaxLdOIIcgPS
 KJ691fZARwxF3q/MG84nelk91TISSgFnX7R6DspSmDoUHUQ2I7EMkslhZVbw0IE4+8Vk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uoZ2N-0002Rs-CK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 02:58:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CC7BE5C1127;
 Wed, 20 Aug 2025 02:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A55C4CEF1;
 Wed, 20 Aug 2025 02:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755658729;
 bh=2Zi9h4GXmdMyUs8RyLnCYmlY8a0oIBkL4KA959j2gjo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=FL7h+52JMJbqB1HctPVzM90ZX4dyBeRKSrm5HyNlhiMlx7IkLEMx5tU8fYNFdzweI
 lOxPeS7ncH2vLnr3Qj11YVDetYkoChvw9H4ih+Cqwv3frQoBof2zZdI7xmspsT1GI+
 aBLbgtIE6Fuhyh9tahOy/BgoiraQh4YxKENV1AL81rT7VH+pyHwKLu2vIUz0lTOhT0
 W6JTmP3L9apxoIoE2qXdaDfOFsE4zyZoAiXYi+LT6gpCYlNVTEPx+8RLzx5HTtd2Mn
 FYxAMFilbrtmB/MUWbkUBKB9FbopHdNEO5OUp2Yr6dvtk/cdiG1Twf1IEgdXEUctQa
 iKj4Sbv/FHskA==
Message-ID: <cd82a673-aa43-46bc-be67-6924500376ef@kernel.org>
Date: Wed, 20 Aug 2025 10:58:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "mason.zhang" <masonzhang.linuxer@gmail.com>
References: <20250806123236.4389-1-masonzhang.linuxer@gmail.com>
Content-Language: en-US
In-Reply-To: <20250806123236.4389-1-masonzhang.linuxer@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/6/25 20:32, mason.zhang wrote: > This fix combines the
 space check for data_blocks and dent_blocks when > verifying HOT_DATA segment
 capacity, preventing potential insufficient > space issues dur [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uoZ2N-0002Rs-CK
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix CURSEG_HOT_DATA left space check
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

On 8/6/25 20:32, mason.zhang wrote:
> This fix combines the space check for data_blocks and dent_blocks when
> verifying HOT_DATA segment capacity, preventing potential insufficient
> space issues during checkpoint.
> 
> Fixes: bf34c93d2645 ("f2fs: check curseg space before foreground GC")
> Signed-off-by: mason.zhang <masonzhang.linuxer@gmail.com>

It breaks f2fs/005 of xfstests, can you please take a look?

Thanks,

> ---
>  fs/f2fs/segment.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index db619fd2f51a..d8dae0049b6a 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -649,7 +649,7 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>  				get_ckpt_valid_blocks(sbi, segno, true);
>  	}
>  
> -	if (dent_blocks > left_blocks)
> +	if (dent_blocks + data_blocks > left_blocks)
>  		return false;
>  	return true;
>  }



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

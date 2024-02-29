Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF886D040
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Feb 2024 18:12:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfjx7-0006ZY-Ud;
	Thu, 29 Feb 2024 17:12:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rfjx7-0006ZR-EK
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 17:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yln2VMX1qHPOqCEEsHmxRVm91IZaIa2EL8fFAzz3dGo=; b=OB/GkJ43MXIvIVaSFW59qdjVR8
 U4uak7+l5FUwGHQSk1De7dBv8cGf0C75A67Pu5SrwXBez7Z2MUdjkq2mzUL/6i78Pt+tZUWLTE68T
 gRIj6nBv1VGOBfeXiWIKYP13EpEwsb+CG03IOhn8NqzhTtVp52IqocbGnNuCeHXJnNIM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yln2VMX1qHPOqCEEsHmxRVm91IZaIa2EL8fFAzz3dGo=; b=AX5/3nrYwTDnKXS6mlfSWZL7rc
 PCuHs7RExOUUpf/t3tnGpdgv4/z+ARwia9TQ4EFkFlHisjyfNS68JZc/C2gyyVa+TPASWpM6WYsDD
 ZkKSwqRSv1P0PEsFblzj/LY0jno6O1Zn72A7wicmow0YEzefwD7Ew+7QCIHCvaaWXD14=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rfjx2-0000dK-VK for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 17:12:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 91F74612B8;
 Thu, 29 Feb 2024 17:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173AFC433C7;
 Thu, 29 Feb 2024 17:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709226723;
 bh=VG+D+qi/TZVphX/2CxdUZBtA1M2Vw5Tcn2yPs23Fek8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rC+eskhkTRByz+sXdvXhNDcxf+Mqe8D5QmUEgaoQBf31TzfNH2Ev5uklY2tzJ99OS
 DSXSyFOQjZYURl2OZR3bK6W7eg4TpbTuZDYCR7nGNiWo7Ng6lWcjHn6/IBXmLDolkj
 KvdzYbhnFg62+kfriOhaQCZV7IWHbXkf55Phq/HzNPcCS4e10yW1GU/Siw9cjsEkAw
 VQbCG0m0b5xEkiUghvdle6d2qUimGgiPxMrsFKkZuwyIW7pOcbS4QUkS92ODgzQdPk
 3Wz9bBdAzlTuehcgQTnkRaAwimCnnX9uNkYHxiuUvrE5dLG0OoraFHirIfvvcQwUB+
 xPO8MV+i4A+8A==
Date: Thu, 29 Feb 2024 09:12:01 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Message-ID: <ZeC64dDr-nBGlsli@google.com>
References: <20240229091449.105032-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240229091449.105032-1-colin.i.king@gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Colin, Thank you for the fix. If you don't mind, can I
 integrate this fix into the original patch? Thanks, 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rfjx2-0000dK-VK
Subject: Re: [f2fs-dev] [PATCH][next] f2fs: Fix two spelling mistakes in
 f2fs_zone_status array
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Colin,

Thank you for the fix. If you don't mind, can I integrate this fix
into the original patch?

Thanks,

On 02/29, Colin Ian King wrote:
> The array f2fs_zone_status contains two spelling mistakes in
> literal strings. Fix them.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  fs/f2fs/segment.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index bdb27e4a604b..072c4355d3d3 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4921,8 +4921,8 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
>  const char *f2fs_zone_status[BLK_ZONE_COND_OFFLINE + 1] = {
>  	[BLK_ZONE_COND_NOT_WP]		= "NOT_WP",
>  	[BLK_ZONE_COND_EMPTY]		= "EMPTY",
> -	[BLK_ZONE_COND_IMP_OPEN]	= "IMPLICITE_OPEN",
> -	[BLK_ZONE_COND_EXP_OPEN]	= "EXPLICITE_OPEN",
> +	[BLK_ZONE_COND_IMP_OPEN]	= "IMPLICIT_OPEN",
> +	[BLK_ZONE_COND_EXP_OPEN]	= "EXPLICIT_OPEN",
>  	[BLK_ZONE_COND_CLOSED]		= "CLOSED",
>  	[BLK_ZONE_COND_READONLY]	= "READONLY",
>  	[BLK_ZONE_COND_FULL]		= "FULL",
> -- 
> 2.39.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

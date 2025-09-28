Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95555BA775A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Sep 2025 21:59:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTBpTbiPYx8x9iTdKBMqqY290J7Ji6nmNpJIHBDlIDA=; b=YdMvj0BZV5omRaGxRyWMg3h30p
	zMhz9RiW87SFSO6bci0vvJBJkxeAyRv/hfZhGRlhXn+ADfMN1Oy+rPOadlryjrYtmd9aseKQTTCZ+
	iUb62R0tf9/+bVmmhlcwwRzbLewP5v1KY2nw4tCMi4s1y0/m1ikmmTRPsXZ4mMyMNCUI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v2xXy-0006bM-Ep;
	Sun, 28 Sep 2025 19:59:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1v2xXw-0006b7-5F
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Sep 2025 19:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IvsXNpcgXrV7DDP8t04BMX6mIwewQRhlCvE2VhgDWNg=; b=Thtc/a3bAaB+T1EpsyvfyQ9O4b
 Ip7kRC4daQq+ylC6v4oEmPeCOFM7lTWyvALcc9w8FvRAHM4W7F5Z3JV6YmVRl5EHazLq7sjB9CY1U
 OZAbW3xrA/yrxxDXl4ea6apG750NSh1e8Yfv5VnM4n3tIi8Ufeoc8/od31iPfm2BzxGg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IvsXNpcgXrV7DDP8t04BMX6mIwewQRhlCvE2VhgDWNg=; b=cR4qzu04G/7JZGz6ozujlzQ80N
 qp7ujLXv673BSfflis+Uqy5l2qa6olxySEjqn/rVVR5efwKpWhDaEvPmDMPPdH+K7uN7qWsYu1bUx
 n5CTboCWrN9Bmgm6gNSLaSrGPgf6YFMI9RRzYCC/Hufe5xSG9+2JdhseNjGse1Rri2l4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v2xXv-0007Kv-PZ for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Sep 2025 19:59:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 094FF621C9;
 Sun, 28 Sep 2025 19:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76430C4CEF0;
 Sun, 28 Sep 2025 19:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759089533;
 bh=BSaNDAJ2DXajilDe8utcY5o/kSH59Yaye0rmVkRFg58=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qt48dHd73hR8qF0yh1mbzrZSmoewZpeuZPnrWBLTLsFCYQpZAbxRiDujDVqg9MEgQ
 LUobkOYPI9359vDSTv2L0OrwmaUFqzTQdFb6hC8/v4D/MOQBFXGfKgVxIiCZYfoqKB
 nmQWlvt1id9J+6D8snN3NprwoK6x7IGBoM9byxgFfPSDLEXgJz/3QvhwTwbuWayiCm
 yu/TsDq8UCoHhG9sczkk4INEHHfXyLI18CZjTbnQM8kzQMTamKsgs7+qGOHcckL+lz
 FIDr+OrLO+wF5u+hKvBGYKp6QNyA7EJTKluVP6hZLebBivWUuwcrnE1enVrR7NPVSL
 JTGHIA6vYUo5g==
Date: Sun, 28 Sep 2025 19:58:51 +0000
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <aNmTex1lM2qGi_hf@google.com>
References: <20250924185423.1305104-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250924185423.1305104-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/24,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > total_valid_blks_available is already a multiple of c.blks_per_seg. >
 So, we don't need an additional alignment adjustment. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v2xXv-0007Kv-PZ
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: remove unnecessary alignment for
 blocks_for_ssa
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/24, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> total_valid_blks_available is already a multiple of c.blks_per_seg.
> So, we don't need an additional alignment adjustment.

Can we add ASSERT?

> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  mkfs/f2fs_format.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> index b98976c..55a7505 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -500,8 +500,7 @@ static int f2fs_prepare_super_block(void)
>  	if (c.feature & F2FS_FEATURE_RO)
>  		blocks_for_ssa = 0;
>  	else
> -		blocks_for_ssa = total_valid_blks_available /
> -				c.blks_per_seg + 1;
> +		blocks_for_ssa = total_valid_blks_available / c.blks_per_seg;
>  
>  	set_sb(segment_count_ssa, SEG_ALIGN(blocks_for_ssa));
>  
> -- 
> 2.51.0.536.g15c5d4f767-goog
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

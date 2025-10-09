Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF136BC755E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Oct 2025 05:53:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REpW/gtbrsnjI8zPKqyno3qLgQ5Y/BAoIVqdAjKvAFQ=; b=QNDxb7djO3hVfTfEPGxgij9EPd
	06k5+VXXhOlg6YwM6pAWXOBIqYudEN75TGx0iHwJYez0JyOexpmjeah/KaK0vN+g8R6wCAOpc7/gm
	GpF74w1GivOxwMcRZOGD2WMCn4zanUgNxT793YI8p7g13HKhLItKwTYo7xuxkqi1sAHQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6him-0008Ku-EW;
	Thu, 09 Oct 2025 03:53:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v6hik-0008Kl-8c
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 03:53:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CvcHI/vdWA6vd1vvtQpppdQbhjsqnuvHn/sTRiUhqSU=; b=a7pkgzCVUxL9BrqQoRMxrZ8W9y
 ILtYPrEyoDFF4kN493X2EmLVtlV+RpNY0Zne6IkwpOPjLVY01avzsbZV3N0b+pPEfSYVsWMKh+zgu
 UxidpVyMnkKnuURxVRVufvB1BxWx663RNopkOzGO43806SoBkTU+26HtLqsSMbnFqqpY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CvcHI/vdWA6vd1vvtQpppdQbhjsqnuvHn/sTRiUhqSU=; b=a/oRv7kvso9ht7PNGEDkxTuJrm
 hqn3tieNcX1CJkFrOia3J1X3W5ab0SRah0Y0LJ1JFYlndTlSf5g4YWh2c5z3U+xAHQ6CW9X8laZRG
 j9DH7g2YGZl/HerN23S7ZkxXWpOdq5hWqYQLeDPnHuW/hxTm2FljQRQNs+53CU5XSG9g=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v6hij-0006vu-SZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 03:53:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3AEDC604A9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  9 Oct 2025 03:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8367C4CEE7;
 Thu,  9 Oct 2025 03:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759982011;
 bh=uyodu9Nq9lMkDSCdaot9IvSCnaHWz4Hb9j/CRaYxamc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=dI2U7F9KpZGsC/6vS0gB2fMt7pVi1rCmOLXUSehfyI4436CnIXSTHMdo4v17+aZO6
 8ZsunLPrB+tk0R6NHWMZra5OtEKwkhqyLebryJRfJu3APGKm1wg+w3q1Rlh7bhXRiS
 y/n7yuyknM+MqjYXt3aC4at4IvsyNZrZ3px5Rr9/Jkn2EMBofu1Y+XXmxkDpXWsoTc
 5skysXJKv0+wetubniK3AYlR4mATLiYiMORXtkpGzdh07TN3pjlJnhGWl11iJe3b4j
 DU2JHRa+f4tiLqzyZ76lX2Y4inL2cZObGBaxUNKpR/wKHwtQZAKIofYoApbtwWwZV6
 QfOm8LVQmrl5w==
Message-ID: <fdfe10ef-7122-4d84-9299-e16294a1e2d5@kernel.org>
Date: Thu, 9 Oct 2025 11:53:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20251007035343.806273-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20251007035343.806273-1-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/7/2025 11:53 AM,
 Jaegeuk Kim via Linux-f2fs-devel wrote:
 > Assuming the disk layout as below, > > disk0: 0 --- 0x00035abfff > disk1:
 0x00035ac000 --- 0x00037abfff > disk2: 0x00037ac000 --- 0x000 [...] 
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
X-Headers-End: 1v6hij-0006vu-SZ
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix wrong block mapping for
 multi-devices
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
Cc: stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/7/2025 11:53 AM, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Assuming the disk layout as below,
> 
> disk0: 0            --- 0x00035abfff
> disk1: 0x00035ac000 --- 0x00037abfff
> disk2: 0x00037ac000 --- 0x00037ebfff
> 
> and we want to read data from offset=13568 having len=128 across the block
> devices, we can illustrate the block addresses like below.
> 
> 0 .. 0x00037ac000 ------------------- 0x00037ebfff, 0x00037ec000 -------
>            |          ^            ^                                ^
>            |   fofs   0            13568                            13568+128
>            |       ------------------------------------------------------
>            |   LBA    0x37e8aa9    0x37ebfa9                        0x37ec029
>            --- map    0x3caa9      0x3ffa9
> 
> In this example, we should give the relative map of the target block device
> ranging from 0x3caa9 to 0x3ffa9 where the length should be calculated by
> 0x37ebfff + 1 - 0x37ebfa9.
> 
> In the below equation, however, map->m_pblk was supposed to be the original
> address instead of the one from the target block address.
> 
>   - map->m_len = min(map->m_len, dev->end_blk + 1 - map->m_pblk);
> 
> Cc: stable@vger.kernel.org
> Fixes: 71f2c8206202 ("f2fs: multidevice: support direct IO")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Looks good to me, thanks for the fix!

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

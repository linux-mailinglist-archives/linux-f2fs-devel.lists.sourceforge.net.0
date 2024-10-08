Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA8D994341
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Oct 2024 11:02:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sy66q-0007yO-4c;
	Tue, 08 Oct 2024 09:02:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sy66o-0007yI-Ok
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Oct 2024 09:02:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jofjzSLpaZUzQLmyj4Nch6fmjtDsBOl4E/A6UfuMO2Q=; b=lDKOjuLPOpNdnzw6VPgm2/PWtj
 BJ/KoUwZyVTd4PX1OcB+Ts0RQKBuLQPRv2P2iN1uHTD+EmGvM3eIZ76wZHYhdh4V4qTFVjCa3Psg+
 fukWPgDUXWua8g6WcMFJea1Mp2oBoOeqlDYy/VPqeiVH9tV0+S7AXpp7qBMWuV5UP+m8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jofjzSLpaZUzQLmyj4Nch6fmjtDsBOl4E/A6UfuMO2Q=; b=mLQgiCnqDWVZ0YCuLHiHqXL8bA
 RO35PjI4mbTwikRZJlfWGScpujClzd3agXzRZJwzWQMA2o5kuAoQYhpASDI4s9w0xAyrpRrLUCMua
 XoDMvZjnFxR934Ca+4BYTWgYrMmUoaFs54ZrwoFWfoNSY5jkSsYZpiQPJecR1pVKq0qA=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sy66n-0005L4-Gx for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Oct 2024 09:02:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 43EBFA4337C;
 Tue,  8 Oct 2024 09:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D699C4CEC7;
 Tue,  8 Oct 2024 09:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728378135;
 bh=zQiizLClsBxLSB6OT29x/oYUUPknpiOhCSGFL9uzqss=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=BqwKyJBGoOtUn3Lm6JXfWX2U+P70Ov3aYIWIRDLij0ssPOcz09+7q4cYsPRJ616vI
 stbpdemTOLWcSQTlSlL5JsnUBZ0/nkXr7B7Fwp2mqL5XOk1jCj2nNWVmJ/OGNCTQRx
 Z6Um54hAnU8jJi3r7zWGbs42q2v6td4JNG61fCTIWQHalAN7UTdNY532p/z5rgo25M
 JPKSEUoogE5klojYva5jG6laXrwHx5eXxnui3ZjyG9QGS6V4RAli0Znx4IHe8puSyk
 UiYKs95a5iG5h5ecx8ym+qIs9FtW4gNZz0D4STY6mfqlDEfCc+AeRzGqwBIe+qnu+v
 qrBQhZBvsH6yg==
Message-ID: <e26d7399-a0a7-4646-8e93-267cb20018cf@kernel.org>
Date: Tue, 8 Oct 2024 17:02:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yonggil.song@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Dongjin Kim <dongjin_.kim@samsung.com>, Siwoo Jung <siu.jung@samsung.com>,
 Daejun Park <daejun7.park@samsung.com>
References: <CGME20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p8>
 <20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p8>
Content-Language: en-US
In-Reply-To: <20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p8>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/7 13:21, Yonggil Song wrote: > There was a bug
 that did not subtract the super block area when calculating > the usable
 segments
 for a single zoned device with a conventional zone. > This b [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sy66n-0005L4-Gx
Subject: Re: [f2fs-dev] [PATCH] libf2fs: Fix calculation of usable segments
 for single zoned
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/7 13:21, Yonggil Song wrote:
> There was a bug that did not subtract the super block area when calculating
> the usable segments for a single zoned device with a conventional zone.
> This bug resulted in incorrect the overprovision and reserved area.
> 
> 	<256MiB legacy block + zoned block w/ 32MiB zone size>
> 	Info: Overprovision ratio = 3.570%
> 	Info: Overprovision segments = 656 (GC reserved = 560)
> 
> 	<8 conventional zone + 1016 sequential zone w/ 32MiB zone size>
> 	Info: Overprovision ratio = 3.700%
> 	Info: Overprovision segments = 676 (GC reserved = 578)
> 
> This patch fixes the bug by subtracting the super block area when there is
> only one zoned device.
> 
> Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
> ---
>   lib/libf2fs_zoned.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
> index 89ba5ad73a76..cc5c064b7e3e 100644
> --- a/lib/libf2fs_zoned.c
> +++ b/lib/libf2fs_zoned.c
> @@ -555,6 +555,11 @@ uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb)
>   	}
>   	usable_segs -= (get_sb(main_blkaddr) - get_sb(segment0_blkaddr)) >>
>   						get_sb(log_blocks_per_seg);
> +
> +	/* single zoned device needs to remove a super block area */

If we don't format zoned device, it doesn't need to do this?

Thanks,

> +	if (c.ndevs == 1)
 > +		usable_segs -= (get_sb(segment0_blkaddr) >> get_sb(log_blocks_per_seg));> +
>   	return usable_segs;
>   #endif
>   	return get_sb(segment_count_main);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

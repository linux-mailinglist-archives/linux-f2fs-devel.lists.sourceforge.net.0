Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C306299A7DF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Oct 2024 17:35:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1szHfM-0006ij-6I;
	Fri, 11 Oct 2024 15:34:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1szHfF-0006ia-9r
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Oct 2024 15:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gRIzntNMWr8NwfLtmzW4wZctrY8nWyuF2Nh0asy2ZEw=; b=cwvFR+YObVhxqf/Oq71l5e/Cyq
 IfRS5qWssct/rdEKWBCbp7WcTd5YlQwzrRJTAVhX5Vr7f00aCyhklIOzp4vnqnM9EfQ3n1jN+4fxC
 AcqukdQgMhK0PoXB9y5ykQgeskdn2cayfz6e5P9xwTS+gg8NdkccyFws/nJRnQ8Mr4LY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gRIzntNMWr8NwfLtmzW4wZctrY8nWyuF2Nh0asy2ZEw=; b=ZhIETK36Cxe/V9QAGCuC0zFThO
 JxBnfy4NwmhmGi+kZG9ZH1uW4tyuAHQVAWFjCq0/zSaxIpv/0hqSoo7Jt/v9YJo6sRs3mzOEwqBLY
 ld06/rQDnWocgFfACcarCVAa4gfHLNzMNfZR9lRoaLX0tfTj1SvL0gRNIgLypmZJzioQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1szHfE-00078l-1F for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Oct 2024 15:34:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 58E175C03E3;
 Fri, 11 Oct 2024 15:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023EEC4CEC3;
 Fri, 11 Oct 2024 15:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728660882;
 bh=2zjq4Ks3ur9+Akzi/sv+mw+4+XesiyAmSjBvkeudVnc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XrYYv8WpBXqLu3Zd+a3ilj9tVg/ivwC/p4/3/Bi3LvKsXPbnB9MkYuL6Bf+fhkJnz
 IAgr54fHcMIl89Bhj4qpdnI3pMRKwsf/ZPuVp7Zp0w9S9tLb/HYvt+LZlXuVnuBCJz
 2QFrSwUnMGfA4p5ZWZjn6ueJQZpmYZw23wCBppXrrH3lqnJRzIXNkFq5daA5KrngJ7
 a8zlyHlxF+eb2SZ6D/2CxFnnUTKZ4pAZ8RRHz8BrZo4zWAlHXCgNibOSM+bZXQRAXM
 PZdkpPus0Y7WR4V7SZL5qmDFqQnI7UEmNpav+XGOS1FTxNbjzSQrcjje97sF17f+GS
 fylUdXK/Wx1RA==
Date: Fri, 11 Oct 2024 15:34:40 +0000
To: Yonggil Song <yonggil.song@samsung.com>
Message-ID: <ZwlFkBAV2yxf1DBt@google.com>
References: <20241010043123epcms2p2ad514eb5e4a94413d8b26aea56f772a8@epcms2p2>
 <20241010021506epcms2p21d877e3c72389b41805db31f391d2b42@epcms2p2>
 <e26d7399-a0a7-4646-8e93-267cb20018cf@kernel.org>
 <20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p8>
 <CGME20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p7>
 <20241010045935epcms2p7ab5f54e9789b36ea496abcb100a7878f@epcms2p7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241010045935epcms2p7ab5f54e9789b36ea496abcb100a7878f@epcms2p7>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/10, Yonggil Song wrote: > There was a problem that did
 not subtract the super block area when calculating > the usable segments
 for a single zoned device with a conventional zone. > This resulte [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1szHfE-00078l-1F
Subject: Re: [f2fs-dev] [PATCH v2] libf2fs: Fix calculation of usable
 segments for single
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Siwoo Jung <siu.jung@samsung.com>,
 Dongjin Kim <dongjin_.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/10, Yonggil Song wrote:
> There was a problem that did not subtract the super block area when calculating
> the usable segments for a single zoned device with a conventional zone.
> This resulted in incorrect the overprovision and reserved area.
> 
> 	<256MiB legacy block + zoned block w/ 32MiB zone size>
> 	Info: Overprovision ratio = 3.570%
> 	Info: Overprovision segments = 656 (GC reserved = 560)
> 
> 	<8 conventional zone + 1016 sequential zone w/ 32MiB zone size>
> 	Info: Overprovision ratio = 3.700%
> 	Info: Overprovision segments = 676 (GC reserved = 578)
> 
> This patch addresses the problem by subtracting the super block area when
> there is only one zoned device.
> 
> Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
> ---
>  lib/libf2fs_zoned.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
> index 89ba5ad73a76..1a0985378789 100644
> --- a/lib/libf2fs_zoned.c
> +++ b/lib/libf2fs_zoned.c
> @@ -555,6 +555,11 @@ uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb)
>  	}
>  	usable_segs -= (get_sb(main_blkaddr) - get_sb(segment0_blkaddr)) >>
>  						get_sb(log_blocks_per_seg);
> +
> +	/* single zoned device needs to remove a super block area */
> +	if (c.ndevs == 1 && c.devices[0].zoned_model == F2FS_ZONED_HM)

Does this work?

> +		usable_segs -= (get_sb(segment0_blkaddr) >> get_sb(log_blocks_per_seg));
> +
>  	return usable_segs;
>  #endif
>  	return get_sb(segment_count_main);
> -- 
> 2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

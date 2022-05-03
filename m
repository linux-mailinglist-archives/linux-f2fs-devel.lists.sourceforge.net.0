Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E68E7518DC0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 May 2022 22:05:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nlymC-00055v-FB; Tue, 03 May 2022 20:05:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nlymA-00055p-NH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 20:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SLM3Ygt2iESODXGmQs63u34UXciqPDbzgQ5fAhca4RU=; b=bCLYAXK2wHQfMt+yaCjYKDPhV3
 pr443yB3Xqc5eCUWZ/ZWOnitkEIQDOESYoYh9NZ8804ZrTdIS9bSCX7FDQLlDAhX/6l8qANlqq7e9
 sa+UX0uIFxFgaUx55odozIXRGj669Yn6MCASe2DiyCw6lczJbOTVog4KSz6/qGM4x7IA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SLM3Ygt2iESODXGmQs63u34UXciqPDbzgQ5fAhca4RU=; b=TebrEhcVkgComokYfGdo+zH9pQ
 S6Jo0ta7cKguw3cdUMrrjJiR+3bYx8sARGoO9KaNlB3VR9e66PigGY3N+/kXqDPBL5NjL1gmuWuti
 Cr//E326VTXzWjoVOP17j1aIYXVRVRjzhxxDmzmoG6Bo+jom0Z2sc/UZUlBj9BkbN14s=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nlym5-000PTJ-7g
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 20:05:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E6D72B82064;
 Tue,  3 May 2022 20:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0282C385A4;
 Tue,  3 May 2022 20:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651608321;
 bh=2OQ31S8saJK84+b60Nks/1nuGKuObPzODZf658f3HMo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z3gmS/aw/5UbzdnldhQqOG3y2Htd54aWj3NdcFNjD/VuO6MUhIRAXm8gaqDMrbl7m
 0Yd/IIwkIht0j2PXb+Na0iGFxmmXo69g/ybxOPgh9SC99E//dv42kQFiRnnJINmj0G
 WQVouHUD07VcTCvD102p1MYo7k7OtdRH4nZKSxophQWU5wzuRrxx/mIrjlCvn7kjsq
 yDReBNF0aClXwfI3zXeCWlW3e+RBMWhcbp6h1csAmjw9TRrSIgu4j5wxKNCdKT+oKm
 M5ALQh3FJxRyG6IiOBdtF5JBS3VvY3anbsCRiV8IDHss/pgBG5U5QwG09lcuiCVlnW
 Bdy2Z6nmvE8yA==
Date: Tue, 3 May 2022 13:05:19 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Pankaj Raghav <p.raghav@samsung.com>
Message-ID: <YnGK/8lu2GW4gEY0@google.com>
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160312eucas1p279bcffd97ef83bd3617a38b80d979746@eucas1p2.samsung.com>
 <20220427160255.300418-16-p.raghav@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220427160255.300418-16-p.raghav@samsung.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Applied to f2fs tree. Thanks, On 04/27, Pankaj Raghav wrote:
 > From: Luis Chamberlain <mcgrof@kernel.org> > > F2FS zoned support has power
 of 2 zone size assumption in many places > such as in
 __f2fs_issue_discard_zone, init_blkz_ [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nlym5-000PTJ-7g
Subject: Re: [f2fs-dev] [PATCH 15/16] f2fs: ensure only power of 2 zone
 sizes are allowed
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
Cc: jiangbo.365@bytedance.com, linux-nvme@lists.infradead.org, clm@fb.com,
 dm-devel@redhat.com, hch@lst.de, agk@redhat.com, naohiro.aota@wdc.com,
 sagi@grimberg.me, gost.dev@samsung.com, damien.lemoal@opensource.wdc.com,
 jonathan.derrick@linux.dev, kch@nvidia.com, snitzer@kernel.org,
 josef@toxicpanda.com, linux-block@vger.kernel.org, dsterba@suse.com,
 kbusch@kernel.org, matias.bjorling@wdc.com, bvanassche@acm.org,
 axboe@kernel.dk, johannes.thumshirn@wdc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Applied to f2fs tree. Thanks,

On 04/27, Pankaj Raghav wrote:
> From: Luis Chamberlain <mcgrof@kernel.org>
> 
> F2FS zoned support has power of 2 zone size assumption in many places
> such as in __f2fs_issue_discard_zone, init_blkz_info. As the power of 2
> requirement has been removed from the block layer, explicitly add a
> condition in f2fs to allow only power of 2 zone size devices.
> 
> This condition will be relaxed once those calculation based on power of
> 2 is made generic.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> ---
>  fs/f2fs/super.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index f64761a15df7..db79abf30002 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3685,6 +3685,10 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
>  		return 0;
>  
>  	zone_sectors = bdev_zone_sectors(bdev);
> +	if (!is_power_of_2(zone_sectors)) {
> +		f2fs_err(sbi, "F2FS does not support non power of 2 zone sizes\n");
> +		return -EINVAL;
> +	}
>  
>  	if (sbi->blocks_per_blkz && sbi->blocks_per_blkz !=
>  				SECTOR_TO_BLOCK(zone_sectors))
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

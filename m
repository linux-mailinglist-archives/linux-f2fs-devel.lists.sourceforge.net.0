Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC0B518DBC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 May 2022 22:04:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nlykx-0003iM-B7; Tue, 03 May 2022 20:04:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nlykw-0003h9-Lu
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 20:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mbnLZXvmjiUydw6XV2zP4n7v0/cS2cpfMEj9/h01KLs=; b=ZuUXHAZrhljMygrinx3ozxNk+j
 QCN//V8Hbpy37Xsd8oP/b34TwcsTVWm/25N7c9CwNCGPHUgRPOoqwNGLf93bAPy4+D89mCdr/r39e
 eR6uYC77YQXLEQ6H/I5DlIKZ8PvdwVtL90q2fSl/Dak3Mf7QvItGWpq3BhRhBb/AUlO0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mbnLZXvmjiUydw6XV2zP4n7v0/cS2cpfMEj9/h01KLs=; b=XYTiXIl0owEHQ5M3w5GG0rb+sS
 N+MNXAJSStafQttnmX0TONKMXJAp5wlO87VaQ00eGwchB4+O0m/7EtKZ6bYRTxCe7yXMClcWnCa6N
 NaiXGD/9g+WK2aE3MUeub744nhSHayv4BRoIPSugr1FxDQnGIw3tEjGTgh8yQeflpJKw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nlykt-0002CE-9O
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 20:04:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3137CB82061;
 Tue,  3 May 2022 20:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F65C385A4;
 Tue,  3 May 2022 20:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651608251;
 bh=yEwIKUkYrUe+UB4k6sDSTOcJaUQFRLK0s3/p+P/axO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GI4PqtOAj9PMvq17VbxQwejZWyW9waSFBPKixzYGnlcgVZKbWRTtbDsNIZZwaqgJW
 oRbRzsBLXIeXqedBxITy5sBQxpsdE8I0dm3cEPiXGUZcnaeNIQ12WIBdr1DNLQll1t
 +pUS07koL10aaZ31K0ZVF/uLZ+EZZBoxW+DCQadgwgerGjiYcHn3UgSgB4OcJyJiYe
 i6tehN8h7cCda5ctDbs17t6pRzGracdobePQtcHkfSJEEz+G6rES43RSs+L4zfA7c4
 iHfsO8Ek/+4eQNxEj3/7v/WG9g0aL4gDw9K4vOzjBpm1V5OnkKQ8fUIpjm9PDrF8aA
 kouE3UjVHDJkQ==
Date: Tue, 3 May 2022 13:04:08 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Pankaj Raghav <p.raghav@samsung.com>
Message-ID: <YnGKuET79JQ+ssPp@google.com>
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160311eucas1p151141fc73adc590b40ad6f935b1ac214@eucas1p1.samsung.com>
 <20220427160255.300418-15-p.raghav@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220427160255.300418-15-p.raghav@samsung.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Applied to f2fs tree. Thanks, On 04/27, Pankaj Raghav wrote:
 > From: Luis Chamberlain <mcgrof@kernel.org> > > Instead of calling
 bdev_zone_sectors()
 multiple times, call > it once and cache the value locally. This will make
 the > [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nlykt-0002CE-9O
Subject: Re: [f2fs-dev] [PATCH 14/16] f2fs: call bdev_zone_sectors() only
 once on init_blkz_info()
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
> Instead of calling bdev_zone_sectors() multiple times, call
> it once and cache the value locally. This will make the
> subsequent change easier to read.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> ---
>  fs/f2fs/super.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index ea939db18f88..f64761a15df7 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3678,22 +3678,25 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
>  	struct block_device *bdev = FDEV(devi).bdev;
>  	sector_t nr_sectors = bdev_nr_sectors(bdev);
>  	struct f2fs_report_zones_args rep_zone_arg;
> +	u64 zone_sectors;
>  	int ret;
>  
>  	if (!f2fs_sb_has_blkzoned(sbi))
>  		return 0;
>  
> +	zone_sectors = bdev_zone_sectors(bdev);
> +
>  	if (sbi->blocks_per_blkz && sbi->blocks_per_blkz !=
> -				SECTOR_TO_BLOCK(bdev_zone_sectors(bdev)))
> +				SECTOR_TO_BLOCK(zone_sectors))
>  		return -EINVAL;
> -	sbi->blocks_per_blkz = SECTOR_TO_BLOCK(bdev_zone_sectors(bdev));
> +	sbi->blocks_per_blkz = SECTOR_TO_BLOCK(zone_sectors);
>  	if (sbi->log_blocks_per_blkz && sbi->log_blocks_per_blkz !=
>  				__ilog2_u32(sbi->blocks_per_blkz))
>  		return -EINVAL;
>  	sbi->log_blocks_per_blkz = __ilog2_u32(sbi->blocks_per_blkz);
>  	FDEV(devi).nr_blkz = SECTOR_TO_BLOCK(nr_sectors) >>
>  					sbi->log_blocks_per_blkz;
> -	if (nr_sectors & (bdev_zone_sectors(bdev) - 1))
> +	if (nr_sectors & (zone_sectors - 1))
>  		FDEV(devi).nr_blkz++;
>  
>  	FDEV(devi).blkz_seq = f2fs_kvzalloc(sbi,
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

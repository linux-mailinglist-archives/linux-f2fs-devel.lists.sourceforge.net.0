Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5484074F4C5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Jul 2023 18:18:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qJG40-0004QF-7r;
	Tue, 11 Jul 2023 16:18:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qJG3z-0004Q9-69
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jul 2023 16:18:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YKOwq8sdF95jVkTlVFJ5Q7JfTyV7gMWc0poo8VC6kiE=; b=MhkqYxepRd3xuCqOoqY7TgVD6M
 inh9E16OG2yM0IeaRZXvFHLd3MkyeDTaSUnpmC2hwKhvaRbDWKJj5MiecwO1tjpxpqCha9E/4Kfwa
 9F2R9eJUWMmXKKN2xbJbg12aZL0GDgG9PlBxdd9IA3DRPPK1O9iBJ2aku1jqf0Ww02Hg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YKOwq8sdF95jVkTlVFJ5Q7JfTyV7gMWc0poo8VC6kiE=; b=T2NHFa1VuskbYP6JCVQT5ttlQ1
 6sr0aQYjnKKzKJMD6L1EbI5AlVO0ugR8bAjVcF//4kGPg2K7J16Fv6q9Q1x9Auw16aZEvvLXrUx0I
 04dqKO+ryrPU7ASKRruuieBJku5x2xwjnFldb8Ner1drh1fQqzk4I2iDoefJTkMsyZ64=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qJG3z-0000sJ-Uo for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jul 2023 16:18:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E91061557;
 Tue, 11 Jul 2023 16:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E1FC43397;
 Tue, 11 Jul 2023 16:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689092279;
 bh=9L6KVSpQ52iJPE/W9jY3lrnhEPrff+Z1LTyLQcv3sdo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GjMT73AgXcyF+/wnM61zc+wcm/8+eqcyrwD4iVIc+yIvuT+1V7qmm2MdRA0lKY/WD
 xdJ9bIgeszZQ6thQC1dB813TOS+iQrY0gKWqpajt4w0UqMTyhIgJcCUXMiuNqoFvgr
 wnTKYlRQKa4jrojQp05SGNSzG7uNhVVs+BgMkx/U6TNOu8WX1gyvrEsiYs0NfLPOiG
 N3frObkHFygc1ageTo9HcPRYpB6WWShpwoY0d1lOAkJJ2Et+mbfB3cECwz1PVy80tN
 9hx8J+DBW/XxqyR1TilaseDsC9Ig0lMUv3olAUi58RZ19k/PcdKY/mt034voSdWvPO
 xq2nYnt433w4g==
Date: Tue, 11 Jul 2023 09:17:57 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <ZK2AtW9hLjqpbaPW@google.com>
References: <20230707094028.107898-1-hch@lst.de> <ZKx2jVONy35B0/S1@google.com>
 <20230711050101.GA19128@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230711050101.GA19128@lst.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/11, Christoph Hellwig wrote: > I think that's because
 it doesn't look at sbi->s_ndevs in > destroy_device_list. Let's try the
 variant
 below, which also fixes > the buildbot warning for non-zoned [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qJG3z-0000sJ-Uo
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't reopen the main block device in
 f2fs_scan_devices
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
Cc: linux-block@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/11, Christoph Hellwig wrote:
> I think that's because it doesn't look at sbi->s_ndevs in
> destroy_device_list.  Let's try the variant below, which also fixes
> the buildbot warning for non-zoned configfs:

Thanks. At a glance, this looks better. Let me give it a try.

> 
> ---
> >From 645d8dceaa97b6ee73be067495b111b15b187498 Mon Sep 17 00:00:00 2001
> From: Christoph Hellwig <hch@lst.de>
> Date: Fri, 7 Jul 2023 10:31:49 +0200
> Subject: f2fs: don't reopen the main block device in f2fs_scan_devices
> 
> f2fs_scan_devices reopens the main device since the very beginning, which
> has always been useless, and also means that we don't pass the right
> holder for the reopen, which now leads to a warning as the core super.c
> holder ops aren't passed in for the reopen.
> 
> Fixes: 3c62be17d4f5 ("f2fs: support multiple devices")
> Fixes: 0718afd47f70 ("block: introduce holder ops")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/blk-flush.c |  2 +-
>  fs/f2fs/super.c   | 20 ++++++++------------
>  2 files changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index ca31163da00a55..30883beb750a59 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1561,7 +1561,8 @@ static void destroy_device_list(struct f2fs_sb_info *sbi)
>  	int i;
>  
>  	for (i = 0; i < sbi->s_ndevs; i++) {
> -		blkdev_put(FDEV(i).bdev, sbi->sb->s_type);
> +		if (i > 0)
> +			blkdev_put(FDEV(i).bdev, sbi->sb->s_type);
>  #ifdef CONFIG_BLK_DEV_ZONED
>  		kvfree(FDEV(i).blkz_seq);
>  #endif
> @@ -4190,16 +4191,12 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>  	sbi->aligned_blksize = true;
>  
>  	for (i = 0; i < max_devices; i++) {
> -
> -		if (i > 0 && !RDEV(i).path[0])
> +		if (i == 0)
> +			FDEV(0).bdev = sbi->sb->s_bdev;
> +		else if (!RDEV(i).path[0])
>  			break;
>  
> -		if (max_devices == 1) {
> -			/* Single zoned block device mount */
> -			FDEV(0).bdev =
> -				blkdev_get_by_dev(sbi->sb->s_bdev->bd_dev, mode,
> -						  sbi->sb->s_type, NULL);
> -		} else {
> +		if (max_devices > 1) {
>  			/* Multi-device mount */
>  			memcpy(FDEV(i).path, RDEV(i).path, MAX_PATH_LEN);
>  			FDEV(i).total_segments =
> @@ -4215,10 +4212,9 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>  				FDEV(i).end_blk = FDEV(i).start_blk +
>  					(FDEV(i).total_segments <<
>  					sbi->log_blocks_per_seg) - 1;
> +				FDEV(i).bdev = blkdev_get_by_path(FDEV(i).path,
> +					mode, sbi->sb->s_type, NULL);
>  			}
> -			FDEV(i).bdev = blkdev_get_by_path(FDEV(i).path, mode,
> -							  sbi->sb->s_type,
> -							  NULL);
>  		}
>  		if (IS_ERR(FDEV(i).bdev))
>  			return PTR_ERR(FDEV(i).bdev);
> -- 
> 2.39.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

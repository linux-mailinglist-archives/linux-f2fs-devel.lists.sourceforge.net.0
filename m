Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE209816A2A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Dec 2023 10:49:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFAFI-0006ut-FZ;
	Mon, 18 Dec 2023 09:49:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1rFAFE-0006un-Ng
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Dec 2023 09:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DEQyzTBOF31GcKD7NdM5mwEKdtroTTQI3efWJtk7z0s=; b=V0Dj5IWXJNLJb5yf/EL6LHsAlJ
 WfhsaXYyP/ewdxFXl3P2G1CllyGrGqJ/mKjozbqdwwX2hZ/c2RcdtC3lDCy+QpyRTblNe3oSYxyr/
 J1C7MJmZNNYLRRPecdCjGkyhFvQlrW/JvL7kzWtfzS3DVqSaZnhmhT4beoInHKOhWe9A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DEQyzTBOF31GcKD7NdM5mwEKdtroTTQI3efWJtk7z0s=; b=Mp/pxQ/muOfdYUgJPIqMHwuUx/
 Pl9v6q6DELPtQhx5uIZoBPMB4aOzep1KVAXm26hbM5MW464STrON5IHQfuTH4F1fWYX9318KKPfzj
 MKJr4xkDtyl13ROIjU9YoEEaHW04cy8HcWa+LWENFT9osX/XWUinot+Ci9d2Vx0tjME8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFAFB-0004yY-7J for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Dec 2023 09:49:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9569960EF4;
 Mon, 18 Dec 2023 09:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877CBC433C8;
 Mon, 18 Dec 2023 09:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702892926;
 bh=w3Wuzja30oOGu0utwKgnSd8xLtm5mDiuTxMgEorAXbI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=as+YGjvFQQHCp0vG4DpCpN+b/lQQcLdoRqqACk87PvDIKzXnIuGjJy4Y0UnVEkzvg
 W27e3J1lmjujffQ0WLuvrrYYi29etk3JdlJ1yjGO+LAN/oWe5WrMGjTe44kFDWraEU
 /WceoHYRnuBBo/kqBMPLs1FpitywHmoBgwrEvPH0JTmvwxB754j20bS453Pj0x6WeD
 1ozC6QlkLCKH+mwqBTISxTymRT9hnit6pAFPWpQ+GGturAnfoh1wxKbf6GWE4zrlYT
 aJbSfp34v/UjaYcB1vVc9jlpS1qqLFUQIqu0mTHZ+5RwSqmJFeqwd9URZqp/WViOzl
 9FjPCS9lb0JgQ==
Message-ID: <09f1adfe-90b5-445c-b7f6-ae4fc7a9666a@kernel.org>
Date: Mon, 18 Dec 2023 18:48:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20231217165359.604246-1-hch@lst.de>
 <20231217165359.604246-4-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20231217165359.604246-4-hch@lst.de>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/12/18 1:53, Christoph Hellwig wrote: > When zones
 were first added the SCSI and ATA specs, two different > models were supported
 (in addition to the drive managed one that > is invisible to th [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rFAFB-0004yY-7J
Subject: Re: [f2fs-dev] [PATCH 3/5] block: remove support for the host aware
 zone model
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
Cc: dm-devel@lists.linux.dev, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 virtualization@lists.linux.dev, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/12/18 1:53, Christoph Hellwig wrote:
> When zones were first added the SCSI and ATA specs, two different
> models were supported (in addition to the drive managed one that
> is invisible to the host):
> 
>  - host managed where non-conventional zones there is strict requirement
>    to write at the write pointer, or else an error is returned
>  - host aware where a write point is maintained if writes always happen
>    at it, otherwise it is left in an under-defined state and the
>    sequential write preferred zones behave like conventional zones
>    (probably very badly performing ones, though)
> 
> Not surprisingly this lukewarm model didn't prove to be very useful and
> was finally removed from the ZBC and SBC specs (NVMe never implemented
> it).  Due to to the easily disappearing write pointer host software
> could never rely on the write pointer to actually be useful for say
> recovery.
> 
> Fortunately only a few HDD prototypes shipped using this model which
> never made it to mass production.  Drop the support before it is too
> late.  Note that any such host aware prototype HDD can still be used
> with Linux as we'll now treat it as a conventional HDD.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

[...]

> diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
> index 6d8218a4412264..d03d66f1149301 100644
> --- a/drivers/scsi/scsi_debug.c
> +++ b/drivers/scsi/scsi_debug.c
> @@ -339,7 +339,7 @@ struct sdebug_dev_info {
>  	bool used;
>  
>  	/* For ZBC devices */
> -	enum blk_zoned_model zmodel;
> +	bool zoned;
>  	unsigned int zcap;
>  	unsigned int zsize;
>  	unsigned int zsize_shift;
> @@ -844,8 +844,11 @@ static bool write_since_sync;
>  static bool sdebug_statistics = DEF_STATISTICS;
>  static bool sdebug_wp;
>  static bool sdebug_allow_restart;
> -/* Following enum: 0: no zbc, def; 1: host aware; 2: host managed */
> -static enum blk_zoned_model sdeb_zbc_model = BLK_ZONED_NONE;
> +static enum {
> +	BLK_ZONED_NONE	= 0,
> +	BLK_ZONED_HA	= 1,
> +	BLK_ZONED_HM	= 2,
> +} sdeb_zbc_model = BLK_ZONED_NONE;
>  static char *sdeb_zbc_model_s;
>  
>  enum sam_lun_addr_method {SAM_LUN_AM_PERIPHERAL = 0x0,
> @@ -1815,8 +1818,6 @@ static int inquiry_vpd_b1(struct sdebug_dev_info *devip, unsigned char *arr)
>  	arr[1] = 1;	/* non rotating medium (e.g. solid state) */
>  	arr[2] = 0;
>  	arr[3] = 5;	/* less than 1.8" */
> -	if (devip->zmodel == BLK_ZONED_HA)
> -		arr[4] = 1 << 4;	/* zoned field = 01b */

I think we should keep everything related to HA in scsi debug as that is an easy
way to test the block layer and scsi. no ?

Other than this, very nice cleanup !

-- 
Damien Le Moal
Western Digital Research



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

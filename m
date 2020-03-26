Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB8719376B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Mar 2020 06:07:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jHKjr-0003vH-Pd; Thu, 26 Mar 2020 05:07:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jHKjq-0003v3-GD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 05:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0AjyQfnZe3a6KgU3Mt8tSC8F1C6jh6b6K+UyFgsQsTo=; b=izYoIrSuDPJCbHw3pj0Gho0cQG
 AV+btHOhqo0al5aPMzaCtuhzIJUZcSpYxk4p0nJiqZPSZRgzgquFslBzW5tnK55be6BkueR2hT2R/
 QaPCetVkmcZ/ihwxl06zqWMcLtKRu778WSJ55t6m5htaTLPZckGrFzoWfIg6wTkgY4os=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0AjyQfnZe3a6KgU3Mt8tSC8F1C6jh6b6K+UyFgsQsTo=; b=lVaQeIxoEV5G3iCClSe9ITEHZi
 NW50xZx14+ILmWdSYr7aFF/PbhJgEM5mr4Gaj436YZNMKdnep/O0RToDdfm5sqj1otqxHXlhTnhVG
 Z10Pl+oRzeri2KTyqWrh4Fr9pTW8ylM8Zv9c4/daTgyamRDOFV+Tmep5teS5NFfMbsWA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jHKjn-0009Vc-LS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 05:07:30 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 326E62070A;
 Thu, 26 Mar 2020 05:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585199239;
 bh=L93EhN0UlFtJqX/gYR0aa3wk+7m7DwlPwFZinjcu45g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P/05KEELLY9eRnCZ52KBkPmIRjwf+w3dHjNT7/NUOuZFrdqZf0gHvuUN/cHWOysBs
 gG3gj6U+cMZEqWlgzpNJBKMArfqL0F2qBFDorlUP2jUGpN1iU8Rx1kySNW1RJLAXC5
 AOubGRlzbwKQfv+KB+KhM9+L5/+vsIcyFOOXoxOM=
Date: Wed, 25 Mar 2020 22:07:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200326050717.GB858@sol.localdomain>
References: <20200326030702.223233-1-satyat@google.com>
 <20200326030702.223233-7-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326030702.223233-7-satyat@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jHKjn-0009Vc-LS
Subject: Re: [f2fs-dev] [PATCH v9 06/11] scsi: ufs: UFS crypto API
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Mar 25, 2020 at 08:06:57PM -0700, Satya Tangirala wrote:
> Introduce functions to manipulate UFS inline encryption hardware
> in line with the JEDEC UFSHCI v2.1 specification and to work with the
> block keyslot manager.
> 
> The UFS crypto API will assume by default that a vendor driver doesn't
> support UFS crypto, even if the hardware advertises the capability, because
> a lot of hardware requires some special handling that's not specified in
> the aforementioned JEDEC spec. Each vendor driver must explicity set
> hba->caps |= UFSHCD_CAP_CRYPTO before ufshcd_hba_init_crypto is called to
> opt-in to UFS crypto support.
> 

Thanks, this looks much better now!

A couple minor nits I noticed while reading this latest version:

> +void ufshcd_crypto_setup_rq_keyslot_manager(struct ufs_hba *hba,
> +					    struct request_queue *q)
> +{
> +	if ((hba->caps & UFSHCD_CAP_CRYPTO))
> +		blk_ksm_register(&hba->ksm, q);
> +}

There's an extra pair of parentheses in the 'if'.

> diff --git a/drivers/scsi/ufs/ufshcd-crypto.h b/drivers/scsi/ufs/ufshcd-crypto.h
> new file mode 100644
> index 0000000000000..1e98f1fc99965
> --- /dev/null
> +++ b/drivers/scsi/ufs/ufshcd-crypto.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2019 Google LLC
> + */
> +
> +#ifndef _UFSHCD_CRYPTO_H
> +#define _UFSHCD_CRYPTO_H
> +
> +#ifdef CONFIG_SCSI_UFS_CRYPTO
> +#include "ufshcd.h"
> +#include "ufshci.h"
> +
> +bool ufshcd_crypto_enable(struct ufs_hba *hba);
> +
> +void ufshcd_crypto_disable(struct ufs_hba *hba);

ufshcd_crypto_disable() has been removed, so its declaration should be removed
too.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

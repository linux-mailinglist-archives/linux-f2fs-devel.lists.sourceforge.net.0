Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 219DD193773
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Mar 2020 06:10:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jHKmK-0004LA-2k; Thu, 26 Mar 2020 05:10:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jHKmI-0004Kl-EK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 05:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tPCDhExoDbgZWt5uPIFgHtlP4i+DNiIYYZ2mb2vB8IY=; b=Erc6a4phSODVizDAByhnbPQSlp
 r3Ed02zeNEpkZmVGIFd3GgCGA13DJyeOfrllKacluYQohFnPY1y5vVnUmpTXbzg+ztkcRaMRXoHI3
 1i0JwdmIVWvGjh2JJDMmNzs3v2NWW5AHF9ZqE9AR4YQ4E7ImPr44F/StBj+oY/cpkY4s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tPCDhExoDbgZWt5uPIFgHtlP4i+DNiIYYZ2mb2vB8IY=; b=kKV0Jn33dCknA+l+5Ij3FY9eN0
 SRIiLkC2tHZ9AjhxxkCotku4ZNLUzJiOwInr1efr7LE5sZywbSuhQ86/mCYXVcalrb81uyuBbRnbW
 n5/dyRnF6wyQtZJj4jddZV2SSrh/lp5D++vOpqTEnVcbqc69XOC/vArYU9K0rJwiIG+c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jHKmG-007pPU-Af
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 05:10:02 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C95EB2070A;
 Thu, 26 Mar 2020 05:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585199393;
 bh=SAzWGnLaDMWUeuZGiBEGw8t99I39riFFfBkRkECR76k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KBk6bh+2+KgvnH/GBoaOZP5CoOGFXBDEmHLgyFu7jp7J3p2K4KtNOxOGCOaR2gJoO
 NoaM3PK4kAQwznME9Gi10zGQmX6diVM0og4bc4/edRNOGvjRedijlsyrXSGWLAPzG2
 1sDc4qg8+owA7W1kg+pUvnaPTPQpJZ24CZrBYHL8=
Date: Wed, 25 Mar 2020 22:09:51 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200326050951.GC858@sol.localdomain>
References: <20200326030702.223233-1-satyat@google.com>
 <20200326030702.223233-8-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326030702.223233-8-satyat@google.com>
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
X-Headers-End: 1jHKmG-007pPU-Af
Subject: Re: [f2fs-dev] [PATCH v9 07/11] scsi: ufs: Add inline encryption
 support to UFS
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

On Wed, Mar 25, 2020 at 08:06:58PM -0700, Satya Tangirala wrote:
> Wire up ufshcd.c with the UFS Crypto API, the block layer inline
> encryption additions and the keyslot manager.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>

Thanks, like the previous patch this looks much better now!

A couple minor nits I noticed while reading this latest version:

> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index eaeb21b9cda24..3af15880e1e36 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -168,6 +168,8 @@ struct ufs_pm_lvl_states {
>   * @intr_cmd: Interrupt command (doesn't participate in interrupt aggregation)
>   * @issue_time_stamp: time stamp for debug purposes
>   * @compl_time_stamp: time stamp for statistics
> + * @crypto_key_slot: the key slot to use for inline crypto

It would be helpful if the comment mentioned the -1 case:

 * @crypto_key_slot: the key slot to use for inline crypto (-1 if none)

> + * @data_unit_num: the data unit number for the first block for inline crypto
>   * @req_abort_skip: skip request abort task flag
>   */
>  struct ufshcd_lrb {
> @@ -192,6 +194,10 @@ struct ufshcd_lrb {
>  	bool intr_cmd;
>  	ktime_t issue_time_stamp;
>  	ktime_t compl_time_stamp;
> +#if IS_ENABLED(CONFIG_SCSI_UFS_CRYPTO)
> +	int crypto_key_slot;
> +	u64 data_unit_num;
> +#endif

Since CONFIG_SCSI_UFS_CRYPTO is a bool this should use #ifdef, not IS_ENABLED().

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

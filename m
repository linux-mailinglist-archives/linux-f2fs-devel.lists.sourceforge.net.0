Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8151D1D36
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2020 20:16:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYvvf-0006JR-3i; Wed, 13 May 2020 18:16:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jYvvd-0006JK-Po
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 18:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8jKfxt998Pi+5fZanZG8tQW8Rgngq6MexczIKBG+3jU=; b=JdroFNuxz21Jwb4d4T/Wizz1NK
 g6Xt+23dayBXN1eYV80pKCr+VnLSSjQPXsv2G0et1QwaGs67z2e30/jeYt+qG8GTs66rRDuxT/KJh
 cbVzNx351uLZEwEyphpMk2XoBZmATdR2ZcLzsDcNCHz0GltAdsZzUjq8mT43b/6nTYmY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8jKfxt998Pi+5fZanZG8tQW8Rgngq6MexczIKBG+3jU=; b=MKY8JhN5tQdxVTd3yu7tBrTbf/
 SQ+nevf7iuzF4WK4b7f99EfyrvyKVtFDx1dXBtu+WrD2LL1smHyEbgRCrM8DjUHfQv7tzmipHKTFY
 75HDXN56XefJD7LkNWk29sV8ehkeippZ1GU3EJMBgk2VT2r81St0QMu3sI9zdnq1CyNg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYvvc-008tns-OZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 18:16:25 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5141A20659;
 Wed, 13 May 2020 18:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589393777;
 bh=NzWZMwcALO2Ink36HyIe2Q6IAjI7yALGFMtqrR20MkY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cq1KZYO+yqMKqCVJa5a+qSnmOdDeU9MYSCzy91/uXLdy/BkeajpPJD0xzF62BtUSi
 v0car04IsUZjOGWn3W2aZ+zTtfHX798CRa97jEknrFuB/IMQB9tCptjZNaol5OyNRV
 0MPR7cNoSo5OM4BXzpqeaG6ZWtVSZ8K9dfVGyYm8=
Date: Wed, 13 May 2020 11:16:15 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200513181615.GF1243@sol.localdomain>
References: <20200430115959.238073-1-satyat@google.com>
 <20200430115959.238073-7-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430115959.238073-7-satyat@google.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jYvvc-008tns-OZ
Subject: Re: [f2fs-dev] [PATCH v12 06/12] scsi: ufs: UFS driver v2.1 spec
 crypto additions
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

On Thu, Apr 30, 2020 at 11:59:53AM +0000, Satya Tangirala wrote:
> Add the crypto registers and structs defined in v2.1 of the JEDEC UFSHCI
> specification in preparation to add support for inline encryption to
> UFS.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>

Looks good, you can add:

    Reviewed-by: Eric Biggers <ebiggers@google.com>

One nit:

> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 6ffc08ad85f63..1eebb589159d6 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -555,6 +555,12 @@ enum ufshcd_caps {
>  	 * for userspace to control the power management.
>  	 */
>  	UFSHCD_CAP_RPM_AUTOSUSPEND			= 1 << 6,
> +
> +	/*
> +	 * This capability allows the host controller driver to use the
> +	 * inline crypto engine, if it is present
> +	 */
> +	UFSHCD_CAP_CRYPTO				= (1 << 7),
>  };

The other values of this enum don't use parentheses.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

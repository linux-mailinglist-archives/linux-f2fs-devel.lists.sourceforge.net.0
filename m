Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE82B1274D1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Dec 2019 05:48:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iiADY-0006HG-Pm; Fri, 20 Dec 2019 04:48:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iiADX-0006H8-MI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Dec 2019 04:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6RbDGeIBkUW/rXA8ot6H4JduyGZWKukIrDsU3iSvnQM=; b=mDvG+gwS3yMjcuMkKdYmGzVSad
 5u+voPDEMAV0LuNFtkOnXxTB6MIllwFL713vRo/aiXXFr7aJ0E8ceqBaDh+NNg8EEsMIzfcOaRkJv
 G36nPZkdgeojMJLrhiAI9ObfJG1/CL9LzgrKV5dlbghtjwWW0VOy8DxeKjjrLaJEZ/d8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6RbDGeIBkUW/rXA8ot6H4JduyGZWKukIrDsU3iSvnQM=; b=S1QDVEn1i9s5qARZ2sIGqa2ybA
 Vgonf870KmfuWyZ6a84XsvsXzEAM6cTIIaXWOmloecVFcs8Th9cEO9xxCy1Rrckf9zQEOZgB9hF8L
 CdrczPXERSc2rQSshOSxsw1zw0hqX/AMjHZxAou+iOtSk2h6nKzjVCZlI65Ur33gXJ9I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iiADW-00Ap5x-KG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Dec 2019 04:48:47 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE98624680;
 Fri, 20 Dec 2019 04:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576817320;
 bh=JG9lA6TKxyPsQrVZPp69bCwvWZBiXcOFmTMqWztJ2MI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FlfVl8k5h5A+pN0Rd73Jym68ICrvv5/gzvjdKHAZ81xLao5L19ZMM080e9HpgkFtF
 Y9qHpiDIQchO8s19CxgxgVn+xkynNfO41KHYC3Tyl0D4gj09rYMGuQNYjqCIMbFG6C
 ft8Tdz8/nGcBIPoXD1tl6uAOj9d0JG/XGhhpWqbs=
Date: Thu, 19 Dec 2019 20:48:38 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20191220044838.GD718@sol.localdomain>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-6-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218145136.172774-6-satyat@google.com>
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
X-Headers-End: 1iiADW-00Ap5x-KG
Subject: Re: [f2fs-dev] [PATCH v6 5/9] scsi: ufs: UFS crypto API
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
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 18, 2019 at 06:51:32AM -0800, Satya Tangirala wrote:
> +/**
> + * ufshcd_hba_init_crypto - Read crypto capabilities, init crypto fields in hba
> + * @hba: Per adapter instance
> + *
> + * Return: 0 if crypto was initialized or is not supported, else a -errno value.
> + */
> +int ufshcd_hba_init_crypto(struct ufs_hba *hba)
> +{
> +	int cap_idx = 0;
> +	int err = 0;
> +	unsigned int crypto_modes_supported[BLK_ENCRYPTION_MODE_MAX];
> +	enum blk_crypto_mode_num blk_mode_num;
> +
> +	/* Default to disabling crypto */
> +	hba->caps &= ~UFSHCD_CAP_CRYPTO;
> +
> +	/* Return 0 if crypto support isn't present */
> +	if (!(hba->capabilities & MASK_CRYPTO_SUPPORT))
> +		goto out;
> +

Note that unfortunately, this patch doesn't work yet on some UFS host
controllers that claim to support the UFS standard crypto, due to issues like
deviations from the UFS standard and missing device tree changes -- and this can
even cause boot-time crashes.

So if we can't fix everything right away (which can be really hard without help
from the relevant vendor) I think we have to define a bit
UFSHCD_QUIRK_BROKEN_CRYPTO in ufs_hba::quirks which can be set on host
controllers where the proper tricks to get the crypto working correctly haven't
been figured out yet.  The crypto support would be ignored if that bit is set.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

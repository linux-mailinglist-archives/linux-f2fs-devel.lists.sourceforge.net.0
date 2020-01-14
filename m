Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A8C13B428
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jan 2020 22:17:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1irTYe-0006AM-8W; Tue, 14 Jan 2020 21:17:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1irTYc-0006AC-Jl
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jan 2020 21:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KjxKSwhl2JVBvoUuNac2VDAnPcTJIOED8DCnyJYimIQ=; b=mgqPoLl6DAfgnPB3vodiuAecK4
 xY+TC4N13JzCP9NjXBo5rkEnEGDldR6P9ixelB20jno+4nNy3VMXV/s1R9/hB/jMl3SGakji0RADK
 XYxRpY4YuUDYLAwTpezjzLIxO8lHebLEqzUdwThvetkKvTYNh5+KvDkX9wTNlW/WzP/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KjxKSwhl2JVBvoUuNac2VDAnPcTJIOED8DCnyJYimIQ=; b=DdyKel5TMvYsC86ZWf17A5YshW
 mYBWtVYTY6cllAMCB/FMLIzvaKh+ihHYRf92GNdx/cKrKZ4mxvRI6hcY74i1PWAbFi8AoS65wdrNV
 3alcbvgMhIB76J+QPbocJQipmd6rHy/+BDs2tt7OyWphwNZsh9YOXZJ1LN5W9a/kmBH8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1irTYb-003VwU-DR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jan 2020 21:17:02 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8862124658;
 Tue, 14 Jan 2020 21:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579036615;
 bh=PzGGbPQJnnJrvhracuO2jY95bGpEghQuRwTZb0zELqc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TvYuEITubu7X9Iyh7rL1YDF9fFJ6DmKcYzaM8JPSbuuQnYaWIeNMfyoIrp7LTNzzk
 AFLcvj+PHjjtph7ptkJjJNJBLMX0wQLtE9FAUBkmym2qR4do8F9NVjFgXKsK4L7j/p
 duZAnSEudfJrWbWpuKsOM+wEVqoY0d5Pnz5UL82k=
Date: Tue, 14 Jan 2020 13:16:54 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200114211653.GD41220@gmail.com>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-6-satyat@google.com>
 <20191220044838.GD718@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191220044838.GD718@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-Headers-End: 1irTYb-003VwU-DR
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

On Thu, Dec 19, 2019 at 08:48:38PM -0800, Eric Biggers wrote:
> On Wed, Dec 18, 2019 at 06:51:32AM -0800, Satya Tangirala wrote:
> > +/**
> > + * ufshcd_hba_init_crypto - Read crypto capabilities, init crypto fields in hba
> > + * @hba: Per adapter instance
> > + *
> > + * Return: 0 if crypto was initialized or is not supported, else a -errno value.
> > + */
> > +int ufshcd_hba_init_crypto(struct ufs_hba *hba)
> > +{
> > +	int cap_idx = 0;
> > +	int err = 0;
> > +	unsigned int crypto_modes_supported[BLK_ENCRYPTION_MODE_MAX];
> > +	enum blk_crypto_mode_num blk_mode_num;
> > +
> > +	/* Default to disabling crypto */
> > +	hba->caps &= ~UFSHCD_CAP_CRYPTO;
> > +
> > +	/* Return 0 if crypto support isn't present */
> > +	if (!(hba->capabilities & MASK_CRYPTO_SUPPORT))
> > +		goto out;
> > +
> 
> Note that unfortunately, this patch doesn't work yet on some UFS host
> controllers that claim to support the UFS standard crypto, due to issues like
> deviations from the UFS standard and missing device tree changes -- and this can
> even cause boot-time crashes.
> 
> So if we can't fix everything right away (which can be really hard without help
> from the relevant vendor) I think we have to define a bit
> UFSHCD_QUIRK_BROKEN_CRYPTO in ufs_hba::quirks which can be set on host
> controllers where the proper tricks to get the crypto working correctly haven't
> been figured out yet.  The crypto support would be ignored if that bit is set.

I included a patch defining UFSHCD_QUIRK_BROKEN_CRYPTO in my RFC patchset that
wires up inline crypto support on Dragonboard 845c:
https://lkml.kernel.org/linux-scsi/20200110061634.46742-4-ebiggers@kernel.org/

Satya, feel free to include that patch in v7 of your patchset.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

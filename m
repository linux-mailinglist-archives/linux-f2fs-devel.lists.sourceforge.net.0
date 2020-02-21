Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCE416862E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 19:11:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5Cll-00075i-3G; Fri, 21 Feb 2020 18:11:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j5Clk-00075b-Ht
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 18:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xf/5Dafx5t/rME+FUAkXYOq5x67aKxbM4/RJSWTANOQ=; b=ly5k5Zq5Md4cv8+ABxAB6ZqA5c
 plb5lingkrUalsnDi72MREV/OfZEiJdHUaNyRXDpt0HmzvZhsTJGDUYDAHo8Hv1kl1wEWux80u6De
 mA3xHPSUOVcTjWqzgAgtDJKtTyOlRFbHaHw1nGK+JXE2WV37yDFGYyKPWDBh7fPdqAVE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xf/5Dafx5t/rME+FUAkXYOq5x67aKxbM4/RJSWTANOQ=; b=lK9pVv4+Hbt96ZHOXxoHuKDm+m
 HUQYquGUNOT8wxa5z3fRb1oVrdRjtHGiAt9sQFO1FxCFlErI1EIx2sgyqBJI+Va+IvElREjxTvgZd
 fSl197Hrya/ohbhzZlVECX3iQ4v7H1gRjYALgvIj04ZM8o8eQRJaMQED7CHk35pD76Rg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5Clg-003Ujq-EL
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 18:11:20 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 67F44208E4;
 Fri, 21 Feb 2020 18:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582308670;
 bh=+Cb4JLP4AzzeUHtnURjqmhLOWjfrHEnJh6ZcrHPfzIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CjjOcC1DgFPJx0n0W5Nn6sNEYOnHeArMulQiOCQ4eexPuzr9eFQvsRUz0vIrVkkl1
 YVEguzqY8Go0OdhJE+DDsByPVTEPPqTi3fX5JPN9j33JL7ACiwqD4Atau7D5PoSDQ6
 Z/q7kG6l1EuZMlqYb0P1zmwE4APm4LXlkELsQOzE=
Date: Fri, 21 Feb 2020 10:11:09 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200221181109.GB925@sol.localdomain>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-7-satyat@google.com>
 <20200221172244.GC438@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221172244.GC438@infradead.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlesource.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j5Clg-003Ujq-EL
Subject: Re: [f2fs-dev] [PATCH v7 6/9] scsi: ufs: Add inline encryption
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
Cc: Ladvine D Almeida <Ladvine.DAlmeida@synopsys.com>,
 linux-ext4@vger.kernel.org, linux-scsi@vger.kernel.org,
 Kim Boojin <boojin.kim@samsung.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 Parshuram Raju Thombare <pthombar@cadence.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 21, 2020 at 09:22:44AM -0800, Christoph Hellwig wrote:
> On Fri, Feb 21, 2020 at 03:50:47AM -0800, Satya Tangirala wrote:
> > Wire up ufshcd.c with the UFS Crypto API, the block layer inline
> > encryption additions and the keyslot manager.
> > 
> > Also, introduce UFSHCD_QUIRK_BROKEN_CRYPTO that certain UFS drivers
> > that don't yet support inline encryption need to use - taken from
> > patches by John Stultz <john.stultz@linaro.org>
> > (https://android-review.googlesource.com/c/kernel/common/+/1162224/5)
> > (https://android-review.googlesource.com/c/kernel/common/+/1162225/5)
> > (https://android-review.googlesource.com/c/kernel/common/+/1164506/1)
> 
> Between all these quirks, with what upstream SOC does this feature
> actually work?

It will work on DragonBoard 845c, i.e. Qualcomm's Snapdragon 845 SoC, if we
apply my patchset
https://lkml.kernel.org/linux-block/20200110061634.46742-1-ebiggers@kernel.org/.
It's currently based on Satya's v6 patchset, but I'll be rebasing it onto v7 and
resending.  It uses all the UFS standard crypto code that Satya is adding except
for ufshcd_program_key(), which has to be replaced with a vendor-specific
operation.  It does also add vendor-specific code to ufs-qcom to initialize the
crypto hardware, but that's in addition to the standard code, not replacing it.

DragonBoard 845c is a commercially available development board that boots the
mainline kernel (modulo two arm-smmu IOMMU patches that Linaro is working on),
so I think it counts as an "upstream SoC".

That's all that we currently have the hardware to verify ourselves, though
Mediatek says that Satya's patches are working on their hardware too.  And the
UFS controller on Mediatek SoCs is supported by the upstream kernel via
ufs-mediatek.  But I don't know whether it just works exactly as-is or whether
they needed to patch ufs-mediatek too.  Stanley or Kuohong, can you confirm?

We're also hoping that the patches are usable with the UFS controllers from
Cadence Design Systems and Synopsys, which have upstream kernel support in
drivers/scsi/ufs/cdns-pltfrm.c and drivers/scsi/ufs/ufshcd-dwc.c.  But we don't
currently have a way to verify this.  But in 2018, both companies had tried to
get the UFS v2.1 standard crypto support upstream, so presumably they must have
implemented it in their hardware.  +Cc the people who were working on that.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

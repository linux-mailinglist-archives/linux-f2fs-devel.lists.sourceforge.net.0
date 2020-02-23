Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DE71697FE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 23 Feb 2020 15:03:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5rr9-0008DO-Q5; Sun, 23 Feb 2020 14:03:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stanley.chu@mediatek.com>) id 1j5rr7-0008Cq-9c
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 23 Feb 2020 14:03:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xzX/UQmBaKzzXeW3wSmoU95INRraG2xqKdLhcRv0zw0=; b=lsG+rPivNHfX4nkBiQnkDNKLc5
 GX0Lhc4tm4jVMch+JkX5koo7YzBr6W7AlXw5Xo3yw7MBSEliLQfcOyBhr5Iw49vpMS4cqjZmnoF73
 n/EY6JVUXG4xg4FX+PH3TuHGj8G8F+KY72wNbUQIocl2BWR9b0f1nE+As48w7bVo5+yY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xzX/UQmBaKzzXeW3wSmoU95INRraG2xqKdLhcRv0zw0=; b=RKNMnl7CICUETV5JQtwPj0QYVU
 fDvuCrtidD2fNtRBcyHYfwe8f526oa69huweWt/quDotbfl1XW+jMPNs7Ezk4z9Y1d/cde3JyR0I9
 oL2d6GIlRlkrbLIH36prnx2h6RilPdAzjraCFjiaWvFRGxpm1WM65lPQ05qehV1cCrls=;
Received: from [210.61.82.184] (helo=mailgw02.mediatek.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1j5rqz-004YcH-37
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 23 Feb 2020 14:03:37 +0000
X-UUID: 83b3ac7c022647e98daa2ff3fabae555-20200223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xzX/UQmBaKzzXeW3wSmoU95INRraG2xqKdLhcRv0zw0=; 
 b=cC8U13tnRxQzVl2x9qp4ks0D6qUzZqJU0gCf60mIaIrwGbkhE4J1IohyRR7jGBfGws6Jyw8Anbu2asvCqM8yomejgHOU6zwf1gnaSZPj8PA7gSK7tmBytKH3H1qWkyqIg6BWiyhyLuS+5gTBywl6XtWAVbhtMeXY9ePvg/A3G1A=;
X-UUID: 83b3ac7c022647e98daa2ff3fabae555-20200223
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1594138836; Sun, 23 Feb 2020 21:47:44 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 23 Feb 2020 21:45:04 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 23 Feb 2020 21:47:56 +0800
Message-ID: <1582465656.26304.69.camel@mtksdccf07>
From: Stanley Chu <stanley.chu@mediatek.com>
To: Eric Biggers <ebiggers@kernel.org>
Date: Sun, 23 Feb 2020 21:47:36 +0800
In-Reply-To: <20200221181109.GB925@sol.localdomain>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-7-satyat@google.com>
 <20200221172244.GC438@infradead.org> <20200221181109.GB925@sol.localdomain>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 994E6A33E05B8928D3F2EC1C5ED8840CD9FEC231CBD3D196C64A17554069603C2000:8
X-MTK: N
X-Spam-Score: 0.0 (/)
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
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.9 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j5rqz-004YcH-37
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
Cc: linux-block@vger.kernel.org,
 Ladvine D Almeida <Ladvine.DAlmeida@synopsys.com>, linux-ext4@vger.kernel.org,
 linux-scsi@vger.kernel.org, Kim
 Boojin <boojin.kim@samsung.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 Parshuram Raju Thombare <pthombar@cadence.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, Christoph Hellwig <hch@infradead.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi, 

On Fri, 2020-02-21 at 10:11 -0800, Eric Biggers wrote:
> On Fri, Feb 21, 2020 at 09:22:44AM -0800, Christoph Hellwig wrote:
> > On Fri, Feb 21, 2020 at 03:50:47AM -0800, Satya Tangirala wrote:
> > > Wire up ufshcd.c with the UFS Crypto API, the block layer inline
> > > encryption additions and the keyslot manager.
> > > 
> > > Also, introduce UFSHCD_QUIRK_BROKEN_CRYPTO that certain UFS drivers
> > > that don't yet support inline encryption need to use - taken from
> > > patches by John Stultz <john.stultz@linaro.org>
> > > (https://android-review.googlesource.com/c/kernel/common/+/1162224/5)
> > > (https://android-review.googlesource.com/c/kernel/common/+/1162225/5)
> > > (https://android-review.googlesource.com/c/kernel/common/+/1164506/1)
> > 
> > Between all these quirks, with what upstream SOC does this feature
> > actually work?
> 
> It will work on DragonBoard 845c, i.e. Qualcomm's Snapdragon 845 SoC, if we
> apply my patchset
> https://lkml.kernel.org/linux-block/20200110061634.46742-1-ebiggers@kernel.org/.
> It's currently based on Satya's v6 patchset, but I'll be rebasing it onto v7 and
> resending.  It uses all the UFS standard crypto code that Satya is adding except
> for ufshcd_program_key(), which has to be replaced with a vendor-specific
> operation.  It does also add vendor-specific code to ufs-qcom to initialize the
> crypto hardware, but that's in addition to the standard code, not replacing it.
> 
> DragonBoard 845c is a commercially available development board that boots the
> mainline kernel (modulo two arm-smmu IOMMU patches that Linaro is working on),
> so I think it counts as an "upstream SoC".
> 
> That's all that we currently have the hardware to verify ourselves, though
> Mediatek says that Satya's patches are working on their hardware too.  And the
> UFS controller on Mediatek SoCs is supported by the upstream kernel via
> ufs-mediatek.  But I don't know whether it just works exactly as-is or whether
> they needed to patch ufs-mediatek too.  Stanley or Kuohong, can you confirm?

Yes, MediaTek is keeping work closely with inline encryption patch sets.
Currently the v6 version can work well (without
UFSHCD_QUIRK_BROKEN_CRYPTO quirk) at least in our MT6779 SoC platform
which basic SoC support and some other peripheral drivers are under
upstreaming as below link,

https://patchwork.kernel.org/project/linux-mediatek/list/?state=%
2A&q=6779&series=&submitter=&delegate=&archive=both

The integration with inline encryption patch set needs to patch
ufs-mediatek and patches are ready in downstream. We plan to upstream
them soon after inline encryption patch sets get merged.

> 
> We're also hoping that the patches are usable with the UFS controllers from
> Cadence Design Systems and Synopsys, which have upstream kernel support in
> drivers/scsi/ufs/cdns-pltfrm.c and drivers/scsi/ufs/ufshcd-dwc.c.  But we don't
> currently have a way to verify this.  But in 2018, both companies had tried to
> get the UFS v2.1 standard crypto support upstream, so presumably they must have
> implemented it in their hardware.  +Cc the people who were working on that.
> 
> - Eric

Thanks,
Stanley Chu

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

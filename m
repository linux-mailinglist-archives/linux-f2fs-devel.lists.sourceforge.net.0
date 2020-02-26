Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 360C516F826
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Feb 2020 07:43:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6qPv-0007na-Dt; Wed, 26 Feb 2020 06:43:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stanley.chu@mediatek.com>) id 1j6qPt-0007nK-Uv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Feb 2020 06:43:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=apvx+VLcaGZjP80PbFYAB+4q9C0nw1KkpiRc7G/OTT0=; b=TRu3InAj9xOOGkelEZOgq1wWlq
 ZAYU/2S+3nsrBx5qO4eNDh6hqAaWnaJwqpLrtEONujtwYSRe02WwGTZ63FVFhWCftpDqzbIrgt6Z6
 Ipq0t9/u3SLlb8oPEVpbHTxhQ1eaf85Lih9e4WCl+gQnkkrnhcPnVk7wGNFqEBSLkjvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=apvx+VLcaGZjP80PbFYAB+4q9C0nw1KkpiRc7G/OTT0=; b=e7gy9KPt3Y05WCVPpwkyPC73D5
 4wM0BeLKsTHjdFsnK+XAl+mZe7DYE3aRMPRvtza3rFhU8hz+UXBnBsh4PMsj3zSgDauXHKmPgHocG
 SFkQzar5bAbxWvN+PKn4V5+BaHWzcKwIvCKcoD0jJ3PFzbLrHNzs85UE/2nmxnJjg4XU=;
Received: from [210.61.82.184] (helo=mailgw02.mediatek.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1j6qPp-00A2h7-KL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Feb 2020 06:43:33 +0000
X-UUID: 66ab466f211b4c578793ed09b5fa2993-20200226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=apvx+VLcaGZjP80PbFYAB+4q9C0nw1KkpiRc7G/OTT0=; 
 b=LQPK7eVtpWBPw8xiPHS9jB8i5vXbWpu1Tc+wAzon0iiqZYlkRoxGvNRk5L9f8fEIPVDuPfebLxbLMQ/hXl++0DzkdCCeKRpCARCKaWXWljYLlekfmNiRaFM7gwqHhecoxY5/6rmXURdQ9QAlqtXooKHkDYmChmpNE8D59xI6Z38=;
X-UUID: 66ab466f211b4c578793ed09b5fa2993-20200226
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <stanley.chu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 675364193; Wed, 26 Feb 2020 14:43:16 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 14:41:21 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 14:43:23 +0800
Message-ID: <1582699394.26304.96.camel@mtksdccf07>
From: Stanley Chu <stanley.chu@mediatek.com>
To: Eric Biggers <ebiggers@kernel.org>
Date: Wed, 26 Feb 2020 14:43:14 +0800
In-Reply-To: <20200226011206.GD114977@gmail.com>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-7-satyat@google.com>
 <20200221172244.GC438@infradead.org> <20200221181109.GB925@sol.localdomain>
 <1582465656.26304.69.camel@mtksdccf07>
 <20200224233759.GC30288@infradead.org>
 <1582615285.26304.93.camel@mtksdccf07> <20200226011206.GD114977@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.7 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j6qPp-00A2h7-KL
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

Hi Eric,

On Tue, 2020-02-25 at 17:12 -0800, Eric Biggers wrote:
> On Tue, Feb 25, 2020 at 03:21:25PM +0800, Stanley Chu wrote:
> > Hi Christoph,
> > 
> > On Mon, 2020-02-24 at 15:37 -0800, Christoph Hellwig wrote:
> > > On Sun, Feb 23, 2020 at 09:47:36PM +0800, Stanley Chu wrote:
> > > > Yes, MediaTek is keeping work closely with inline encryption patch sets.
> > > > Currently the v6 version can work well (without
> > > > UFSHCD_QUIRK_BROKEN_CRYPTO quirk) at least in our MT6779 SoC platform
> > > > which basic SoC support and some other peripheral drivers are under
> > > > upstreaming as below link,
> > > > 
> > > > https://patchwork.kernel.org/project/linux-mediatek/list/?state=%
> > > > 2A&q=6779&series=&submitter=&delegate=&archive=both
> > > > 
> > > > The integration with inline encryption patch set needs to patch
> > > > ufs-mediatek and patches are ready in downstream. We plan to upstream
> > > > them soon after inline encryption patch sets get merged.
> > > 
> > > What amount of support do you need in ufs-mediatek?  It seems like
> > > pretty much every ufs low-level driver needs some kind of specific
> > > support now, right?  I wonder if we should instead opt into the support
> > > instead of all the quirking here.
> > 
> > The patch in ufs-mediatek is aimed to issue vendor-specific SMC calls
> > for host initialization and configuration. This is because MediaTek UFS
> > host has some "secure-protected" registers/features which need to be
> > accessed/switched in secure world. 
> > 
> > Such protection is not mentioned by UFSHCI specifications thus inline
> > encryption patch set assumes that every registers in UFSHCI can be
> > accessed normally in kernel. This makes sense and surely the patchset
> > can work fine in any "standard" UFS host. However if host has special
> > design then it can work normally only if some vendor-specific treatment
> > is applied.
> > 
> > I think one of the reason to apply UFSHCD_QUIRK_BROKEN_CRYPTO quirk in
> > ufs-qcom host is similar to above case.
> 
> So, I had originally assumed that most kernel developers would prefer to make
> the UFS crypto support opt-out rather than opt-in, since that matches the normal
> Linux way of doing things.  I.e. normally the kernel's default assumption is
> that devices implement the relevant standard, and only when a device is known to
> deviate from the standard does the driver apply quirks.
> 
> But indeed, as we've investigated more vendors' UFS hardware, it seems that
> everyone has some quirk that needs to be handled in the platform driver:
> 
>   - ufs-qcom (tested on DragonBoard 845c with upstream kernel) needs
>     vendor-specific crypto initialization logic and SMC calls to set keys
> 
>   - ufs-mediatek needs the quirks that Stanley mentioned above
> 
>   - ufs-hisi (tested on Hikey960 with upstream kernel) needs to write a
>     vendor-specific register to use high keyslots, but even then I still
>     couldn't get the crypto support working correctly.
> 
> I'm not sure about the UFS controllers from Synopsys, Cadence, or Samsung, all
> of which apparently have implemented some form of the crypto support too.  But I
> wouldn't get my hopes up that everyone followed the UFS standard precisely.
> 
> So if there are no objections, IMO we should make the crypto support opt-in.
> 
> That makes it even more important to upstream the crypto support for specific
> hardware like ufs-qcom and ufs-mediatek, since otherwise the ufshcd-crypto code
> would be unusable even theoretically.  I'm volunteering to handle ufs-qcom with
> https://lkml.kernel.org/linux-block/20200110061634.46742-1-ebiggers@kernel.org/.
> Stanley, could you send out ufs-mediatek support as an RFC so people can see
> better what it involves?

Sure, I will send out our RFC patches. Please allow me some time for
submission.

Thanks,
Stanley Chu
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

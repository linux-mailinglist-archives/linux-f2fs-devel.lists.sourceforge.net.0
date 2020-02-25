Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B239116BAA5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Feb 2020 08:31:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6Ugv-0000Lx-GS; Tue, 25 Feb 2020 07:31:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stanley.chu@mediatek.com>) id 1j6Ugv-0000Lr-51
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 07:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PlAFoeZLv3yl1DNrLtJ5lhwXHfBU7bpENIh3MZoxiYA=; b=MqCRii1Scm8P6b5SxRh95xFuCb
 YtdTocORDvZu6azXIpgS1vXIWpZSkpkQaB0sUKI1WpKSRKknUatWMTcGe9mGd7/z+8pkLsszyTTm6
 HYsLlTROwWt0tP0FO1J0Zl2mBf0kzZpY+GFcWPllQ3Mk4ZsXK26oFI6Ig9Lb6nk+tzhY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PlAFoeZLv3yl1DNrLtJ5lhwXHfBU7bpENIh3MZoxiYA=; b=Cw7VekdpxqsXl7BKVXBxRbJiwY
 hlwnnTyykiFdZKvnFgkmnhCjAz6CCGnJ6aTvsqLKmbr3XQu41s2UKRLSVimFoCleOqbvicwWjvxCN
 zYSAck4wpxSKZgeaf0SAdR1sOq5OqRFMy68BZT5jSPrNUu5AD4/sbXOUB6/WUKmV4lt0=;
Received: from [210.61.82.183] (helo=mailgw01.mediatek.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1j6Ugs-005jIO-91
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 07:31:41 +0000
X-UUID: c48abae84cc14d3a9f6612981b2feae3-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PlAFoeZLv3yl1DNrLtJ5lhwXHfBU7bpENIh3MZoxiYA=; 
 b=hDN9ebhS0qLFNFnIpNSWd+pVCu3tZtv8DLG1dzuO+lunq8we8otu7OCMl4ArxSpNat/j5KOOiwfRiL/dhoC43DIh4hDUzhThq3qRXyTnY8B0NjsEfL+dJ71lSLooFXET1z+hykUK6Ybc+GQVMLtMKms0AYJ4G23qqbbmvdk6FCI=;
X-UUID: c48abae84cc14d3a9f6612981b2feae3-20200225
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 215015611; Tue, 25 Feb 2020 15:21:26 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 15:19:33 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 25 Feb 2020 15:21:12 +0800
Message-ID: <1582615285.26304.93.camel@mtksdccf07>
From: Stanley Chu <stanley.chu@mediatek.com>
To: Christoph Hellwig <hch@infradead.org>
Date: Tue, 25 Feb 2020 15:21:25 +0800
In-Reply-To: <20200224233759.GC30288@infradead.org>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-7-satyat@google.com>
 <20200221172244.GC438@infradead.org> <20200221181109.GB925@sol.localdomain>
 <1582465656.26304.69.camel@mtksdccf07>
 <20200224233759.GC30288@infradead.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-Spam-Score: 0.0 (/)
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
 -0.9 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j6Ugs-005jIO-91
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
Cc: linux-block@vger.kernel.org, Ladvine D
 Almeida <Ladvine.DAlmeida@synopsys.com>, linux-ext4@vger.kernel.org,
 linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Parshuram Raju Thombare <pthombar@cadence.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Christoph,

On Mon, 2020-02-24 at 15:37 -0800, Christoph Hellwig wrote:
> On Sun, Feb 23, 2020 at 09:47:36PM +0800, Stanley Chu wrote:
> > Yes, MediaTek is keeping work closely with inline encryption patch sets.
> > Currently the v6 version can work well (without
> > UFSHCD_QUIRK_BROKEN_CRYPTO quirk) at least in our MT6779 SoC platform
> > which basic SoC support and some other peripheral drivers are under
> > upstreaming as below link,
> > 
> > https://patchwork.kernel.org/project/linux-mediatek/list/?state=%
> > 2A&q=6779&series=&submitter=&delegate=&archive=both
> > 
> > The integration with inline encryption patch set needs to patch
> > ufs-mediatek and patches are ready in downstream. We plan to upstream
> > them soon after inline encryption patch sets get merged.
> 
> What amount of support do you need in ufs-mediatek?  It seems like
> pretty much every ufs low-level driver needs some kind of specific
> support now, right?  I wonder if we should instead opt into the support
> instead of all the quirking here.

The patch in ufs-mediatek is aimed to issue vendor-specific SMC calls
for host initialization and configuration. This is because MediaTek UFS
host has some "secure-protected" registers/features which need to be
accessed/switched in secure world. 

Such protection is not mentioned by UFSHCI specifications thus inline
encryption patch set assumes that every registers in UFSHCI can be
accessed normally in kernel. This makes sense and surely the patchset
can work fine in any "standard" UFS host. However if host has special
design then it can work normally only if some vendor-specific treatment
is applied.

I think one of the reason to apply UFSHCD_QUIRK_BROKEN_CRYPTO quirk in
ufs-qcom host is similar to above case.

Thanks,
Stanley Chu


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

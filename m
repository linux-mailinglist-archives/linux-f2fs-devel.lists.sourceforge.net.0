Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D68EB1756C7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Mar 2020 10:18:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j8hDA-00079n-LD; Mon, 02 Mar 2020 09:18:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stanley.chu@mediatek.com>) id 1j8hD9-000798-4Q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Mar 2020 09:18:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tm2dGLrDuwKIqwWQ0m6yCuCCVqgYcKl6heBDIiRcfnw=; b=LsyHdmJF5rDzPQej2uN6HMZY7T
 VgakIf30/qYuJ1aWt+raOay3ZL/8sKbR4fFpF6rNW8GZbfxBtkbXl0YxqYAbMpe7vumQBnHz3nVVY
 bp4GnybqV9Op8Y9ojitRinE5NTVxDxJbxAP/8ViKG6STnJcuBzpE10UFbiPujqR0SMRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tm2dGLrDuwKIqwWQ0m6yCuCCVqgYcKl6heBDIiRcfnw=; b=ElD1bjW0pqnrSR88A9bYN6IJYN
 V2B6lPaW70iN85soat2gFnOs0VskbuXZOttfBSfY8Hp6LVBLJpbsvYN9KW2qKoFqOzDGmRYYYf0Qt
 O7Epb4nzQxQfUJywku5aLKxP34vG47QHuXE3gGP3F3gyaXE0R7BNoh6vrJRbgVs/2Xl8=;
Received: from [210.61.82.183] (helo=mailgw01.mediatek.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1j8hD1-00ESdQ-NK
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Mar 2020 09:18:03 +0000
X-UUID: f41c14b013444c8b8059cd4b70c15acd-20200302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Tm2dGLrDuwKIqwWQ0m6yCuCCVqgYcKl6heBDIiRcfnw=; 
 b=m/hQqlwlZqZcCb/1QUp0UCExNYbrk9++KsBF02NmBy/z0LHTDcXsjFrTuG1Zf3urS9X368of4Ko+LS0URaE24EUuO7V75ePvrrl8slLb7iiq+MjRAcUPr8//p0xJT6OkDqOd4GCkNnoFx4lylvtBkyXV4fqCQ5hG4JDNusRWGwU=;
X-UUID: f41c14b013444c8b8059cd4b70c15acd-20200302
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1936260261; Mon, 02 Mar 2020 17:17:43 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Mar 2020 17:15:37 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 2 Mar 2020 17:17:04 +0800
Message-ID: <1583140656.10509.2.camel@mtksdccf07>
From: Stanley Chu <stanley.chu@mediatek.com>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 2 Mar 2020 17:17:36 +0800
In-Reply-To: <1582699394.26304.96.camel@mtksdccf07>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-7-satyat@google.com>
 <20200221172244.GC438@infradead.org> <20200221181109.GB925@sol.localdomain>
 <1582465656.26304.69.camel@mtksdccf07>
 <20200224233759.GC30288@infradead.org>
 <1582615285.26304.93.camel@mtksdccf07> <20200226011206.GD114977@gmail.com>
 <1582699394.26304.96.camel@mtksdccf07>
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
X-Headers-End: 1j8hD1-00ESdQ-NK
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
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Ladvine D Almeida <Ladvine.DAlmeida@synopsys.com>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?=
 <kuohong.wang@mediatek.com>, Parshuram Raju Thombare <pthombar@cadence.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, Christoph Hellwig <hch@infradead.org>,
 "linux-fscrypt@vger.kernel.org" <linux-fscrypt@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric and all,

On Wed, 2020-02-26 at 14:43 +0800, Stanley Chu wrote:
> Hi Eric,
> 
> On Tue, 2020-02-25 at 17:12 -0800, Eric Biggers wrote:

> > 
> > I'm not sure about the UFS controllers from Synopsys, Cadence, or Samsung, all
> > of which apparently have implemented some form of the crypto support too.  But I
> > wouldn't get my hopes up that everyone followed the UFS standard precisely.
> > 
> > So if there are no objections, IMO we should make the crypto support opt-in.
> > 
> > That makes it even more important to upstream the crypto support for specific
> > hardware like ufs-qcom and ufs-mediatek, since otherwise the ufshcd-crypto code
> > would be unusable even theoretically.  I'm volunteering to handle ufs-qcom with
> > https://lkml.kernel.org/linux-block/20200110061634.46742-1-ebiggers@kernel.org/.
> > Stanley, could you send out ufs-mediatek support as an RFC so people can see
> > better what it involves?
> 
> Sure, I will send out our RFC patches. Please allow me some time for
> submission.

The ufs-mediatek RFC patch is uploaded as
https://patchwork.kernel.org/patch/11415051/

This patch is rebased to the latest wip-inline-encryption branch in
Eric Biggers's git:
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/

Thanks,
Stanley Chu

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

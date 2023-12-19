Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B91F6818565
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Dec 2023 11:38:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFXUi-0005eU-Qj;
	Tue, 19 Dec 2023 10:38:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1rFXUh-0005eN-B8
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 10:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GuKo81d+ZgXaWDIqIqaFeV+6nzSdLOAzkziHliIAKfg=; b=UeTR6WXP65dJcDE2b3ivEWrYwr
 V1cmbF3PdVLt4OyokIkUgu5fABjqUMEVcONBFS9M2PZwbrWIjXkBVptMMPZGf9zKc4FNu4I71UmUO
 kCgZbmZ6hFbpNRi0YC3dMwX680DfPO2Qr6oLvl3/oAW+hXHhFCAKCwe6DAxVkbWVLcK0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GuKo81d+ZgXaWDIqIqaFeV+6nzSdLOAzkziHliIAKfg=; b=OIUXAhOeNNQTdVNk0IoN5cYzWL
 SnXXsOJHjqB6Aw1q1Xmn/MO2spQ8NsN5mdTfmcKChLpQb5IPrsIFgyEQ+ty6NeGWfwjAEyTjddhh7
 VLmnzu3G7817kyi5tX+DruUT303fLz6dIb4Zhh2g2xFLiIBiipFULxq0Pa9yfbogLI9s=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFXUf-000283-W9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 10:38:35 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id A192468BFE; Tue, 19 Dec 2023 11:38:25 +0100 (CET)
Date: Tue, 19 Dec 2023 11:38:25 +0100
From: "hch@lst.de" <hch@lst.de>
To: Damien Le Moal <dlemoal@kernel.org>
Message-ID: <20231219103825.GB14379@lst.de>
References: <20231217165359.604246-1-hch@lst.de>
 <20231217165359.604246-4-hch@lst.de>
 <b4d33dc359495c6227a3f20285566eed27718a14.camel@mediatek.com>
 <190f58f7-2ed6-46f8-af59-5e167a0bddeb@kernel.org>
 <f19c41b9ea990e6da734b6c81caeebb73fb60b29.camel@mediatek.com>
 <do3ekgymdpa4skyz5p3dp6qcqq7zuty73qrpmftszmffunnxpm@fyswyalaxzfq>
 <dbc4a5b4296effd88ba0ef939aa324df0969545c.camel@mediatek.com>
 <0a329050-0010-47cb-8c7b-a2f0863a21e8@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a329050-0010-47cb-8c7b-a2f0863a21e8@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Dec 19, 2023 at 05:12:41PM +0900,
 Damien Le Moal wrote:
 > >> Since we cannot create lambda as in other fancy languages, we need >
 >> two > >> functions... > > > > Not really, there is a "void [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rFXUf-000283-W9
Subject: Re: [f2fs-dev] [PATCH 3/5] block: remove support for the host aware
 zone model
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
Cc: "Naohiro.Aota@wdc.com" <Naohiro.Aota@wdc.com>,
 "axboe@kernel.dk" <axboe@kernel.dk>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 Chun-Hung Wu =?utf-8?B?KOW3q+mnv+Wujyk=?= <Chun-hung.Wu@mediatek.com>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Ed Tsai =?utf-8?B?KOiUoeWul+i7kik=?= <Ed.Tsai@mediatek.com>,
 "hch@lst.de" <hch@lst.de>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Dec 19, 2023 at 05:12:41PM +0900, Damien Le Moal wrote:
> >> Since we cannot create lambda as in other fancy languages, we need
> >> two
> >> functions...
> > 
> > Not really, there is a "void *data" can be used.
> > 
> > The device_is_zoned_model() is just the same as the device_not_zoned()
> > with (bool *)data = false.
> > 
> > It's very minor, so is okay to ignore my preference.
> 
> Send a patch on top of Christoph's series if you want to clean this up.

I'll need to respin anyway, so I'll look into incorporating the
suggestion.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

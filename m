Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C4281873C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Dec 2023 13:17:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFZ27-0000pa-VJ;
	Tue, 19 Dec 2023 12:17:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1rFZ20-0000p2-Eq
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 12:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zuGhO8i3ZiSAExfeQ5Od0dl4I/eaGPN8DqgVTFU9kew=; b=MUA7b/SRWn9FA7GMnu1NZhIypo
 dCRMplxxTvgCvyg2y0SEjV+jBQ+KuNjxDTWzNtX5ovbAbULsIoo8C6Y3PXThWz3XGIy0JKIe0bUBj
 EmJu+PMIpCem4sgOCw+SYrvDT7cH5TUMl7yHsfcXFpp7tjsC7c8GnsCQ+kE2EaKW0kBc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zuGhO8i3ZiSAExfeQ5Od0dl4I/eaGPN8DqgVTFU9kew=; b=lKKrSUoE7V0//rIaLojI5uTEab
 mrJsHADpA0npo2psuZnrYO0d/KXAgb1ACupfwpFR5PGlZF3RyAvh9M7epS2GssoeUv8FHE2VlCnGu
 AWLA2MqmlxF5Ay5AYBwKbWHgG8JwniFLFB1MC00d6tN6Ap7B1Zo2wIuCweUaSCSQ5RsI=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFZ1z-0003Zp-Tk for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 12:17:04 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 01BCC68BFE; Tue, 19 Dec 2023 13:16:49 +0100 (CET)
Date: Tue, 19 Dec 2023 13:16:49 +0100
From: "hch@lst.de" <hch@lst.de>
To: Damien Le Moal <dlemoal@kernel.org>
Message-ID: <20231219121649.GA21736@lst.de>
References: <20231217165359.604246-1-hch@lst.de>
 <20231217165359.604246-4-hch@lst.de>
 <b4d33dc359495c6227a3f20285566eed27718a14.camel@mediatek.com>
 <190f58f7-2ed6-46f8-af59-5e167a0bddeb@kernel.org>
 <f19c41b9ea990e6da734b6c81caeebb73fb60b29.camel@mediatek.com>
 <do3ekgymdpa4skyz5p3dp6qcqq7zuty73qrpmftszmffunnxpm@fyswyalaxzfq>
 <dbc4a5b4296effd88ba0ef939aa324df0969545c.camel@mediatek.com>
 <0a329050-0010-47cb-8c7b-a2f0863a21e8@kernel.org>
 <20231219103825.GB14379@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231219103825.GB14379@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Dec 19, 2023 at 11:38:25AM +0100, hch@lst.de wrote:
 > > > It's very minor, so is okay to ignore my preference. > > > > Send a
 patch on top of Christoph's series if you want to clean this up. > [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rFZ1z-0003Zp-Tk
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

On Tue, Dec 19, 2023 at 11:38:25AM +0100, hch@lst.de wrote:
> > > It's very minor, so is okay to ignore my preference.
> > 
> > Send a patch on top of Christoph's series if you want to clean this up.
> 
> I'll need to respin anyway, so I'll look into incorporating the
> suggestion.

I did look into it and the iterate callbacks confuse the heck out of me.
So I'm not going to touch them in non-trivial ways here and will leave
it for follow on cleanups as needed.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A807C8173A2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Dec 2023 15:33:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFEgT-0000ZA-B1;
	Mon, 18 Dec 2023 14:33:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1rFEgQ-0000Z3-OV
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Dec 2023 14:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/jjBsrYRAddTbQkFQfTX1XQ2G9N0xboaukV6pMBgTX0=; b=TIaBI8xjJEHWTmoi1wBfDbQNcK
 GkaOKqlOrNkKoUoVpLtvNy4T8b/KSbbkOt4vv2fq6N8aNHrn++eL9t5yUd8NuOiypSmJ5cF78LJLu
 qnokSsXT7nuED7RLuHXEaqPwdp8IMfkdsf6aAsdV8CuSAtBTsOBeYvrfmrWYsOnxxA8k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/jjBsrYRAddTbQkFQfTX1XQ2G9N0xboaukV6pMBgTX0=; b=UjQSEwiSzSy3sDE+NON73e3Sas
 kQeEZ6TENNOgwxH6nDBX/XUwaPdwrl3tqNDG6Gt2WJm/lRzgxMyAPjeP/eFohgrhPuN57d5KIpGWZ
 R1S2etjjIyV8XbyfkOd7eSy6uNh2ecu3NvtQ2Mt6VMWDMRu0GSurT2pB//ozxcs9KkLY=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFEgM-0005wv-3c for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Dec 2023 14:33:26 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id DE8E168AFE; Mon, 18 Dec 2023 15:33:09 +0100 (CET)
Date: Mon, 18 Dec 2023 15:33:09 +0100
From: Christoph Hellwig <hch@lst.de>
To: Damien Le Moal <dlemoal@kernel.org>
Message-ID: <20231218143309.GA16810@lst.de>
References: <20231217165359.604246-1-hch@lst.de>
 <20231217165359.604246-4-hch@lst.de>
 <09f1adfe-90b5-445c-b7f6-ae4fc7a9666a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09f1adfe-90b5-445c-b7f6-ae4fc7a9666a@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Dec 18, 2023 at 06:48:43PM +0900,
 Damien Le Moal wrote:
 > > - if (devip->zmodel == BLK_ZONED_HA) > > - arr[4] = 1 << 4; /* zoned
 field = 01b */ > > I think we should keep everything related to [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rFEgM-0005wv-3c
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
Cc: Jens Axboe <axboe@kernel.dk>, dm-devel@lists.linux.dev,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 virtualization@lists.linux.dev, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Dec 18, 2023 at 06:48:43PM +0900, Damien Le Moal wrote:
> > -	if (devip->zmodel == BLK_ZONED_HA)
> > -		arr[4] = 1 << 4;	/* zoned field = 01b */
> 
> I think we should keep everything related to HA in scsi debug as that is an easy
> way to test the block layer and scsi. no ?

Yes.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

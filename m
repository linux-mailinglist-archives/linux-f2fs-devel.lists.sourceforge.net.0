Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBA3727A31
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Jun 2023 10:41:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q7BDB-00078S-N5;
	Thu, 08 Jun 2023 08:41:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1q7BDA-00077p-LQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 08:41:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GAAIRqqkx4vBaceVmFUxkRJ9Ec6cSuVyQKnbanRnmp8=; b=hvx0shM6sBYVtfiYvk3HnRNoiS
 KQvDLiAzloDyMexn4b1v0dKWXr0Rfv1NhTMFhgvIDjNsNcX747ng75BelrQSadNehBG65Qky+vJu3
 iQzfLQIcw31//fhfwD73e7ZTWLfvf8WfegfAxlkRvYWM7GYflaYI1CXG/mADmqtAW2KI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GAAIRqqkx4vBaceVmFUxkRJ9Ec6cSuVyQKnbanRnmp8=; b=PhUvfojBMiqCvJB/NylHsG/sLF
 IDfz1LIIQaHNwgR8uvbmpqCgTt0ZUOBKPU2g90Ly6DanMweNKBjKHycWffY+Dy6kDp1rWsh9JJSe5
 9wLlEAqpF5yr+e66ydEgZGS8H3f6Pvo71rjY9bEOwPEF+x8G5SSjy11IeyBKp3ksZ5xI=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q7BD9-00EWsU-IE for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 08:41:41 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9341068BFE; Thu,  8 Jun 2023 10:41:29 +0200 (CEST)
Date: Thu, 8 Jun 2023 10:41:29 +0200
From: Christoph Hellwig <hch@lst.de>
To: Phillip Potter <phil@philpotter.co.uk>
Message-ID: <20230608084129.GA14689@lst.de>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-7-hch@lst.de> <ZH+6qd1W75G49P7p@equinox>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZH+6qd1W75G49P7p@equinox>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 07, 2023 at 12:00:57AM +0100,
 Phillip Potter wrote:
 > Looks good, thanks. > > Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
 Hmm,
 these signoffs don't really make sense here. Were they intended as
 Reviewed-bys?
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q7BD9-00EWsU-IE
Subject: Re: [f2fs-dev] [PATCH 06/31] cdrom: remove the unused mode argument
 to cdrom_release
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Chris Mason <clm@fb.com>, dm-devel@redhat.com,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Pavel Machek <pavel@ucw.cz>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jack Wang <jinpu.wang@ionos.com>,
 Christoph Hellwig <hch@lst.de>, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 07, 2023 at 12:00:57AM +0100, Phillip Potter wrote:
> Looks good, thanks.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>

Hmm, these signoffs don't really make sense here.  Were they intended
as Reviewed-bys?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

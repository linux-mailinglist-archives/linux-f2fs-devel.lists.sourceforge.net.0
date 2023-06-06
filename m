Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBD0723C00
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jun 2023 10:40:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6SFI-0004SF-Sq;
	Tue, 06 Jun 2023 08:40:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1q6SFH-0004S8-Nt
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 08:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WcRxDdb3Mc4cvqAtyQu/VMBqgakZKB2/wbXVOO8uQ1A=; b=GpDzlyTgcaz1L1/EWx0b+qPBJ4
 a7BpqMfpWR1BpJOLtp4v2wTnVFTUwr/S8L9IUawy2HZV8uEN1hhi37btdBPIwl5kFXN0RtDp0cGIa
 b5QvuQXnaEo9u9ijMNjuwZW/Guh/yqx19dNkNoeuYgydFiR5XLrx3DMXajGrd63gv9Ds=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WcRxDdb3Mc4cvqAtyQu/VMBqgakZKB2/wbXVOO8uQ1A=; b=fF69NIZwHKiVtx6W+KI2B8srjD
 fjVO/8zMl1um2vwQcq8fIVE2HWwNUcvO0zlsrGV1nm5YZvBJwImpFwh5JLELg+L24QcF84wqvLZ4C
 xcTB+gTNsZ/ERi+VGRiqr8pdWb/sPQaDeR5uSvcJCJOx+o0DlANpDG4mofVkDv23pwpk=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6SFH-00CYky-3r for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 08:40:52 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4EBBF67373; Tue,  6 Jun 2023 10:40:42 +0200 (CEST)
Date: Tue, 6 Jun 2023 10:40:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <20230606084042.GA30379@lst.de>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606-raumtemperatur-languste-045c5472f6a0@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606-raumtemperatur-languste-045c5472f6a0@brauner>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 06, 2023 at 10:27:14AM +0200, Christian Brauner
 wrote: > On Tue, Jun 06, 2023 at 09:39:19AM +0200, Christoph Hellwig wrote:
 > > Hi all, > > > > this series adds a new blk_mode_t for block [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q6SFH-00CYky-3r
Subject: Re: [f2fs-dev] decouple block open flags from fmode_t
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
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, Christoph Hellwig <hch@lst.de>,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 06, 2023 at 10:27:14AM +0200, Christian Brauner wrote:
> On Tue, Jun 06, 2023 at 09:39:19AM +0200, Christoph Hellwig wrote:
> > Hi all,
> > 
> > this series adds a new blk_mode_t for block open flags instead of abusing
> 
> Trying to look at this series applied but doesn't apply cleanly for
> anything v6.4-rc* related. What tree is this on?

Jens' for-6.5/block tree.

I also have a git tree here:

    git://git.infradead.org/users/hch/block.git blk-open-release

Gitweb:

    http://git.infradead.org/users/hch/block.git/shortlog/refs/heads/blk-open-release


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

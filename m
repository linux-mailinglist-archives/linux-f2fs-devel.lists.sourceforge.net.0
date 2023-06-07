Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5DA725943
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 11:03:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6p4f-0003yi-3h;
	Wed, 07 Jun 2023 09:03:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1q6p4d-0003yS-ET
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 09:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3c7Q4wKRdmA1MQcEV1xnhu6LCilclGTs//lC74QnyLc=; b=DVI3OJCZSdU9T3huk6ptRgHjML
 joO8NYZM06ZpxZmq9RWc0KDY2KUMZOdivT12GWtjkjVDJwUOxvYNcqBzmSteVWWDp9JIMRmrRiUL2
 k7V3Ndp1xFgE7HCMaV+89XGbQBmvf1a5tuaq6Db7G17S6/+TrNcPGtbOrcmT8wAKV2zA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3c7Q4wKRdmA1MQcEV1xnhu6LCilclGTs//lC74QnyLc=; b=VfNsgQv/FUdAKi92f25TINOVRX
 FeehwZWXTZHoP8KMbVCWmL1fNJNln3pZBmuyjhOmZd/MMZueztgLqi8LVfr6q2eh3CWgdr6SU87XR
 FexCKO8z9n6ihJ3QO/tSsvkIs9gm+m+P7nUzxF0Y4+4Eo6Lwb7JGrl3W6Boezr5ypfNY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6p4d-00DXg5-Np for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 09:03:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DC4E61E0B;
 Wed,  7 Jun 2023 09:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCCDC433D2;
 Wed,  7 Jun 2023 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686128597;
 bh=q7AdZhSDALKQcnwiboxtavjTYhFCYH416kEbuBo82ZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LmFv4NUDSWWO12W7cnryBDYV8PpqTiV6m9IiQfaN+Gy1TfavMxnrDvH/1VFaqu0VY
 pNdbYyRHzF2xHsOOKI87miWMENWlYg9+fsdmVVKTz7wYCo6GM1+2x+3dTWnt7WYDdZ
 Mcjyuj+xp5weCEAYKk11qk0vTGQUIzOnBLlKJpx07Q5ZRsx7ASXqBbtAW0ZLkT7Ew4
 zBKVTwzdquqRp3RuennzrpOsYTw2sC0VjBfUPhiyrzzFVaAdPGx6+N+quMH0El0KVh
 SXVIETbMrhU8sh4IsaqUJwCWqqtEaM+3Y6KO5/S9XwefBpx2SMbZ5aVq7LqHVJcaJB
 5ShZ62p5oKScw==
Date: Wed, 7 Jun 2023 11:03:09 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230607-kernkompetenz-halbleiter-b8874bc39061@brauner>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-27-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606073950.225178-27-hch@lst.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 06, 2023 at 09:39:45AM +0200, Christoph Hellwig
 wrote: > All these helpers are only used in core block code, so move them
 out of > the public header. > > Signed-off-by: Christoph Hellwig < [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q6p4d-00DXg5-Np
Subject: Re: [f2fs-dev] [PATCH 26/31] block: move a few internal definitions
 out of blkdev.h
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
 Jack Wang <jinpu.wang@ionos.com>, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 06, 2023 at 09:39:45AM +0200, Christoph Hellwig wrote:
> All these helpers are only used in core block code, so move them out of
> the public header.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good to me,
Acked-by: Christian Brauner <brauner@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

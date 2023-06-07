Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB045725EBE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 14:19:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6s89-0007zJ-0U;
	Wed, 07 Jun 2023 12:19:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1q6s81-0007zB-9v
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 12:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G1xVSMT4nYeIjHeAvG7KBUYvK0CX2nm2f0U1ZadXKG8=; b=cqRClxjjIJ5XNuOxedliWdCjXU
 b2sFgferb1Py6XfFLXrgahLwtQAHjBlrPqhVqzS+gUpADLrRHTuefSpRCul0hIuh0mhzXSfNfh5Dt
 L+fete4Ha+1cyAExT/hohtbEHbAJjsibSw1E57g5RRqig0a9Wu/UmS7TA16O+ubJV3i8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G1xVSMT4nYeIjHeAvG7KBUYvK0CX2nm2f0U1ZadXKG8=; b=BLk6mRliqWheKJk2LJRGNioDGT
 LDTX9Us4d1wq/+ObPRPQvrf9gEvVszPHLpTy70THw9NOp8FJgJEJEQ3W6QJd9oqyWBVHsBwglY8Jv
 MxsR0ewNzb8Js7hjk6WMNOyRFCH3ELmbCdx/TTeK0CocBM7LJSXfSFZo6hFbkWPogmHQ=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6s7v-0003JC-7d for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 12:19:00 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id AC1196732D; Wed,  7 Jun 2023 14:18:50 +0200 (CEST)
Date: Wed, 7 Jun 2023 14:18:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <20230607121850.GA14396@lst.de>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-31-hch@lst.de>
 <20230607-verjagen-weise-4fb3d76a6313@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607-verjagen-weise-4fb3d76a6313@brauner>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 07, 2023 at 11:24:55AM +0200, Christian Brauner
 wrote: > On Tue, Jun 06, 2023 at 09:39:49AM +0200, Christoph Hellwig wrote:
 > > Store the file struct used as the holder in file->private_da [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1q6s7v-0003JC-7d
Subject: Re: [f2fs-dev] [PATCH 30/31] block: store the holder in
 file->private_data
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

On Wed, Jun 07, 2023 at 11:24:55AM +0200, Christian Brauner wrote:
> On Tue, Jun 06, 2023 at 09:39:49AM +0200, Christoph Hellwig wrote:
> > Store the file struct used as the holder in file->private_data as an
> > indicator that this file descriptor was opened exclusively to  remove
> > the last use of FMODE_EXCL.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> 
> Feels a bit odd to store the object itself but anyway,
> Acked-by: Christian Brauner <brauner@kernel.org>

We could literally store anything we want.  The only reason I picked the
file is because: a) we have it around and b) that allows passing it
to blkdev_put without a branch in blkdev_release.

If you prefer something else I can change it.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1690FAA9E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Nov 2019 08:06:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUmje-0001wE-Tq; Wed, 13 Nov 2019 07:06:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+b6a0ef5c1751a0763e03+5925+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iUmjd-0001w7-Gi
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 07:06:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1z4quAOHH2Akat4uFIdPYFiZ0oXjyTLqx8trezJXJOE=; b=F/rpPAjARaFpGSQInzTf+Y4kdu
 5bw0ApyOGynlU1T4r/85kPXCbi5QU0P1mMFkJm0I/hLkQTTKJcoHUsectmySFx9Gwfb40oFI5E/Nn
 jXibPqKjvct3OeTWbK/A+guZZ/NxEw14/vpW9560joCymRRTY5f98V1bJM/9jjisenng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1z4quAOHH2Akat4uFIdPYFiZ0oXjyTLqx8trezJXJOE=; b=FrlfW8mlsG+51VtvAwRPYe1U6x
 JiF2nyXy+sxJbwtavNuolEh5UHel+mELqKYg38b4go8nNX15eM0zQ0Lalpf+CiSxmCRZQyYQR1Odp
 isogGH82byAP8Kk5OWcav7mR5SwiinMk2CZHGiEiZTpk9zJkSPubYLWDwsW7UrQlUshM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUmjc-00EWmB-8A
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 07:06:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1z4quAOHH2Akat4uFIdPYFiZ0oXjyTLqx8trezJXJOE=; b=MyIrNe5mUezegC2u6ULNi0+gJ
 ME+X2vwWbZIufGKaV754XdMvgg+zFcIkjyQvZeomdj76+mejRK8cHujSTlk9ugc9rvgry26a2mZ6I
 1CZQjBB5Abe66yE7rH3gMXWDsJaCjJaLSJpQ0y2RQL79+ejjfPgILbZuyuzzweG7uZuhbDJ+9nKcD
 DR2hdlMY0OSrr1U1zaXNZjljqMnM6LP+v3NyCVU3F52DWjOOB8fMjbh0cBDb1AdAVwjAQAO3BwlaO
 Vzsx6/qYx0xBM9QoF9Jft1YKisv6p07SEWVLJU8mE9NSFONvuenbp8prkcu5RcIUVTTutCl87M8OS
 5c6uiYuaQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iUmjC-0004ha-QZ; Wed, 13 Nov 2019 07:06:10 +0000
Date: Tue, 12 Nov 2019 23:06:10 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20191113070610.GA17875@infradead.org>
References: <20191111023930.638129-1-damien.lemoal@wdc.com>
 <a0c1c1bf-d6e5-8be1-ed99-6bfed3483d1d@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a0c1c1bf-d6e5-8be1-ed99-6bfed3483d1d@kernel.dk>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iUmjc-00EWmB-8A
Subject: Re: [f2fs-dev] [PATCH v2 0/9] Zoned block device enhancements and
 zone report rework
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, dm-devel@redhat.com, linux-scsi@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 12, 2019 at 07:16:39PM -0700, Jens Axboe wrote:
> We're taking branching to new levels... I created for-5.5/zoned for this,
> which is for-5.5/block + for-5.5/drivers + for-5.5/drivers-post combined.
> The latter is a branch with the SCSI dependencies from Martin pulled in.

So I guess the report of the partitioning series has to go on top of
that?  Let me try..


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

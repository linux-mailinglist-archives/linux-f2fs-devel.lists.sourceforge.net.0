Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAD1304137
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Jan 2021 16:01:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4PqI-0000Yy-Nu; Tue, 26 Jan 2021 15:01:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+b7a2078c382f6036dc0e+6365+infradead.org+hch@casper.srs.infradead.org>)
 id 1l4PqH-0000Yj-S9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tvv/hngq/dBU/TVoa7iwWv/YX1vhiuaE4wP7JKrNMhk=; b=nC8/q9+r1LCnXwNttKHn6KdKhQ
 mYlazHgNMrwSS7rXKD3AACCvnGuU3V6k10ngTWC29FswRGWYRKi8rH/sqMgJGrzJ0Mm+Mkp09HhMi
 G5JXLI6V2e6zbiG4q7iPwgmMOEqSNcbyedzsb1aPqPJbtKaA7CFWGHI+pqWEQ5DIVVhs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tvv/hngq/dBU/TVoa7iwWv/YX1vhiuaE4wP7JKrNMhk=; b=fVxQpeJI5SkQPuNigjxFtDvt98
 L0afEwy/TrSvOk4qf3KCNpaEGagUKTexhD1tPQ1Cy8Ol0bVCDL0ppwdQyfbTlEkIr9gk39lNtZxP7
 FwPlMv94+OaBCySNAAFxWq2WyMXVSoXsbfhRSauS2kg1+xVOKG/vFBQCAUBLwf2IhJNk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4Pq8-00AL70-Vp
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Tvv/hngq/dBU/TVoa7iwWv/YX1vhiuaE4wP7JKrNMhk=; b=k+FYANNOZNSV7d80UmzTAyJIKL
 sjR3uLRaK2TwHcBUsVcl9IndBEPxYkEu006OvPkkzK4tvMff5Z+dVhL0IjaUHx8BBuZ0yyw0kvg4G
 U3KPy3sIpICR9kG1TUy5jK8QjcY8sM8tPsbnAwnAg6bU60/F72Zv6QiuZCxnnZ+olHIVHWG6zEu9H
 vbj18B9ZyF73S0P0GskthCvFSLA42B1MNOQoLGT1DCJY5RV9hIWsDq7qtgSf3bFvuu11dMCIUC78m
 O5PhvXXW4p1xsC37+azC3ghr00JUxWPW0MIn1botrn443lpgRWINUt2FYChxfCgxAeBHpwqT6P5I5
 ybwQ3v+w==;
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l4Pl3-005mG9-Rr; Tue, 26 Jan 2021 14:56:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:32 +0100
Message-Id: <20210126145247.1964410-3-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126145247.1964410-1-hch@lst.de>
References: <20210126145247.1964410-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l4Pq8-00AL70-Vp
Subject: [f2fs-dev] [PATCH 02/17] btrfs: use bio_kmalloc in __alloc_device
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
Cc: Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org, dm-devel@redhat.com,
 drbd-dev@lists.linbit.com, Naohiro Aota <naohiro.aota@wdc.com>,
 linux-nilfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 linux-nfs@vger.kernel.org, Coly Li <colyli@suse.de>,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-block@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use bio_kmalloc instead of open coding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/volumes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 0a6de859eb2226..584ba093cf4966 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -421,7 +421,7 @@ static struct btrfs_device *__alloc_device(struct btrfs_fs_info *fs_info)
 	 * Preallocate a bio that's always going to be used for flushing device
 	 * barriers and matches the device lifespan
 	 */
-	dev->flush_bio = bio_alloc_bioset(GFP_KERNEL, 0, NULL);
+	dev->flush_bio = bio_kmalloc(GFP_KERNEL, 0);
 	if (!dev->flush_bio) {
 		kfree(dev);
 		return ERR_PTR(-ENOMEM);
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

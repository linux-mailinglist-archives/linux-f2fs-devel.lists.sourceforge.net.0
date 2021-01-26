Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B00B304239
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Jan 2021 16:21:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4Q9w-0007oM-Lw; Tue, 26 Jan 2021 15:21:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+b7a2078c382f6036dc0e+6365+infradead.org+hch@casper.srs.infradead.org>)
 id 1l4Q9u-0007oE-Qu
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hT6VVHBE+h6JAvE1DToGRa2iclpKhRp2E4jpRU5fhfg=; b=TEViDHZI0iJI/+KKopENL9IUTk
 4Bro1j4Yk9rdqnnKGrPENLg+jnCfCk1OvG3n3JH98LyQCK/5v7zBc4P6RS8Zde0nsFNDNCT4lSU9E
 qxcTeTWCWocpu1ddvPSVCCY10j9jX7v2AUfPPFhs8paoS5cnPpMMYROVBu+Q/7fvUbWQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hT6VVHBE+h6JAvE1DToGRa2iclpKhRp2E4jpRU5fhfg=; b=eDagN7z1WZF19eVE9eOtHXa/Gq
 jlCxcYDTCivuw0wDeIlQEBKZbKCe7w3lcl1ZtzI4q8MlFcyZOQBghk2m9jTBRA7IygIqfOORBYA0O
 IOjo2vLcJ91WlfdFe70+QRmv5IHlRBLvApxhPt1l72lKaruS1RZC1NEn0DfRIVhH9OYE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4Q9o-00AMyn-Hf
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=hT6VVHBE+h6JAvE1DToGRa2iclpKhRp2E4jpRU5fhfg=; b=a5C/DS8xF1Qgcw0TbOpCyVosGS
 Zrj/lJFI88P49DOf+/Bv7oVHux9xqSc90dqCb+MgQFhiF1iNvcTKtNotsaqaT9GZ5O2lfHYWPU8f9
 MWSyAVCn+XzTVBXvoQFlhs6Nk75UUNAvCFZY8DGZ+OF3VElW6b7AOCAZODHM1g0BPGh6KHJ7SLPKZ
 ldxaH+8wFBz/F2aTXvOIhpfh3/7iT/Vec2zTOjOdaNV8EKhaGb4msUb18JCH4H9nVObBYh45mZ/t7
 Mt7fD5vi0lda03mpky5eT1QtbuYJV5pgTQU/Q9GheLbpEAbrqXTRFm9yHPYEgOqLWBKQ/o7X2nMXc
 I/Ys90sw==;
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l4Q39-005o7b-JG; Tue, 26 Jan 2021 15:15:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:43 +0100
Message-Id: <20210126145247.1964410-14-hch@lst.de>
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
X-Headers-End: 1l4Q9o-00AMyn-Hf
Subject: [f2fs-dev] [PATCH 13/17] md: remove md_bio_alloc_sync
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

md_bio_alloc_sync is never called with a NULL mddev, and ->sync_set is
initialized in md_run, so it always must be initialized as well.  Just
open code the remaining call to bio_alloc_bioset.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/md.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 6a27f52007c871..399c81bddc1ae1 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -340,14 +340,6 @@ static int start_readonly;
  */
 static bool create_on_open = true;
 
-static struct bio *md_bio_alloc_sync(struct mddev *mddev)
-{
-	if (!mddev || !bioset_initialized(&mddev->sync_set))
-		return bio_alloc(GFP_NOIO, 1);
-
-	return bio_alloc_bioset(GFP_NOIO, 1, &mddev->sync_set);
-}
-
 /*
  * We have a system wide 'event count' that is incremented
  * on any 'interesting' event, and readers of /proc/mdstat
@@ -989,7 +981,7 @@ void md_super_write(struct mddev *mddev, struct md_rdev *rdev,
 	if (test_bit(Faulty, &rdev->flags))
 		return;
 
-	bio = md_bio_alloc_sync(mddev);
+	bio = bio_alloc_bioset(GFP_NOIO, 1, &mddev->sync_set);
 
 	atomic_inc(&rdev->nr_pending);
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

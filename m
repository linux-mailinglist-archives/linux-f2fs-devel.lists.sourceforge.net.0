Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EABC81D4745
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 May 2020 09:41:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jZUyY-0002a1-FN; Fri, 15 May 2020 07:41:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+e5f7f93d3739a79b60a3+6109+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jZUyU-0002Zl-TD
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 May 2020 07:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5F5020LXe/PKeW2E7HP+KIsjpPbHby4z569GcXavvzw=; b=MeY0Unp5BsMOiQdkOxVfXZ3gOL
 vHkm5aF6AWN1I2T8hC0hABTEPK34VPI2EdwnXp6Y5hU2bjPXqFTmrknAhBrHtbxzKE4B2C4yeWftZ
 o8n2yEdFBpYy3aocR4Y2aUrvWtH9rlfYFFvhBY1uGOovnD5hIZ4u034H4PLOPFwiFCFA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5F5020LXe/PKeW2E7HP+KIsjpPbHby4z569GcXavvzw=; b=AftK1ruo0ggTtswUOYHuJDZGcH
 V2c9gjiJcK+8O4rMa1tSeNmakDTaDWNhxEARYgam/cgecog4OnL6cSgWFHhJhpM+cyAmlqkyzP3sd
 yZwpmVH9E5yY34msuUUpnHS/xjSGHz96D3JyU6MeJdvbvB2BrkL6y4zNAVDu8eUgZqD0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jZUyT-008Hp0-Fr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 May 2020 07:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5F5020LXe/PKeW2E7HP+KIsjpPbHby4z569GcXavvzw=; b=HbpcDNi3cjt95r1YCRFokz/Cxj
 P+8RahgC1lAn/32KwuHkV4Lvhyhsk97XCxxP0im6h+5rMpUaSLveo3+kRZlKvMsoccaigaCPWm1cy
 qLJ0wTKT1MLNqAGARFe/2g2elZChAcggp62D7/BfxeDnVplokiU+xeDaFSkipusQsgp50BZkC4QCs
 1GC5JyHov7b6RP7pfumvwoG8cFIdaqTzqMYYr19s9rekZo9R5CGENqmBlqKBDBqmSGhAo6+3NJkic
 Hk5pup2crDyCB948jsfNP0kCfoLy2tU6hHMpyfWcRcJLPEHubtPFNggqhzA2Eerfysdcuiz7ClvSL
 fAiHMJXg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jZUyF-0005Jq-7l; Fri, 15 May 2020 07:41:27 +0000
Date: Fri, 15 May 2020 00:41:27 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20200515074127.GA13926@infradead.org>
References: <20200514003727.69001-1-satyat@google.com>
 <20200514051053.GA14829@sol.localdomain>
 <8fa1aafe-1725-e586-ede3-a3273e674470@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8fa1aafe-1725-e586-ede3-a3273e674470@kernel.dk>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZUyT-008Hp0-Fr
Subject: Re: [f2fs-dev] [PATCH v13 00/12] Inline Encryption Support
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
Cc: linux-block@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, May 14, 2020 at 09:48:40AM -0600, Jens Axboe wrote:
> I have applied 1-5 for 5.8. Small tweak needed in patch 3 due to a header
> inclusion, but clean apart from that.

I looked at this a bit more as it clashed with my outstanding
q_usage_counter optimization, and I think we should move the
blk_crypto_bio_prep call into blk-mq, similar to what we do about
the integrity_prep call.  Comments?

---
From b7a78be7de0f39ef972d6a2f97a3982a422bf3ab Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Fri, 15 May 2020 09:32:40 +0200
Subject: block: move blk_crypto_bio_prep into blk_mq_make_request

Currently blk_crypto_bio_prep is called for every block driver, including
stacking drivers, which is probably not the right thing to do.  Instead
move it to blk_mq_make_request, similar to how we handle integrity data.
If we ever grow a low-level make_request based driver that wants
encryption it will have to call blk_crypto_bio_prep manually, but I really
hope we don't grow more non-stacking make_request drivers to start with.

This also means we only need to do the crypto preparation after splitting
and bouncing the bio, which means we don't bother allocating the fallback
context for a bio that might only be a dummy and gets split or bounced
later.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c | 13 +++++--------
 block/blk-mq.c   |  2 ++
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 1e97f99735232..ac59afaa26960 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1131,12 +1131,10 @@ blk_qc_t generic_make_request(struct bio *bio)
 			/* Create a fresh bio_list for all subordinate requests */
 			bio_list_on_stack[1] = bio_list_on_stack[0];
 			bio_list_init(&bio_list_on_stack[0]);
-			if (blk_crypto_bio_prep(&bio)) {
-				if (q->make_request_fn)
-					ret = q->make_request_fn(q, bio);
-				else
-					ret = blk_mq_make_request(q, bio);
-			}
+			if (q->make_request_fn)
+				ret = q->make_request_fn(q, bio);
+			else
+				ret = blk_mq_make_request(q, bio);
 
 			blk_queue_exit(q);
 
@@ -1185,8 +1183,7 @@ blk_qc_t direct_make_request(struct bio *bio)
 		return BLK_QC_T_NONE;
 	if (unlikely(bio_queue_enter(bio)))
 		return BLK_QC_T_NONE;
-	if (blk_crypto_bio_prep(&bio))
-		ret = blk_mq_make_request(q, bio);
+	ret = blk_mq_make_request(q, bio);
 	blk_queue_exit(q);
 	return ret;
 }
diff --git a/block/blk-mq.c b/block/blk-mq.c
index d2962863e629f..0b5a0fa0d124b 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -2033,6 +2033,8 @@ blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
 	blk_queue_bounce(q, &bio);
 	__blk_queue_split(q, &bio, &nr_segs);
 
+	if (!blk_crypto_bio_prep(&bio))
+		return BLK_QC_T_NONE;
 	if (!bio_integrity_prep(bio))
 		return BLK_QC_T_NONE;
 
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

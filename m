Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC23A71A153
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 16:59:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4jmK-0000FP-B5;
	Thu, 01 Jun 2023 14:59:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+afcc791b37732e68e234+7221+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q4jm4-0000FI-9B for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 14:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1AhsMC0b8Le+Qj8+/F9cJR6e5GLVWYekas+17NCVqqI=; b=TIgkZaHuOGJTJd0cK2tPn4vidE
 ojhegD/ZPLxFWEB3z/o3C5tsuLlIq1INzmFPm7qAKXr/Gj6PDTuhWrTJti/3zs859VmN5ZMsELzEA
 dQCBSc35RkHexcehonFltsG3p61YRB2/R1Wzc5WoysBax+kP6vyCmV0oPrk0lN+S6Tvw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1AhsMC0b8Le+Qj8+/F9cJR6e5GLVWYekas+17NCVqqI=; b=jBvEnwWaOBZJsNjc5hYpacFqET
 rPcnRAHAlEdTRP6nVNKnUhpsDyH7MoVIVfhkPjZyZvd6Frxi7I28UNM39ApRnL4D5A1Wm6dAyFfF7
 aO4x7iyE3eryLYKH4HuLwEYNxSSFa0+/JhrNqhEsUoOI7RDUP96bkaNljgNpw7g4zIVU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4jm0-008SYD-Qx for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 14:59:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=1AhsMC0b8Le+Qj8+/F9cJR6e5GLVWYekas+17NCVqqI=; b=wiZK9iqy2Q2DgmztCycdzZFJYV
 +f+Z1EUaPp/WxVng7hKAlTugkvoijJtdaCd0abPoIux8/9iobGyPP3C6ZdxSo+5MDjs+QVxSsZ3Yw
 3H/pO+bF6DsK8j6VvoAk02XyxLpv8r9mchlt36SS/V9hKI45pU8u3aID3Cuyz6NRbbOYhfrEEm6b1
 NNHoLMnhvwSNrDWABgK8ExwUWqr924HfRyejUtySvIZe/Xw5vgaGGms+mTqdLK9GBRSnpE9VluHzD
 Eeh8qQMBY9tUVU6xoJPSMjm7g2W4rjDN+CjEc3/cLcIsyBTtm2CIz0MxYanPENl5SoUy/NTEUsg2H
 qg0aEunA==;
Received: from [2001:4bb8:182:6d06:eacb:c751:971:73eb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q4jlf-003w32-1z; Thu, 01 Jun 2023 14:59:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Thu,  1 Jun 2023 16:58:54 +0200
Message-Id: <20230601145904.1385409-3-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601145904.1385409-1-hch@lst.de>
References: <20230601145904.1385409-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Move the ki_pos update down a bit to prepare for a better
 common helper that invalidates pages based of an iocb. Signed-off-by:
 Christoph
 Hellwig <hch@lst.de> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
 Reviewed-by:
 Hannes Reinecke <hare@suse.de> Reviewed-by: Darrick J. Wong
 <djwong@kernel.org> --- fs/iomap [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q4jm0-008SYD-Qx
Subject: [f2fs-dev] [PATCH 02/12] iomap: update ki_pos a little later in
 iomap_dio_complete
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Move the ki_pos update down a bit to prepare for a better common
helper that invalidates pages based of an iocb.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/iomap/direct-io.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 019cc87d0fb339..6207a59d2162e1 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -94,7 +94,6 @@ ssize_t iomap_dio_complete(struct iomap_dio *dio)
 		if (offset + ret > dio->i_size &&
 		    !(dio->flags & IOMAP_DIO_WRITE))
 			ret = dio->i_size - offset;
-		iocb->ki_pos += ret;
 	}
 
 	/*
@@ -120,19 +119,21 @@ ssize_t iomap_dio_complete(struct iomap_dio *dio)
 	}
 
 	inode_dio_end(file_inode(iocb->ki_filp));
-	/*
-	 * If this is a DSYNC write, make sure we push it to stable storage now
-	 * that we've written data.
-	 */
-	if (ret > 0 && (dio->flags & IOMAP_DIO_NEED_SYNC))
-		ret = generic_write_sync(iocb, ret);
 
-	if (ret > 0)
-		ret += dio->done_before;
+	if (ret > 0) {
+		iocb->ki_pos += ret;
 
+		/*
+		 * If this is a DSYNC write, make sure we push it to stable
+		 * storage now that we've written data.
+		 */
+		if (dio->flags & IOMAP_DIO_NEED_SYNC)
+			ret = generic_write_sync(iocb, ret);
+		if (ret > 0)
+			ret += dio->done_before;
+	}
 	trace_iomap_dio_complete(iocb, dio->error, ret);
 	kfree(dio);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(iomap_dio_complete);
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

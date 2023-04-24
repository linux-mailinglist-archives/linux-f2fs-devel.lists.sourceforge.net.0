Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A03D96EC516
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 07:50:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqp5Q-0004Ix-9N;
	Mon, 24 Apr 2023 05:50:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e16e2fc4419b117693a1+7183+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pqp5J-0004IL-SC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:49:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EScWBpUly43XmjjjdD4wwdvXMFWqSgBIztZj7g+ZMe8=; b=VNT7k+2WBxPGPF8Fqx4EjnHJjg
 k8y78xeMFcN+LwUNZaBbOwvw2PXR0j2mhgxZ4nA7tRFYG5q8XryXNJt/RvWFYyuQbQ1J6cYg2ikYM
 Dju/mz1+0e8ZkN/anRrKTOPvRAZeflNlqo9t0RgvpphvFVC48LXtTQ9ijWBmAHHoTZXE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EScWBpUly43XmjjjdD4wwdvXMFWqSgBIztZj7g+ZMe8=; b=JLjqKDKMBHTdpRSnAX8GkQuCP3
 vyGBxu72nddZRa+IWycYQeJHYVqVbsAhOmYmNrWGuYrKf5gG9bKdv71Tb1KN5fiQXey2uwzLUAh1G
 yWsrMpNDkLxthcqEMxxvdkdqLOAPh8GUBFwKSbQcGpVgQRDkqsJTak2WFnlaLEwP2JTg=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pqp5E-0003Tj-MK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:49:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=EScWBpUly43XmjjjdD4wwdvXMFWqSgBIztZj7g+ZMe8=; b=MLLALFsGBXb0yEP6gMC+osLHIV
 LxXX9DY2kTS2XEw2wLe6CXDUGRoxAMHBwXzobLE9Y9zji+azCMLR5NU8y8TLrvKuOMasdYzfEdAbx
 YS0O7LEmtvCsE+U0cmWHT4J2ADCxI6QWaoyVaWpQVUefmWLPSuNZO42MVhHQwB3WxcfClsmoL0JNN
 tN4fQtJUEXSg3i8MJ/wAy3B6Z6igVb8BVPomdBmnhj9Z4ZWBCDswm59W3TtI08owaBDS0Vnv8Jt+Y
 NyKD0hmhBS+Tx5z7HnU1WPDVW85bTSHltv+c4f8A4YPMvyYVqQ6G4LsKmHiql/CpLvwdMS1O4lk1U
 I4zba1cA==;
Received: from [2001:4bb8:189:a74f:e8a5:5f73:6d2:23b8] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pqp4v-00FOuH-2z; Mon, 24 Apr 2023 05:49:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Apr 2023 07:49:10 +0200
Message-Id: <20230424054926.26927-2-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424054926.26927-1-hch@lst.de>
References: <20230424054926.26927-1-hch@lst.de>
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
 Content preview: buffer_check_dirty_writeback is only used by the block device
 aops, remove the export. Signed-off-by: Christoph Hellwig <hch@lst.de> ---
 fs/buffer.c | 1 - 1 file changed, 1 deletion(-) diff --git a/fs/buffer.c
 b/fs/buffer.c index 9e1e2add541e07..eb14fbaa7d35f7 100644 --- a/fs/buffer.c
 +++ b/fs/buffer.c @@ -111, 7 +111,
 6 @@ void buffer_check_dirty_writeback(struct
 folio *folio, bh = b [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pqp5E-0003Tj-MK
Subject: [f2fs-dev] [PATCH 01/17] fs: unexport buffer_check_dirty_writeback
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
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

buffer_check_dirty_writeback is only used by the block device aops,
remove the export.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/buffer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 9e1e2add541e07..eb14fbaa7d35f7 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -111,7 +111,6 @@ void buffer_check_dirty_writeback(struct folio *folio,
 		bh = bh->b_this_page;
 	} while (bh != head);
 }
-EXPORT_SYMBOL(buffer_check_dirty_writeback);
 
 /*
  * Block until a buffer comes unlocked.  This doesn't stop it
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2032220056D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2020 11:40:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jmDVK-0000iF-RA; Fri, 19 Jun 2020 09:40:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <agruenba@redhat.com>) id 1jmDVJ-0000i5-Ba
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 09:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SldHT58QWZEaNH+GrGNea/awooFbiqL4jxPiQBrZZXc=; b=bs0iEgIG8zvXnER8v0hovQDC40
 Jgn38vDZlmDVO8S8JmRjdTbAXaogtKD6Zm7Q/14aMgQwUCLRhMaxnSZRVvZklcypSsHBERJVF5zUm
 niyP1obE3+I5sAdfvma9Nkkt01EkZvDvDMWQEHC/BgXH+O28KHmIu+Z6VKBlXnfpm+Nk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SldHT58QWZEaNH+GrGNea/awooFbiqL4jxPiQBrZZXc=; b=i456dIxCPj/J273fO96vdF7BKp
 JAEEXDxu8BF7vbrMQWzeEjAcey+BVOE4tJ1vDaBn98ps53G5SWAgixRIDHlLRMRPHPPJSPw9nCbfa
 u0G3dB6p+UDsaF4SRfc4zM145SntcKZlexrO0NGcVZdr2RZNohK4Ph5F0+hL61Afh2I0=;
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1jmDVH-00BohX-Km
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 09:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592559601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SldHT58QWZEaNH+GrGNea/awooFbiqL4jxPiQBrZZXc=;
 b=YjpvJgVYRnJx2GnfY2WKvVkQYWkDJjsicEKvaimanQhqabfPuxDAsGwbZ1SCBGgF31H7zY
 zq1sBlLnWkX9gAmlL+2YawoxUkN00jJIdaS0MfbVLgr+8G3z0AVnnX0flrc5rb+ZQjyT2n
 IpiLcH1Z4dizVBaeacTxpf+LUFtOQPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-SIB5PbDMObCm2YydCZpjNg-1; Fri, 19 Jun 2020 05:39:37 -0400
X-MC-Unique: SIB5PbDMObCm2YydCZpjNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E25C218FF660;
 Fri, 19 Jun 2020 09:39:34 +0000 (UTC)
Received: from max.home.com (unknown [10.40.195.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 258625D9EF;
 Fri, 19 Jun 2020 09:39:26 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Matthew Wilcox <willy@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 19 Jun 2020 11:39:15 +0200
Message-Id: <20200619093916.1081129-2-agruenba@redhat.com>
In-Reply-To: <20200619093916.1081129-1-agruenba@redhat.com>
References: <20200619093916.1081129-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [205.139.110.61 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [205.139.110.61 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jmDVH-00BohX-Km
Subject: [f2fs-dev] [PATCH 1/2] fs: Add IOCB_CACHED flag for
 generic_file_read_iter
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
Cc: cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org, Junxiao Bi <junxiao.bi@oracle.com>,
 linux-xfs <linux-xfs@vger.kernel.org>,
 William Kucharski <william.kucharski@oracle.com>,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-erofs@lists.ozlabs.org,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add an IOCB_CACHED flag which indicates to generic_file_read_iter that
it should only regard the page cache, without triggering any filesystem
I/O for the actual request or for readahead.  With this flag, -EAGAIN is
returned when regular I/O would be triggered similar to the IOCB_NOWAIT
flag, and -ECANCELED is returned when readahead would be triggered.

This allows the caller to perform a tentative read out of the page
cache, and to retry the read if the requested pages are not cached.

Please see the next commit for what this is used for.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 include/linux/fs.h |  1 +
 mm/filemap.c       | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 6c4ab4dc1cd7..74eade571b1c 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -315,6 +315,7 @@ enum rw_hint {
 #define IOCB_SYNC		(1 << 5)
 #define IOCB_WRITE		(1 << 6)
 #define IOCB_NOWAIT		(1 << 7)
+#define IOCB_CACHED		(1 << 8)
 
 struct kiocb {
 	struct file		*ki_filp;
diff --git a/mm/filemap.c b/mm/filemap.c
index f0ae9a6308cb..bd11f27bf6ae 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2028,7 +2028,7 @@ ssize_t generic_file_buffered_read(struct kiocb *iocb,
 
 		page = find_get_page(mapping, index);
 		if (!page) {
-			if (iocb->ki_flags & IOCB_NOWAIT)
+			if (iocb->ki_flags & (IOCB_NOWAIT | IOCB_CACHED))
 				goto would_block;
 			page_cache_sync_readahead(mapping,
 					ra, filp,
@@ -2038,12 +2038,17 @@ ssize_t generic_file_buffered_read(struct kiocb *iocb,
 				goto no_cached_page;
 		}
 		if (PageReadahead(page)) {
+			if (iocb->ki_flags & IOCB_CACHED) {
+				put_page(page);
+				error = -ECANCELED;
+				goto out;
+			}
 			page_cache_async_readahead(mapping,
 					ra, filp, page,
 					index, last_index - index);
 		}
 		if (!PageUptodate(page)) {
-			if (iocb->ki_flags & IOCB_NOWAIT) {
+			if (iocb->ki_flags & (IOCB_NOWAIT | IOCB_CACHED)) {
 				put_page(page);
 				goto would_block;
 			}
@@ -2249,6 +2254,13 @@ EXPORT_SYMBOL_GPL(generic_file_buffered_read);
  *
  * This is the "read_iter()" routine for all filesystems
  * that can use the page cache directly.
+ *
+ * In the IOCB_NOWAIT flag in iocb->ki_flags indicates that -EAGAIN should be
+ * returned if completing the request would require I/O; this does not prevent
+ * readahead.  The IOCB_CACHED flag indicates that -EAGAIN should be returned
+ * as under the IOCB_NOWAIT flag, and that -ECANCELED should be returned when
+ * readhead would be triggered.
+ *
  * Return:
  * * number of bytes copied, even for partial reads
  * * negative error code if nothing was read
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

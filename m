Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCFA18CFF0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2020 15:22:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFIXv-0001Jz-3Y; Fri, 20 Mar 2020 14:22:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jFIXt-0001Iv-6h
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 14:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MRxRO1fcwbFnyNnTRcoLLuE0j9WLLNVBpiFAzDcHLGo=; b=R4Ev5LyblfAw3ihmh7yEop8SSb
 7FbibAmtrXEero3kllUFRvsMXxK4tyY+dBs592Tf20U1K0Mdl8F6gOIeAENsP+Hv0ry09+e3gJWXe
 UCZpSSqZyJlS2PCzf+6Bhi8IWN9+DrJbCWEs9rE+4gUKtNb7bfPKW1HLubGpmoUTqp5Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MRxRO1fcwbFnyNnTRcoLLuE0j9WLLNVBpiFAzDcHLGo=; b=N6rgV/IfvaRMCy2adI37xr2FVS
 6oGez61ZR9P1RnKlpAsKklaEMu+yk0xbpM5SSgiGcTDE0c2pMBDxW/jXg+pXtkC5e24m2+ZDtuZYM
 QzDqnq3eUHoyPlvK/IKShrVCcSUtr/wTHmCA0FQGQ7M7b8NDbowyplPMa28PIHHm+GxQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFIXp-001KEI-Ch
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 14:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=MRxRO1fcwbFnyNnTRcoLLuE0j9WLLNVBpiFAzDcHLGo=; b=QIcbvGfZA3PeGw0fYUhbdqz6SR
 RgrMY+rOF7L8CM9S/WFa2bEkx9vFrp29udQWW8L0PrK7WuSKP3z53dTw98tPq3Jgr/bDTc8eVbky6
 rOUWqzb/Q4P31uLOhIH9jFMQdyagN+2MtzFHU8EEX0vgNw0AkKvjyVyZ0dBqQWhHWGbM9ub8ePtpC
 aae7Dk3lcGbgWNHit9uRy9lUx2vIGoqePKDT/XJaMGh78pxENGo2GIukQPX2hAn43WWr4bddZP9rH
 ByqFx1ZKTLHsrReJEjgiZ90r7LTz2OmBgvEOYWHJw6NndPF9D2J9yLew19Wnivz1q63l3h6+W9VGW
 0RlSNrWQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jFIXh-0000iX-Nr; Fri, 20 Mar 2020 14:22:33 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 20 Mar 2020 07:22:20 -0700
Message-Id: <20200320142231.2402-15-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320142231.2402-1-willy@infradead.org>
References: <20200320142231.2402-1-willy@infradead.org>
MIME-Version: 1.0
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
X-Headers-End: 1jFIXp-001KEI-Ch
Subject: [f2fs-dev] [PATCH v9 14/25] mm: Document why we don't set
 PageReadahead
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
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

If the page is already in cache, we don't set PageReadahead on it.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 mm/readahead.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 8ee9036fd681..0afb55a49909 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -195,9 +195,12 @@ void page_cache_readahead_unbounded(struct address_space *mapping,
 
 		if (page && !xa_is_value(page)) {
 			/*
-			 * Page already present?  Kick off the current batch of
-			 * contiguous pages before continuing with the next
-			 * batch.
+			 * Page already present?  Kick off the current batch
+			 * of contiguous pages before continuing with the
+			 * next batch.  This page may be the one we would
+			 * have intended to mark as Readahead, but we don't
+			 * have a stable reference to this page, and it's
+			 * not worth getting one just for that.
 			 */
 			read_pages(&rac, &page_pool, true);
 			continue;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

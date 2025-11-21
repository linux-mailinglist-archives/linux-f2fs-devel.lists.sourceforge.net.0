Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E12C76E2D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 02:48:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qlPzVnOcThas9ZOIHRHwMVccHR/QR9P6JVqWlI4+wQk=; b=igIy4RKmIsdnZka7eNH8avNzg2
	fC6vKzmS2IEwS8j9czD9pmwHoTpUTaxzgssejmsQW+q/88nLKBUthTPFB10uDsiL6yEsbL0i+e2n6
	D+obZ4z9Ye0FywL0B8Y0IxO+7jyAYjlESGAyz8cQylmf2uoun+mKne/XZnpCOljhQJdA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMGGA-0004Tx-LE;
	Fri, 21 Nov 2025 01:48:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vMGG8-0004Tf-SD
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 01:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E/LPU4N7wLTa6sOoERYwS5vWU1GBzVgpajxpSeD5mk0=; b=J0Hep7gJGdQkur0k3G74EWwJUK
 54l0ClzTmQu8USUe9EkwpprE5udoUxXkufeHhd6HxOUVd1ZlmLMn/q1m4V7076qT478RMYOAdD3Vz
 RQVii+KXjHtDq13fEoj+VA1MpXuCRPK2SKdJmdfbUsKnbIVY7BuGYn5sEgRlW57Qn/zo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=E/LPU4N7wLTa6sOoERYwS5vWU1GBzVgpajxpSeD5mk0=; b=H
 jI0IsxwNbHYlg0E+L8QX9MCOpNp0L0BOTgfxu3A0hEBLA/Zj3JJbPt5Ktzc69w6gSFn00/EcbKb1U
 eOQx534jlTVvsJXo1UFyOYepPpc+w5ch0x7fXmLLBM3BZLF1tQDcxPhvQb7D5gk7ve0HZHbHPvAYG
 rxIy3o9TWvtmZ0Go=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMGG9-0005vP-93 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 01:48:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 97F1C6020E;
 Fri, 21 Nov 2025 01:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3B5C4CEF1;
 Fri, 21 Nov 2025 01:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763689694;
 bh=L/FBZ6EX8BBEKd+oHDA9ozKPVRqFKy89jllHraqtJqY=;
 h=From:To:Cc:Subject:Date:From;
 b=AsWFE2/ZaJzeSyKw92X+LJqR8iMDxGzF7BfywN9uJZldHmP/9N8GsNpj1cvruVbkl
 2aBBEyX+YBLzTUTnSfn8cwON/9TvmjTKeqxdmdpymJrCIkSiw3TEH03ZqcxxkeQGLv
 HVRmjj6X8+qbRGLAp+J2+7dku2GCARWkmw87ZL2O+FABcyrGHez3omBgb+vz5TOs8i
 oHsbrXK0FcHHESByFIvc97gY0iyooDsv+mV3XdiwL0c40nAint/RXIbjQEQayLEOjb
 1V8qVNa1Aj0MUiFTXn76iS9eewI0uabRinSbRNObvQPw3Fo/YTlbMLSuXFZxAQB2sm
 nME3O9AFjTZ0A==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 21 Nov 2025 01:48:11 +0000
Message-ID: <20251121014811.1971698-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch adds a desired folio order in file_ra_state in
 order to get non-zero-order allocation for readahead. Cc: David Hildenbrand
 <david@redhat.com> Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- include/linux/fs.h | 1 + mm/filemap.c
 | 2 +- mm/readahead [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vMGG9-0005vP-93
Subject: [f2fs-dev] [PATCH] mm/readahead: add a desired folio order for
 readhead
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds a desired folio order in file_ra_state in order to get
non-zero-order allocation for readahead.

Cc: David Hildenbrand <david@redhat.com>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 include/linux/fs.h | 1 +
 mm/filemap.c       | 2 +-
 mm/readahead.c     | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index c895146c1444..8233b166139b 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1167,6 +1167,7 @@ struct file_ra_state {
 	unsigned int async_size;
 	unsigned int ra_pages;
 	unsigned short order;
+	unsigned short desired_order;
 	unsigned short mmap_miss;
 	loff_t prev_pos;
 };
diff --git a/mm/filemap.c b/mm/filemap.c
index 13f0259d993c..6aa0e26c5d17 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3332,7 +3332,7 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
 		ra->start = max_t(long, 0, vmf->pgoff - ra->ra_pages / 2);
 		ra->size = ra->ra_pages;
 		ra->async_size = ra->ra_pages / 4;
-		ra->order = 0;
+		ra->order = ra->desired_order;
 	}
 
 	fpin = maybe_unlock_mmap_for_io(vmf, fpin);
diff --git a/mm/readahead.c b/mm/readahead.c
index 3a4b5d58eeb6..5194211dfdee 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -621,7 +621,7 @@ void page_cache_sync_ra(struct readahead_control *ractl,
 	ra->size = min(contig_count + req_count, max_pages);
 	ra->async_size = 1;
 readit:
-	ra->order = 0;
+	ra->order = ra->desired_order;
 	ractl->_index = ra->start;
 	page_cache_ra_order(ractl, ra);
 }
-- 
2.52.0.487.g5c8c507ade-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

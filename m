Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6FE53DDEE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  5 Jun 2022 21:39:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nxw5w-000620-J1; Sun, 05 Jun 2022 19:39:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1nxw5q-00061f-Fp
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nZd7FdfhHHpfkPZj2gtn0+UCb6ZHZaprTIaRzyl1jXk=; b=Dm2aIt4JO6gt6q9Rs5E38Ht3Ks
 bnr4jl7x759BM36L15pmUbdSCQudssaG5zxzDjCc16zQtIo2LuMvwhQOmQM132gUzJ2dtHVv7oWAx
 BskJVHVRCxjkZ1zIsridBy4F77AyZqgqLog9+270PzY/1CMiDlejVpbT+xtwSqDG0Qyg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nZd7FdfhHHpfkPZj2gtn0+UCb6ZHZaprTIaRzyl1jXk=; b=FWEQ4GN0tSpLEPN/CskrRppImV
 DQUtMzAWNrA+aSVuvgolm4y9W8RmvhnsZ7GZ06qmRIoIXnBG8KBolIt+sbkAkmevI9viT0cm9RhT0
 +aup9VC4JXGPws5fG/XhDrpMc3KpdE30DC5dW+tcSrmrTKYzJ8fkxlAmg+pd6PKWVbvg=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nxw5p-006MEy-Ud
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=nZd7FdfhHHpfkPZj2gtn0+UCb6ZHZaprTIaRzyl1jXk=; b=uFlx6IYCw7cKUMv6UFQU0NiN2j
 iQ24sV1L+N0JJ+PYt+whKlcyMvxX397wDiXAeuW16ipXpv7uj75S+ifah7UED1rGBmJ6INgUn0EaP
 +9Vs3ySStr9qIgZ0zF6RDK7wq0A7Z8UrY0v2gbCiqtYZYhxFzeNL/2ggxHjmv6qm+147lvrX2dSYA
 KrGPUqo5c0kBsr1HE5k1I7rfjNq5kWWJNZbU41W0uuZJbmiuIPzLxEOUcBBG4y5IcjIH3D5ekaRwS
 R4P3XSnF1YkMw+gsOSK1a5dkmx/misM3DKGpZBhb7qWzj2lws1FAo2SU2BuaoFyWnchKohsh2xIzm
 dolxg0Dg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nxw5R-009wsf-8D; Sun, 05 Jun 2022 19:38:57 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Sun,  5 Jun 2022 20:38:53 +0100
Message-Id: <20220605193854.2371230-10-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220605193854.2371230-1-willy@infradead.org>
References: <20220605193854.2371230-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a straightforward conversion. Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- mm/shmem.c | 13 ++++++------- 1
 file changed, 6 insertions(+),
 7 deletions(-) diff --git a/mm/shmem.c b/mm/shmem.c
 index 60fdfc0208fd..313ae7df59d8 100644 --- a/mm/shmem.c +++ b/mm/shmem.c
 @@ -867,18 +867,17 @@ unsigned long shmem_swap_usage(struct vm_area_struct
 *vma) */ void [...] 
 Content analysis details:   (2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nxw5p-006MEy-Ud
Subject: [f2fs-dev] [PATCH 09/10] shmem: Convert shmem_unlock_mapping() to
 use filemap_get_folios()
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
Cc: linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is a straightforward conversion.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/shmem.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 60fdfc0208fd..313ae7df59d8 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -867,18 +867,17 @@ unsigned long shmem_swap_usage(struct vm_area_struct *vma)
  */
 void shmem_unlock_mapping(struct address_space *mapping)
 {
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	pgoff_t index = 0;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	/*
 	 * Minor point, but we might as well stop if someone else SHM_LOCKs it.
 	 */
-	while (!mapping_unevictable(mapping)) {
-		if (!pagevec_lookup(&pvec, mapping, &index))
-			break;
-		check_move_unevictable_pages(&pvec);
-		pagevec_release(&pvec);
+	while (!mapping_unevictable(mapping) &&
+	       filemap_get_folios(mapping, &index, ~0UL, &fbatch)) {
+		check_move_unevictable_folios(&fbatch);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 }
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

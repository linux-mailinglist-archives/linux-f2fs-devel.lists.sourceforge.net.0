Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05484AFD462
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:05:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghgdAuEt4OoVC3/T8mahksyEYXyldmGgIRxgVJRTiTo=; b=jMTvLOj5inAqoHhuPaf47jgZgA
	rqU0BlJkOo7STkHA+VRFN9VgvymyJpNZy0jRAz5jQ7AUrBI5FefziBFl3rLTeTSVXhvYyV0calScj
	ew6Pue4fJBJ04aFlaW9cwU6TJXlCWF/guyvoIs9KfgbzySopM9CHdpxfavi+by0C4TYg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBkv-0007gw-Hk;
	Tue, 08 Jul 2025 17:05:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjy-0007OR-2Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uwz4gZUWpVJ2fEZHXGVHNxNh+Kzeuo+sxo0M7fxFFSE=; b=T1KpwFILBYRBTbrpP/It2P6aMw
 u4q/cPyJToe0HbVYh2yPPeiwwQetwHIVfeRudarcZs785+4MXClr7yTKdfUACU7W96e8426Bt5yWI
 AhTKol2kY3IEvHRbgWLzDrWRkZI4oTK0tQyimOFwos17j0sM53eiBZl4qaYrlWcOpXSQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uwz4gZUWpVJ2fEZHXGVHNxNh+Kzeuo+sxo0M7fxFFSE=; b=JQW0adeHvPC4J/GqIqupGy+eA/
 ChAvC+hpNYz9CqFAJRwoxRnxKvmHf+JF0H1AD13xRshv49U88CjQKu9k9w86X/1HqA1DWPniNUS5l
 7Kqilm5Y/vI3hoR58mfwvQ0A2uf6M33xRpWKDuUuAO/Wm8xiRije4oQcSSyGf8lYctYI=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjx-0006Ha-H9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Uwz4gZUWpVJ2fEZHXGVHNxNh+Kzeuo+sxo0M7fxFFSE=; b=wASh+KuV0W1fvj/hxwR6PEptx4
 PizOXDxffL6DnPTzMibL1AuQ2Kb2V35aLXTsE37m/cBAYV9Ou872BrbIO81AEug+Zk/xkTuRhr9L9
 iqlDbKV4VZCnufQVwbEd8gOHUiSvpIuJXB327kOCAEBhUqQptc007vx6V6K95uLQQU4mShrnSRjCm
 JzOSjYA+Kble8hrigHVFi3DbRfXYSlz17byafhVZrwYWx7zOaeid9U/cL8I1FXCzWLlKa3P1BJqzo
 fta32gU1a0Binb6IdB6zm/UavNPoStUVrTJPVmjL2G2ypUQbRltKjXhAUMDVldI10D//bLV16+ysy
 TMITGaJw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjm-00000000T9q-0DSr;
 Tue, 08 Jul 2025 17:04:10 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:56 +0100
Message-ID: <20250708170359.111653-60-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: All three callers have a folio so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/data.c | 12
 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-) diff --git a/fs/f2fs/data.c
 b/fs/f2fs/data.c index b82d8784248e..56ea8dfc43a7 100644 --- a/fs/f2fs/data.c
 +++ b/fs/f2fs/data.c @@ -543, 14 +543,
 14 @@ static void __submit_merged_bio(struct f2fs_bio_inf [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZBjx-0006Ha-H9
Subject: [f2fs-dev] [PATCH 59/60] f2fs: Pass a folio to __has_merged_page()
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

All three callers have a folio so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b82d8784248e..56ea8dfc43a7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -543,14 +543,14 @@ static void __submit_merged_bio(struct f2fs_bio_info *io)
 }
 
 static bool __has_merged_page(struct bio *bio, struct inode *inode,
-						struct page *page, nid_t ino)
+						struct folio *folio, nid_t ino)
 {
 	struct folio_iter fi;
 
 	if (!bio)
 		return false;
 
-	if (!inode && !page && !ino)
+	if (!inode && !folio && !ino)
 		return true;
 
 	bio_for_each_folio_all(fi, bio) {
@@ -569,7 +569,7 @@ static bool __has_merged_page(struct bio *bio, struct inode *inode,
 
 		if (inode && inode == target->mapping->host)
 			return true;
-		if (page && page == &target->page)
+		if (folio && folio == target)
 			return true;
 		if (ino && ino == ino_of_node(target))
 			return true;
@@ -650,7 +650,7 @@ static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
 			struct f2fs_bio_info *io = sbi->write_io[btype] + temp;
 
 			f2fs_down_read(&io->io_rwsem);
-			ret = __has_merged_page(io->bio, inode, &folio->page, ino);
+			ret = __has_merged_page(io->bio, inode, folio, ino);
 			f2fs_up_read(&io->io_rwsem);
 		}
 		if (ret)
@@ -845,7 +845,7 @@ void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
 				found = (target == be->bio);
 			else
 				found = __has_merged_page(be->bio, NULL,
-							&folio->page, 0);
+							folio, 0);
 			if (found)
 				break;
 		}
@@ -862,7 +862,7 @@ void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
 				found = (target == be->bio);
 			else
 				found = __has_merged_page(be->bio, NULL,
-							&folio->page, 0);
+							folio, 0);
 			if (found) {
 				target = be->bio;
 				del_bio_entry(be);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

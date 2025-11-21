Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91903C76E36
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 02:49:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9CV/MDwIvpaYUpxSbP1q4xuSKSKTvB9tQj3vF3R731A=; b=hxSYH9h5csF83kWwyYjrm1QJwN
	2Oyvfmzt4Y/pf+DisjD11KJnDvoXoleoVQnN4JjhUAtdNZF1WAuqYPpcNRqdK7smu5Ny5onu4cLrC
	3qqlSLb/AsaD+y7M8IGWmwqBYX44xjjyYrFr9yxgbd7L2NRRUk3NBJtHFZckknUSAPS8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMGGi-0007bD-9g;
	Fri, 21 Nov 2025 01:49:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vMGGh-0007b4-7V
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 01:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q9rLIH3cNGjOePsV6xlh5NHmqo+w+LFf/BrKriTg7Gw=; b=aplV0HfWweDliwKm1YD/YjLh+2
 tQ6VFK5PMr+Z5+FcQd3/oWaRv/AZIWNjcwm81WICdiddVwPzaG/gYretsGWTP4hr8dlnkLvaVIxkc
 vYSdirbNKz4IhT1RJYNboMCzYKBkiy2XU0JhyYC1W33pRSpqwas2WhQqaNUW1/BRp9Xw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Q9rLIH3cNGjOePsV6xlh5NHmqo+w+LFf/BrKriTg7Gw=; b=U
 iR0nnCFaadREu8P/XZeOTAXmx0ZEyG1Dd9PpMDrmgfqNXBymt2AnP/4xLeU57aj67USuxptvMI8ot
 nIvT5zav/PAxdVog2v3Pz64W+akiq4dGYbUJBvsjibW+fQWulwzRr+tl30va6gLujI8G8jDc586vI
 1KADnnj2vwoBIvPI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMGGg-0005xS-Or for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 01:48:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 713514191F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Nov 2025 01:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC80C4CEF1;
 Fri, 21 Nov 2025 01:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763689728;
 bh=/W57j2ll3ACPGt8wN96H/XWIaVIW2a3EbaNx6lzNUEw=;
 h=From:To:Cc:Subject:Date:From;
 b=S80GXausSHkLJWw/Bl5XMhNLGKWvRw60S8IzQbwCIXwkTQ/R2xCTsZzX/hwAjPv4J
 14miCzfUD9TjPgaGyi5ggWoNDg91FD3xPMeTGbp3/eeJhdKw0QG6UFTuj1twczqJqw
 L1G4qWc7rLXkVPAFHNUvDSW2VplEasSysNiez1uAYPLJLfZrPmzcCw6SvH9vxrVJTz
 6WsyQ+rmXWH+IAMgjmzIhf8P+vG+WIui1iH/ne4uuHCSQLJZG5AMu0WotEezV41dpp
 WW2DB5I3RHo3opMHsJZtuWtEcLIn/AUDinbufeYjMfyZNkYkOp3lYWNtJMqTFYtuTo
 nFIXTi4s6smvg==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 21 Nov 2025 01:48:46 +0000
Message-ID: <20251121014846.1971924-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds a sysfs entry to change the folio order for
 readahead. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/data.c
 | 1 + fs/f2fs/f2fs.h | 3 +++ fs/f2fs/super.c | 1 + fs/f2fs/sysfs.c | 9
 +++++++++ 4 files changed, 14 insertions(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vMGGg-0005xS-Or
Subject: [f2fs-dev] [PATCH] f2fs: add a way to change the desired readahead
 folio order
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds a sysfs entry to change the folio order for readahead.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c  | 1 +
 fs/f2fs/f2fs.h  | 3 +++
 fs/f2fs/super.c | 1 +
 fs/f2fs/sysfs.c | 9 +++++++++
 4 files changed, 14 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c80d7960b652..faf1faa27c41 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2764,6 +2764,7 @@ int f2fs_readahead_pages(struct file *file, loff_t offset, loff_t len)
 	while (nrpages) {
 		unsigned long this_chunk = min(nrpages, ra_pages);
 
+		ractl.ra->desired_order = F2FS_I_SB(inode)->ra_folio_order;
 		ractl.ra->ra_pages = this_chunk;
 
 		page_cache_sync_ra(&ractl, this_chunk << 1);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 934287cc5624..0e61e253d861 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1921,6 +1921,9 @@ struct f2fs_sb_info {
 	/* carve out reserved_blocks from total blocks */
 	bool carve_out;
 
+	/* enable large folio. */
+	unsigned int ra_folio_order;
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct kmem_cache *page_array_slab;	/* page array entry */
 	unsigned int page_array_slab_size;	/* default page array slab size */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d47ec718f3be..dabac6f288f0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4287,6 +4287,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 			NAT_ENTRY_PER_BLOCK));
 	sbi->allocate_section_hint = le32_to_cpu(raw_super->section_count);
 	sbi->allocate_section_policy = ALLOCATE_FORWARD_NOHINT;
+	sbi->ra_folio_order = 0;
 	F2FS_ROOT_INO(sbi) = le32_to_cpu(raw_super->root_ino);
 	F2FS_NODE_INO(sbi) = le32_to_cpu(raw_super->node_ino);
 	F2FS_META_INO(sbi) = le32_to_cpu(raw_super->meta_ino);
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index c42f4f979d13..2537a25986a6 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -906,6 +906,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "ra_folio_order")) {
+		if (t < 0 || t > MAX_PAGECACHE_ORDER)
+			return -EINVAL;
+		sbi->ra_folio_order = t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -1180,6 +1187,7 @@ F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(dir_level);
 F2FS_SBI_GENERAL_RW_ATTR(allocate_section_hint);
 F2FS_SBI_GENERAL_RW_ATTR(allocate_section_policy);
+F2FS_SBI_GENERAL_RW_ATTR(ra_folio_order);
 #ifdef CONFIG_F2FS_IOSTAT
 F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
 F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
@@ -1422,6 +1430,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(reserved_pin_section),
 	ATTR_LIST(allocate_section_hint),
 	ATTR_LIST(allocate_section_policy),
+	ATTR_LIST(ra_folio_order),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.52.0.487.g5c8c507ade-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

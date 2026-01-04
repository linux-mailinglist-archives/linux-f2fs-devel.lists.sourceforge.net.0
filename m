Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B94CF0820
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 04 Jan 2026 03:08:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1eB64VmMxoY/p7F7il/NohGzXf+Dzk3Mf/DxENWkQVk=; b=RZP9MpZaFi28+LaLze6beit1eI
	fAP9iAoo7X6YEL2D4+GkSDnwVklOypxTQzwuIdysfv7IxdN0GYXBOU3SFeGw++8+xh3kTJjOWRhl7
	FfvySeD0HOz3ytyZ25MI4/1opp+NKJN7yBn0lVQiZ2qBGgTOKlZQ3giBmK2HgADuDl4w=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcDXS-0006wZ-8P;
	Sun, 04 Jan 2026 02:08:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vcDXO-0006wE-Vc
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bQZuJxNSHxp9nVA5wn+Cf7lUSqgRHBtFeCRVDASnNYA=; b=NEakkmG6/pLLF+9lgfh6a0GHjy
 j1S1/GgcSBtokNehrfU5HJ8UN975Wfi74fYF1WcRLglqIqL/JRH9pyyOw5Jipfod5GpnpKUgeuWfS
 G6V7aS7HOBWAuG7HkVYc5puCN81Ib7pIwamYX+J2T6Z4R3fTrSuH2tyRw6/U+Qlaqag0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bQZuJxNSHxp9nVA5wn+Cf7lUSqgRHBtFeCRVDASnNYA=; b=dzdqlLQCNd2v1bYg/HsAP66Zkd
 BIrHeNqOrh1qAvgZZU51QCrWK6GzM6Xj0F5ncJmiFhdtBEH9z277W5sOW+So++7BY1z09TkDu+Z2/
 VowCZOXNLFssGqRooqriRScfK9SaEmB/0pHB2DB0XCx+qkKQ3mZDmsCyC4Dnnp/+56EY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcDXP-0005nQ-77 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E8EB5440E1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  4 Jan 2026 02:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7AB3C19422;
 Sun,  4 Jan 2026 02:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767492485;
 bh=22CZHf9Gf9wSJLz2awwoel7QS+TzqKNNCxsacnZaqDY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E5LSrqDuZYik6d5FBDbJgysD3BpzS+C4JgmOXf2j5Lx3JJ9LhGvEDyHjX2IulphkU
 JGRfgy3Z9NgoasYDO1pzqq5crzxurSQC3POBaSmI4QuF6v237sxtYd6KN42Qlj3mVP
 tuaAcheCYb5Hgu8HDPoRIMcF3T1lq8+SwrR0LrTJuo2tu0YLKwu+AH0NWeOK6LPLzx
 /INdZGnAPEu4kNq0LlA7l2ieISCEz3NlWWAjz+yXQw+XJiNmJi+kMYjdaq602LceNy
 Kk+igMny49xxA8ffyILmUvoaYOi8Oh9dVDlUGG6H3e2DUQ/sevAh7gApMkjxQRhkGO
 aKEAWRVStNKBg==
To: jaegeuk@kernel.org
Date: Sun,  4 Jan 2026 10:07:17 +0800
Message-ID: <20260104020729.1064529-2-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
In-Reply-To: <20260104020729.1064529-1-chao@kernel.org>
References: <20260104020729.1064529-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch add a new sysfs node in
 /sys/fs/f2fs/<device>/max_lock_elapsed_time.
 This is a threshold, once a thread enters critical region that lock covers,
 total elapsed time exceeds this threshold, f2fs will print tracepoint to
 dump information of related context. This sysfs ent [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vcDXP-0005nQ-77
Subject: [f2fs-dev] [PATCH 02/14] f2fs: sysfs: introduce
 max_lock_elapsed_time
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch add a new sysfs node in /sys/fs/f2fs/<device>/max_lock_elapsed_time.

This is a threshold, once a thread enters critical region that lock covers,
total elapsed time exceeds this threshold, f2fs will print tracepoint to dump
information of related context. This sysfs entry can be used to control the
value of threshold, by default, the value is 500 ms.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 8 ++++++++
 fs/f2fs/checkpoint.c                    | 2 +-
 fs/f2fs/f2fs.h                          | 3 +++
 fs/f2fs/super.c                         | 1 +
 fs/f2fs/sysfs.c                         | 2 ++
 5 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index c39a85e84b6b..648ddd0d59f6 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -939,3 +939,11 @@ Description:	Controls write priority in multi-devices setups. A value of 0 means
 		allocate_section_policy = 1  Prioritize writing to section before allocate_section_hint
 		allocate_section_policy = 2  Prioritize writing to section after allocate_section_hint
 		===========================  ==========================================================
+
+What:		/sys/fs/f2fs/<disk>/max_lock_elapsed_time
+Date:		December 2025
+Contact:	"Chao Yu" <chao@kernel.org>
+Description:	This is a threshold, once a thread enters critical region that lock covers, total
+		elapsed time exceeds this threshold, f2fs will print tracepoint to dump information
+		of related context. This sysfs entry can be used to control the value of threshold,
+		by default, the value is 500 ms.
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index bc6058a3122b..61bcf227d8ca 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -66,7 +66,7 @@ static inline void trace_lock_elapsed_time_end(struct f2fs_rwsem *sem,
 	get_lock_elapsed_time(&tts);
 
 	total_time = div_u64(tts.total_time - lc->ts.total_time, npm);
-	if (total_time <= MAX_LOCK_ELAPSED_TIME)
+	if (total_time <= sem->sbi->max_lock_elapsed_time)
 		return;
 
 #ifdef CONFIG_64BIT
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 7e22315dbedd..b31589e5e19f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1951,6 +1951,9 @@ struct f2fs_sb_info {
 	/* carve out reserved_blocks from total blocks */
 	bool carve_out;
 
+	/* max elapsed time threshold in critical region that lock covered */
+	unsigned long long max_lock_elapsed_time;
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct kmem_cache *page_array_slab;	/* page array entry */
 	unsigned int page_array_slab_size;	/* default page array slab size */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 16293b0f4480..d277f082d4c0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4295,6 +4295,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->max_fragment_hole = DEF_FRAGMENT_SIZE;
 	spin_lock_init(&sbi->gc_remaining_trials_lock);
 	atomic64_set(&sbi->current_atomic_write, 0);
+	sbi->max_lock_elapsed_time = MAX_LOCK_ELAPSED_TIME;
 
 	sbi->dir_level = DEF_DIR_LEVEL;
 	sbi->interval_time[CP_TIME] = DEF_CP_INTERVAL;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index e6a98ddd73b3..e95aa23c5bef 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1263,6 +1263,7 @@ F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
 F2FS_SBI_GENERAL_RW_ATTR(carve_out);
 F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);
 F2FS_SBI_GENERAL_RW_ATTR(bggc_io_aware);
+F2FS_SBI_GENERAL_RW_ATTR(max_lock_elapsed_time);
 
 /* STAT_INFO ATTR */
 #ifdef CONFIG_F2FS_STAT_FS
@@ -1466,6 +1467,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(reserved_pin_section),
 	ATTR_LIST(allocate_section_hint),
 	ATTR_LIST(allocate_section_policy),
+	ATTR_LIST(max_lock_elapsed_time),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

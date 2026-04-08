Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHvFGx4C1mlsAAgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 08 Apr 2026 09:22:06 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE403B80C6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 08 Apr 2026 09:22:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4EH1fkX+YGdW7G6e6f/fEvxxkdqUXkMH7TqyRroNz1k=; b=lh3FyEYq+5pl6h0fvG7/NHTmLw
	ZVLEFz0iOla7Qqs7lKgrjBi0amDeqNxoB75InRZtKpod5gEUB/TGnMvHYZcABHWHtmG8+6UmGzt7C
	s6alYglod2zqCkyg+Zlumxksu3tC0rVdlV27tQu4VpqusvpTstCOXWQcQaAaDUEHbpzg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wANEU-0003AU-DZ;
	Wed, 08 Apr 2026 07:21:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3-vDVaQcKAIkpu7yyrrt11tyr.p1z@flex--chullee.bounces.google.com>)
 id 1wANEA-0003AA-Sy for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Apr 2026 07:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/4VHAXQtt4UQjJS8apUAAIRIJDoen9TVa0cA30mWt+8=; b=EuJXMslU+hJp14cgPfhaXytMoj
 3VWQ79KgeZYl/e/PMI03MDmnIeA4n5e/rhe3hSaNdSKAt2owCe7cexfeCX4iSFlJvbyhiNp4Z05rZ
 zJu9en0vp1QQY45Vf7I/z0ykwiARNhDVz2qGrve91B67e3XQBo/IewcB9RPJbIjexx7c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/4VHAXQtt4UQjJS8apUAAIRIJDoen9TVa0cA30mWt+8=; b=N
 WG/fWVt63bXStSvQGAa9u6NmyyDzcCINJrQzslZZoChvXdWnJo/mkCTeM+mUbD4nCQnL1zMi5VCpZ
 zfxO00eOjl7+UBkoSIOM0TpWFNYrLmwAHFhaxzdVGQ0obDyzFyfeJTHHEfZ7xZTkhGHHjnegP0Lwq
 rOqAFBpV+wvKrEP4=;
Received: from mail-oo1-f73.google.com ([209.85.161.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wANEA-0003i0-9B for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Apr 2026 07:21:30 +0000
Received: by mail-oo1-f73.google.com with SMTP id
 006d021491bc7-6853c2439a6so6655335eaf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 08 Apr 2026 00:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1775632884; x=1776237684;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/4VHAXQtt4UQjJS8apUAAIRIJDoen9TVa0cA30mWt+8=;
 b=bOt1nTML6qQ7d6BivE0PZ8zOZBjRkYKnYEz4dhp3ctHc1q42f0ZEAjgbUqR1XOIjKJ
 LWLj/hH3Pgs8lFDeBMweVu9mI83yYisKeFkJi6e9KlNqOrYzm58NnApzcC9vOKiLGKoU
 foZPFNUoowEmKlt4aE8nnZprrLRXU5HTv7JPLoe4qbCpyvA52e0T1FbszmecKZ+dqjna
 G7ZVkDegZ1oqiZEvE+roOGAShF5nQc2yNlMIwSHXaSdLSwrAgPCWst9FanEudqW1KF+o
 HU3c/UWYu1w6XKAKBIkX7Aa6jHPkvYsBzwhZFuFreBFymZEiw7HbThA4EuOWiVuF0NMe
 DQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775632884; x=1776237684;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/4VHAXQtt4UQjJS8apUAAIRIJDoen9TVa0cA30mWt+8=;
 b=S+az9FFYx1zuDiyeohC4rDMJBqY7APtLuJn4+12SwJFEfhSECx1kOHSccJ6PWTYyl4
 KX4T8OxSizTSnfFbN9KucTAlYg5Zze6qIbovmot1ku2h+6MXMGqre1HLSVixBwjYHBKz
 tXq4vRvyaXfaLWYjNuZelgQJqYYxQhG+euVcxyI7hiYo39PFHdRd8ysMXlUTe5UP32Ks
 V4IjNsr09OWFGE/FmGZwMbmFibc6g8suchopBnaKA3yq+rm/CSqle6f1l0s+yN5Fn81x
 dNvCpGBbm0v8EwRSv+CAy8qsvTI7Pvb8h+KlubKlGPLppnK22ec+qNqiVvAFGNOb3ySJ
 LOyg==
X-Gm-Message-State: AOJu0Yz7ifxtpqLxTxEQqmBzPR7OKw6DLCYaIsmgG3IFXXaSRB7uaZLQ
 w6Zl4L3rIzRKb+GNipH451YqAf4zBQ1lBxCVB4jwQRdt2frKqHhvydhPpMPEB5+rlBrWxBpqnyC
 pKmjZp6VOgg==
X-Received: from dlii40.prod.google.com ([2002:a05:7022:41a8:b0:12a:7a40:ea24])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:6997:b0:128:cf75:42a3
 with SMTP id a92af1059eb24-12bfb745b32mr9292926c88.21.1775628538712; Tue, 07
 Apr 2026 23:08:58 -0700 (PDT)
Date: Tue,  7 Apr 2026 23:08:40 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260408060840.316332-1-chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Track read folio counts by order in F2FS iostat sysfs and
 tracepoints. Signed-off-by: Daniel Lee <chullee@google.com> --- fs/f2fs/data.c
 | 4 ++++ fs/f2fs/f2fs.h | 3 +++ fs/f2fs/iostat.c | 38
 ++++++++++++++++++++++++++++++++++++-
 fs/f2fs/iostat.h | 4 ++++ include/trace/ev [...] 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.73 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1wANEA-0003i0-9B
Subject: [f2fs-dev] [PATCH] f2fs: add page-order information for large folio
 reads in iostat
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
From: Daniel Lee via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Lee <chullee@google.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,google.com:s=20251104];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chullee@google.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,google.com:-];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 7FE403B80C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Track read folio counts by order in F2FS iostat sysfs and tracepoints.

Signed-off-by: Daniel Lee <chullee@google.com>
---
 fs/f2fs/data.c              |  4 ++++
 fs/f2fs/f2fs.h              |  3 +++
 fs/f2fs/iostat.c            | 38 ++++++++++++++++++++++++++++++++++++-
 fs/f2fs/iostat.h            |  4 ++++
 include/trace/events/f2fs.h | 21 ++++++++++++++++----
 5 files changed, 65 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a210a7a627c6..965d4e6443c6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2508,6 +2508,8 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	if (!folio)
 		goto out;
 
+	f2fs_update_read_folio_count(F2FS_I_SB(inode), folio);
+
 	folio_in_bio = false;
 	index = folio->index;
 	offset = 0;
@@ -2682,6 +2684,8 @@ static int f2fs_mpage_readpages(struct inode *inode, struct fsverity_info *vi,
 			prefetchw(&folio->flags);
 		}
 
+		f2fs_update_read_folio_count(F2FS_I_SB(inode), folio);
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		index = folio->index;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 56c4af4b1737..e40b6b2784ee 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -10,6 +10,7 @@
 
 #include <linux/uio.h>
 #include <linux/types.h>
+#include <linux/mmzone.h>
 #include <linux/page-flags.h>
 #include <linux/slab.h>
 #include <linux/crc32.h>
@@ -2034,6 +2035,8 @@ struct f2fs_sb_info {
 	unsigned long long iostat_count[NR_IO_TYPE];
 	unsigned long long iostat_bytes[NR_IO_TYPE];
 	unsigned long long prev_iostat_bytes[NR_IO_TYPE];
+	unsigned long long iostat_read_folio_count[NR_PAGE_ORDERS];
+	unsigned long long prev_iostat_read_folio_count[NR_PAGE_ORDERS];
 	bool iostat_enable;
 	unsigned long iostat_next_period;
 	unsigned int iostat_period_ms;
diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index f8703038e1d8..ae265e3e9b2c 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -34,6 +34,7 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 {
 	struct super_block *sb = seq->private;
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+	int i;
 
 	if (!sbi->iostat_enable)
 		return 0;
@@ -76,6 +77,12 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 	IOSTAT_INFO_SHOW("fs node", FS_NODE_READ_IO);
 	IOSTAT_INFO_SHOW("fs meta", FS_META_READ_IO);
 
+	/* print read folio order stats */
+	seq_printf(seq, "%-23s", "fs read folio order:");
+	for (i = 0; i < NR_PAGE_ORDERS; i++)
+		seq_printf(seq, " %llu", sbi->iostat_read_folio_count[i]);
+	seq_putc(seq, '\n');
+
 	/* print other IOs */
 	seq_puts(seq, "[OTHER]\n");
 	IOSTAT_INFO_SHOW("fs discard", FS_DISCARD_IO);
@@ -113,6 +120,7 @@ static inline void __record_iostat_latency(struct f2fs_sb_info *sbi)
 static inline void f2fs_record_iostat(struct f2fs_sb_info *sbi)
 {
 	unsigned long long iostat_diff[NR_IO_TYPE];
+	unsigned long long read_folio_count_diff[NR_PAGE_ORDERS];
 	int i;
 	unsigned long flags;
 
@@ -133,9 +141,15 @@ static inline void f2fs_record_iostat(struct f2fs_sb_info *sbi)
 				sbi->prev_iostat_bytes[i];
 		sbi->prev_iostat_bytes[i] = sbi->iostat_bytes[i];
 	}
+
+	for (i = 0; i < NR_PAGE_ORDERS; i++) {
+		read_folio_count_diff[i] = sbi->iostat_read_folio_count[i] -
+					sbi->prev_iostat_read_folio_count[i];
+		sbi->prev_iostat_read_folio_count[i] = sbi->iostat_read_folio_count[i];
+	}
 	spin_unlock_irqrestore(&sbi->iostat_lock, flags);
 
-	trace_f2fs_iostat(sbi, iostat_diff);
+	trace_f2fs_iostat(sbi, iostat_diff, read_folio_count_diff);
 
 	__record_iostat_latency(sbi);
 }
@@ -151,6 +165,10 @@ void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
 		sbi->iostat_bytes[i] = 0;
 		sbi->prev_iostat_bytes[i] = 0;
 	}
+	for (i = 0; i < NR_PAGE_ORDERS; i++) {
+		sbi->iostat_read_folio_count[i] = 0;
+		sbi->prev_iostat_read_folio_count[i] = 0;
+	}
 	spin_unlock_irq(&sbi->iostat_lock);
 
 	spin_lock_irq(&sbi->iostat_lat_lock);
@@ -165,6 +183,24 @@ static inline void __f2fs_update_iostat(struct f2fs_sb_info *sbi,
 	sbi->iostat_count[type]++;
 }
 
+void f2fs_update_read_folio_count(struct f2fs_sb_info *sbi, struct folio *folio)
+{
+	unsigned int order = folio_order(folio);
+	unsigned long flags;
+
+	if (!sbi->iostat_enable)
+		return;
+
+	if (order >= NR_PAGE_ORDERS)
+		order = NR_PAGE_ORDERS - 1;
+
+	spin_lock_irqsave(&sbi->iostat_lock, flags);
+	sbi->iostat_read_folio_count[order]++;
+	spin_unlock_irqrestore(&sbi->iostat_lock, flags);
+
+	f2fs_record_iostat(sbi);
+}
+
 void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
 			enum iostat_type type, unsigned long long io_bytes)
 {
diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
index eb99d05cf272..2025225b5bed 100644
--- a/fs/f2fs/iostat.h
+++ b/fs/f2fs/iostat.h
@@ -34,6 +34,8 @@ extern int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
 extern void f2fs_reset_iostat(struct f2fs_sb_info *sbi);
 extern void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
 			enum iostat_type type, unsigned long long io_bytes);
+extern void f2fs_update_read_folio_count(struct f2fs_sb_info *sbi,
+			struct folio *folio);
 
 struct bio_iostat_ctx {
 	struct f2fs_sb_info *sbi;
@@ -68,6 +70,8 @@ extern void f2fs_destroy_iostat(struct f2fs_sb_info *sbi);
 #else
 static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
 		enum iostat_type type, unsigned long long io_bytes) {}
+static inline void f2fs_update_read_folio_count(struct f2fs_sb_info *sbi,
+		struct folio *folio) {}
 static inline void iostat_update_and_unbind_ctx(struct bio *bio) {}
 static inline void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
 		struct bio *bio, struct bio_post_read_ctx *ctx) {}
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 9364e6775562..49c6cbb6f989 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -2116,9 +2116,10 @@ DEFINE_EVENT(f2fs_zip_end, f2fs_decompress_pages_end,
 #ifdef CONFIG_F2FS_IOSTAT
 TRACE_EVENT(f2fs_iostat,
 
-	TP_PROTO(struct f2fs_sb_info *sbi, unsigned long long *iostat),
+	TP_PROTO(struct f2fs_sb_info *sbi, unsigned long long *iostat,
+			unsigned long long *read_folio_count),
 
-	TP_ARGS(sbi, iostat),
+	TP_ARGS(sbi, iostat, read_folio_count),
 
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
@@ -2150,6 +2151,7 @@ TRACE_EVENT(f2fs_iostat,
 		__field(unsigned long long,	fs_mrio)
 		__field(unsigned long long,	fs_discard)
 		__field(unsigned long long,	fs_reset_zone)
+		__array(unsigned long long,	read_folio_count, 16)
 	),
 
 	TP_fast_assign(
@@ -2182,6 +2184,9 @@ TRACE_EVENT(f2fs_iostat,
 		__entry->fs_mrio	= iostat[FS_META_READ_IO];
 		__entry->fs_discard	= iostat[FS_DISCARD_IO];
 		__entry->fs_reset_zone	= iostat[FS_ZONE_RESET_IO];
+		memset(__entry->read_folio_count, 0, sizeof(__entry->read_folio_count));
+		memcpy(__entry->read_folio_count, read_folio_count,
+				sizeof(unsigned long long) * min_t(int, NR_PAGE_ORDERS, 16));
 	),
 
 	TP_printk("dev = (%d,%d), "
@@ -2194,7 +2199,9 @@ TRACE_EVENT(f2fs_iostat,
 		"app [read=%llu (direct=%llu, buffered=%llu), mapped=%llu], "
 		"compr(buffered=%llu, mapped=%llu)], "
 		"fs [data=%llu, (gc_data=%llu, cdata=%llu), "
-		"node=%llu, meta=%llu]",
+		"node=%llu, meta=%llu], "
+		"read_folio_count [0=%llu, 1=%llu, 2=%llu, 3=%llu, 4=%llu, "
+		"5=%llu, 6=%llu, 7=%llu, 8=%llu, 9=%llu, 10=%llu]",
 		show_dev(__entry->dev), __entry->app_wio, __entry->app_dio,
 		__entry->app_bio, __entry->app_mio, __entry->app_bcdio,
 		__entry->app_mcdio, __entry->fs_dio, __entry->fs_cdio,
@@ -2205,7 +2212,13 @@ TRACE_EVENT(f2fs_iostat,
 		__entry->app_rio, __entry->app_drio, __entry->app_brio,
 		__entry->app_mrio, __entry->app_bcrio, __entry->app_mcrio,
 		__entry->fs_drio, __entry->fs_gdrio,
-		__entry->fs_cdrio, __entry->fs_nrio, __entry->fs_mrio)
+		__entry->fs_cdrio, __entry->fs_nrio, __entry->fs_mrio,
+		__entry->read_folio_count[0], __entry->read_folio_count[1],
+		__entry->read_folio_count[2], __entry->read_folio_count[3],
+		__entry->read_folio_count[4], __entry->read_folio_count[5],
+		__entry->read_folio_count[6], __entry->read_folio_count[7],
+		__entry->read_folio_count[8], __entry->read_folio_count[9],
+		__entry->read_folio_count[10])
 );
 
 #ifndef __F2FS_IOSTAT_LATENCY_TYPE
-- 
2.53.0.1213.gd9a14994de-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

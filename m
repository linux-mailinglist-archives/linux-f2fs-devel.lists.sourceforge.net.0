Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAF1C90CED
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Nov 2025 04:56:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gE88f8J9JSFdHn9SYCow4Nc3JoNN5sUaMX/fzDvVec=; b=GQwd0N3cdlNoLxjzxnLugPPu0H
	YIj2Cy8t9duhRri335wG92vgANiNCGWhNqv+3HwF8yQ/x9nF889D3OJgtdDo/3KdfqOd46BpPUkWA
	ZO2ty76PwluYBeCcsaMDJ0YpqPyYQFdE/TrZ0+QgYso29RSGyZby61EgxAqepGwq5Y4I=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vOpal-0000oR-Ua;
	Fri, 28 Nov 2025 03:56:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3dhYpaQQKEJcP8C97FF7C5.3FDC9ELO-6T6J-45M5CC9JKJ.JFLI356FI75.E5K@flex--yhli.bounces.google.com>)
 id 1vOpak-0000oK-4k for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Nov 2025 03:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bPY6J8aGE6D9kMp0fnzHzUqR5pFauYhLSeepNwWlytg=; b=bdn6kqdkdJBAUanAmeyyT+dk9M
 hnI3qUvdA9rfFWfCwwQ3dY3UfzJ18dtUM6o/7r7LDUQxCkFpHKeACbWvhyGjjC8EKo5Xd41h2OGAE
 C/l+b8NU1ZQsoJps0StZd8N703ZgiNOZmZ6rkJR1szgihbEfQOT6zFUCAEgCh+yIQvWk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bPY6J8aGE6D9kMp0fnzHzUqR5pFauYhLSeepNwWlytg=; b=ldPfaExC/5XYMsdhe08J2cmSyu
 wfRcCivwWek4aDaFUqVXWAPQEoEbrGbbgZ38e2vy0FaYuwkn4p46/BYzqV9+KiSNImizk8jNVhxl1
 7UjsHkTaWRJ/nYMOiinRqUW3lQi1BilCjvH/xyAy5de+ywWpeZp7zEeyqls1gtbHPK4M=;
Received: from mail-qk1-f202.google.com ([209.85.222.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vOpaj-0000jB-LG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Nov 2025 03:56:18 +0000
Received: by mail-qk1-f202.google.com with SMTP id
 af79cd13be357-8b26bc4984bso400042785a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Nov 2025 19:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764302167; x=1764906967;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=bPY6J8aGE6D9kMp0fnzHzUqR5pFauYhLSeepNwWlytg=;
 b=o8boMp0JV2VC9lYRlQxSR/gQpvnJv9IeLv/v+2oUPoUsVUNmhXjXoDChApBi4u5kmY
 lC5epGDu7zKtisPKa4fkr3BALvW5G+yaSWgT7TMqt16UhdpraNsKDJimmPbZgQ9fxQFM
 PYNl62oJ8qD5Phdj2ukXhQayxt0CNOMJJljmBULGGlYCEx9QEhIn1evEl4kHfIr95Xbk
 fsBbKjJ5lcRKAFTK+NNOAdqgi/TBQGq2MzXpxBbJQrzup0zDVK7luQEFPWlw4yV8tM+/
 cvO6aMVcRjRYPjZGYVUzpyhU6gqqc7/n1gNn49XEQWQHXMou/XLk/fe0E+YKoLi/PwIt
 Z4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764302167; x=1764906967;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bPY6J8aGE6D9kMp0fnzHzUqR5pFauYhLSeepNwWlytg=;
 b=D2w5u6FQDUJ/BGTdN9RQgyr48ZnOde3N6AfeSTM1OHiHTWi/ARn9ojx2NlXb8yL88E
 NbTrouflsnLRA7Mg8upzYF6XqyJ4pF2LWrm6hMM0QicpA/KHRpNF74K3WIdM7Gno+mRh
 H+EcSQaTGt2HwwUGBKdgSTtgyB8WXhs8NpTZEWUgH4lfTYPSsbiZlhuxAlBOe4NPjQgQ
 4fT+sp/t4BBG7wdpKRek0t9PtevSF4cxlPqAMsmO94nw6nM34xKSkEX4Ac8IewJGX4we
 RHbC9YGrSVfX07HLd4k/Qrj1NnijLs8v4tiRM92zljJHvpB69QpFynvCm2bAw3TZpXM0
 WVUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeLOorwKj6ilnHy636XeTTuNjjMoD6NfydfeZSOAeyLSECqOXOl8WL/ImWP4ynMVW96vQQ/zAGzikl3v6RQgJO@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw5+TmTcZzGMv5HzPjJPLy6SOgJSfF6+HlDoe2+L/RaZ+oHAqPU
 Fejh8tCIeBL7lG5/xTBKJTZ4yksq/7ELesl76Oqwejbg30Gkup66RZ7jKjvGBcEXvbU08tF8Ew=
 =
X-Google-Smtp-Source: AGHT+IGxBRbLNbmGL9n+2+vakJDui9W8IGhhE6rqBqDp7pBn826yD5OZcwJeoxjTNFqns6+vEB0c1zEf
X-Received: from pfbmb15.prod.google.com ([2002:a05:6a00:760f:b0:7ae:a150:ac8])
 (user=yhli job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1895:b0:7b9:a3c8:8c3a
 with SMTP id d2e1a72fcca58-7c58beb75bfmr28179433b3a.7.1764300406497; Thu, 27
 Nov 2025 19:26:46 -0800 (PST)
Date: Fri, 28 Nov 2025 11:23:57 +0800
In-Reply-To: <no>
Mime-Version: 1.0
References: <no>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
Message-ID: <20251128032509.825003-1-yhli@google.com>
To: yes@google.com
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch optimizes the tracepoint by replacing these
 hardcoded
 strings with a new enumeration f2fs_cp_phase. 1.Defines enum f2fs_cp_phase
 with values for each checkpoint phase. 2.Updates trace_f2fs_write_checkpoint
 to accept a u16 phase argument instead of a string pointer. 3.Uses
 __print_symbolic in TP_prin [...] 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.202 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1vOpaj-0000jB-LG
Subject: [f2fs-dev] [PATCH v2] f2fs: optimize trace_f2fs_write_checkpoint
 with enums
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
From: YH Lin via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: YH Lin <yhli@google.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch optimizes the tracepoint by replacing these hardcoded strings
with a new enumeration f2fs_cp_phase.

1.Defines enum f2fs_cp_phase with values for each checkpoint phase.
2.Updates trace_f2fs_write_checkpoint to accept a u16 phase argument
instead of a string pointer.
3.Uses __print_symbolic in TP_printk to convert the enum values
back to their corresponding strings for human-readable trace output.

This change reduces the storage overhead for each trace event
by replacing a variable-length string with a 2-byte integer,
while maintaining the same readable output in ftrace.

Signed-off-by: YH Lin <yhli@google.com>
V2:
- Relocate enum f2fs_cp_phase from include/trace/events/f2fs.h to fs/f2fs/f2fs.h,
  as requested by Chao Yu for better structure cleanup.
---
 fs/f2fs/checkpoint.c        |  6 +++---
 fs/f2fs/f2fs.h              |  6 ++++++
 include/trace/events/f2fs.h | 19 ++++++++++++++-----
 3 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index bbe07e3a6c75..b04f82fdd143 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1673,7 +1673,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		goto out;
 	}
 
-	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, "start block_ops");
+	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, CP_PHASE_START_BLOCK_OPS);
 
 	err = block_operations(sbi);
 	if (err)
@@ -1681,7 +1681,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	stat_cp_time(cpc, CP_TIME_OP_LOCK);
 
-	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, "finish block_ops");
+	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, CP_PHASE_FINISH_BLOCK_OPS);
 
 	f2fs_flush_merged_writes(sbi);
 
@@ -1747,7 +1747,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	/* update CP_TIME to trigger checkpoint periodically */
 	f2fs_update_time(sbi, CP_TIME);
-	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, "finish checkpoint");
+	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, CP_PHASE_FINISH_CHECKPOINT);
 out:
 	if (cpc->reason != CP_RESIZE)
 		f2fs_up_write(&sbi->cp_global_sem);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6f509d88c596..a995103af735 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -313,6 +313,12 @@ struct cp_control {
 	struct cp_stats stats;
 };
 
+enum f2fs_cp_phase {
+	CP_PHASE_START_BLOCK_OPS,
+	CP_PHASE_FINISH_BLOCK_OPS,
+	CP_PHASE_FINISH_CHECKPOINT,
+};
+
 /*
  * indicate meta/data type
  */
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index e00611ead024..df4017dcc701 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -50,6 +50,9 @@ TRACE_DEFINE_ENUM(CP_PAUSE);
 TRACE_DEFINE_ENUM(CP_RESIZE);
 TRACE_DEFINE_ENUM(EX_READ);
 TRACE_DEFINE_ENUM(EX_BLOCK_AGE);
+TRACE_DEFINE_ENUM(CP_PHASE_START_BLOCK_OPS);
+TRACE_DEFINE_ENUM(CP_PHASE_FINISH_BLOCK_OPS);
+TRACE_DEFINE_ENUM(CP_PHASE_FINISH_CHECKPOINT);
 
 #define show_block_type(type)						\
 	__print_symbolic(type,						\
@@ -175,6 +178,12 @@ TRACE_DEFINE_ENUM(EX_BLOCK_AGE);
 #define S_ALL_PERM	(S_ISUID | S_ISGID | S_ISVTX |	\
 			S_IRWXU | S_IRWXG | S_IRWXO)
 
+#define show_cp_phase(phase)					\
+	__print_symbolic(phase,						\
+		{ CP_PHASE_START_BLOCK_OPS,		"start block_ops" },			\
+		{ CP_PHASE_FINISH_BLOCK_OPS,	"finish block_ops" },			\
+		{ CP_PHASE_FINISH_CHECKPOINT,	"finish checkpoint" })
+
 struct f2fs_sb_info;
 struct f2fs_io_info;
 struct extent_info;
@@ -1573,26 +1582,26 @@ TRACE_EVENT(f2fs_readpages,
 
 TRACE_EVENT(f2fs_write_checkpoint,
 
-	TP_PROTO(struct super_block *sb, int reason, const char *msg),
+	TP_PROTO(struct super_block *sb, int reason, u16 phase),
 
-	TP_ARGS(sb, reason, msg),
+	TP_ARGS(sb, reason, phase),
 
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
 		__field(int,	reason)
-		__string(dest_msg, msg)
+		__field(u16, phase)
 	),
 
 	TP_fast_assign(
 		__entry->dev		= sb->s_dev;
 		__entry->reason		= reason;
-		__assign_str(dest_msg);
+		__entry->phase		= phase;
 	),
 
 	TP_printk("dev = (%d,%d), checkpoint for %s, state = %s",
 		show_dev(__entry->dev),
 		show_cpreason(__entry->reason),
-		__get_str(dest_msg))
+		show_cp_phase(__entry->phase))
 );
 
 DECLARE_EVENT_CLASS(f2fs_discard,
-- 
2.52.0.487.g5c8c507ade-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

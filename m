Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9592C67C93
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Nov 2025 07:53:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VVvnX3ILElxn+dqmnNeu205BzjV2uJi94/il3W52GEs=; b=KcZe1feHXwXDjL5iTpHWfP8Lll
	Okx0n10DLVqWpltDn/S/MJR3uwtjgRUibHDzh2M4cGcZ5rcdIKMLxiOvFppdFKhfxSHchfN8Bp3rM
	vMKbNBsJU2XqfJcODQ6upx05asGY3d/eT5xHmhAFUVnbPPJ4qsNhKqMgXXktpsn0RR/0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vLFan-0004fH-1y;
	Tue, 18 Nov 2025 06:53:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3exAcaQQKEFwSBFCAIIAF8.6IGFCHOR-9W9M-78P8FFCMNM.MIOL689ILA8.H8N@flex--yhli.bounces.google.com>)
 id 1vLFal-0004f7-P9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ht0bGJ+qMeoh2nKXD0gUXCN3fVl6s6OTYvnWp4jySD0=; b=RAU9bGpKPtEHNAQ/vqJI3YPtn8
 6L9VJAFX87Pq5ybtWwYCaBI3d0+PqfDuO/Fz7yq0u2wGq9FBqyjsuc5C7tWeg6caCo4pw/YqcwlMR
 dot+ePFSXYgamwL1lTYP1b2xGdpd1/qJBh+FWcMVeMqjKyk1TZjh2sTcBj86Y30BCQoE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ht0bGJ+qMeoh2nKXD0gUXCN3fVl6s6OTYvnWp4jySD0=; b=g
 eQSExYI945F6TSfejioH5z+Ai4aU2bdhH87tY7KLVTB9OPsP9rI0oaWZmQjHUETdfJT98E79arr8c
 SXfOUno1mCBkUHBmWuOUaNE0bwscnhQwml2iH1DxE+J3IkF3xQy9p3H7yVLjQGLj+Y3sgoChJP98A
 mCl/KlcDXnUDZs8E=;
Received: from mail-oo1-f74.google.com ([209.85.161.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vLFal-0008PO-9b for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:53:31 +0000
Received: by mail-oo1-f74.google.com with SMTP id
 006d021491bc7-6574ff2be86so2855219eaf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Nov 2025 22:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1763448800; x=1764053600;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ht0bGJ+qMeoh2nKXD0gUXCN3fVl6s6OTYvnWp4jySD0=;
 b=P5oLlSI3jr2z16uuXGevfOmCFLoCTP/f29EHRy7RNenJNjBqmpzb5GP8gL/N80K/u8
 OSYSaO837gveUoePhm7M9CDsyO2a/cnyWqz9VeeOl/kbai0LhanI6j2MV9sOdC6MTfsN
 3o7naFmLwM6kE3MJt29ExEquuz9U4JlPW0KdVBAKhmfJZO301VnCkWkS3CiAm5Fx4JE5
 1VtSW1o6y0PRm3/Yhv9B8ttOH3Rx219R6KIj7bFf5WBolh4RxaAXnbb8OL8p6And0KqQ
 9q4BsE3TrTJeTFzPPoz8vPcHUuCuTy4ZJXrsU4X6Tn2xLqhfcYo0LPiS9xCG4hKVC5hU
 CgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763448800; x=1764053600;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ht0bGJ+qMeoh2nKXD0gUXCN3fVl6s6OTYvnWp4jySD0=;
 b=VK6bN2Rf6lE2s+kp60A92RKoEqgFKQdfgmmp8OpC0bA04p1QYYXSOdbPQH1YmpFv51
 Frc7ZLKLlq6l+292Um2+8ZSSUuZkKv02+Z4ynUYpeybWrxplnfZjQ7HPrUXRAi4K2AIA
 pdGGkiw3a2jkLEcz8vTiL4+7FYcDw3SXi90R160IshFPLmoy41RItrryD3W/HOO+UUuN
 /T8mZ9pIzLzJL8OLYw6mzAWkBFbLX8eCA6/d4yMTxYZxAhznBCNVt8tKpTVX/dLo81cp
 gRUwK+2HJlSeZ+x6JX4DX1oxs5Ys5sQy0Ac6SDEH4iH249Bgf/VhN7k+DOpq7x2dFDiy
 dC8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrWxlGZQOBvfpjoDK3EuttQEm9b9IHxOp8DLbxqUKKUZXAXcc/SoDOmrIn+W3eUf7Iu46vO/S0Irwj2xmoVxKj@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxr3Hj0eX4d9davJVk4HCQc8EjJs3hRQvL52MosWIYFSsNNvbY7
 RlD1uyWCLJuoKxbeZMlwFH4WHPoS+RjVgarVL7Lke/KWrxHWOPod7Syj52WPPAksn+GrMuiu5Q=
 =
X-Google-Smtp-Source: AGHT+IG4lunFThAtiGTvAVuvfp+1YhoKbyAo8dba1DkSZ/pQCkz4PLegWIzFsFufPnDN4ny5AWU4BtGG
X-Received: from pfblh5.prod.google.com ([2002:a05:6a00:7105:b0:7b2:129d:2cc1])
 (user=yhli job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:33a4:b0:35f:7431:5d98
 with SMTP id adf61e73a8af0-35f74316cb8mr7492913637.15.1763446907068; Mon, 17
 Nov 2025 22:21:47 -0800 (PST)
Date: Tue, 18 Nov 2025 14:21:32 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251118062132.678025-1-yhli@google.com>
To: jaegeuk@kernel.org, chao@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.74 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1vLFal-0008PO-9b
Subject: [f2fs-dev] [PATCH] f2fs: optimize trace_f2fs_write_checkpoint with
 enums
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
---
 fs/f2fs/checkpoint.c        |  6 +++---
 include/trace/events/f2fs.h | 28 +++++++++++++++++++++++-----
 2 files changed, 26 insertions(+), 8 deletions(-)

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
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index e00611ead024..a87aab397457 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -11,6 +11,15 @@
 #define show_dev(dev)		MAJOR(dev), MINOR(dev)
 #define show_dev_ino(entry)	show_dev(entry->dev), (unsigned long)entry->ino
 
+#ifndef _TRACE_F2FS_ENUM_H
+#define _TRACE_F2FS_ENUM_H
+enum f2fs_cp_phase {
+	CP_PHASE_START_BLOCK_OPS,
+	CP_PHASE_FINISH_BLOCK_OPS,
+	CP_PHASE_FINISH_CHECKPOINT,
+};
+#endif /* _TRACE_F2FS_ENUM_H */
+
 TRACE_DEFINE_ENUM(NODE);
 TRACE_DEFINE_ENUM(DATA);
 TRACE_DEFINE_ENUM(META);
@@ -50,6 +59,9 @@ TRACE_DEFINE_ENUM(CP_PAUSE);
 TRACE_DEFINE_ENUM(CP_RESIZE);
 TRACE_DEFINE_ENUM(EX_READ);
 TRACE_DEFINE_ENUM(EX_BLOCK_AGE);
+TRACE_DEFINE_ENUM(CP_PHASE_START_BLOCK_OPS);
+TRACE_DEFINE_ENUM(CP_PHASE_FINISH_BLOCK_OPS);
+TRACE_DEFINE_ENUM(CP_PHASE_FINISH_CHECKPOINT);
 
 #define show_block_type(type)						\
 	__print_symbolic(type,						\
@@ -175,6 +187,12 @@ TRACE_DEFINE_ENUM(EX_BLOCK_AGE);
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
@@ -1573,26 +1591,26 @@ TRACE_EVENT(f2fs_readpages,
 
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
2.52.0.rc1.455.g30608eb744-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

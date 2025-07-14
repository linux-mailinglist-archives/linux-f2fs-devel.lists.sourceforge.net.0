Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E834AB046FE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Jul 2025 20:00:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/RXfAgrJwCHA0HkL96U1UCqGgKWV+41uZRGEq46taWo=; b=PjQlfLI6ntkxCQxoHuYgFyfucM
	zMpJc9EAeWd841bDaRJvikRHctkYVsExeFcPTnbkx5lS10cOpBnJrJl7FBICdu2DzBM7E/NV8WPzi
	05uCSuYyRg8UmU7orY2LWsGClwFABYrlsz9sv9S+q/zHitsHFs9Lloqeh7ZsmPfPbnn4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubNSv-00018H-7l;
	Mon, 14 Jul 2025 17:59:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3i0N1aAcKADIQViZZSSUccUZS.Qca@flex--chullee.bounces.google.com>)
 id 1ubNSt-00018B-Mu for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Jul 2025 17:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7MG/f9hslXekZ2zM+6HmDTtB/oM6WCCFuX6rJVI6NfA=; b=lFRkRCWpr096AFHFTP3kfv2Bjg
 sI7+/cbqPLCQL6uh2uWwuDAfzXsOX9snaA3vt22lkf8etDoGkJCQvlOCg5gJbKof+i6+jMfCzqHwo
 cetdm8HTwWznJwHxutrd4tw2Z+cgOQHw2hpONsHUkg6ZeUfoHaYHnpaXbiW3YFu1yrtA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7MG/f9hslXekZ2zM+6HmDTtB/oM6WCCFuX6rJVI6NfA=; b=B
 qfMn10YBRiK5Rg85ypyxAa7m0b+PV7rX7zzij5fJ0jGBI80G/SjMVfT760/VFl71XRAb9s+GojsSD
 8NLICQE3kjArgItvrpuZ3pYOF6rT4XI7j3E22mE+IGNMHfpOOusGpwzHxG5cNtHG/KIG6oTxma48O
 S7VpOSgyENEmwL/0=;
Received: from mail-oa1-f73.google.com ([209.85.160.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ubNSt-0003rG-CW for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Jul 2025 17:59:47 +0000
Received: by mail-oa1-f73.google.com with SMTP id
 586e51a60fabf-2eae95dfae3so5302423fac.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Jul 2025 10:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752515976; x=1753120776;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7MG/f9hslXekZ2zM+6HmDTtB/oM6WCCFuX6rJVI6NfA=;
 b=KFrJww+BEgleWIOuHvuZ8mrqGTigazbsRkeUUUEjVi7lIhGR6ir5C8GCoUCavgGwU2
 VNvhGcoIXZOTHwOsS1PVSbNJm27Xwy1YjpLEFLDyEpMzuJjNdiawdVzkG96Wh2hJttBE
 F6MzKFAQ4945Ezayq8qoEskCV5LIkacIe6LwmMFkO2+7mzuGM6JAZJYjxxTAuktpIdmu
 lMZ6VlxDmawvETIHcVnW+JiaY8Ez4MgNAX07YgE59UsJMOTLoBJyYoBqBOjD4whuCFYy
 Ti/aLtN84499ia5lsncGvAcyaS6gEDAUAgyVNXBsdeuOc9HDlc4z0e77V96zccv6F8qt
 g5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752515976; x=1753120776;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7MG/f9hslXekZ2zM+6HmDTtB/oM6WCCFuX6rJVI6NfA=;
 b=LAouV4bd88ZLShq2oD0IPjR5XOjKa/is/Mzf9zrGhPC6f846g9gE2o7T6eqco7R7r8
 TjkdX6Mf42yUadbL8sz/9c/gol74d7+8GclgtqtArhx8RFV1FTfRpKByl3PEKb25FnY5
 p/LbuF6PipIoX4Ll8xTwUFtbj5RnqD45Ihceoo+dl7T60YEY+RWMKbD3HIDOmca8k91q
 cY2yb3J8cahPzzLqCUE+vuIHtQxUPtAnqqRbG1eao66NtdTGTH5YD2PtcLqbGYCYuT+6
 xqjt/zgSD+l0ycIDjHDlTY3vOIlGodPwGjhpiZARNRZ/BrEUG9BV97UOrQegyeyXclgW
 vtHQ==
X-Gm-Message-State: AOJu0YzHdLffuiiVKRSySwZVcFeksTB3DkWT6PrmypE2g+uSxoBwx+VJ
 TJnOfxZ7pzKewmjkQZCz+3gkyyh7+dbwtzaC7poIYPE0R8A6Y9c60Z/e5LEnhxdJidFBxQoRMDb
 OxbBKvf05Dg==
X-Google-Smtp-Source: AGHT+IG5zAc1OVwonW3B/0Qc0B4DGSQqWxuMr1gJWBD6nrBITJm5t+JXtnMMCxmo3d7cPfBhH6rTx9Gya1V+
X-Received: from oabrx10.prod.google.com
 ([2002:a05:6871:200a:b0:2b8:e401:9c8d])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6871:4510:b0:2ea:736c:2b08
 with SMTP id 586e51a60fabf-2ff2697fceemr11206923fac.29.1752515467760; Mon, 14
 Jul 2025 10:51:07 -0700 (PDT)
Date: Mon, 14 Jul 2025 10:51:03 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714175103.61996-1-chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Daniel Lee <chullee@google.com> ---
 man/f2fs_io.8 | 22 ++++++++++++++++++++++ 1 file changed,
 22 insertions(+) diff --git a/man/f2fs_io.8
 b/man/f2fs_io.8 index e0f659e..6f3e11e 100644 --- a/man/f2fs_io.8 +++
 b/man/f2fs_io.8
 @@ -184,6 +184,28 @@ Get i_advise value and info in file .TP \fBioprio\fR
 \fI[hint] [fi [...] 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.73 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ubNSt-0003rG-CW
Subject: [f2fs-dev] [PATCH] man: add doc for
 test_create_perf/test_lookup_perf
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Daniel Lee <chullee@google.com>
---
 man/f2fs_io.8 | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index e0f659e..6f3e11e 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -184,6 +184,28 @@ Get i_advise value and info in file
 .TP
 \fBioprio\fR \fI[hint] [file]\fR
 Set ioprio to the file. The ioprio can be ioprio_write.
+.TP
+\fBtest_create_perf\fR \fI[-s] [-S] [dir] [num_files] [size_kb]\fR
+Measure file creation and deletion performance.
+.RS 1.2in
+.TP
+.B -s
+Call fsync() after each file creation.
+.TP
+.B -S
+Call sync() after deleting all files.
+.RE
+.TP
+\fBtest_lookup_perf\fR \fI[-i] [-v] [dir] [num_files]\fR
+Measure readdir/stat performance.
+.RS 1.2in
+.TP
+.B -i
+Initialized to create files only.
+.TP
+.B -v
+Verbose mode.
+.RE
 .SH AUTHOR
 This version of
 .B f2fs_io
-- 
2.50.0.727.gbf7dc18ff4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

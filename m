Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD48C83772
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 07:27:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D1XBPyZL95Pr0kRl+LrIVOT11to5ooZYk9PXDFIriME=; b=LZmSGqXujVAPy6XwAlRXQnOSio
	4uxQfmgkr/A3oocSQpEho+WXl/gBCVkzdfAB0+Wygn9R6pHv3b8K35jNULpXp2DeA27vmZxq+bCk3
	tIV9wo9SXMzxWLc3YVyrFk7k/iTnKJn3AjTLUDldFmWLbvUfdd/O67YxvZ8ioNzCIko0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNmW8-0005aN-5B;
	Tue, 25 Nov 2025 06:27:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1vNmW7-0005aG-He
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 06:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6WS+C9z8j+twqzrMehDo6BfvL4CUsWkTLlkzCxhbhUM=; b=AKq3QAoopJQDf+RBAW0N35m9Yp
 2Kion7Je9ihaFSwp8/E0NzQ9sQXCHU/OagjggYCG+GjDk46ctg491BPNVmpRn2GyufOUmMTOqbOhd
 A7r0AS2NqY6sOinDCUPP7jRy9wa4SJQ2zK5XJmd87aTUdWDbzf1zyPJ1OJOT8iH4EcBk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6WS+C9z8j+twqzrMehDo6BfvL4CUsWkTLlkzCxhbhUM=; b=R
 GjQIPfHMHVjQZq4jrRFmwaWtKNc+wUv0PgnZ2eSpmPknhDchPAbCZCfeD7XoMiIt2cxPV7gjUEw0p
 uX7MwSXPR37c8tLg+VoIMO+msvL8T91MVLskllIwjbi7NT8i5xWRzPhNy5FF16gNnFesgmC3fgg3c
 rEduvLmR2YHODyVc=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNmW7-0007iz-1O for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 06:27:11 +0000
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7ba55660769so4486599b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Nov 2025 22:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764052020; x=1764656820; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6WS+C9z8j+twqzrMehDo6BfvL4CUsWkTLlkzCxhbhUM=;
 b=L2QD0MdFUEkR7Ipta+/iqvFyf49oP5Ql1Dvv5PTd1yT9cZIAf06YGDjEZs62waW4yy
 T7Zv9yJHaUEY79YbmPbVzxpYwz4O2rX1bYTLvhKFXlQWJ+avOdlHuOP368hCpCp2hpn/
 4Sj5LSMew1gSY6H0ClbWq9v9dn8nnbG2/rC0/HK0ahgRPdwxWeEMlAefiidjsvenTLZC
 YILKO0xCV8nSig1gQVqZdJGsy/5FXO9JClgKMLKznUQhbl+Uv6jR/QKwcSlbZ+OR8Hqn
 tmyAsHrc9YUE2UHj6ikN/xKpGeIhqr2hY1zAEmhpz8KFc8i88RIprYpAQYE4dEdkl3HU
 fuow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764052020; x=1764656820;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6WS+C9z8j+twqzrMehDo6BfvL4CUsWkTLlkzCxhbhUM=;
 b=pv2TYRM6ZvJ3ubWmSnz33jBXL7PBAu2y78PgMEMAqGtmnYC/BoKJ95GoTuQ4/zMdpM
 7D5PDIQbeffIE8/7yJp9CkXwHCMinDJMcfUto54YA8fP9pA+dzgOO4mwdACRyVkUQZdo
 obczyQw213dFpz0qxmveGiGZ/HSKETrIuoKUy07zDqegi/l/gvs0nUZcTGdnywaSqjup
 k79hN9Y2tDlX8TiErgwKtgJ7tjVq+iPHB3ElV1o3KCCOPgk4YZNqN3m499YRY/Vrg0DA
 7eFjKPHx2o7ta+JJ9e5SOFK9P2bDp8ciKKsIDhf43yHm9aiOdLmu2GVXGluAxEtAWgHM
 8rIg==
X-Gm-Message-State: AOJu0YzuH+DL+YyogkdjxpiRcKYZblOzXf9GlXgFx+gtD5CJTGErXOW/
 z8Ggls8gVqa1+k2gnj7e0OoosW4BMb+IsuzcQS6m3wDpajq1BMZUSCg5
X-Gm-Gg: ASbGncsgngXSAvxEg9oTjDy5xqNIFEzMGMjeg9s11LFWg+6vJQXmjAWsUbecktik+vB
 F5GK35Ag6NmpeTOUIcDnVaNka2miEv9+gUzlvO/wFZUx3hJEIahSpVukeU09dTDKOoZw8bIhfDH
 YZi122dfCE0sJljAcsRnCeT5OP97FncGTPQ22rxaKVvEXVfbzUSTziFvSoo9cu9Yfck8YvZTEyt
 9N6G2Bywqxyg1iFgx0fLWnTymIeaRoz19OHWfBYWb5aRuRSkBeBFxt1zsS+XYOYNeKKBY5r9wXb
 qTBwt9XY/as2zMXFcYODox83BSIvXYDj48GmPBYW7VFc9T8D6JKEBQ60ADTiz5ojrLhxNEpiepp
 Lm3rtaFSyYn7tjuY0mZ6W/Hb397swuk9azebtSa36GoJ0n2mEEfxkqnXNZFBldkqnxLQNuwGLSr
 Iyc83vzxTQZMCvXy61e1TJ
X-Google-Smtp-Source: AGHT+IHcbcG2yMIICtlC5CLJgadhk9NLTNKcWrgX1AD5Jy1boYS2cH5hVVmdPte4O+Ph5fLxmftutQ==
X-Received: by 2002:a05:6a21:9989:b0:353:6c3b:d92a with SMTP id
 adf61e73a8af0-36150e5f5e8mr15870986637.15.1764052020246; 
 Mon, 24 Nov 2025 22:27:00 -0800 (PST)
Received: from zyy.mioffice.cn ([2408:8607:1b00:8:95d3:3bdc:c643:7f89])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7c3f024b7c5sm16706026b3a.43.2025.11.24.22.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 22:26:59 -0800 (PST)
From: Yangyang Zang <zangyangyang66@gmail.com>
X-Google-Original-From: Yangyang Zang <zangyangyang1@xiaomi.com>
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Tue, 25 Nov 2025 14:26:38 +0800
Message-ID: <20251125062638.3189156-1-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Commit 42482e81248f ("resize.f2fs: add caution message for
 resize") introduced the `-F' option to force resizing f2fs without displaying
 the caution message. And `add_default_options()` implies that ` [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zangyangyang66(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zangyangyang66(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.177 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNmW7-0007iz-1O
Subject: [f2fs-dev] [PATCH v3] resize.f2fs: add -g to give default options
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
Cc: Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Commit 42482e81248f ("resize.f2fs: add caution message for resize")
introduced the `-F' option to force resizing f2fs without displaying
the caution message. And `add_default_options()` implies that `-g'
enables `-F' for resize by default. However resize.f2fs does not
currently support the `-g' option. This patch adds `-g' for it.

Fixes: 42482e81248f ("resize.f2fs: add caution message for resize")
Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>
---
Changes in v3:
 - Update the resize.f2fs manual page

Changes in v2:
 - Modify the commit message as suggested by shengyong
---
 fsck/main.c       | 11 ++++++++++-
 man/resize.f2fs.8 |  7 +++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/fsck/main.c b/fsck/main.c
index f7ef092..08d38d8 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -145,6 +145,9 @@ void resize_usage()
 	MSG(0, "[options]:\n");
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -H support write hint\n");
+	MSG(0, "  -f ignore errors during resize\n");
+	MSG(0, "  -F force to resize\n");
+	MSG(0, "  -g add default options\n");
 	MSG(0, "  -o overprovision percentage [default:auto]\n");
 	MSG(0, "  -s safe resize (Does not resize metadata)\n");
 	MSG(0, "  -t target sectors [default: device size]\n");
@@ -640,7 +643,7 @@ void f2fs_parse_options(int argc, char *argv[])
 #endif
 	} else if (!strcmp("resize.f2fs", prog)) {
 #ifdef WITH_RESIZE
-		const char *option_string = "d:fFHst:o:V";
+		const char *option_string = "d:fFg:Hst:o:V";
 
 		c.func = RESIZE;
 		while ((option = getopt(argc, argv, option_string)) != EOF) {
@@ -664,6 +667,12 @@ void f2fs_parse_options(int argc, char *argv[])
 				c.force = 1;
 				MSG(0, "Info: Force to resize\n");
 				break;
+                        case 'g':
+                                if (!strcmp(optarg, "android")) {
+                                        c.defset = CONF_ANDROID;
+                                        MSG(0, "Info: Set conf for android\n");
+                                }
+                                break;
 			case 'H':
 				c.need_whint = true;
 				c.whint = WRITE_LIFE_NOT_SET;
diff --git a/man/resize.f2fs.8 b/man/resize.f2fs.8
index 5b6daf5..5ffc5d5 100644
--- a/man/resize.f2fs.8
+++ b/man/resize.f2fs.8
@@ -24,6 +24,10 @@ resize.f2fs \- resize filesystem size
 .B \-F
 ]
 [
+.B \-g
+.I specific environment
+]
+[
 .B \-H
 ]
 [
@@ -65,6 +69,9 @@ Force to fix any inconsistent data during resize.
 .BI \-F
 Skip caution dialogue and resize partition directly.
 .TP
+.BI \-g
+Set default options for specific environment
+.TP
 .BI \-H
 Specify support write hint.
 .TP
-- 
2.43.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

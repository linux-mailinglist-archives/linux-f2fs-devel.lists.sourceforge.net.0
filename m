Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 022782D0AD0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 07:43:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmAFT-000548-2t; Mon, 07 Dec 2020 06:43:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <robinh3123@gmail.com>) id 1kmAFR-00053S-0i
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 06:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=otQkiR2Uy8rxb1pUSHnhE2UFpTc3iYNCzbqKsfb2NA4=; b=KHJmxr3mY6DWi1rpVQYT94Cv+W
 Diw2E70L4Vu962v9pXl5Nu8Wx9S45Ri1Fr4kg/dI+N7BmnjEUxKGrkHtT4IqtRHAhMOMyeEO7vZKw
 lj0Gx2y3w86gXC3viRrhCqW44caYQ+TmbRuDtBQqi4tsQo0D6+EuNk90YKNVF0mU/Ml0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=otQkiR2Uy8rxb1pUSHnhE2UFpTc3iYNCzbqKsfb2NA4=; b=OEv3MeCVA6cRwIrlJ6s0QoOJs4
 szpNqmnp1RLKCA2I1dwPpXtO1Jo34QR++dT/qKpERsITjgjlv9InS78hNvFFNjRBzvXi1hHGzXwkY
 tXvhiajJQCtpvpgLklCBgLvg+tldk/GGCz5MoRt1ToPIME5RziBA3wFK2IVz0iqvbzIY=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kmAFK-0052du-Ob
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 06:43:48 +0000
Received: by mail-pf1-f178.google.com with SMTP id 131so8813424pfb.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 06 Dec 2020 22:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=otQkiR2Uy8rxb1pUSHnhE2UFpTc3iYNCzbqKsfb2NA4=;
 b=DYtvR1R7Wtnp8S64BLo/0lOTgKaVJO3rSudD5Y7dxHxnvcnlueoBtU7pTJrjoA9JR+
 H3GMBP4nifMBidpjNOyTPToW97WOsqmTGNRMxDZg+OdvVwr5IvLbipg6JwoBd8Seg8XP
 Q71YUCVq/76glb2VBJCxMzuOFe5H086ncAnIsdVW6ir2lr1dDBL4NtuenTnPT57HANpf
 O7Mm4mDZO8ZMDlU9ziZ+gjCeySlvIGQZmTu10fa7aJl2l1jgIredfD5eNMYe/+CuGZXa
 Fbe5aEETbX6flXqIZ0zuX8VUnxMq/yPSdpfP5SuqlmSxAjJu2votKNzWS80QLzmMJJRG
 akPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=otQkiR2Uy8rxb1pUSHnhE2UFpTc3iYNCzbqKsfb2NA4=;
 b=sC7KPCXZPe0q8K1n0iP2jFdzARRYv3AnLCaQo4Nk5xn8sgfbSGRvzOqpw/bHlQRvHe
 vAA4S8T2K3D8s82LRkwXFtjKxcJuRdCCz7UnmWt7ePH1giacz9dEWXymMQBMUpvuenNO
 SC7SSTyzRRVKkRYF8ziBp3aizwFQGlz+xgOcCEbUoylQcM4/yl82ZkX7yBkIHdgv+3am
 dIxX1yEkgxTz2GA8kgvs3Q6gL8VXhm6xXKpOpn1Tw2GZ4HWYxvQ2xtN3PTHrF0TJ5+Mh
 U2iD+mC1EBQ/nrTP86z0ou3A1q3czFKutLXqhepeRuy+Mn48yNDv2ogp3vFXd6KKWZ5T
 qCLQ==
X-Gm-Message-State: AOAM530Kc/Awv1x5XJIKTWIeqjbUkDR+LfCaf1u6z6WtY2Rr4D+hb7ZH
 GJqaqmLP7qIHtMa9gaAOLQtrI/iOt38=
X-Google-Smtp-Source: ABdhPJwPpnqJ3+aM79hweW/me2ydhRM5t0xuGUZv0BphpJ+fO+PgpgfvNgCsdNBb3I3V31eGKEhR9g==
X-Received: by 2002:a17:902:70cc:b029:d7:e8ad:26d4 with SMTP id
 l12-20020a17090270ccb02900d7e8ad26d4mr14539708plt.33.1607323417021; 
 Sun, 06 Dec 2020 22:43:37 -0800 (PST)
Received: from robinhsu-p520.ntc.corp.google.com
 ([2401:fa00:fc:202:1ea0:b8ff:fe77:fe45])
 by smtp.gmail.com with ESMTPSA id o9sm9079984pjl.11.2020.12.06.22.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 22:43:36 -0800 (PST)
From: Robin Hsu <robinh3123@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, chao@kernel.org
Date: Mon,  7 Dec 2020 14:42:48 +0800
Message-Id: <20201207064250.272240-2-robinh3123@gmail.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201207064250.272240-1-robinh3123@gmail.com>
References: <20201207064250.272240-1-robinh3123@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (robinh3123[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.178 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (robinh3123[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kmAFK-0052du-Ob
Subject: [f2fs-dev] [PATCH v2 1/3] f2fs-tools: Added #ifdef WITH_func
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Robin Hsu <robinhsu@google.com>

Add proprocessor defines (options) 'WITH_func',
where func = DUMP, DEFRAG, RESIZE, or SLOAD

Bug: 161486536
Test: n/a (trivial)
Signed-off-by: Robin Hsu <robinhsu@google.com>
Change-Id: I813755548cc71dd8b026abd06893ed0fcf1d8b26
---
 fsck/main.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fsck/main.c b/fsck/main.c
index e70048b..b20498f 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -345,6 +345,7 @@ void f2fs_parse_options(int argc, char *argv[])
 				break;
 		}
 	} else if (!strcmp("dump.f2fs", prog)) {
+#ifdef WITH_DUMP
 		const char *option_string = "d:i:n:s:Sa:b:V";
 		static struct dump_option dump_opt = {
 			.nid = 0,	/* default root ino */
@@ -426,7 +427,9 @@ void f2fs_parse_options(int argc, char *argv[])
 		}
 
 		c.private = &dump_opt;
+#endif
 	} else if (!strcmp("defrag.f2fs", prog)) {
+#ifdef WITH_DEFRAG
 		const char *option_string = "d:s:Sl:t:iV";
 
 		c.func = DEFRAG;
@@ -484,7 +487,9 @@ void f2fs_parse_options(int argc, char *argv[])
 			if (err != NOERROR)
 				break;
 		}
+#endif
 	} else if (!strcmp("resize.f2fs", prog)) {
+#ifdef WITH_RESIZE
 		const char *option_string = "d:st:iV";
 
 		c.func = RESIZE;
@@ -526,7 +531,9 @@ void f2fs_parse_options(int argc, char *argv[])
 			if (err != NOERROR)
 				break;
 		}
+#endif
 	} else if (!strcmp("sload.f2fs", prog)) {
+#ifdef WITH_SLOAD
 		const char *option_string = "C:d:f:p:s:St:T:V";
 #ifdef HAVE_LIBSELINUX
 		int max_nr_opt = (int)sizeof(c.seopt_file) /
@@ -595,6 +602,7 @@ void f2fs_parse_options(int argc, char *argv[])
 			if (err != NOERROR)
 				break;
 		}
+#endif /* WITH_SLOAD */
 	}
 
 	if (err == NOERROR) {
@@ -707,6 +715,7 @@ static int do_fsck(struct f2fs_sb_info *sbi)
 	return FSCK_ERRORS_LEFT_UNCORRECTED;
 }
 
+#ifdef WITH_DUMP
 static void do_dump(struct f2fs_sb_info *sbi)
 {
 	struct dump_option *opt = (struct dump_option *)c.private;
@@ -733,7 +742,9 @@ static void do_dump(struct f2fs_sb_info *sbi)
 	print_cp_state(flag);
 
 }
+#endif
 
+#ifdef WITH_DEFRAG
 static int do_defrag(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
@@ -782,7 +793,9 @@ out_range:
 				c.defrag_target);
 	return -1;
 }
+#endif
 
+#ifdef WITH_RESIZE
 static int do_resize(struct f2fs_sb_info *sbi)
 {
 	if (!c.target_sectors)
@@ -796,7 +809,9 @@ static int do_resize(struct f2fs_sb_info *sbi)
 
 	return f2fs_resize(sbi);
 }
+#endif
 
+#ifdef WITH_SLOAD
 static int do_sload(struct f2fs_sb_info *sbi)
 {
 	if (!c.from_dir) {
@@ -808,6 +823,7 @@ static int do_sload(struct f2fs_sb_info *sbi)
 
 	return f2fs_sload(sbi);
 }
+#endif
 
 #if defined(__APPLE__)
 static u64 get_boottime_ns()
-- 
2.29.2.576.ga3fc446d84-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

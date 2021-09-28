Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0162341B895
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Sep 2021 22:47:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mVK0O-0000gd-Qv; Tue, 28 Sep 2021 20:47:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mVK0N-0000gX-Ml
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Sep 2021 20:47:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+43Onh4HLkZnURtDWg0isjVCwVeiEe/QdPT72teF59c=; b=GyURxjdh3RgWWKQXXRjaGD9GLu
 vS8Evp3hCd3H7shb/N4SSE7XxU9t5geui8DWJpruiLVjdJzcDQdX2SETBLXPiAZG4BEM82VIpTH5Z
 QmIOGUyF+/ggRXiUebGlP1eWQHawdE8ZdwhuPg7fQkdmYMYXoGCXZx8DLo9s8WEH9z7k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+43Onh4HLkZnURtDWg0isjVCwVeiEe/QdPT72teF59c=; b=R
 fiZ+ndEEa+cz8o0B2dDRWJd9Lh+6QkstyaFv6+L+dmNzDYHlTSHXxVt1TBUte5Up8peEkKi8TML30
 jkB7yCJHR/ZlBznDkg1RuFDm7sPwHgi3SPFiAcZpmz5idk2ICK4k54D6hfefGVXHyhBC/jGvENWG7
 Rdyf4aN1J6e6bszc=;
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mVK0M-00A9sq-QS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Sep 2021 20:47:11 +0000
Received: by mail-pl1-f176.google.com with SMTP id t11so15005857plq.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Sep 2021 13:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+43Onh4HLkZnURtDWg0isjVCwVeiEe/QdPT72teF59c=;
 b=HEbBZj/V0ZB5lae5qYF2tkTybTiTwP3ivQzeDmRMWPH6F9XPE0VhLYAHR9r8vNt2ei
 vBgsQns0l1TsumStQKiQ2LX7GlM/E4QiTKPFgwiLkQ6psBedgZOVUh78sGLMsgD9oBIk
 bMI0T1XbPAVt4kU2ZgDrfqWUnNeuIizUpDp/O8LIAYScBvBe9SH3rUdHsdqWRtiKNL7+
 QaM08y0bCXyEbkfRIyRfpEVQLIjbHQU3mE9NPlK5KQqyye6SfjGHZETWpb7oYWrgPC5N
 SyFW3O4IxUvzf19JMPfXx/0ao+wBtbCbyhCBfAc85Sk9gpmHK+2bglNpDoF/vJaIK5Xh
 gP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+43Onh4HLkZnURtDWg0isjVCwVeiEe/QdPT72teF59c=;
 b=LyQtYa7U54ctYaJynnIyWywlfCNzO9SlsegrnSkjACegGoPFgthhPGmFnHlwpKQS0B
 neED/qlGym9BjdLJQAehHPn4aMcUhBmOcfDV4FbYhWQciGj2RSrtKIkjb9KytoVu0OGL
 8Goh+w6BPYj4GTH4/pAR++6XUGFeuqFeZlkFPeTUCN+tsL2lD0k3njX8hkgNY3yYqLDY
 F1FOQYQYgkhgAhK1Gv21ufGuKlJwKS6pQk8SUKNirVqMOJ6g0ghegI7KL+rAn06afX5P
 XfW++r9bVSp9v7SzarYZDnMyC85HIaX8mIAtIsuepwR3jiUVv9Oq1s3WiuS7ruWVdJPo
 kNGw==
X-Gm-Message-State: AOAM5308LmkmUXvYrMmqiTEA3qGV4qB85jxs5dctMSV/W+HxKKViDOgd
 FRgBXRstgv5NqF2di+I/0rg=
X-Google-Smtp-Source: ABdhPJx4cpsJn/joYMU866++cYAR7WQpe0hFwXByL6PnF3QWe1w8pxddYU9WSucKXHRAaDdfjMOYGA==
X-Received: by 2002:a17:90b:1096:: with SMTP id
 gj22mr2120509pjb.124.1632862024942; 
 Tue, 28 Sep 2021 13:47:04 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:ad75:d50c:938b:6212])
 by smtp.gmail.com with ESMTPSA id s2sm32071pjo.24.2021.09.28.13.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 13:47:04 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 28 Sep 2021 13:46:58 -0700
Message-Id: <20210928204658.2230524-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong In lower versions than macOS 10.12, they
 don't support clock_gettime function. It breaks the build, so we need to
 fall back to the original kernel version check algorithm, in that case. 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.176 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.176 listed in wl.mailspike.net]
X-Headers-End: 1mVK0M-00A9sq-QS
Subject: [f2fs-dev] [PATCH] f2fs-tools: fall back to the original version
 check when clock_gettime is not supported
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

In lower versions than macOS 10.12, they don't support clock_gettime
function. It breaks the build, so we need to fall back to the original
kernel version check algorithm, in that case.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/mount.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index 7c4c681..c928a15 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -975,6 +975,16 @@ int validate_super_block(struct f2fs_sb_info *sbi, enum SB_ADDR sb_addr)
 		MSG(0, "Info: MKFS version\n  \"%s\"\n", c.init_version);
 		MSG(0, "Info: FSCK version\n  from \"%s\"\n    to \"%s\"\n",
 					c.sb_version, c.version);
+#if defined(__APPLE__)
+		if (!c.no_kernel_check &&
+			memcmp(c.sb_version, c.version,	VERSION_NAME_LEN)) {
+			c.auto_fix = 0;
+			c.fix_on = 1;
+			memcpy(sbi->raw_super->version,
+					c.version, VERSION_NAME_LEN);
+			update_superblock(sbi->raw_super, SB_MASK(sb_addr));
+		}
+#else
 		if (!c.no_kernel_check) {
 			struct timespec t;
 			u32 prev_time, cur_time, time_diff;
@@ -1007,6 +1017,7 @@ int validate_super_block(struct f2fs_sb_info *sbi, enum SB_ADDR sb_addr)
 			update_superblock(sbi->raw_super, SB_MASK(sb_addr));
 		}
 out:
+#endif
 		print_sb_state(sbi->raw_super);
 		return 0;
 	}
-- 
2.33.0.685.g46640cef36-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

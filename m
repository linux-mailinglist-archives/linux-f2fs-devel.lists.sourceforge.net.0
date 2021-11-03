Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B8744435B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Nov 2021 15:23:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1miHAD-0000ya-K3; Wed, 03 Nov 2021 14:22:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mudongliangabcd@gmail.com>) id 1miHAB-0000yO-IN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Nov 2021 14:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=odOeSMEh9ZpBA89eL2qhRpEs4XuRy4e44peglvFnMtU=; b=AvfEmsy+IaNRoSdBlk1vlfo4lh
 r2W2dL5yogjCOB6xnZhrmLU5r1Y1BV4lmFBvTfCG66yYaWRZh2vqgBK4hz5dZN86FRvUMnB74Q0P5
 hLp+v6WSCLwE79gxs9G9NX7ZEXbsVWNld9Izty4In6tJmIxokKBnN/5qA7cM0mp0EzOg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=odOeSMEh9ZpBA89eL2qhRpEs4XuRy4e44peglvFnMtU=; b=K
 f75vk3gn7wfKv7KV/455JcmTvwBkk9o3TBRZtnf23xoWDnwKT7qogOzAVWquYNtyRWOpYvbBKxd60
 o4l+0Q/2VSkdlxSMkoVRqaRE9huBfVgjzOmhhlZghEHAICtl6Yu5EHBQRP/nZZ8g4yA9ztAlaWBIi
 /OX7Ou6UhEHyPt/8=;
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1miHAA-00GiDk-VL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Nov 2021 14:22:51 +0000
Received: by mail-pl1-f169.google.com with SMTP id u11so2606577plf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 03 Nov 2021 07:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=odOeSMEh9ZpBA89eL2qhRpEs4XuRy4e44peglvFnMtU=;
 b=XvnnyeRAxuitPImPJIlZ70HPKNSIKTcgcDDCY0BNYwKZWzeSb5fDk1B3m41sj1be5e
 JBE6X0HSXj9sHYamSvwZSv0DuNVWnqQ2rPGnd5vvxwHwHjRDOPLcfuYIriiJ7GUjv/Od
 8BG9Kxs9jWpA1Xepdcr9KRfekCJQ0CmTHp+xZ5aQryS9DFroWIs6G/cYS+DuCdEP1Y5u
 scsALWMNUaNfM4hT5rvf+MJak6cx1BlCEdKDTUO49B5uDS3DftuL/XS+O43iZX1uxePw
 bVnhf1/EkcSTncJmKhvlbO72RoA2w0CDrgGISL1VMSgJQF5WpieOhKwKk3JT/ZmVIi4r
 Ghmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=odOeSMEh9ZpBA89eL2qhRpEs4XuRy4e44peglvFnMtU=;
 b=kyhhfv0Nwllv0LBg+5wTNvgKDrv91tmBhn6j3hwCSKc6hREo9u5FK+V62DQ2XoBiNY
 tz4kf1y3asGLdnqEB2hlm84/GI1qpiqw4Y7sDcfSPv2O5CSIv8toMl+sYZ0T4vscWOyo
 Sdki8ohGxBlPNhkvSzNm0MQXklQ1Q5I2KnqbfKqqv34a8vD+eJfDs5rfk1+jYvcTlvYb
 h2JcePKlj7dKAiE7NjJy4e9braM9XSz+h3wnJEBq4zs71aqM6LI3xvbl00uPshxmR1wq
 WTo/nPEuILaWMW3TCvPgJe/XvIvJ2pb4qivRQffgORYSXPg974pQ0yag49UtG9t/dTIW
 vUeQ==
X-Gm-Message-State: AOAM533+wEG19aAi0O+lYg/VgVUmII7nIMKCGQwEd75qoUNb3z/iBOsv
 ++kb9Hm9dRwqRZEiTAwJPig=
X-Google-Smtp-Source: ABdhPJx9boeHyijVo0W1PSZZtMsybz7on3bwcC9dzysQlM/8X3F4rrEQ+xNqP6JGnTelBQ2qFY9VIg==
X-Received: by 2002:a17:90b:1293:: with SMTP id
 fw19mr14920912pjb.155.1635949365327; 
 Wed, 03 Nov 2021 07:22:45 -0700 (PDT)
Received: from localhost.localdomain ([94.177.118.123])
 by smtp.gmail.com with ESMTPSA id z21sm2855893pfk.31.2021.11.03.07.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:22:44 -0700 (PDT)
From: Dongliang Mu <mudongliangabcd@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Wed,  3 Nov 2021 22:22:27 +0800
Message-Id: <20211103142228.1235864-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_fill_super -> f2fs_build_segment_manager ->
 create_discard_cmd_control
 -> f2fs_start_discard_thread It invokes kthread_run to create a thread and
 run issue_discard_thread. However, if f2fs_build_node_manager fails, the
 control flow goes to free_nm and calls f2fs_destroy_node_manager. This
 function
 will free sbi->nm_info. However, if issue_discard_thread accesses sbi->nm
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [mudongliangabcd[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.169 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1miHAA-00GiDk-VL
Subject: [f2fs-dev] [PATCH] fs: f2fs: fix UAF in f2fs_available_free_memory
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
Cc: linux-kernel@vger.kernel.org, Dongliang Mu <mudongliangabcd@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_fill_super
-> f2fs_build_segment_manager
   -> create_discard_cmd_control
      -> f2fs_start_discard_thread

It invokes kthread_run to create a thread and run issue_discard_thread.

However, if f2fs_build_node_manager fails, the control flow goes to
free_nm and calls f2fs_destroy_node_manager. This function will free
sbi->nm_info. However, if issue_discard_thread accesses sbi->nm_info
after the deallocation, but before the f2fs_stop_discard_thread, it will
cause UAF(Use-after-free).

-> f2fs_destroy_segment_manager
   -> destroy_discard_cmd_control
      -> f2fs_stop_discard_thread

Fix this by switching the order of f2fs_build_segment_manager
and f2fs_build_node_manager.

Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 fs/f2fs/super.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 78ebc306ee2b..1a23b64cfb74 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4135,18 +4135,18 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	}
 
 	/* setup f2fs internal modules */
-	err = f2fs_build_segment_manager(sbi);
-	if (err) {
-		f2fs_err(sbi, "Failed to initialize F2FS segment manager (%d)",
-			 err);
-		goto free_sm;
-	}
 	err = f2fs_build_node_manager(sbi);
 	if (err) {
 		f2fs_err(sbi, "Failed to initialize F2FS node manager (%d)",
 			 err);
 		goto free_nm;
 	}
+	err = f2fs_build_segment_manager(sbi);
+	if (err) {
+		f2fs_err(sbi, "Failed to initialize F2FS segment manager (%d)",
+			 err);
+		goto free_sm;
+	}
 
 	/* For write statistics */
 	sbi->sectors_written_start = f2fs_get_sectors_written(sbi);
@@ -4351,10 +4351,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	sbi->node_inode = NULL;
 free_stats:
 	f2fs_destroy_stats(sbi);
-free_nm:
-	f2fs_destroy_node_manager(sbi);
 free_sm:
 	f2fs_destroy_segment_manager(sbi);
+free_nm:
+	f2fs_destroy_node_manager(sbi);
 	f2fs_destroy_post_read_wq(sbi);
 stop_ckpt_thread:
 	f2fs_stop_ckpt_thread(sbi);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

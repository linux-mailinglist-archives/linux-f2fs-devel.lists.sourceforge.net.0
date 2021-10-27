Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE33043D800
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Oct 2021 02:19:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mft8u-00083L-0v; Thu, 28 Oct 2021 00:19:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daeho43@gmail.com>) id 1mft8t-00083F-G2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Oct 2021 00:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yk1HXF7J33uzPhunZD36y8oU6oQ1XrEctAld/JR4uvY=; b=ccgf+d3U8OuLpuwh9QJ6bmyzQD
 Xe6AGaGJrBFPZo5NtysobPgY1gRgOfjR5NGRmrlc5bDoY1PLr1q92f8aZV9bWR7uicUyiaqOtwzY1
 vhHMcmSqTSdSFAAm90qB4ruLcQzVTdXBVajCH9JHIb8q39/JKGZE0nEvZSnv/yskiOX0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yk1HXF7J33uzPhunZD36y8oU6oQ1XrEctAld/JR4uvY=; b=d1SU/b6hR6dXGCl80ftS2QCz15
 PvI/FpU1Q8Oa6NWcc5GgFeabbK7NNlbvDxnZH1N+IAonRjuBAKtoalgzC59Gsm+tO2t9ZC1HI9kHB
 /yhrggRVVJQl71NT6McG4EUANyyOp4s1wbtlcZcbyFnqrnxBEt5FeoLAE3OAvik+n2PU=;
Received: from mail-il1-f177.google.com ([209.85.166.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mft8m-0002Tc-G3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Oct 2021 00:19:38 +0000
Received: by mail-il1-f177.google.com with SMTP id f10so370649ilu.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Oct 2021 17:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yk1HXF7J33uzPhunZD36y8oU6oQ1XrEctAld/JR4uvY=;
 b=L12aulqnozTFkk9ipyX7hwKm+OwTRe6uvWDur/VrVtQeo3/Z7xFMEos+c7J5k9+b5G
 q4c7DayuFhReg+dHITmNzUOODsfT9DOgsbgaCah46bmrjOEu97TI8NVJ9+dOKpFgRXt+
 KndX11kL+2qSwW1WT2pT3zkgB8f0XWW3Hk/tZ8WGQLAnFys1L2QyVVELLGXmKkCM4i3C
 iKxum/blEvABIlFnkBFkwdwvqjuMgf0MWnhdCHilg3EKAQlvCqowp34nLyHpUsr5D8tf
 DgFxXGndE7vzJC5WmijYCxBKHA6HaTnO1QxTZ5eAfzf/ILxkuLYspXfrZa+RilDWA+tw
 lbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yk1HXF7J33uzPhunZD36y8oU6oQ1XrEctAld/JR4uvY=;
 b=KUzoRY1bCrog4qko2uQsO1+4JJ270c5Wy1kKBPNcFvDs+bppMQD2bP8L+rmovmfnp9
 kMwFc/I/3+yc4bBzJidYNwANqTuPbGhlpf8QNUS1bUP+8GoHr+8Ek5cYd5+Bfa2g0K+v
 sL3M50lBC7+P1/nH+JEuevl7U6uPggD0f1lCjNlh65HYoFWY6sgSnB03TmM4ayuLSkB/
 VjBEOclJ1OfE0323Jrv9B+vbdzTzxGty5/h6ThjLdbPm0nAW7pk+aDEyjPaRr/ehCXuM
 O0449Ir/BddSi6tB8uFs1LBjIw134nC3L0H7dZBGMlxRsSC3vpw6XA+/ecv/ZIq5XSMz
 SD1A==
X-Gm-Message-State: AOAM53021oF7E/Rv16TnAhFB++KyBdh3AZGXpRm9ltpJ3BHWpG/hN0B7
 WUiEaO9q4T7jfjHVNa2SQUQeTEJxINM=
X-Google-Smtp-Source: ABdhPJwO9EVBH9A8169jDk3/VM8L2G+Q9Dg7Zaa5k+YFrZrHIGy5hmCxHJEyAmreZosm+TsEa3NLMA==
X-Received: by 2002:a63:7f0f:: with SMTP id a15mr644221pgd.9.1635378378755;
 Wed, 27 Oct 2021 16:46:18 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:b75c:b351:dcb7:11d8])
 by smtp.gmail.com with ESMTPSA id b9sm1048168pfv.158.2021.10.27.16.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 16:46:18 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed, 27 Oct 2021 16:46:11 -0700
Message-Id: <20211027234611.1958146-2-daeho43@gmail.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211027234611.1958146-1-daeho43@gmail.com>
References: <20211027234611.1958146-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong When we check other corrupted bugs in fsck,
 we use bug_on. So, if major bugs are already detected in fsck_verify(), fsck
 will false alarm that there are other bugs, even if there are no other bugs.
 So [...] Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.177 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.177 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mft8m-0002Tc-G3
Subject: [f2fs-dev] [PATCH 2/2] f2fs-tools: separate other bugs in
 fsck_verify
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

When we check other corrupted bugs in fsck, we use bug_on. So, if major
bugs are already detected in fsck_verify(), fsck will false alarm that
there are other bugs, even if there are no other bugs. So, let's fix this.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/fsck.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index bc11e07..0619519 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3162,6 +3162,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 	u32 nr_unref_nid = 0;
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct hard_link_node *node = NULL;
+	bool verify_failed = false;
 
 	if (c.show_file_map)
 		return 0;
@@ -3175,7 +3176,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		} else {
 			printf(" [Fail] [0x%x]\n",
 			       fsck->chk.wp_inconsistent_zones);
-			c.bug_on = 1;
+			verify_failed = true;
 		}
 
 		if (fsck->chk.wp_fixed && c.fix_on)
@@ -3221,8 +3222,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		printf(" [Ok..] [0x%x]\n", nr_unref_nid);
 	} else {
 		printf(" [Fail] [0x%x]\n", nr_unref_nid);
-		ret = EXIT_ERR_CODE;
-		c.bug_on = 1;
+		verify_failed = true;
 	}
 
 	printf("[FSCK] SIT valid block bitmap checking                ");
@@ -3231,8 +3231,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		printf("[Ok..]\n");
 	} else {
 		printf("[Fail]\n");
-		ret = EXIT_ERR_CODE;
-		c.bug_on = 1;
+		verify_failed = true;
 	}
 
 	printf("[FSCK] Hard link checking for regular file           ");
@@ -3240,8 +3239,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		printf(" [Ok..] [0x%x]\n", fsck->chk.multi_hard_link_files);
 	} else {
 		printf(" [Fail] [0x%x]\n", fsck->chk.multi_hard_link_files);
-		ret = EXIT_ERR_CODE;
-		c.bug_on = 1;
+		verify_failed = true;
 	}
 
 	printf("[FSCK] valid_block_count matching with CP            ");
@@ -3249,8 +3247,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		printf(" [Ok..] [0x%x]\n", (u32)fsck->chk.valid_blk_cnt);
 	} else {
 		printf(" [Fail] [0x%x]\n", (u32)fsck->chk.valid_blk_cnt);
-		ret = EXIT_ERR_CODE;
-		c.bug_on = 1;
+		verify_failed = true;
 	}
 
 	printf("[FSCK] valid_node_count matching with CP (de lookup) ");
@@ -3258,8 +3255,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		printf(" [Ok..] [0x%x]\n", fsck->chk.valid_node_cnt);
 	} else {
 		printf(" [Fail] [0x%x]\n", fsck->chk.valid_node_cnt);
-		ret = EXIT_ERR_CODE;
-		c.bug_on = 1;
+		verify_failed = true;
 	}
 
 	printf("[FSCK] valid_node_count matching with CP (nat lookup)");
@@ -3267,8 +3263,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		printf(" [Ok..] [0x%x]\n", fsck->chk.valid_nat_entry_cnt);
 	} else {
 		printf(" [Fail] [0x%x]\n", fsck->chk.valid_nat_entry_cnt);
-		ret = EXIT_ERR_CODE;
-		c.bug_on = 1;
+		verify_failed = true;
 	}
 
 	printf("[FSCK] valid_inode_count matched with CP             ");
@@ -3276,8 +3271,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		printf(" [Ok..] [0x%x]\n", fsck->chk.valid_inode_cnt);
 	} else {
 		printf(" [Fail] [0x%x]\n", fsck->chk.valid_inode_cnt);
-		ret = EXIT_ERR_CODE;
-		c.bug_on = 1;
+		verify_failed = true;
 	}
 
 	printf("[FSCK] free segment_count matched with CP            ");
@@ -3286,8 +3280,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		printf(" [Ok..] [0x%x]\n", fsck->chk.sit_free_segs);
 	} else {
 		printf(" [Fail] [0x%x]\n", fsck->chk.sit_free_segs);
-		ret = EXIT_ERR_CODE;
-		c.bug_on = 1;
+		verify_failed = true;
 	}
 
 	printf("[FSCK] next block offset is free                     ");
@@ -3295,8 +3288,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		printf(" [Ok..]\n");
 	} else {
 		printf(" [Fail]\n");
-		ret = EXIT_ERR_CODE;
-		c.bug_on = 1;
+		verify_failed = true;
 	}
 
 	printf("[FSCK] fixing SIT types\n");
@@ -3311,6 +3303,11 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		ret = EXIT_ERR_CODE;
 	}
 
+	if (verify_failed) {
+		ret = EXIT_ERR_CODE;
+		c.bug_on = 1;
+	}
+
 #ifndef WITH_ANDROID
 	if (nr_unref_nid && !c.ro) {
 		char ans[255] = {0};
-- 
2.33.0.1079.g6e70778dc9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

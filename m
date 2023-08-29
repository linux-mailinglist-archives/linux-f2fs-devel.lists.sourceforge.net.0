Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B049078BC4E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Aug 2023 03:06:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qanB7-000854-VD;
	Tue, 29 Aug 2023 01:05:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3bUTtZAYKANg7LIM8HAIIAF8.6IG@flex--drosen.bounces.google.com>)
 id 1qanB6-00084s-Sv for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Aug 2023 01:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KoCJlcXQDNCZZwtAdpIw6xZUoePDJtcx5D0MxHIb8KQ=; b=FTE83anibClBibrQO7GGKGl4Rs
 k3EgiijlH8ERn220YxFhmkMxaQIBLl7SlipBkTWLfERGkhN7bHaRD30g8hRO7W8CTkOntIzk9Dwl+
 ikWx79t5ef0iblxhQYTukVPUVCIoTSTCcJaLI3Spgz7rnXXCzkRz8gNpz70m0T1ZsB7Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KoCJlcXQDNCZZwtAdpIw6xZUoePDJtcx5D0MxHIb8KQ=; b=EMJyaz6XY2dShe7Nk/vKqjk1sz
 kbkIeg1S2magA1h1YVmy1imhwz1HYjfWvfU+xvVqV6hLChyAzxFbz8br5yuEQHD4DO8hOd2ECVj9N
 QkBn+yhuCT8meR4HSBn8XlG/nTn5HV37/E0aRhiqsuZnRS5v6Q2JJFrcrgEUIobVUOUg=;
Received: from mail-yw1-f202.google.com ([209.85.128.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qanB5-0007Gt-4R for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Aug 2023 01:05:55 +0000
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-58d37b541a2so55201787b3.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Aug 2023 18:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693271149; x=1693875949;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=KoCJlcXQDNCZZwtAdpIw6xZUoePDJtcx5D0MxHIb8KQ=;
 b=hQRTlKNg8jpm7JuCt7zH5vT667dw5dB16m/3NFze+RBHprbaTIuL+YymBVBu8UClXh
 b/7TH35dFArc/ril5nNd/Tvtim8vvpizTmmIxM0MMoQfsP8RhO3S1eo8VEBawimsND8v
 HgEY/x5yNjIuzIZ+JLi03sX0L40nyUkkmmusA8cQ2YJ2oEBU0K0pwYzug8MuqiyxotR2
 luQHpkqOnY2egt4lgbq/NdDwdb+4n+pMBnbYbJO53DD/Qdv0OevpYJs7e8je/wYVGKzV
 YwTeV1gNdF34LaWU8n3YTbFW52kU0Zdn6gRF0vyj3skeskEyoosMaNjkN03IRmYUHF1b
 JqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693271149; x=1693875949;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KoCJlcXQDNCZZwtAdpIw6xZUoePDJtcx5D0MxHIb8KQ=;
 b=Z8rIxwexVUJyKRuQYWdLOOnUC9pYWOkuf3qTsPBTYjYTnvTjpIBMgLobMlZgC0bx9G
 Ti1N4Nqf4lno8SeIQ3vNEQY3Ea73l1KsXPRw/6ABEjWRsbCLWhSa7IW5wK2OtznzYpb3
 +dn6MU9SNQrIV20lr5/8BlXf0savPnn/CB5KQ/3f69Xf8gHJI98/RDywNg9SqDE1Gyi8
 i2m6z2y2ugjRt0vCG+PVVZjMF+d+9YDZ/Ut8ViuyRqZTDP58g82syduSNlFqMqfCvVOh
 EuZuKV9bVnLhGdQIpaz4M33jgfwvmmAyxToPZG1ifPpRGgwTNRqNKjbdYctTLiR9OAmF
 c/tg==
X-Gm-Message-State: AOJu0YxOxp91KY1wQSTLfWN0V5EjMpIW1BtI8Zj+VMyvzutVUJIeeQai
 ucAuf0OjU/ko/wBd/+siEgxv7G32zLet1b9XCSHVxz9D4yRS/JbIMh6mX2S0VEiTYpdoI8JhZtT
 O/xTn1+x5yLPndkMkebpUa0l47h2su7UdP01dDsE3s0hSMCphp488nvTFtudnz5b/HsTeXbP4UZ
 2tExpJ/h8=
X-Google-Smtp-Source: AGHT+IETfTN8N+JCSZ544DCkyVbItaHHL1X5V5KgXV9Ok3DbAZG/ql9wC9M0T5NEcEykx4TcY5O8Fi+ZcKc=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:d11f:7395:bc0b:a192])
 (user=drosen job=sendgmr) by 2002:a05:6902:290:b0:d48:c04:f256 with SMTP id
 v16-20020a056902029000b00d480c04f256mr892018ybh.11.1693271149429; Mon, 28 Aug
 2023 18:05:49 -0700 (PDT)
Date: Mon, 28 Aug 2023 18:05:33 -0700
In-Reply-To: <20230829010536.3044883-1-drosen@google.com>
Mime-Version: 1.0
References: <20230829010536.3044883-1-drosen@google.com>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Message-ID: <20230829010536.3044883-5-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This converts f2fs_nat_block and f2fs_sit_block to be
 variable
 length arrays. This does not change the way they are accessed, but removes
 a misleading statment that these sizes are fixed, as opposed t [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.202 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.202 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qanB5-0007Gt-4R
Subject: [f2fs-dev] [PATCH v3 4/7] f2fs-tools: Refactor SIT/NAT block structs
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This converts f2fs_nat_block and f2fs_sit_block to be variable length
arrays. This does not change the way they are accessed, but removes a
misleading statment that these sizes are fixed, as opposed to deriving
from F2FS_BLKSIZE

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 include/f2fs_fs.h | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 13a1c14..4c213dd 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1119,11 +1119,9 @@ struct f2fs_nat_entry {
 static_assert(sizeof(struct f2fs_nat_entry) == 9, "");
 
 struct f2fs_nat_block {
-	struct f2fs_nat_entry entries[NAT_ENTRY_PER_BLOCK];
+	struct f2fs_nat_entry entries[0]; /* NAT_ENTRY_PER_BLOCK */
 };
 
-static_assert(sizeof(struct f2fs_nat_block) == F2FS_BLKSIZE - (F2FS_BLKSIZE % 9), "");
-
 /*
  * For SIT entries
  *
@@ -1169,12 +1167,14 @@ struct f2fs_sit_entry {
 
 static_assert(sizeof(struct f2fs_sit_entry) == 74, "");
 
+/*
+ * On disk layout is:
+ * struct f2fs_sit_entry entries[SIT_ENTRY_PER_BLOCK];
+ */
 struct f2fs_sit_block {
-	struct f2fs_sit_entry entries[SIT_ENTRY_PER_BLOCK];
+	struct f2fs_sit_entry entries[0];
 };
 
-static_assert(sizeof(struct f2fs_sit_block) == F2FS_BLKSIZE - (F2FS_BLKSIZE % 74), "");
-
 /*
  * For segment summary
  *
@@ -1995,6 +1995,14 @@ static inline void check_block_struct_sizes(void)
 
 	/* Check Indirect Block Size */
 	assert(NIDS_PER_BLOCK * sizeof(__le32) + sizeof(struct node_footer) == F2FS_BLKSIZE);
+
+	/* Check NAT Block Size */
+	assert((NAT_ENTRY_PER_BLOCK + 1) * sizeof(struct f2fs_nat_entry) > F2FS_BLKSIZE);
+	assert(NAT_ENTRY_PER_BLOCK * sizeof(struct f2fs_nat_entry) <= F2FS_BLKSIZE);
+
+	/* Check SIT Block Size */
+	assert((SIT_ENTRY_PER_BLOCK + 1) * sizeof(struct f2fs_sit_entry) > F2FS_BLKSIZE);
+	assert(SIT_ENTRY_PER_BLOCK * sizeof(struct f2fs_sit_entry) <= F2FS_BLKSIZE);
 }
 
 #endif	/*__F2FS_FS_H */
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 776CD7D9CFC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Oct 2023 17:31:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qwOnX-0004IZ-8N;
	Fri, 27 Oct 2023 15:30:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1qwOnW-0004IR-JE
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Oct 2023 15:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Evqr8X6UfMuvTJbckZTyJVytbmNduRUqY597JEFkmzE=; b=IUbnWwMq/zC2Ty79PBhtRKCaJm
 eeprP655qJyh5E4vG5lu4YgG6MO/HsT08etbnwiK/z6BsCuqmFO2NJy3SK6y7uWsrnCo/4tw3Vik8
 A/Z/WzjVcD+ki1XizxC99dofytfSWZmzPfNNNOAXnNVABxb6Zzzbbka66EjNE7DjiyxU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Evqr8X6UfMuvTJbckZTyJVytbmNduRUqY597JEFkmzE=; b=S
 1Pul/3lSljNCXzRlocugEnWg4dSMDC/njaMKP3rTs283apHpGxWYtliQQDUraLyebaLUcdoxrDEot
 thxodbi/pNvBSyhoHuHk1jdubDJvT9m2UWbtrJpofOsiAYwgmY3BzZBPCI9CCjoAVh+p7iBhwwsAE
 tUUI3t2fMg5ZIGI0=;
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qwOnU-0006nD-LS for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Oct 2023 15:30:54 +0000
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6b5cac99cfdso2120982b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 27 Oct 2023 08:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698420647; x=1699025447; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Evqr8X6UfMuvTJbckZTyJVytbmNduRUqY597JEFkmzE=;
 b=aufGLU71th50Rz+5wehNEybj044YsupFjC52cNgMjmgExe/ELuvav7LGpUnIQfF+lZ
 pwytOAjoSvj7mkIGM4bybZ3St+RDZtFC5lXwGxnjIYWgg9hZW05bPD1r4mBV/ezrqYDd
 gF08g18g45QU9OxjUiGQUDFEsNh6JABhsSJzPzuMzXBHnuaR7/COLONrEt2nZCTEF7B2
 yzN/4lpXOD+km9iElFjKAumXJkrd9dvqpJ/DA1LmjLH8iq4SXg6ywsSMI6SVSC5PCVHR
 BiecHxaIOuPXP+oVA1z2lSbiJsUj2aE857rtlev4ykKuaNXlqK2ahe8CG7x9RWJeytS7
 eEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698420647; x=1699025447;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Evqr8X6UfMuvTJbckZTyJVytbmNduRUqY597JEFkmzE=;
 b=G2A+CvmoPymqqlxPx66NaODytrBWb//6q6WcFEkSchyYDyPhC7BOsPh3Xvx8Z1sdKB
 iUsNCCnJPqq/j9p/vNdySTghCRALWJ95EtteLGNmxaqCaHIA4NsmG65YXnpIE1CrfdGF
 zBQ9CkxwQ3ezb5Cs1U/L1o0ib/cUQVRsnFJINNV2VNLNOibMIc9FD+S66mOlRAlrvJn1
 cESTWrUeo4bCun42cNz3iynY4AkO41QsviXJjdcLAgh5+P4Iw6mJSy5EgVpVn0O5AP8N
 hP0/sDcckYizGk5IzhdptVMdGSgsIXB3JADtS5j5NnAzpN7YPp7ZJE+kNN8QZx78jV35
 Bqpw==
X-Gm-Message-State: AOJu0YxGV2U0CFcyK18D1quOkNQ2v2ShFWbXuqJ+xZaaTp/KW4Qntp/2
 nYrgMbfW90KX7SGWbcCo4gw=
X-Google-Smtp-Source: AGHT+IF0MMBAZtbKnTDtmgBEnAgN51HU36zoqrUZaap1glWuBrZ5gLRtDPcyNJyJWmYF4uKRZZqpZw==
X-Received: by 2002:a05:6a00:1302:b0:690:422f:4f17 with SMTP id
 j2-20020a056a00130200b00690422f4f17mr3285641pfu.4.1698420646936; 
 Fri, 27 Oct 2023 08:30:46 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:d9fe:c408:7e52:ad85])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056a00244300b006bde8e1f0adsm1551946pfj.98.2023.10.27.08.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 08:30:46 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 27 Oct 2023 08:30:43 -0700
Message-ID: <20231027153043.1381438-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong We might allocate more node blocks than
 total_valid_node_count, when we recreate quota files. Signed-off-by: Daeho
 Jeong --- fsck/segment.c | 4 ++-- 1 file changed, 2 insertions(+),
 2 deletions(-)
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.173 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.173 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qwOnU-0006nD-LS
Subject: [f2fs-dev] [PATCH] f2fs-tools: use total_node_count when creating a
 new node block in fsck
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

We might allocate more node blocks than total_valid_node_count, when we
recreate quota files.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/segment.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fsck/segment.c b/fsck/segment.c
index 4b05fd4..4ea0a6f 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -36,8 +36,8 @@ int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
 				ERR_MSG("Not enough space\n");
 				return -ENOSPC;
 			}
-			if (is_node && fsck->chk.valid_node_cnt >
-					sbi->total_valid_node_count) {
+			if (is_node && fsck->chk.valid_node_cnt >=
+						sbi->total_node_count) {
 				ERR_MSG("Not enough space for node block\n");
 				return -ENOSPC;
 			}
-- 
2.42.0.820.g83a721a137-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

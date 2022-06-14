Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CF454BE3A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jun 2022 01:18:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1FnK-0005SH-4y; Tue, 14 Jun 2022 23:17:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1o1FnI-0005S7-CV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 23:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5dmLc4/muxANPynt7WLG32gcI5IY3R0thhcHdIrzT+Y=; b=X0B+w1ggkbzq7q1uXn1qPPX2OJ
 2NwyXJNlpbpevZANN1yd4q474AL0rvmPBXllfaygF7UyTs0H/Nr84M+GeUk38tJ0qAjNQQuUbHQLK
 rI6IzKLHbhjTwRB4fYBhBWRgiP06P+DLndx4xW5jk07oB9ywXSDupCf2xtYlEHAsRS5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5dmLc4/muxANPynt7WLG32gcI5IY3R0thhcHdIrzT+Y=; b=kuDlUOznqi1t8pOCSyMIk61aCo
 vNggHzrvGnYX86iAQBdNT0K45lsu96KaMWLoQZs5SHBu9PJgAtB8ueZpmwgClJcEz6XTpnXUZiR3M
 261btk3RFgk6EGoRkOqF9mLyvWJ84kngaedY21F85PrLcHHpeVAlQ3GsXZ1GXGQNBOCI=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o1FnD-0006LG-FG
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 23:17:56 +0000
Received: by mail-pf1-f171.google.com with SMTP id u37so1458743pfg.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Jun 2022 16:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5dmLc4/muxANPynt7WLG32gcI5IY3R0thhcHdIrzT+Y=;
 b=axtGwwrLRDDRIHl2RMlarUpWzXwAnS+DxIeR8+QDHb5/2NsD0D6LK6PZQappEiTDrA
 dyBJmvFWwbnShq7SHq3vmvwa4qDc+D86LcFZMcATVDFH5ajtl35FjntvyfFSLNsyFEBd
 FyTaaQXPCxgn3sYn/nuM+7YkhWf6HqYnABBFPpUYda0ZqAzcIPT/IC3vh/s4lMoc+0U/
 CWrXRuf8tcdPWUAa+7HzyhEXf3TMo9GnLokN6VTh0MHeqgGZj3Zp9I6JGQT6RAosE2z9
 6bIp1fvB7Lpq4/19bRTsIZQuwaLCGIXCQlbmGfaZE2mEDsErS0yY+AueJzuC8IDO7QlY
 WRTg==
X-Gm-Message-State: AOAM530uyKwwVm5y/2q0QgCmBnPSH+CzgGdZ9nLnL/q4skIi2X2LZf8x
 xgaYSXKq7JHZDiTXjoagNk8=
X-Google-Smtp-Source: ABdhPJyAeR2Sl/MjTAhy/hpnAWewg98NKBhn6PZZyjOD0RPvrTDvFtfrTOXf1I1wGvj5jlGNJWw7xw==
X-Received: by 2002:a65:6d08:0:b0:3c6:8a08:3b9f with SMTP id
 bf8-20020a656d08000000b003c68a083b9fmr6447246pgb.147.1655248667073; 
 Tue, 14 Jun 2022 16:17:47 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:ab60:e1ea:e2eb:c1b6])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a1709028ec200b001621ce92196sm7769491plo.86.2022.06.14.16.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 16:17:46 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 14 Jun 2022 16:17:22 -0700
Message-Id: <20220614231724.776264-2-bvanassche@acm.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220614231724.776264-1-bvanassche@acm.org>
References: <20220614231724.776264-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Fix the f2fs-tools build on systems for which PAGE_SIZE !=
 4096. Cc: Peter Collingbourne <pcc@google.com> Reported-by: Peter
 Collingbourne
 <pcc@google.com> Signed-off-by: Bart Van Assche <bvanassche@acm.org> ---
 include/f2fs_fs.h | 2 +- 1 file changed, 1 insertion( [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.171 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1o1FnD-0006LG-FG
Subject: [f2fs-dev] [PATCH 1/3] Fix the struct f2fs_dentry_block size check
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
Cc: Peter Collingbourne <pcc@google.com>, Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix the f2fs-tools build on systems for which PAGE_SIZE != 4096.

Cc: Peter Collingbourne <pcc@google.com>
Reported-by: Peter Collingbourne <pcc@google.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/f2fs_fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 21a7e70d952d..3b1bd6eb7dc7 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1341,7 +1341,7 @@ struct f2fs_dentry_block {
 	__u8 filename[NR_DENTRY_IN_BLOCK][F2FS_SLOT_LEN];
 };
 
-static_assert(sizeof(struct f2fs_dentry_block) == 4096, "");
+static_assert(sizeof(struct f2fs_dentry_block) == PAGE_SIZE, "");
 
 /* for inline stuff */
 #define DEF_INLINE_RESERVED_SIZE	1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

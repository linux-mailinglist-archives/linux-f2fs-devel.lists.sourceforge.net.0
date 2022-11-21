Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1FC63290E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Nov 2022 17:11:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ox9ON-0006c5-Nu;
	Mon, 21 Nov 2022 16:11:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ssawgyw@gmail.com>) id 1ox9OJ-0006bg-Au
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Nov 2022 16:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nrfq658ppsV6A0UxvigWf4GUIKl2kFHfMPKNsHA6hzo=; b=gnMz+zWBENXCWv+1satEyL8eUa
 SXNeG3oeDq6QaXthp0NiQe+zIVpDK9Ai1e1BtYl8Z5jzaFDCXRLosiLZroAwaXKut1plGHU5HvM9g
 BqecRHVpJ0tKf8v4bbANuVVzlTauXFIXn8dPBo15sxMTllsudHiorXn7y3IaJH7Izcpo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Nrfq658ppsV6A0UxvigWf4GUIKl2kFHfMPKNsHA6hzo=; b=e
 /ggXCTrOBSX2awC2SQYqVoAt27awhzSYBsShjmdfOacODfdVPtR+nqEcRjSMcE8fhTzAAK2ZC6iIO
 4YxC8rHUhnhPc0FGyVP036vE8OoTrlrwhoAX+FxVK7OKQ/uNcnp8UC3rBzS4W547GjZBbPEZID/gr
 3/QC0h9Q4ZIBNlUw=;
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ox9OE-0007X4-3B for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Nov 2022 16:11:27 +0000
Received: by mail-pj1-f54.google.com with SMTP id
 k2-20020a17090a4c8200b002187cce2f92so9499541pjh.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Nov 2022 08:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nrfq658ppsV6A0UxvigWf4GUIKl2kFHfMPKNsHA6hzo=;
 b=nhv+nzMIswF6089c7r9+/04T0AJi4Jfd7Bb2/+Ib6+Sb+/j3IevYn7Pp+nzWADYMFS
 2cTVOiPLxr54Z6YJm9NWdX5nVJrzkQbUMiLjlw+c2F6JASSK7u4WupuK1TZ2ps6uPb7b
 rM7QvLGw6gV8uexiptIPbkhFpDnSZOTS+r6M3S0TNvDxSS7fl6H2IJGgtLHnCdeC+hwn
 nkUJXZi3/WkjQlLcmLXZebh7qKlXcDglKNdI1VOYM5hpJMr9DJzpt3WmNVfpJolfKehk
 FJaEKSEEfUe0e1NAg3lWUSVYdHo5k96MWSf2fE+Hqn+EehUD8wBWnRqpjwSAvvot2Qwv
 +XIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nrfq658ppsV6A0UxvigWf4GUIKl2kFHfMPKNsHA6hzo=;
 b=4SRRdxbubSvtoURmwaCOTXLU94L0+2G1CBiit4X9j8j+6oGsl7A/d4OhipuQpsqRat
 7pg/6hhhW+Q0ngVEXoiIknWOPUaeHRKwFDPbhvWy40tvSXEmhe70RKMj6kxOPz59d6Fo
 2jnTXROo+VKVn1QkI6dEpTfhHqijCObRmbojt5gxjlg/PoMjT7d2BO5kIosLWlG6hZPo
 flMMFk10HuFBGR9EmIihYTuE/amZTBhi6K39FFWrmzLERWXCNyetwrgxhut0HTeEonCC
 eFDHd9RHAAw+ItNw1yjfr0pzezZrDHW/dczd0DJ4SUxXoAMbdBUT0ZyI1OuZAf/we7Yp
 tu4A==
X-Gm-Message-State: ANoB5pkTifAtjNV2KjK/6pbEO2o9Igoh281MjTrij2gVj1s8/BxT4Xvs
 HhZy2aCnlKRHxfEc7IiH3Q+/ZU5wX+o=
X-Google-Smtp-Source: AA0mqf6odYdNtQXeCRJPdgRlCySo6MJP81hhMJ/kpY0g4kwJ4SJvJUt6sTA8XeKHBBB31N8K5Cio3Q==
X-Received: by 2002:a17:903:2109:b0:186:8d7b:377e with SMTP id
 o9-20020a170903210900b001868d7b377emr259918ple.19.1669047076526; 
 Mon, 21 Nov 2022 08:11:16 -0800 (PST)
Received: from VirtualBox.. ([129.227.152.6]) by smtp.gmail.com with ESMTPSA id
 x15-20020a63fe4f000000b00434272fe870sm7774571pgj.88.2022.11.21.08.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 08:11:15 -0800 (PST)
From: Yuwei Guan <ssawgyw@gmail.com>
X-Google-Original-From: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 22 Nov 2022 00:11:01 +0800
Message-Id: <20221121161101.72847-1-Yuwei.Guan@zeekrlife.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As the 'dcc->discard_granularity' and
 'dcc->max_ordered_discard'
 can be set at the user space, and if the 'dcc->max_ordered_discard' is set
 larger than 'dcc->discard_granularity' in DPOLICY_BG mode, o [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.54 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ssawgyw[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.54 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ox9OE-0007X4-3B
Subject: [f2fs-dev] [PATCH] f2fs: continuous counting for 'issued' in
 __issue_discard_cmd_orderly()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As the 'dcc->discard_granularity' and 'dcc->max_ordered_discard' can be set
at the user space, and if the 'dcc->max_ordered_discard' is set larger than
'dcc->discard_granularity' in DPOLICY_BG mode, or it's a volume device,
discard_granularity can be tuned to 1 in f2fs_tuning_parameters(),
it will may send more requests than the number of 'dpolicy->max_requests'
in issue_discard_thread().

This patch will fix the issue.

Signed-off-by: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
---
 fs/f2fs/segment.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8b0b76550578..b0157bf392fb 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1379,8 +1379,8 @@ static int __queue_discard_cmd(struct f2fs_sb_info *sbi,
 	return 0;
 }
 
-static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
-					struct discard_policy *dpolicy)
+static int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
+					struct discard_policy *dpolicy, int *issued)
 {
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
 	struct discard_cmd *prev_dc = NULL, *next_dc = NULL;
@@ -1388,7 +1388,6 @@ static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
 	struct discard_cmd *dc;
 	struct blk_plug plug;
 	unsigned int pos = dcc->next_pos;
-	unsigned int issued = 0;
 	bool io_interrupted = false;
 
 	mutex_lock(&dcc->cmd_lock);
@@ -1415,9 +1414,9 @@ static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
 		}
 
 		dcc->next_pos = dc->lstart + dc->len;
-		err = __submit_discard_cmd(sbi, dpolicy, dc, &issued);
+		err = __submit_discard_cmd(sbi, dpolicy, dc, issued);
 
-		if (issued >= dpolicy->max_requests)
+		if (*issued >= dpolicy->max_requests)
 			break;
 next:
 		node = rb_next(&dc->rb_node);
@@ -1433,10 +1432,10 @@ static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
 
 	mutex_unlock(&dcc->cmd_lock);
 
-	if (!issued && io_interrupted)
-		issued = -1;
+	if (!(*issued) && io_interrupted)
+		*issued = -1;
 
-	return issued;
+	return *issued;
 }
 static unsigned int __wait_all_discard_cmd(struct f2fs_sb_info *sbi,
 					struct discard_policy *dpolicy);
@@ -1465,7 +1464,7 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 			break;
 
 		if (i + 1 < dcc->max_ordered_discard && dpolicy->ordered)
-			return __issue_discard_cmd_orderly(sbi, dpolicy);
+			return __issue_discard_cmd_orderly(sbi, dpolicy, &issued);
 
 		pend_list = &dcc->pend_list[i];
 
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

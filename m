Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8994649429
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Dec 2022 13:19:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4LJ4-0004WE-UA;
	Sun, 11 Dec 2022 12:19:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ssawgyw@gmail.com>) id 1p4LIj-0004Vz-Ta
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 12:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2gPtb0kZX78YC1crT8EvCgaAOrm2u8F10CNCRPyKjDs=; b=Hhqk1tnmx1cDQmjr8eCuv5MNEu
 t+483Dny6iUxle1jpWv6/fGBL8YSP2efMA14aCi0wexqFq+ZAs2EM3YDsxOPBwqk8Ztjl0AvCfIdr
 NPb6xKWiUFCjGDmufcRpP/yfg7e0cCIN4+wextWiLrLSbgN48V3YoxKZpx7Bk3l7FKFU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2gPtb0kZX78YC1crT8EvCgaAOrm2u8F10CNCRPyKjDs=; b=V
 hQd+EwTr4IE63G0vo1iQp8iwiESiGHu2KWldSZjKweT/FoVnIWX863b6yoEnwchDYF9QXP59kqzNz
 U831NB2KY6co8q/x41TPnc19/orLgmVHVwjYpCC+H1fpqSzmyMyKrFvOQ7BrOe8w6/eAXdeHMt58K
 eqg/GG68whm93500=;
Received: from mail-pg1-f181.google.com ([209.85.215.181])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p4LIg-00Doid-63 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 12:19:25 +0000
Received: by mail-pg1-f181.google.com with SMTP id f3so6450210pgc.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 11 Dec 2022 04:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2gPtb0kZX78YC1crT8EvCgaAOrm2u8F10CNCRPyKjDs=;
 b=qrIcVpUzXvWXYO3UhPLOnorH/Eu/FHJejqP7uivXntXh0txXkSUgUup7nNojEoAKCa
 EmCWI3H16krYpIW2w2JWRS7C1LzuS7hcv9S3p34ufjZEexlyIOEWrWFKSZjqscfzEaa7
 hz5CVyjz1PHWYOWPxtN+nmHDD0dW1SeWi/DcYir/6H4rhDNT3KkV3ZxeToSkxi9S8VG3
 8xb/mCU4fr1rNTrr52nEuGoNCqRHtp3bDZMDSCvA9MR/COJKTGIBRdZuBWt0rkukMBSf
 NLer25MBEjP0hrAmNKg6xavme1lWhZ1MAEMOt8NigV8ARg9BxQ02Jcx8r2bvQML8/WFV
 ncMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2gPtb0kZX78YC1crT8EvCgaAOrm2u8F10CNCRPyKjDs=;
 b=qOWgPd4bdbNQ20ZgY96GblbS/gz5LGzn5BAnkd4ycnPB7e+Xk5PPMs2PjB7JosVK+P
 HXlnh+bXB3/nMhq4QyB4lF/SoMqDlTMwOoBV2fhk+aTW03cEHSnjjLh8Oab058MEtndO
 lu9daaXB/I3OjoNpWayIgUDvIkMFcd5bW2ZRGXR9Rz/CLNhQX7erCPT69/3xGfTzs4hV
 TA1cAJQpOD6igH7/bIoAbu2099sO7rBUweVJB1Zf243oY20o5do+MTdXuio5novS4WKD
 gAeDupeVTg/uF6UTGTH5a6fItuoiNnAZKfmUpHIu/U5TeUERWBlFdLOdaJASCCJhHWhN
 Co7A==
X-Gm-Message-State: ANoB5plzofUfzamprhvP3ewLLZKismIb5D726mPlcj8u+gX//ourDjw/
 NERBcOkqH+tBZKSUbQ79Kt8=
X-Google-Smtp-Source: AA0mqf4vuuM+wRcWw8X2rkwWqijFrj/G0xljLe1/XMy+uhyQPu5NxN2mrGYn/do9HVRXVBE6izGVRw==
X-Received: by 2002:aa7:9050:0:b0:56d:67d7:1eb2 with SMTP id
 n16-20020aa79050000000b0056d67d71eb2mr12565044pfo.19.1670761156574; 
 Sun, 11 Dec 2022 04:19:16 -0800 (PST)
Received: from VirtualBox.. ([129.227.152.6]) by smtp.gmail.com with ESMTPSA id
 k145-20020a628497000000b00578199ea5afsm2472838pfd.9.2022.12.11.04.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 04:19:16 -0800 (PST)
From: Yuwei Guan <ssawgyw@gmail.com>
X-Google-Original-From: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 11 Dec 2022 20:18:52 +0800
Message-Id: <20221211121852.112127-1-Yuwei.Guan@zeekrlife.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 no trust [209.85.215.181 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ssawgyw[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.181 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1p4LIg-00Doid-63
Subject: [f2fs-dev] [PATCH v2] f2fs: continuous counting for 'issued' in
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
 fs/f2fs/segment.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a9099a754dd2..908b9a9bd82d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1379,8 +1379,8 @@ static void __queue_discard_cmd(struct f2fs_sb_info *sbi,
 	mutex_unlock(&SM_I(sbi)->dcc_info->cmd_lock);
 }
 
-static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
-					struct discard_policy *dpolicy)
+static void __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
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
@@ -1433,10 +1432,8 @@ static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
 
 	mutex_unlock(&dcc->cmd_lock);
 
-	if (!issued && io_interrupted)
-		issued = -1;
-
-	return issued;
+	if (!(*issued) && io_interrupted)
+		*issued = -1;
 }
 static unsigned int __wait_all_discard_cmd(struct f2fs_sb_info *sbi,
 					struct discard_policy *dpolicy);
@@ -1464,8 +1461,10 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 		if (i + 1 < dpolicy->granularity)
 			break;
 
-		if (i + 1 < dcc->max_ordered_discard && dpolicy->ordered)
-			return __issue_discard_cmd_orderly(sbi, dpolicy);
+		if (i + 1 < dcc->max_ordered_discard && dpolicy->ordered) {
+			__issue_discard_cmd_orderly(sbi, dpolicy, &issued);
+			return issued;
+		}
 
 		pend_list = &dcc->pend_list[i];
 
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

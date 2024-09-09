Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B8F971F7A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2024 18:46:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1snhWT-0001h0-Bq;
	Mon, 09 Sep 2024 16:45:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1snhWR-0001gu-DF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 16:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AhF2unESHOHNXtsHs//IUH+u17vTyKFOAwToWScirFo=; b=d7sEAUvMH2TDYDeZ119aqEb2td
 sp3at6+3Qh50MQ8AJ0oy/phY14JSiBZkdWbJ6NcBw06XteBRfqwxAylsr6UzivFgszJxW/o4m8W/3
 CDYF0JBG8nCaXaz/8xgAC0G9xde6rgNl/9xtxFXE1i+mH2XAkoreTiw9paxSkb2ivOow=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AhF2unESHOHNXtsHs//IUH+u17vTyKFOAwToWScirFo=; b=Q
 RZC6OK9Yce+S8iIX5mqA0nckrfBltuktW7nKnxaf48naqf2zvGAursrHYn5V7vcUGGkrzg31MXnBN
 u1uYjQ12bpTBW9LXHWcRlBNDo+69VO2HQqR8WGejBo5RXMaEbfatHTlXVgveeSVxzsK8exfqszD+u
 HVzTa68qO/UYHN+Y=;
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1snhWQ-0001os-On for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 16:45:51 +0000
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-718d985b6bbso2810242b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Sep 2024 09:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725900340; x=1726505140; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AhF2unESHOHNXtsHs//IUH+u17vTyKFOAwToWScirFo=;
 b=bSZf7zogTzn3oZPNJ7hrZtH4rb0s0Ut/igXQxkv50FE/awog/0I89KwQVDRZFAQLGe
 +4tZgNaRyYnd1vNVFrngVDUiYduUWoCSE/J5JwxXUdZ3905JaSUJpZPBxstANrkLNNqa
 QUQMhggAfR68ilhjnKK6zvvlpEecW/puRhcf3eoXkW/AGcLxknWZTxboZZyndP/rIkZG
 jMeV7DRq4yJSNFnIcCk565El/3oc9EHvWLznp57CqZFwaiUQgI30xhaq8JFR/xi0AVqt
 8XMie4r0AYsO4zim0Z+cisljvcMdvxpKXXPVrnkmadWoMpkH7W4ELiCM13XrZolnJ9sJ
 DhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725900340; x=1726505140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AhF2unESHOHNXtsHs//IUH+u17vTyKFOAwToWScirFo=;
 b=NGnQm6J4y7/UrRPYpXA11rNQ3+X2yJtTjxEMnuDmy8UhktOghMmxMuu711BV+eRelk
 87KjRs683byOy6vKXG84GNTfNBQ3UNXyY1IV3wKFxkBocPt+fVeLSU2b5OWqpENLQNOG
 KcPVXzI3Dx2Yn7OUdIVjnt/qmvWd6o51VuV4+saVMcFZd45A4su/nhJJ6XK9OQ9tL01R
 oDm/MGKkwLhkX8t0ebWRDxP8YqG4UFjkiwA2g0plyaPYRmooBjVnzC/V0HWeNRnhIrVB
 Jh4WiwpfGt9jklQ5VTMYsiyuxmOGsWxtc9uDd5ZulOWX3pr6kcqE7Ei5ezsJ38/IJJh+
 Zkkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzOswxfIWbWk1zl0HbrGlIjv+/o4bxlQSEQMc2RTWz2lZscDlSwNeBj1zdjGX6VKg2vV4PBwx1xqGg9VowArVK@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyj/fV25dYlQixYF5gB2MLEdVJ5lE2b0f8wimqGMdvrknJUXyWt
 0Fy5WfUBn6Bp2wAoEjqrSZYPKShnuW0h573AkKcBZ1esYfQwolL9lS0OCQ==
X-Google-Smtp-Source: AGHT+IEr+bb071DTjycAg7TSxqG/Ztfnz2xO3//P7l7cKrCJY00ajS86UpgnKNvJg0cjU/A7X7KRCA==
X-Received: by 2002:a05:6a21:1706:b0:1c6:ed5e:241 with SMTP id
 adf61e73a8af0-1cf1d0acadcmr11707917637.15.1725900339894; 
 Mon, 09 Sep 2024 09:45:39 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:ed56:14c3:db02:6c66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-718e5968a6csm3718026b3a.125.2024.09.09.09.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:45:39 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  9 Sep 2024 09:45:35 -0700
Message-ID: <20240909164535.1926830-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Removed a redundant code to set i_ext.len
 to zero. Signed-off-by: Daeho Jeong --- fsck/fsck.c | 2 -- 1 file changed,
 2 deletions(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.174 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1snhWQ-0001os-On
Subject: [f2fs-dev] [PATCH] fsck.f2fs: remove redundant i_ext.len set to zero
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

Removed a redundant code to set i_ext.len to zero.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/fsck.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 7400dcf..f8607fd 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1400,8 +1400,6 @@ skip_blkcnt_fix:
 	}
 
 	if (need_fix && f2fs_dev_is_writable()) {
-		if (c.zoned_model == F2FS_ZONED_HM)
-			node_blk->i.i_ext.len = 0;
 		ret = update_block(sbi, node_blk, &ni->blk_addr, NULL);
 		ASSERT(ret >= 0);
 	}
-- 
2.46.0.598.g6f2099f65c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

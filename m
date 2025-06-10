Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDFDAD3C83
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:17:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sG0Qjo9GoFFLhDQCO6XzLbJspTRdCaYUyRzMlSJ1WQg=; b=OPRLZx2bhVKqkg2Q2dTCMSGtfS
	btBBiW5FeVxmep8S1D4h3I4VmmLcSXSVFC5Mw2yVmDAPZ1mY8PJEm8VPk/ZYiNtX5nTeXcH0AQbN/
	e7qG108h613lN0HiiVOGh1cZ6NW/lop3ZO3pNX4m5F2QSwR2NZLHLUQHdduwIZorXgn4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0jK-00060n-FT;
	Tue, 10 Jun 2025 15:17:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0jI-00060g-RZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+PlVO7wjgyW9d5v8KBmKdQqa97/8MSH9m70txGueAmg=; b=WZUVqaTF62pMk+PEm2S8/XmdU2
 C7aIbpKJ6KrD2t/bRCVkdf8VCEVwuj+ebkdWev65UG7YL6YRSlSWCf3hmmY5siQh7KxelDQ1Li+v9
 ZlfhoShvW3dwhj80CGLiTatcdJqXsobV/c3d0Udy5xLxcwrkmuQdZjxw2UhzuuncMMdI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+PlVO7wjgyW9d5v8KBmKdQqa97/8MSH9m70txGueAmg=; b=b+u/vj0l+y2+hY340r7Vi+lsxs
 m5NJNgGG3jBA8gSBdKPoBF4peIQVqduHkvvTzieOzRlHXjkvngnvDV5rxYWBevlSFiSopY2H/ab/Z
 rtxgBWPfqDf4+20TXXuS568bup9kSAhQp5LWoxd9kSlD7hPlPlClPKSyIlK7ZiNNctDw=;
Received: from mail-qk1-f174.google.com ([209.85.222.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0jH-0003Qb-RR for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:17:36 +0000
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7d09ab17244so527788885a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749568645; x=1750173445; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+PlVO7wjgyW9d5v8KBmKdQqa97/8MSH9m70txGueAmg=;
 b=H+JEws2vxqqWtF0AneJlg65KqUrROYNicukZkgEm20lwhNGZTo6hyGjKLPW+YTPvj+
 U6D+UCrsYxciPwFr8IKUoEezpk3tYrBYUa/DsfEC7tFzVYWziB8YkA7dSmRj2AJ41Mrj
 oUNQQlTD2nKK2/S28V518XwcYWGbcMuDxoEHDWT0dFGGLu1y5Rvg/WGwlvcxPWmWfGK9
 SiLx3x73D8moVG51u4jDHaPVOPXqO/7mgQZptvt0Ckc4XkNafVKchc8qiXJYNVWNvQ3i
 b5dr13dUn/j75YvmUZA46flyNPSZuwC4m9XgjhB8Y1ntdnay+vzPM9kN5wG5DVTLSI+8
 bRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749568645; x=1750173445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+PlVO7wjgyW9d5v8KBmKdQqa97/8MSH9m70txGueAmg=;
 b=qDzA3V58i/s1x2O9P+LMMnQNnZXpYmmqt98FfuyQ6fnBAFnxJ3XwYLfuIhdLlWGfXq
 B62hbSfGxG9QbPS5YLpeBoXpdlbbDHC5JqdjJX8dpCFC9ilitEu1ylVkICFlyPLBC29R
 XQQjU5xutBqVPTknwNWm8a5lkdAWVEEq2hh7v7vpas0tWgpIUBaNmTb60rN5uDpIe44B
 RMBPtB1yj59oDgZE0VzH/46cc+KkPCIS74Xt/9IgsLl52aHE0WidzHreX6kStXQbhDhD
 lNjhKJK5u1vf1AWor8SV2Hfi/ZrJ9uiIZM4k85r+WUrZHdOHOWIwT8HXXhCwB1sx+xsw
 Vj/Q==
X-Gm-Message-State: AOJu0YzO+RLDg/1P8kjh4zZvJCNms1S15guYLVtcByiHkuI7+cIKTTxV
 FnUK0tqtjlkvc3co1Jid/RKDWDUkaDTCATxhZbg/fW7hFA1/FxpgU8BjrwFigA==
X-Gm-Gg: ASbGncsn/66vp0dZ7QJYE1fXS9eQAZH1qJzk0VxlBwXuCHJxNn2AOwXdt2zbdUWEwm+
 NLQSZBJ+QsRS3I8m8HmAGtD1ve7Uo262iHz+vTL08sVZZ2NzGSfk6fEdeyDr/C50ffUE4ek/x/+
 GCDyMwzH+YIGlBABHz8/smLZ4CB1YqsnXwdtHDwUjixUqzGHQyM9HXYl+9qj2B4UEdaFvkCxCKt
 kk/gY3FlaTAGeI6SvqY/2YHxHIpXGnErtubZdh5g9/WKbdAYZZ4s3WAn2vUi3UM/sa2d3MOpD0q
 3kFkdg3scS144NkKxz+KHpggPdQ88BMnVso3FtLJiBxpJTwWOimek8ljyqeqWA6Kk+HN
X-Google-Smtp-Source: AGHT+IH2ubCTNaqfLV9Yq2MxzofLD0mvduHfQS11cNJ4Ix51nhIoIh2cLHVXNCpCzxucUmDvMmLKlg==
X-Received: by 2002:a05:6a00:80a:b0:72d:3b2e:fef9 with SMTP id
 d2e1a72fcca58-748280d4ca6mr24020253b3a.20.1749559103685; 
 Tue, 10 Jun 2025 05:38:23 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:23 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:21 +0800
Message-ID: <20250610123743.667183-12-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610123743.667183-1-shengyong1@xiaomi.com>
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Sheng Yong This patch adds a new member `feature' in
 inject_sb to inject features. Signed-off-by: Sheng Yong --- fsck/inject.c
 | 5 +++++ man/inject.f2fs.8 | 3 +++ 2 files changed, 8 insertions(+) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.174 listed in wl.mailspike.net]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
X-Headers-End: 1uP0jH-0003Qb-RR
Subject: [f2fs-dev] [RFC PATCH v2 11/32] inject.f2fs: add member `feature'
 in inject_sb
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong1@xiaomi.com>

This patch adds a new member `feature' in inject_sb to inject features.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 fsck/inject.c     | 5 +++++
 man/inject.f2fs.8 | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index 53667730775f..0b5aecbf8061 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -122,6 +122,7 @@ static void inject_sb_usage(void)
 	MSG(0, "  magic: inject magic number\n");
 	MSG(0, "  s_stop_reason: inject s_stop_reason array selected by --idx <index>\n");
 	MSG(0, "  s_errors: inject s_errors array selected by --idx <index>\n");
+	MSG(0, "  feature: inject feature\n");
 	MSG(0, "  devs.path: inject path in devs array selected by --idx <index> specified by --str <string>\n");
 }
 
@@ -415,6 +416,10 @@ static int inject_sb(struct f2fs_sb_info *sbi, struct inject_option *opt)
 		MSG(0, "Info: inject s_errors[%d] of sb %d: %x -> %x\n",
 		    opt->idx, opt->sb, sb->s_errors[opt->idx], (u8)opt->val);
 		sb->s_errors[opt->idx] = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "feature")) {
+		MSG(0, "Info: inject feature of sb %d: 0x%x -> 0x%x\n",
+		    opt->sb, get_sb(feature), (u32)opt->val);
+		set_sb(feature, (u32)opt->val);
 	} else if (!strcmp(opt->mb, "devs.path")) {
 		if (opt->idx >= MAX_DEVICES) {
 			ERR_MSG("invalid index %u of sb->devs[]\n", opt->idx);
diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
index 975d8c65030a..5ae556015a79 100644
--- a/man/inject.f2fs.8
+++ b/man/inject.f2fs.8
@@ -53,6 +53,9 @@ s_stop_reason array.
 .BI s_errors
 s_errors array.
 .TP
+.BI feature
+features.
+.TP
 .BI devs.path
 path in devs array.
 .RE
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

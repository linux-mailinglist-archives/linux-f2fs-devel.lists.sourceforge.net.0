Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EB6A6514D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Mar 2025 14:36:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tuAdw-0002qV-O6;
	Mon, 17 Mar 2025 13:36:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jyh429@gmail.com>) id 1tuAdv-0002qO-J5
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 13:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tu5yq+Z5UcezHFhkLMRIHBy3lHCFGUdQJWiAN9EoyBw=; b=OgbZAeqUqgiJ/cka4dODLxfP5y
 4bSIcUWwRQjjeYwlJD9re9c20elB39SU/iGXR66d9EWnkx788W6hIJGaCnAMjD/Hnhgb1ev4F4MYD
 P6XtAjzITIi/1oI476jeNJ+3IpA3E9O8eCxH1VfFjWRXJAu9Z99Yy+WvNG/3CikV8ZPM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Tu5yq+Z5UcezHFhkLMRIHBy3lHCFGUdQJWiAN9EoyBw=; b=C
 1O8J5CRisckq/SC/xTWZg4WpBMxIhtdRVyTSPSjSudsxq4yVAPYMKayzimJN9pMJOqMbviwIR8ICC
 1yfSo/XWwG+YvJUtLPCtQJYHSIQ+a5uPxpaOti4Y6tE8KclVbXlcyriKphksSLO+HxhCaovEN3lGX
 h6QGezcaOCb5ZHyw=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tuAdv-00014j-GG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 13:36:35 +0000
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-225d66a4839so50949755ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Mar 2025 06:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742218585; x=1742823385; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tu5yq+Z5UcezHFhkLMRIHBy3lHCFGUdQJWiAN9EoyBw=;
 b=LOvsDOfnvsTi8HsI3SJQuzyrpLfaX1jCIDL27SvHtirEsXSYRXwP/qm2BfG0dQCBoV
 TuadsLqAHGTq/1uyI+iqc7+nBJQycImshCKrkhtZc0ZomNWDc7EAsrqd/tILYFbVLD3+
 P+woArGa1YnYD0zWzY0wjwX34HLaD321T9XxXSfNnIHzZzIGwU2Q04nxTjXQuHUYe5Ni
 +KFwm/LCn/dou/3ppfF40pxM1K3F7cBb9RLlxgVq/MY7r4xroQOxiHlXAie9t2ahBNYY
 39hKjEQHOCBN+u4VjCFtA9r/6PW3paazA+yBk4s9ebaqJxAT75/5nL9LeFmKi+jX88+d
 IwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742218585; x=1742823385;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tu5yq+Z5UcezHFhkLMRIHBy3lHCFGUdQJWiAN9EoyBw=;
 b=sHcsTj34heq22DIdURpOR5WQ7jyHwbzj+652OPNyAvoho0flA56rRgNkRwyATA8S4x
 eMTC6+3aZy4l7MieYobNxjoDHOmCMh3+y8/0/wkX0Z2tDQjosFOUAruPzPzJNvxS8D7y
 XQvujwd/6TWfyHza3rq4ZeiSkjwn9JWxSWMpIND9nqMFFp2rPR75KNiPL6nbTAk8Zy7z
 jkiTYle+FA3uV+Dxt06sa2IwU1Ps+6mCf/y35/KpBqMWHMyFHMRpvytKT8XmejvNzK+s
 /Hf5JWf8ZbDt6tdqil8VkOfszkHhCJkI//sQuF0GD6Yo7axmWPknK0imbkbwgmpHb0LW
 jFnw==
X-Gm-Message-State: AOJu0YyQV5LQRYQWJHsKZJtR0jNWYrI85jmNX009/APSbtoAAYFSMzGA
 acN0Sx0EKOXSvtVTRreUZtsgODdR7Ez7R83QQwYIjPQI/cc9VBy0
X-Gm-Gg: ASbGncuDZhsdFMG8jSQNrD81K2nRyHEQi6vJDUGTvcTh6V1lyTpxYRerAMDDsOqnJWM
 O9/4o92Yif3Gz9mxZElg7kdATxz1DuNZGZgpMGs6dRPLR7VjAbRSSv9tWfwLWt0TsaaGqs5LobX
 yJGlH8D4JvjavsYDhznoVaWjWo1txNLUInSox44D8VQ+qGrJX1Ivu7o8L9b4y4u0Md1/0fk7gdD
 4UILDlfxSyQXNiFHf9Xo2t7pgfMh1Kj3ZTHLgjWciGRdpmu274f2xQp3QxkdeghuJm1r2ZND/0I
 nCV2I/s/KT2PTtqgjOPdP4c/yN68yF6sIbG/l6+TglrUbxByDH3GicJxarz99Fh2yyFpFnu47A=
 =
X-Google-Smtp-Source: AGHT+IFgvFfnyg29CPjz6eKDVq+RV53imLzWb6rAEgagFVoPaeWhCJCLeWZOmRdniuqFt62X1T+5jA==
X-Received: by 2002:a05:6a00:1255:b0:727:39a4:30cc with SMTP id
 d2e1a72fcca58-737106d1ca8mr22103745b3a.1.1742218584658; 
 Mon, 17 Mar 2025 06:36:24 -0700 (PDT)
Received: from DESKTOP-B5TBVBT.localdomain ([175.117.51.71])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56ea7daddsm7193397a12.54.2025.03.17.06.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 06:36:24 -0700 (PDT)
From: Yohan Joung <jyh429@gmail.com>
X-Google-Original-From: Yohan Joung <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daeho43@gmail.com
Date: Mon, 17 Mar 2025 22:36:11 +0900
Message-Id: <20250317133611.457-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: this is unnecessary when we know we are overwriting already
 allocated blocks and the overhead of starting a transaction can be significant
 especially for multithreaded workloads doing small writes. Signed-off-by:
 Yohan Joung --- fs/f2fs/data.c | 8 +++++++- 1 file changed, 7 insertions(+),
 1 deletion(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jyh429[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [jyh429[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.175 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.175 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.175 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
X-Headers-End: 1tuAdv-00014j-GG
Subject: [f2fs-dev] [PATCH v2] f2fs: optimize f2fs DIO overwrites
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

this is unnecessary when we know we are overwriting already allocated
blocks and the overhead of starting a transaction can be significant
especially for multithreaded workloads doing small writes.

Signed-off-by: Yohan Joung <yohan.joung@sk.com>
---
 fs/f2fs/data.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d872f785a996..d99ec9370b1d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4181,7 +4181,13 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	map.m_next_pgofs = &next_pgofs;
 	map.m_seg_type = f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
 						inode->i_write_hint);
-	if (flags & IOMAP_WRITE)
+
+	/*
+	 * If the blocks being overwritten are already allocated,
+	 * f2fs_map_lock and f2fs_balance_fs are not necessary.
+	 */
+	if ((flags & IOMAP_WRITE) &&
+		!f2fs_overwrite_io(inode, offset, length))
 		map.m_may_create = true;
 
 	err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DIO);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

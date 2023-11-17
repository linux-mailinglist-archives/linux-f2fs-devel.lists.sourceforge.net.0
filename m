Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C15CB7EF8CC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Nov 2023 21:39:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r45cO-0001b7-BD;
	Fri, 17 Nov 2023 20:39:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1r45cN-0001ay-E9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Nov 2023 20:39:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7ETgvrJcyf+GAZnQOzgEhP5ISVDHjC8tSZ7J4fXmHUs=; b=CIc9bts7+jkn85zSJHKPXD65f6
 wH0kZz6LOSisnOR2x7jm2mp3gQcIK+jZASSiLHXH11i5XUNPTYjcmMGDy/lx/xlQwFLqTSkj6RbhD
 gINC0/Q3bXBnhXglmMwcQCw9UpTSCXheaSizBpx86tY/KY3WaBjzT5vGb17X46hIHf1M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7ETgvrJcyf+GAZnQOzgEhP5ISVDHjC8tSZ7J4fXmHUs=; b=i
 rFmHl7csebK3124QzZKVqIpd4jGyu1OOBD3JJo+KbaSdJUZLNaBRuCsALLy9q8BisGpny3UgM/cCQ
 FqzodfLtwyQciSCOOVzJAI+YB4NaTkwk7soCioDh6MmmZVHWFWxCJVvpLhXD6K86OzXoD2UVycNbE
 lREdRwfies5XvMqk=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r45cH-008pOl-Td for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Nov 2023 20:39:10 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1cc5b705769so21550435ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Nov 2023 12:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700253540; x=1700858340; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7ETgvrJcyf+GAZnQOzgEhP5ISVDHjC8tSZ7J4fXmHUs=;
 b=J+LVBP0T1Ip3Ub5vbOvT/g9FpcdyH10dc5iaKb3DJXfdhtX5Z1hBC9ys5mh+lt+vui
 Qw0zs29nMb99rhxvgrxh2+ImHxBRFgDBqrIksJkTKdpTooqO93tWs+QZUOXNaN40HGtt
 tVWYS+Hm/vnKJF6lOeQz7BHjaL4fEoqlz45LO1fVu9OR/L+njXNtidDwzveRvx8ddMmo
 D34G7jKU77M6b0PNLzd+yPPsQqch49PgkPxIAZ6TW80AGDgNgwZrsz91d4pP4exA4xDO
 YVHAUU6akVsFMAa6EIvznhWvnK6V/qE/OQDYhCO1rgXYzEJUbJphoce7YmDTDVmNjfNP
 c+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700253540; x=1700858340;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ETgvrJcyf+GAZnQOzgEhP5ISVDHjC8tSZ7J4fXmHUs=;
 b=cCSlXpOBfCccj9+fuTkOec+HCyK0D5O9DxKKPbKAlPaYRwyPFCgDeTGkIyuxjJ+R1E
 7DdDpkNZpzcd/U4n2dYMj+GlWiVNZfy9jyGSKn4BuBakmyNX1rKIXSLeM0NGi0G8zOiG
 rF/qLYx7dAXZGZXr27LpDJIdddLgNa3gGVXVvWcRl6NY5BjCr3Qh8ckwbt5nLiJ2G4Jv
 p4r8Yx5DCD2Ebe7v1en57y+7tHweAS8i5lDskVAIJk85Vp5R+at7Zfd+XWrkfAIDzqMA
 aQln7Ia44n03K6ZnQPeTJY9md0mV1SJ1TEBYKGcMOhRUim6qXnnMdBlrzMAoYcEXg+4N
 XzQA==
X-Gm-Message-State: AOJu0Yz/2/Ul39rhiK9yqrdbtYfjSz8jUKU9XBuAKeEXn5zq5zRr5k3O
 ZzZ5VVOy0sEc2Ew5JjFuLP4=
X-Google-Smtp-Source: AGHT+IFiuEUBAekE+jWCaO/fNCPjfjb6h+uNLtJcA/CX3wX3J72Mgq0MlYYDv3o9VqGqm721rrLDJw==
X-Received: by 2002:a17:903:1247:b0:1cc:510c:a0b9 with SMTP id
 u7-20020a170903124700b001cc510ca0b9mr860978plh.34.1700253540200; 
 Fri, 17 Nov 2023 12:39:00 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:4344:b98f:50f2:673a])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a17090276c900b001bdd7579b5dsm1746528plt.240.2023.11.17.12.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 12:38:59 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 17 Nov 2023 12:38:55 -0800
Message-ID: <20231117203855.3415891-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong Fixes: 0f503e443ccb ("f2fs-tools: do not
 reuse corrupted quota inodes") Signed-off-by: Daeho Jeong --- fsck/fsck.c
 | 5 ++++- 1 file changed, 4 insertions(+),
 1 deletion(-) diff --git a/fsck/fsck.c
 b/fsck/fsck.c index 55eddca..2bb759c 100644 --- a/fsck/fsck.c +++
 b/fsck/fsck.c
 @@ -3094,10 +3094,13 @@ static void fsck_disconnect_file(struct f2fs_sb_info
 *sbi, nid_t ino, r [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.178 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r45cH-008pOl-Td
Subject: [f2fs-dev] [PATCH] f2fs-tools: adjust nat and block release logic
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

Fixes: 0f503e443ccb ("f2fs-tools: do not reuse corrupted quota inodes")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/fsck.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 55eddca..2bb759c 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3094,10 +3094,13 @@ static void fsck_disconnect_file(struct f2fs_sb_info *sbi, nid_t ino,
 		release_block_cnt(sbi, dealloc);
 		get_node_info(sbi, nid, &ni);
 		release_block(sbi, ni.blk_addr, dealloc);
+
+		if (dealloc)
+			release_nat_entry(sbi, nid);
 	}
 
 	/* clear data counters */
-	if(!(node->i.i_inline & F2FS_INLINE_DATA)) {
+	if (!(node->i.i_inline & (F2FS_INLINE_DATA | F2FS_INLINE_DENTRY))) {
 		ofs = get_extra_isize(node);
 		for (i = 0; i < ADDRS_PER_INODE(&node->i); i++) {
 			block_t addr = le32_to_cpu(node->i.i_addr[ofs + i]);
-- 
2.43.0.rc0.421.g78406f8d94-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

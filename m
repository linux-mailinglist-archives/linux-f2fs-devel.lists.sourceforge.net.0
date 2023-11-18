Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6A17EFDC2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Nov 2023 05:35:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r4D3G-0007aH-SE;
	Sat, 18 Nov 2023 04:35:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3bRtYZQYKADYVjgkWfYggYdW.Uge@flex--drosen.bounces.google.com>)
 id 1r4D3F-0007aB-6C for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 Nov 2023 04:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r3da8+JleDBVNKPrVjm2nlHhjcj6Q9VBbqhYZ08KC7w=; b=WacIU7aIaDZvRVLZHpMp/IxEP2
 mF/7YRynfKgfvbyF8tvHLWODRzUGAlRahkoRLDcZd8xORf/fOZUALOzZzKzFP6/q6HKzz0B8C96b6
 HIkE125FEt7bYIN4HmgoGUFanneNsTch6JDWgrMwySpsoMyXyE/NsMotY81zGXmSBZ5A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r3da8+JleDBVNKPrVjm2nlHhjcj6Q9VBbqhYZ08KC7w=; b=JoXtxOBZLEqGMPLxHVwMLMPf2a
 Nz9+NDkPDodEETOEZo9s/xsFP+LLYOpUvS4KOnzZc5xaz3iqNmHfLmpBEFQT8+YRPRV1Tnennzj5N
 7EhWvjT0JfGBJwsHl8LsW6XQUOuyXFa6FX/blmVEtYIBwej5Gyo0aqngTNVhaRtKihNc=;
Received: from mail-oi1-f202.google.com ([209.85.167.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r4D3B-0093mk-2m for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 Nov 2023 04:35:25 +0000
Received: by mail-oi1-f202.google.com with SMTP id
 5614622812f47-3b6d023424bso3111270b6e.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Nov 2023 20:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1700282115; x=1700886915;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=r3da8+JleDBVNKPrVjm2nlHhjcj6Q9VBbqhYZ08KC7w=;
 b=WcDk1F+eSv0hP7tQrdBo5IWrZwSsvV0W5pGahKzOP0hGPqYfi80Nuw40r54zuGRabZ
 /6ZikVpnzUtzPVKhbyjHj2158+lNuSiWhFjY47a8WlKNJ7d2LPX2LudExtLXFmRL2Dm3
 cKFWccwuIobgvOASuOIhjkm9RZw3xnVYxjChXF+lYZQsiyB7srwlr9y273DmWQDv1UiQ
 747lNb2tAFLs/zFDdpCmU3iiR1ATP16o3Q+IfVHEUF5LJSfiPm8piPAhYY884Gn8ifxQ
 yi2SSuKeKU52e/1+OkBgHu+sa//gjTdA3XMZKGmXzFPX8NRXmi11RqjZiWJSBop2T3i3
 VhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700282115; x=1700886915;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r3da8+JleDBVNKPrVjm2nlHhjcj6Q9VBbqhYZ08KC7w=;
 b=bUJDeUocn+43Wsc5PlBESVZsJaYkEKAeDblMAIt3QLMZMHvkoY3tjfScui1VwgxqjS
 wWNpKz2qbQjb4BUi2dL2K25K+lXFvjnlJnJlmJKKNVuFB+qOPgGYEu7TzX1+/gxdd211
 twSrrZtKx+IFMHQgrVVkgbvqAM8M1qXyvJlYFZYPbQcRe22T+PS9J17/xm+bM2aSIAMp
 C2ZGp/S1eo2YT5RomppCNtqtGjRZhrFARvzQ6bU+dQFXOsABvvk2Ss9mdHLtOVjX6836
 lfZ56g5nEuPw+A+FAOUjOb5nz8vE9OXqfT7lSR8p2GJacW8QBR/nSh9gtZ4Pl4bGpq9A
 ufew==
X-Gm-Message-State: AOJu0YxmDutB7eGp9VNfg5tdaIf9k6Uq1mP+k6zzkvfgad5pNtLCjNId
 v+sQIsb9BHZf8RW+BW9CAM+tIzuJxp8+tlb8vm1Bg0u16SdOnkuPRq8QMW8k7KqoLvMAZCpFmbF
 dKjvSZmVssBPN5lKR0qLOtqmrIkd5AhvqH7UzQ1CVAOzTCZi9dG/Yr0N8zFQSxUSO01C593gj3b
 napnmRNjE=
X-Google-Smtp-Source: AGHT+IGv0DnQxx+hbyhUa6NznPuXS5TCHEb2adceWiDGvi+Y9WB0vkYKGteYqU3RhS8aoZBWlrEz77FYc5I=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:5334:1f35:bdef:529b])
 (user=drosen job=sendgmr) by 2002:a0d:dbc6:0:b0:59b:f138:c845 with SMTP id
 d189-20020a0ddbc6000000b0059bf138c845mr39537ywe.2.1700273005790; Fri, 17 Nov
 2023 18:03:25 -0800 (PST)
Date: Fri, 17 Nov 2023 18:03:09 -0800
In-Reply-To: <20231118020309.1894531-1-drosen@google.com>
Mime-Version: 1.0
References: <20231118020309.1894531-1-drosen@google.com>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Message-ID: <20231118020309.1894531-4-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The initial sizes for dqblk.dqb_curspace should reflect the
 block size, as that's the minimal filesize. Signed-off-by: Daniel Rosenberg
 <drosen@google.com> --- mkfs/f2fs_format.c | 4 ++-- 1 file changed,
 2 insertions(+), 2 deletions(-) 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.202 listed in wl.mailspike.net]
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.202 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1r4D3B-0093mk-2m
Subject: [f2fs-dev] [PATCH 3/3] f2fs-tools: Fix dqb_curspace to reflect
 blocksize
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

The initial sizes for dqblk.dqb_curspace should reflect the block size,
as that's the minimal filesize.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 mkfs/f2fs_format.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index f2840c8..b46bc15 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -1362,9 +1362,9 @@ static int f2fs_write_default_quota(int qtype, __le32 raw_id)
 	dqblk.dqb_bhardlimit = cpu_to_le64(0);
 	dqblk.dqb_bsoftlimit = cpu_to_le64(0);
 	if (c.lpf_ino)
-		dqblk.dqb_curspace = cpu_to_le64(8192);
+		dqblk.dqb_curspace = cpu_to_le64(F2FS_BLKSIZE * 2);
 	else
-		dqblk.dqb_curspace = cpu_to_le64(4096);
+		dqblk.dqb_curspace = cpu_to_le64(F2FS_BLKSIZE);
 	dqblk.dqb_btime = cpu_to_le64(0);
 	dqblk.dqb_itime = cpu_to_le64(0);
 
-- 
2.43.0.rc0.421.g78406f8d94-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

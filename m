Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8915E7E9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Jul 2019 17:33:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j0izwqIWPls2q6ZbJPJkfGw3drmVr2bXQAX7LDfIdeQ=; b=WVIuc4pNrnQEqxbDEA84siMxNp
	QzojcdM8JLJfoAJxmei3Oeo0g9OGgFxmx6x/Vxu5bgIxQhs2ROkp3/neBih816+6GQRPqfhbXDRJA
	fbkMkAxKV77wojrdXlIhq07fT66ldFgQQu4ceUGvJuD3TRHr6RURitzygR0mm+2AttoI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hihG9-0005bn-R6; Wed, 03 Jul 2019 15:33:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3xsocXQkKAL0rfhdqfkhqjrrjoh.frp@flex--oceanchen.bounces.google.com>)
 id 1hihG8-0005ba-3R
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jul 2019 15:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/6bGHYyTFS2kttBBEjE3ja94SSfbSSxkJ0m3sfLvbLw=; b=hnQj0iHyjRhbvWsFjkcHtPwyLZ
 orc8FQLqV5qYNOmZYnBW6Tn4qnnSFJ8CWWOR11Q5Upj4rBz1p6Jd659Zyh6j9pgCp6Nb6hiXpjpkb
 7En3ni8P9lysNjC6BU4pRD8cDzNPlEEMLsV9MpzK3k6y4A7qnrNxe8cIYcs+vssxFX2s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/6bGHYyTFS2kttBBEjE3ja94SSfbSSxkJ0m3sfLvbLw=; b=l
 yGu6XyeGGD9C5zekBX7rX+4KT26scx2JKcWas5wPQYAYRY2U2orcrg8aNa4i6gxXRkTG9cvBWio3C
 h/7tlURjhGsbR7hdvcGamnvziMkUvtHmOeEex5ET4MUAotQrruhO79e3iy/hbAjJFNaQmMiEVE4YI
 UpAZntbZAp11qRkY=;
Received: from mail-ua1-f73.google.com ([209.85.222.73])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hihGG-004NTO-HE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jul 2019 15:33:33 +0000
Received: by mail-ua1-f73.google.com with SMTP id t2so81173uao.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 03 Jul 2019 08:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=/6bGHYyTFS2kttBBEjE3ja94SSfbSSxkJ0m3sfLvbLw=;
 b=d1g6PiIIpFcSBKhxLW3TWAoUq5UUCQsATCOVnwBRhz9/DsRsQ+xuaKrbjWo6HTjFof
 KOu3qqTOz/u+lec6BcwCxvSeBVunH9TXhDw7o3rhYAVLrJ56qHWPOZ0RKz2mbTS/V3nZ
 9UO9kxCq8Zya6zrmOQku4WgYGtMXaJCdsRKm7TqCN2GSwFlNXkO20igq4WB181zqOWFE
 NK/S0HBVtjNnQMJuHUnIcAHI5/Oc5g9gSVRQph9LckzC6FysJMxmjPrIC172wYrrFQi1
 3B64QHwv8VfK6TQ+XYw6Yd5rRZOBDw0MuDo7wRq9rJ0lF9g3MHM0eTrEVR8RY+gburuH
 K2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=/6bGHYyTFS2kttBBEjE3ja94SSfbSSxkJ0m3sfLvbLw=;
 b=gzCKT+h3zYEilnCDrwAKB57kcPx4n8GFeVBPd/ut4x8rua4Ey57qoZ2RlSlRcFufbZ
 mn2FwvP+J+RMJE8eevr8r7JwY6mVZduIYk0gMmchcE/VpAQA+kPIRxe7oWyCAsIwcKIG
 YQ4Bq3MxsS5TFyN8faSKbpxdM/bu/f69j2njMDWwxrn1z2L+ldESx/TcqbRkziRHOV+v
 u36uhSZQzgyJNAKwR2FTJZOBCwWYdCAycI6AgRWbANmqBSTbIw6sNIclUqtHn1OGBcGP
 M6xVsZ2w9lgS6DjKdUMiKdxl76xOU9oi0kALV/QmKVRo2Qu4YybDfkwaWyShZnn+4dv7
 Q/bA==
X-Gm-Message-State: APjAAAXss9PFkAh/xSpX+IxVxgCPYaDNAhfxeqPLW3qJGOxV2MjhbDtm
 sH3kZ6SCZ7PvwNs4aHPaWOpqkeQX9RmuYAg=
X-Google-Smtp-Source: APXvYqzrwdQGhOseYcg6xIM5JSFjAPspBRD77M05eXm8kqyCNWugf7glng5Xz6BJwUhoi80Y+lROqLL9UM9h8Y4=
X-Received: by 2002:ac5:c5a8:: with SMTP id f8mr4107446vkl.80.1562168006316;
 Wed, 03 Jul 2019 08:33:26 -0700 (PDT)
Date: Wed,  3 Jul 2019 23:33:20 +0800
Message-Id: <20190703153320.203523-1-oceanchen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
To: jaegeuk@kernel.org, yuchao0@huawei.com, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.73 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1hihGG-004NTO-HE
Subject: [f2fs-dev] [PATCH v3] f2fs: avoid out-of-range memory access
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
From: Ocean Chen via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Ocean Chen <oceanchen@google.com>
Cc: oceanchen@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

blk_off might over 512 due to fs corrupt and should
be checked before being used.
Use ENTRIES_IN_SUM to protect invalid memory access.

--
v2:
- fix typo
v3:
- check blk_off before being used
--
Signed-off-by: Ocean Chen <oceanchen@google.com>
---
 fs/f2fs/segment.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8dee063c833f..c3eae3239345 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3401,6 +3401,9 @@ static int read_compacted_summaries(struct f2fs_sb_info *sbi)
 		if (seg_i->alloc_type == SSR)
 			blk_off = sbi->blocks_per_seg;
 
+                if (blk_off >= ENTRIES_IN_SUM)
+                  return -EFAULT;
+
 		for (j = 0; j < blk_off; j++) {
 			struct f2fs_summary *s;
 			s = (struct f2fs_summary *)(kaddr + offset);
-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

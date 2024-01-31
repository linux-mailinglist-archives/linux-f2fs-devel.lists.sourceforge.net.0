Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A84D8844733
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jan 2024 19:33:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rVFOu-0004Hz-8G;
	Wed, 31 Jan 2024 18:33:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rVFOs-0004Hj-Ji
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 18:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i3HqJfEyYAV9x9E8qNujfqhtfVC27wsVyRT1JllQJy4=; b=VRypYEQe/8wc6XpirNsbyvUKrx
 AndDxQfUTgFyWg1zLM0fLNbi28KXKhsG28ntB1dZwMQUBPweP4V7dc52mitl6EW5YEy6TjYxCAPo4
 /3DnEZ2nbrh7SD5yRj2rXOn4vHl0LKv7qd0ECp7OWik8x7UkhiVixDfm0B3wPSZ8vluQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=i3HqJfEyYAV9x9E8qNujfqhtfVC27wsVyRT1JllQJy4=; b=d
 5GraN4elAE+mW5+8IKQw9m3l8v/amhnfCTmTarL6/peVZnhDtkuHSPKXx9nX9U6Pb6pVlUFE1ecO9
 oauQ2TAnQyOo/1CjCsCkkIrjHW+ybEGBkfDyJo8Wu+l3fewxnYc0P1QW5nHTyZTG5N71OX06VXs9L
 m46YL2JsaJUfQgS4=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rVFOl-00031w-Mj for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 18:33:30 +0000
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6ddd1fc67d2so20625b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 Jan 2024 10:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706725994; x=1707330794; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i3HqJfEyYAV9x9E8qNujfqhtfVC27wsVyRT1JllQJy4=;
 b=B2dq1WgqfLtyVAaCxe5ulxIGy/+6XP9ZEg2k37s4Tlz9uYmUMlIMcWGjJ3UPvOldJW
 rUXqe8vZQUgHgIFi3lHpqKn1ZvSt8kRpdiM8uSopfMxRNgYl4eltOiZED7uKONsYSFsc
 5QDSFnCoey6No0ChR7bQpZ8j4BiO+mNBatoAyb6KfzZDCdtG5qoR+hr0/2gYXfpeheFM
 xJtMQN74v7ZCJezw71v9K9q5pMGbXZbxJfz8t1YpWgULlIYs/Y/Ek9tynqQhvkOrOZ9Q
 GmOp6oKWoISBRY8hopNnQRuEbJqe6ZPBIx8M89b0JZcXotbmXJAtREnjU07ubTfPfTHk
 VyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706725994; x=1707330794;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i3HqJfEyYAV9x9E8qNujfqhtfVC27wsVyRT1JllQJy4=;
 b=Tcse0XNQj55ECqMg6TX97zfcDqki8iI1os8w8k4Ilc+7myKCzejiL+wuwsL+1QHBhA
 areZjPZPgvlYplQhcgHOReXRmZ1LYjhsUAKh9F/+JOVCZqwB+FMnZ/kgVxDY+dZ0asVJ
 nX53PuFb1f2KhTGYOzhGY0A9BU21cesvfWIdk9aMokhsKVIYXgbAmM5JfyW75+EQWYsa
 eqQ7R+UNyaYt3NQKdEvOrqwuNNKF5X3WfUwwU911WcYi4S9HhEfAEUk7MEvuXP3YCSeG
 8DxQFYwC3cZQuwp4jvnSbDwZf8KE7OMkgPlxbCJoxL4JW8Dac/Fd+2p67Gsx1kHXDW/6
 R9Cw==
X-Gm-Message-State: AOJu0YzsaqINlkhOUZMcfcpsTn4gvCCvx0Ka8kC484zO8282XabIy5l9
 dajIp7qaFzooegzI3nNS6Mj3/aG1dqWZhSYPiSaO1hZy07mpMqo8fLrpLUgH
X-Google-Smtp-Source: AGHT+IEXSr/QD1yLRkKwnlLJyr71HUl3kKXqwgQJE+B4DcZMVSYiefw7oL/qDvzE75jC1NHxL0JKHw==
X-Received: by 2002:a05:6a00:99e:b0:6dd:a0a7:ad9a with SMTP id
 u30-20020a056a00099e00b006dda0a7ad9amr3271685pfg.25.1706725993619; 
 Wed, 31 Jan 2024 10:33:13 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:436b:ab62:1d08:45ea])
 by smtp.gmail.com with ESMTPSA id
 i21-20020aa787d5000000b006d9c216a9e6sm10300369pfo.56.2024.01.31.10.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 10:33:13 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed, 31 Jan 2024 10:33:06 -0800
Message-ID: <20240131183306.536372-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong Make to allocate logs after conventional
 area for HM zoned devices to spare them for file pinning support.
 Signed-off-by:
 Daeho Jeong --- v2: make current segment numbers relative to main start block.
 check zoned block availability before the allocation. --- mkfs/f2fs_format.c
 | 10 ++++++++++ 1 file chan [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.169 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rVFOl-00031w-Mj
Subject: [f2fs-dev] [PATCH v2] f2fs-tools: allocate logs after conventional
 area for HM zoned devices
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

Make to allocate logs after conventional area for HM zoned devices to
spare them for file pinning support.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: make current segment numbers relative to main start block. check
    zoned block availability before the allocation.
---
 mkfs/f2fs_format.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index f2840c8..57ea9ea 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -558,6 +558,16 @@ static int f2fs_prepare_super_block(void)
 		c.cur_seg[CURSEG_WARM_DATA] = next_zone(CURSEG_COLD_DATA);
 	} else if (c.zoned_mode) {
 		c.cur_seg[CURSEG_HOT_NODE] = 0;
+		if (c.zoned_model == F2FS_ZONED_HM) {
+			uint32_t conv_zones =
+				c.devices[0].total_segments / c.segs_per_zone
+				- total_meta_zones;
+
+			if (total_zones - conv_zones >= avail_zones)
+				c.cur_seg[CURSEG_HOT_NODE] =
+					(c.devices[1].start_blkaddr -
+					 get_sb(main_blkaddr)) / c.blks_per_seg;
+		}
 		c.cur_seg[CURSEG_WARM_NODE] = next_zone(CURSEG_HOT_NODE);
 		c.cur_seg[CURSEG_COLD_NODE] = next_zone(CURSEG_WARM_NODE);
 		c.cur_seg[CURSEG_HOT_DATA] = next_zone(CURSEG_COLD_NODE);
-- 
2.43.0.429.g432eaa2c6b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

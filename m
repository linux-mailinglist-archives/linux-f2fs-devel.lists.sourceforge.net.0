Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E42B5138C11
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jan 2020 07:52:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iqtaj-0003th-B9; Mon, 13 Jan 2020 06:52:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <xp1982.06.06@gmail.com>) id 1iqtai-0003ta-Rb
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jan 2020 06:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ixWmZZn5cz1mbd7yW9N78OzPov834nZ+OiSf3qX3/Iw=; b=HfZmZWMvWkVfsMBPNlrRZgM6JB
 hJDQ2D0xZR888BqGAIaqn/dQLpOqnE8jX9lBNatEu/Z4zdbGpIO1AdVI53wvjf4EosHW0QUSemaoC
 VE4MEght8vhg5vAce6k7LwQLnTtWCZ9TvP4ueRR8ly8/LxWzEUKk0uhbcGstix1cB9C0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ixWmZZn5cz1mbd7yW9N78OzPov834nZ+OiSf3qX3/Iw=; b=VFfKUUE2SZgGtC9pnlCV+pzERE
 d2s3zZoskxobx1g1uyR6Htwc/Vc8DjXLp8DvWgT+krEHgKUcDux+97gp2+TkB3ZH0YMICt8LECnHl
 4/JFjj15MhhLM/WyWMN40Asv76V/KDoyJ7RgnTM1Z7ZMrg8aIjcVN10IO+uGBvRkm7iE=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iqtag-002nCX-Mh
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jan 2020 06:52:48 +0000
Received: by mail-pg1-f194.google.com with SMTP id k3so4236892pgc.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 12 Jan 2020 22:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ixWmZZn5cz1mbd7yW9N78OzPov834nZ+OiSf3qX3/Iw=;
 b=MWDnx4s6w/tmBrNVbFIQ1vEX6qQvpKt44HmfIThiV/xaQluAyx9nzyLcL1Yscq+xBf
 85JkyYzx/i3b13pq2yZWeuEiFyErVuSGRIvzYKg2iEQ28m/8Emq3+YX7/q0T0WBZFIMf
 oTC6CpQifBvzkwRzR4sdi24ce49Jp8JxpA6AuQFHTZyKoAiT0ivYXwf4aytyqc13wQ3a
 1Lga1hYL7mosq+M9NPIETKtjn0RmIMrRa/6veh8h7PHZwLsJx+2JYtc3LfBUGPv8OyWz
 CqkgN1sVbjpQlCZH9/lo7vnLK3UHfaqTWUezZWHxQ7oaQ0lMi2fEOtSkA7s27R2x/y3B
 U54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ixWmZZn5cz1mbd7yW9N78OzPov834nZ+OiSf3qX3/Iw=;
 b=IrBSYOLHGR3LAXwH1MeP58THiArUEMFOor5MIrc7hujzp2kGt7v9eP3vluy8Owqzfc
 ySwAnYDMM2YytX5oKXEjU3f9Lrh2BSTJs4zjwJjB5t8L7ragC0Fbq0/rW1mSOKNryiQy
 /lYw6WHR1tTs8CgqTrp7W7+Gs5vkep34RXCd0gWLh343kJiKH8yzdwqMvUp9oMeEOmSe
 Y2GES2gt7gHd4O1gn3aMe6e/cSPMei7K9usgPKa8sojpFoUmFDKxnGtE4sIRm3JmeeO9
 48tabpNq49OLRqCwPeBIjpWL1MUAwXkPFumVb8S70wZPggxPeEtp/wi1twxuRYp92cG8
 92Pw==
X-Gm-Message-State: APjAAAXOlUkjpvQ2+wkZrqFCL/lvGPwfaLe7XTnwGGYoPCVUv33l8vca
 bdPhbfp7XqBYf+bp/iSs6D4=
X-Google-Smtp-Source: APXvYqz8DDYgtxILjbT8NXNXztKpdNhF11x4wKO5q4NOEFrzD3WC1my7gwV5KogGtPbc3vnQZWJIiw==
X-Received: by 2002:a05:6a00:90:: with SMTP id
 c16mr17661377pfj.230.1578898361059; 
 Sun, 12 Jan 2020 22:52:41 -0800 (PST)
Received: from xp-OptiPlex-7050.mioffice.cn ([43.224.245.180])
 by smtp.gmail.com with ESMTPSA id p21sm12338217pfn.103.2020.01.12.22.52.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 12 Jan 2020 22:52:40 -0800 (PST)
From: ping xiong <xp1982.06.06@gmail.com>
To: yuchao0@huawei.com
Date: Mon, 13 Jan 2020 14:52:30 +0800
Message-Id: <1578898350-29607-1-git-send-email-xp1982.06.06@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (xp1982.06.06[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (xp1982.06.06[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iqtag-002nCX-Mh
Subject: [f2fs-dev] [PATCH V2] resize.f2fs: add option for large_nat_bitmap
 feature
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
Cc: jaegeuk@kernel.org, xiongping1 <xiongping1@xiaomi.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: xiongping1 <xiongping1@xiaomi.com>

resize.f2fs has already supported large_nat_bitmap feature, but has no
option to turn on it.

This change add a new '-i' option to control turning on it.

Signed-off-by: xiongping1 <xiongping1@xiaomi.com>
---
 fsck/main.c   | 6 +++++-
 fsck/resize.c | 3 +++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/fsck/main.c b/fsck/main.c
index 9a7d499..e7e3dfc 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -104,6 +104,7 @@ void resize_usage()
 	MSG(0, "\nUsage: resize.f2fs [options] device\n");
 	MSG(0, "[options]:\n");
 	MSG(0, "  -d debug level [default:0]\n");
+	MSG(0, "  -i extended node bitmap, node ratio is 20%% by default\n");
 	MSG(0, "  -s safe resize (Does not resize metadata)");
 	MSG(0, "  -t target sectors [default: device size]\n");
 	MSG(0, "  -V print the version number and exit\n");
@@ -449,7 +450,7 @@ void f2fs_parse_options(int argc, char *argv[])
 				break;
 		}
 	} else if (!strcmp("resize.f2fs", prog)) {
-		const char *option_string = "d:st:V";
+		const char *option_string = "d:st:iV";
 
 		c.func = RESIZE;
 		while ((option = getopt(argc, argv, option_string)) != EOF) {
@@ -476,6 +477,9 @@ void f2fs_parse_options(int argc, char *argv[])
 					ret = sscanf(optarg, "%"PRIx64"",
 							&c.target_sectors);
 				break;
+			case 'i':
+				c.large_nat_bitmap = 1;
+				break;
 			case 'V':
 				show_version(prog);
 				exit(0);
diff --git a/fsck/resize.c b/fsck/resize.c
index fc563f2..46b1cfb 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -512,6 +512,9 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
 
 	/* update nat_bits flag */
 	flags = update_nat_bits_flags(new_sb, cp, get_cp(ckpt_flags));
+	if (c.large_nat_bitmap)
+		flags |= CP_LARGE_NAT_BITMAP_FLAG;
+
 	if (flags & CP_COMPACT_SUM_FLAG)
 		flags &= ~CP_COMPACT_SUM_FLAG;
 	if (flags & CP_LARGE_NAT_BITMAP_FLAG)
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

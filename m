Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF95F1355D7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jan 2020 10:32:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ipUBL-0004mt-1Z; Thu, 09 Jan 2020 09:32:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <xp1982.06.06@gmail.com>) id 1ipUBK-0004mX-32
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jan 2020 09:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IUptMHJL+9Tl4nhOhJMfCKeT/r8B8a7YJnYcaAk5T+4=; b=O/ZOw9XxS1FJ6iHsjS9Rx5hNnU
 jJnbsCHtr2t/Ox5qQ6o5mEpDETa3k1HcsOr0j7VyfxtOEf5xkuW7Xtsu/Eax1rO7+T1V21uYzEQbt
 9KmVraNELC0FnlPQlPr+BM+6l8ajyYa3owLnSvM4p3XM2FpyblrxTTnpUeqzwfSilbYQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IUptMHJL+9Tl4nhOhJMfCKeT/r8B8a7YJnYcaAk5T+4=; b=NVp/7VAEhUW9V14J1P+yeLC8Xz
 zsg964jAFYarZayzYfZbA4Cb2+U4xWXxlOMLH4gnv/ZQB/wcgB+SOmsUuO/hlnl7iWO3n1N0Y6WWJ
 F91vx13A7tU4y+Xe+XN1AdbY5YX1yG/3X0idsQ+AaV7KeWKIMKonskxAEe6hNDiaK/EI=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ipUBI-00EH5M-3s
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jan 2020 09:32:46 +0000
Received: by mail-pg1-f194.google.com with SMTP id z124so2934679pgb.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 09 Jan 2020 01:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=IUptMHJL+9Tl4nhOhJMfCKeT/r8B8a7YJnYcaAk5T+4=;
 b=n930WMFzeCmP5ttP1TldocO/9JwvUJXTCdFgxCpyoVU14UEuckw3pi5GhVnTrxel8y
 qXH2mO5pl0DD05POWU6NQBkhrrKF+96Jomuv48OJdpEG3VbrIbSrBqxOV4Q7UUGN36iI
 pS2t/PuBonQ12GJk2MRiL4QjBN8Z+bwun2A3bl1NmvodbF1Q/Xbd5vc/g6bOtzOjW630
 S71ZUbs7tevnBWY/4PJO3TK87CeVVPOw1rJINrfPPgELpO4mRKnsbeq6wIeHN2n1b5Fh
 rYy3lSe7o2TENXT94FZrTiPCEinaAiVmgYZLEg44liGVMH60IgJTHZ9PgGkbOKTRZu7X
 LQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IUptMHJL+9Tl4nhOhJMfCKeT/r8B8a7YJnYcaAk5T+4=;
 b=RgaIxG/3ZAS2MKHVy1W9SMRSFR/Cd6pLSL6Djqbv+u9Bf7sXhV6mAXzy1Mvt4e7Jll
 MMmck21K+pR63Vgv++4XRAEYiSPpDunae5zpfHGbCwkkPhzf83JXJTcJIe65N9KJbiXq
 DckmlA1FaEIIxYfTo22dEVGuv2CanhqEl1MiUxtXgHS9IhqLoJn0+khpkjFBqwDiTXma
 YCi83GQZ2HMdcWxAmMH7KGDIRIUNpA7SmvZ/rmjdZYzRZxcNx71ywoKFDPF4ORJIaR0q
 HlLniDLQBpB436JNTjeE7sTxVooOxgarL5vyEOeQ8iSgfYUHDMrykeABOvStDAXUt7BF
 rQZw==
X-Gm-Message-State: APjAAAVqBHVtb6a2/uqr6qr4c9or6aHWwPYpJYz3OCj7bqiSE7yhlcTu
 lex/k7AgUH9um8HM8Q9WaaU=
X-Google-Smtp-Source: APXvYqyPNuEcV6edJfxPLDzBxOyLVXgzbP+dnUJvCZ/+azkjXlXkF1dASRQjsluZjmvJDYVIzuH93g==
X-Received: by 2002:a63:904c:: with SMTP id a73mr10267285pge.335.1578562358385; 
 Thu, 09 Jan 2020 01:32:38 -0800 (PST)
Received: from xp-OptiPlex-7050.mioffice.cn ([43.224.245.180])
 by smtp.gmail.com with ESMTPSA id m128sm6963746pfm.183.2020.01.09.01.32.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 09 Jan 2020 01:32:38 -0800 (PST)
From: ping xiong <xp1982.06.06@gmail.com>
To: yuchao0@huawei.com
Date: Thu,  9 Jan 2020 17:32:29 +0800
Message-Id: <1578562349-842-1-git-send-email-xp1982.06.06@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (xp1982.06.06[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: xiaomi.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (xp1982.06.06[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ipUBI-00EH5M-3s
Subject: [f2fs-dev] [PATCH] resize.f2fs: add option for large_nat_bitmap
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

This change add a new '-i' option to control turning on/off it.

Signed-off-by: xiongping1 <xiongping1@xiaomi.com>
---
 fsck/main.c   | 6 +++++-
 fsck/resize.c | 5 +++++
 2 files changed, 10 insertions(+), 1 deletion(-)

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
index fc563f2..88e063e 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -519,6 +519,11 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
 	else
 		set_cp(checksum_offset, CP_CHKSUM_OFFSET);
 
+	if (c.large_nat_bitmap) {
+		set_cp(checksum_offset, CP_MIN_CHKSUM_OFFSET);
+		flags |= CP_LARGE_NAT_BITMAP_FLAG;
+	}
+
 	set_cp(ckpt_flags, flags);
 
 	memcpy(new_cp, cp, (unsigned char *)cp->sit_nat_version_bitmap -
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

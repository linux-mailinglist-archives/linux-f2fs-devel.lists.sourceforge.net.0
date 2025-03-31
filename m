Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 131E6A76F3C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:28:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLkb-0002dy-MV;
	Mon, 31 Mar 2025 20:28:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1tzLka-0002ds-P2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:28:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QLr2vd8bO54O3rh+0WvwKHLMNYR1+OTnrqStZHRXh6s=; b=RPBAQfeA3z/EcSlUzf8QytuC1a
 PpUPAWZusORVcrW1/m3HB3qqE8mb3kiZkdGSbAYX0cRh4NyJKlBZiUBqjiv09jBcxTzvcHg3etI4V
 VzbXS3QpneVuv3tzSTWE0inMRMpiZTwUhBwYt0HB7eo5yJFjZyH3YUS6E3L3A1YVVAKo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QLr2vd8bO54O3rh+0WvwKHLMNYR1+OTnrqStZHRXh6s=; b=O
 75R1RbG8g0gcgSumDDZWdqZXEvUdFDCQqxVRwZ4XX1GRmANG1fs6wscRZjK7S8OGUh436WFdnCP0o
 M/xKIHeBylbEoLPmPbb1/o5dYYGPypAR7HqACkTuRq+SdGFWXoU25LPbJXPHqXCBgkBP5P/4Ab+oW
 lMu5IiiYaYtNuYSA=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tzLkV-0006YK-J4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:28:53 +0000
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-22928d629faso55370805ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 31 Mar 2025 13:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743452922; x=1744057722; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QLr2vd8bO54O3rh+0WvwKHLMNYR1+OTnrqStZHRXh6s=;
 b=YdTMdH9G18kTHDLoxEocm5gAJuuvya34OLotmWIpmvMqu7TmIv5lfuUIqmm8slg84k
 GPM6QrLN4HzpbiA6tl/o0qnESkz1IRLFnWVlUGsbOfNjNIpqA8vIAC4G2s7yK7Fx1bvo
 UXqzPGyCeWVVOXGLHIzlmvRSJVlg++jXVrr6ZQYY53Kt1LFk1U1hZgCrtwvJKKZ6xSba
 wxeJUQNFiuhdIyRKQ1527fw6f4Cexl17EMkUTZogEx4VKdHCvyd82agPvijrm2cFrYQb
 4V27VYB4n3qO+kQUZn3FI7RiKwhjPfjkY01euf7x8ERMNfNLXLzxLEb0k5/1ieKTh14a
 EUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743452922; x=1744057722;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QLr2vd8bO54O3rh+0WvwKHLMNYR1+OTnrqStZHRXh6s=;
 b=rTPZBSjMTx+y8SmQl1HQsVtTgsZyINhcVQQATULsQXWpXBWS2EihDrTU72h16jneJy
 RoMRbaeRM17rZnSs/vF8TV7afoeuCfyFcYKXmPWYxl1IpyQ4IzqEzJN2r6u1s1c19btX
 Q1+sCxMQas3n1fCm169h6oxB+wJcBllZap0uhX6hkuQSbBrvL9t8vbdDzCTjfL7g/B1d
 JoArfAV4IfqzNZUrWuYI0sadx1uMbppcg7rNc+V47aYAV5dh+E2+Kx/8CZAHnVihOTCe
 nSGSFlXtM7d1rU/8i0fa9NAGYOEduTSZKMlSihsAZCSK4HRW7K2DmBZb2ZusgcNPUvhI
 NoQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4YGEZxLzF5DQdoATSgU7WiUiJQkFjvQNByudH8lP6NxP0E5ieJysDbEz81fF/Ik5ZiMTtpK9hR1foycLWVz8a@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyrTKC3+/D9qZgTmDOS3m7lYUYOQmX4bK4CU4DM6MuCTXj1X3Ap
 hJyd0HG46QW2/Pa97Uv42MK10zrnWH4zUN/BjjZjx2SNS/3DyUG8
X-Gm-Gg: ASbGnct5wfQgKOMS3KpOwkp09VQhIP4c6AF9nCSN7VilpextQokWHGEOnl/RuInNZW9
 +g7z620wRLONXaELHdWqKwXONu4NIfkCsCpiJaSFaIPvBjGc1qlGlELETUAUnz5EOuQyVXPuP12
 +D5+XT+CqMw0Cyid5EHV40ntERK94LEN+JCcVPsrrCp6UKzkKrk0JpthfaYROuNv4Br/OIKW+Zf
 8J4qKPRg/Y+peU0NrtMwWEjVwqDNjGA2cpRVytHxkUhbgEUJneR5s8TA7kWdedVqroPLwTGM8/M
 rC5irrtduOtE3fj55xHokLKUPo9kzbp2kVWjZonUrIHB9KMCJCv3vhIYM9bQEZd5eQiz5BZnicv
 0PJ2b69nsrzyyzy1l17xdsZuOB0QiNSl5cFhb
X-Google-Smtp-Source: AGHT+IEGF4zk0YdJdoj5BbEmITQJ8odofyWpDDRi96ONj6TH5gv+h49FEWrdlv3sUO5nktnM1vTngw==
X-Received: by 2002:a05:6a00:2e05:b0:736:ab21:6f37 with SMTP id
 d2e1a72fcca58-7397fffbe45mr14387009b3a.0.1743452921675; 
 Mon, 31 Mar 2025 13:28:41 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:f74d:571b:c2a4:d872])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739710ace02sm7424843b3a.150.2025.03.31.13.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 13:28:41 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 31 Mar 2025 13:28:35 -0700
Message-ID: <20250331202835.4057396-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong To utilize the delay option of atomic write
 more useful, need to apportion it to each operation of it. Signed-off-by:
 Daeho Jeong --- tools/f2fs_io/f2fs_io.c | 16 +++++++++++----- 1 file changed, 
 11 insertions(+), 5 deletions(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.171 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.171 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
X-Headers-End: 1tzLkV-0006YK-J4
Subject: [f2fs-dev] [PATCH] f2fs-tools: apportion atomic write's total delay
 to its operations
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

To utilize the delay option of atomic write more useful, need to
apportion it to each operation of it.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 tools/f2fs_io/f2fs_io.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 57a931d..292dcb3 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -769,24 +769,30 @@ static void do_write_with_advice(int argc, char **argv,
 		}
 	}
 
+	total_time = get_current_us();
 	if (atomic_commit || atomic_abort) {
 		int ret;
 
 		if (argc == 8)
-			useconds = atoi(argv[7]) * 1000;
+			useconds = atoi(argv[7]) * 1000 / (count + 2);
+
+		if (useconds)
+			usleep(useconds);
 
 		if (replace)
 			ret = ioctl(fd, F2FS_IOC_START_ATOMIC_REPLACE);
 		else
 			ret = ioctl(fd, F2FS_IOC_START_ATOMIC_WRITE);
 
+		if (useconds)
+			usleep(useconds);
+
 		if (ret < 0) {
 			fputs("setting atomic file mode failed\n", stderr);
 			exit(1);
 		}
 	}
 
-	total_time = get_current_us();
 	for (i = 0; i < count; i++) {
 		uint64_t ret;
 
@@ -804,10 +810,10 @@ static void do_write_with_advice(int argc, char **argv,
 		if (ret != buf_size)
 			break;
 		written += ret;
-	}
 
-	if (useconds)
-		usleep(useconds);
+		if (useconds)
+			usleep(useconds);
+	}
 
 	if (atomic_commit) {
 		int ret;
-- 
2.49.0.472.ge94155a9ec-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

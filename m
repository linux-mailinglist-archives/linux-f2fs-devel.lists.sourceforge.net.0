Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 830133A3D2C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Jun 2021 09:33:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lrbfF-00009C-Ig; Fri, 11 Jun 2021 07:33:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <robinh3123@gmail.com>) id 1lrbfE-000092-RJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Jun 2021 07:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BPCqp2eGjYWyxk+FWTzcqZLzws1GFwCcPnBYqRgaGjY=; b=SbOffgB56wwh9feXqv97KlRq3x
 S4mXQLrQp3hd5ZVX3SGOKRjx/OYHCmn+PAzxHwGGzll+eeVrF+qMmOc8SzFAuWPNHIdevgE4Fr7Bn
 UZ3jeyOXXRTkxT1btdnNcwvoQoHsefF1WoLI1SGen+2y7JirVJhRmrn+OIElpT1QUBwI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BPCqp2eGjYWyxk+FWTzcqZLzws1GFwCcPnBYqRgaGjY=; b=A
 ltVAiC7p/hXUYEvlyWdySK4xllDxnCcvEbUChi1pAqiGCtr/vhhUUJtciUuhJ21S3Pek2qmAGTV8g
 1ABKS8JrqCwjYzqEIfkzSMTabpDUDNO02bCFqzCwH/YREeCagr2pCMQf4vIBzf+5UiJF3B76GcX9W
 BHd7AB3zLKGBsCII=;
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lrbf6-004ff3-AA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Jun 2021 07:33:13 +0000
Received: by mail-pj1-f54.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso5500519pjp.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Jun 2021 00:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BPCqp2eGjYWyxk+FWTzcqZLzws1GFwCcPnBYqRgaGjY=;
 b=WI0HmFD9udfNt6puGF2sPP3vr5UJEht56zRSnQcExkBlGzwBAezgwnnWotmwlm6f08
 p6rmo5obbgiylTjTBW+WtQPzAYv0s14AHtjUYE51ouc3GAIRcJYWcT29rrhmJesZJ3g5
 gXohqG1pQ/5LXp5Z8CHNT+x8EGtA/aNTwq24HUEv7iGNr/dlbgu+3TdneVw74uJyH7VW
 WxQzdMRt8Va7YoA7eoCIvns+w1Nrs7CnYkKUFkd0pOSBlGaF19IMb45emSU/1y6XCoHa
 c3Z8ZmdkQWFO4nwYfwNKyJ7RppKFA+9W+hZXgphIthGzj4uhFv19kvOzjTT8X3mwVYMD
 kv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BPCqp2eGjYWyxk+FWTzcqZLzws1GFwCcPnBYqRgaGjY=;
 b=tbFz09sEiZhINrqen+XZmj1KEPtd/Aro3GryvvSQdZzySLGzuGTjy10tdUBpNzVQ3X
 md5yoU1v2xCGnCsMl6UZyJjdYqfNbWXXc7C6dHNxIU4Ljlac1rQQA62vUxe0ooCO/Xr8
 nD0G056rpvzoWOkTUJWWZwwSXQ7tdqCRQbmhM7xdxjfuoB2nnzzRtqypT4dwG3/vQAw8
 cyt9gbUncKxELo2e7iI7gMjxKAr+vP2Vw7kUTGPX/uF/YBCkduX7Tc6Tm85sfOym+dNr
 XVJGva8rk38mioeY/aS2pz5nZihB0EZoSZo2rhUPfIM215D2x6OpM5u6leh6iTa/UbGg
 TnIA==
X-Gm-Message-State: AOAM532BnIsc74vgqRG3VHCutws2MKZpNy/XeGxBgAgg5GR9LX2YX0Yn
 tyTp7Ia4SggL6NKTHXPPyQo0pCCs5Gc=
X-Google-Smtp-Source: ABdhPJwhvFF2k1N/OAp9yt8Sw7TqpWkKrs0Z7otIcTPVCOll/eq4RmBn9ZYJ59yPFv6NsL6sex78qA==
X-Received: by 2002:a17:90a:c20b:: with SMTP id
 e11mr7794271pjt.67.1623396778482; 
 Fri, 11 Jun 2021 00:32:58 -0700 (PDT)
Received: from robinhsu-p520.ntc.corp.google.com
 ([2401:fa00:fc:202:8113:90ef:a3f7:4502])
 by smtp.gmail.com with ESMTPSA id i14sm3988085pjv.15.2021.06.11.00.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 00:32:57 -0700 (PDT)
From: Robin Hsu <robinh3123@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, chao@kernel.org
Date: Fri, 11 Jun 2021 15:31:11 +0800
Message-Id: <20210611073111.947552-1-robinh3123@gmail.com>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (robinh3123[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.54 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (robinh3123[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lrbf6-004ff3-AA
Subject: [f2fs-dev] [PATCH] sload.f2fs: Reword "IMMUTABLE" in
 strings/comments
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Robin Hsu <robinhsu@google.com>

Since the IMMUTABLE flag for compression is now changed
to F2FS_COMPRESS_RELEASED, some 'IMMUTABLE' words should be changed too:
	1. sload help page
	2. inline comments

Signed-off-by: Robin Hsu <robinhsu@google.com>
---
 fsck/main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index c07be1e..c0b871b 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -149,7 +149,8 @@ void sload_usage()
 	MSG(0, "    * -i or -x: use it many times for multiple extensions.\n");
 	MSG(0, "    * -i and -x cannot be used together..\n");
 	MSG(0, "    -m <num> min compressed blocks per cluster\n");
-	MSG(0, "    -r readonly (IMMUTABLE) for compressed files\n");
+	MSG(0, "    -r read only (to release unused blocks) for compressed "
+			"files\n");
 	MSG(0, "    ------------------------------------------------------\n");
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -V print the version number and exit\n");
@@ -650,7 +651,7 @@ void f2fs_parse_options(int argc, char *argv[])
 				}
 				c.compress.min_blocks = val;
 				break;
-			case 'r': /* compress file to set IMMUTABLE */
+			case 'r': /* for setting F2FS_COMOPRESS_RELEASE */
 				c.compress.required = true;
 				c.compress.readonly = true;
 				break;
-- 
2.32.0.272.g935e593368-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

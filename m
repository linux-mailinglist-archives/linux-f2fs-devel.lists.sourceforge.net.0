Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C68C9D09FA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2024 08:02:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tCvlw-0007Zl-9h;
	Mon, 18 Nov 2024 07:02:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <danielyangkang@gmail.com>) id 1tCvlv-0007ZZ-F6
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 07:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7u/98G8hsl2ifba6DFoRS73a+4OiRX5NAXlfHv/bHgw=; b=f2hQIJ1UWfJyiRdBV2oZ1eFebq
 2njNKNBxAmh6lvK8Gn4Z/+bkqSTMvVEFjS2reudAG3NJj1Ii94U95v0ecbSB8mD3+QsbfncdYNeEy
 KCmQnQsCnfE4xcW9+u51OB2LujifeojDn6CcuyfAzbozNilA6aaPzfXBGkJ6zEBUuP84=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7u/98G8hsl2ifba6DFoRS73a+4OiRX5NAXlfHv/bHgw=; b=B
 qVMQayJ9/o7IfVrlUaSRTFiaompWX4r9nkLNKSNK0z2HeavutXPkB2jsO0cBn1G23lk/VjfkXoAba
 sbVkxAJmDwk0a7lKPDH7A5Z2rDfoLkA63NKZODd+mWNvtrXazGBtGhsp/aEOoW12rUe7+bH53q5bz
 6NljPWO2H6RRCZ3s=;
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tCvlu-0006Hs-RG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 07:02:07 +0000
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-20c70abba48so10779225ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 17 Nov 2024 23:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731913316; x=1732518116; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7u/98G8hsl2ifba6DFoRS73a+4OiRX5NAXlfHv/bHgw=;
 b=HoH8jiqxY9T8FZPbIEZ7KK5RXm1/VusQ/rew0/W3iKT6AS5u+vNgKG81IOlMyN6GS0
 P5s86sXQz0f12yRF7zRPQjSe5W/0RFs7BZIa1ZmKG7SZop3wKhknDK/okTDG76o6pz8S
 98DRmaRSeX6hwpdF1JhhOOiGe5XYAdHNS47AYicmnhDH1QPVrPt6rVNmy7kHx0HBoVfm
 GymkHKpJwUEelgV11Lw7xe0w09FzkfG27PbCczZM6JNZL/44K642pI0Ru5ypl80vzA2A
 XpLqRQP2SG1ft7YDXPAdvMGoEGK10xDHXabgpamMZ9M1H7kLuZujwM8LZ1nJ2FV19cCi
 KhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731913316; x=1732518116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7u/98G8hsl2ifba6DFoRS73a+4OiRX5NAXlfHv/bHgw=;
 b=C/+SMQZIyrlFOe4BuYKZcofHWNPBr2xKK2FZp65suzzI9OtqVWewOy7JwZk16rvI14
 U9a0shw2CctJutk5n4wD7oZ9UPxbTDsYRtRuhaeHDcgqlCksa6aFV8yJTBI1eeZP9JH5
 BbgspPDVHVbQOWO0dKLKM/szXpr/hBCiIlMPIIpPJtQXxUp4ACiD0whZCBoQ2s/YpKRF
 ibJ92NpV99H/tEWEC9rwA5I1Jgv0OUvCcmG1waXu3PrLDh1SJrL41ATjOiJAIDLjpuU/
 y26SmgdGNLRuNZ3M95/BrObaf/Fbr756srJFcQ7jZLAimrMR3/6ikckELtX4VdzD2igq
 cBxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLLGgTljOoUoRJuxhOF9BdAiK3bce+W7j+FGgOgdBxrfiYR+vFkG2H+T1TRtpfUIIiOFX0iUe9xxDc3J2kDyCY@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwdL6aJEKqD7o7ZJLE5Jn8JqhDVOF2Xmg+3LyVthRuYAkTbPceD
 39PEqCSnFTX/rM0xS/LP+N5NaniMC5g/AihMHY3QRG+cA+t1XF9EdGB5pnIk
X-Google-Smtp-Source: AGHT+IHOzFq5IAlUhAPXw7V4fRi3HzisuRHHVX7RmWj5Ly0UNiASMUhs5G7pKIoWSSs6JEeE7/kLqQ==
X-Received: by 2002:a17:902:f541:b0:20c:9d9e:9049 with SMTP id
 d9443c01a7336-211d0d7269bmr176486995ad.22.1731913315993; 
 Sun, 17 Nov 2024 23:01:55 -0800 (PST)
Received: from debian.resnet.ucla.edu (s-169-232-97-87.resnet.ucla.edu.
 [169.232.97.87]) by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-211d0f56e55sm50289175ad.274.2024.11.17.23.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2024 23:01:55 -0800 (PST)
From: Daniel Yang <danielyangkang@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
 linux-kernel@vger.kernel.org (open list)
Date: Sun, 17 Nov 2024 23:01:40 -0800
Message-Id: <20241118070141.3474-1-danielyangkang@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: strcpy is deprecated. Kernel docs recommend replacing strcpy
 with strscpy. The function strcpy() return value isn't used so there shouldn't
 be an issue replacing with the safer alternative strscpy. Signed-off-by:
 Daniel Yang --- v2 -> v3: store strscpy result in ret and return ret if error
 v1 -> v2: handle strscpy errors, changed prefix to f2fs fs/f2fs/super.c |
 12 ++++++++++-- 1 file changed, [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.169 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.169 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [danielyangkang[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.169 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.169 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tCvlu-0006Hs-RG
Subject: [f2fs-dev] [PATCH v3] f2fs: replace deprecated strcpy with strscpy
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
Cc: Daniel Yang <danielyangkang@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

strcpy is deprecated. Kernel docs recommend replacing strcpy with
strscpy. The function strcpy() return value isn't used so there
shouldn't be an issue replacing with the safer alternative strscpy.

Signed-off-by: Daniel Yang <danielyangkang@gmail.com>
---
v2 -> v3: store strscpy result in ret and return ret if error
v1 -> v2: handle strscpy errors, changed prefix to f2fs
 fs/f2fs/super.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 87ab5696b..3eb754547 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1158,7 +1158,11 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 				break;
 			}
 
-			strcpy(ext[ext_cnt], name);
+			ret = strscpy(ext[ext_cnt], name);
+			if (ret < 0) {
+				kfree(name);
+				return ret;
+			}
 			F2FS_OPTION(sbi).compress_ext_cnt++;
 			kfree(name);
 			break;
@@ -1187,7 +1191,11 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 				break;
 			}
 
-			strcpy(noext[noext_cnt], name);
+			ret = strscpy(noext[noext_cnt], name);
+			if (ret < 0) {
+				kfree(name);
+				return ret;
+			}
 			F2FS_OPTION(sbi).nocompress_ext_cnt++;
 			kfree(name);
 			break;
-- 
2.39.5



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

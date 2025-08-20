Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA57B2D307
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 06:34:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mdl2V5pu+ie7bWFzRT8i09XMY8k/hU7+o+NHJ6bGVUA=; b=T1596uiIrajjmIlzt1Mqb2q9C7
	UoIU1duVwjK4HZzWlWGUK8bh2GlvUM3k0SyNJU+kHJI1dIObtS/nnXVW3zSuePIvnPyPm/r2ak1zA
	wiwPKC8ufAPZ1/iA1PtiJG8HKpgMSOBvty0Rm6/PMIydf/EHTa4gAwdgn6eOHF2jFLqs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoaX9-0004bY-5c;
	Wed, 20 Aug 2025 04:34:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bagasdotme@gmail.com>) id 1uoaX7-0004bR-Ki
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 04:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ln0od7Z4vv9pu4v2OzT1GPO1Pii9c7VKabfV2KE9JTQ=; b=JD92sXbsg+ozvFL6A58tZS6YEA
 gHAeBv4GFLj4uP5Rg9BMWouu4DdxpttYkt8Paxo+3YOj/j7LOXwoE9ah/udZxUxDaqLu/YL0GEDm3
 hFWf8Mnu9b8VRS2IeupauchDWb9YLew5vbSkUk67nOjK0OYvbYjqUzP7ouNagd9x292A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ln0od7Z4vv9pu4v2OzT1GPO1Pii9c7VKabfV2KE9JTQ=; b=PWI+lldmF1T/LTSQbQArHuybjx
 b36GoclP91HNL/3ZgytkZMzSWlpJf3g386SAegcSIwuylEBug1PRAB81FykM+eatrQFTFfdwxgKFJ
 ClwwvuWKLZOkts8xmS0lUehui970vi2emTm49ZD3shSVzEOnFOrbqIGrTjHQT5WzV7kw=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoaX7-0006Vp-4P for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 04:34:45 +0000
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-76e2eb9ae80so4845869b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Aug 2025 21:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755664479; x=1756269279; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ln0od7Z4vv9pu4v2OzT1GPO1Pii9c7VKabfV2KE9JTQ=;
 b=i2E0vkxjHSps/ejVfIPLBpaQQhjuOaU7XXxZjYbrG8ebEIDAO1ETi43sLzcsHSJD5a
 kzT4d+6yHQUzuye4HxQKgB/sqiHeunEGb7T6s2SeA3+tUu178kM+NZp7P88VsD2sv6nS
 zEPhuahzggfQgWQaL8XBgxteyu8sDkhmq9/JEvUF3E+eRNkyJlmD5COszzjdAL14LW55
 EnCT6OqF1HdpQpjCLhhEzxELbH2ghGBjyx6Li5W0Eupsi2mLHDnKKWqvqMvj449bXQCO
 jrRzQphkGBYtPAckxxWQHg3+6LgPAEUSoJSb+E6oer2siqfMa38zVdTshhuCaWz6PGa0
 Mz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755664479; x=1756269279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ln0od7Z4vv9pu4v2OzT1GPO1Pii9c7VKabfV2KE9JTQ=;
 b=tTSD0sFY4PGc82ag0Sh4KYpuUrXZU2jC4O2v/CkaehpyqVyBqgDN7peDml9lh6uxNM
 Fw6WVHU1EkK7wHpM8QZWInIL6KEIK6qxtX0ANHvKamOU+TH5QVR+WvdLxNzBqzkBEgg3
 4uvmQLRjfMhiu74jSrQKp7gRSbf8SKQWxG9cLh4iYRPXYeI4vKExmEcHh6FLRjk01AkV
 YobCikuZ3FtkOr+z8hgnzneJ8QH6q7eZqTk+itLP02oj5nghxuW7MzEjrMSoL/n3ZcjH
 5IKnEfmNA9Q08rCO/gZezTsycNkeZEnvmL8811GSjlgBRJ7iC0G6Bv88P7D9ek6O8iaa
 u9AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf98DOd6S+BAkD1cE8dwuQ+g5GPTgQCW+SlQubuhgDRDfb11/+2RynykWZvPEFrOoKk24wKfeRIHjKWdgLxZUD@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzhhP1h4h3Dc2DKVTXVAsQmOcxevLDIZWFJdjiC6jaz9mUMbLG2
 gSbhyq1PWWgvOzk+vOJChkFARcNSiDMB2EYQA4IrgcL7j6PJSRAN1lnk
X-Gm-Gg: ASbGncvxdErpMmyH+Q/JvPXgHge81zzkXr46QJjhVkwiTjalTkkZ88rO2kGAOPSIhKK
 BulzpyxJImE4TWvYKqyuchAFKUj9dV6wggG87g46xYTLyrQfnF/gwLLI+oZeguHyHbXBwvMHaKd
 JagtD80O6TvtDQ0tGWPWVS7iNlsMXnBbLxhvHt/eI0ieznPdPYg1BVB8m6TCO4VC3yHL1bWMTjU
 p/K2vT50m3GJjjXPUZgZWfF0WA3cawD6f3ptiCSchU1sGVmx1n2AyYuxfr1wRFlhFJvgZX2Lw9J
 yEQFLCL9jIeD9yH0Qa/H4bxCmMGvqu3B5zVbwPxUSRQ2qsM886x5dl97VdDnbGPj7lqLOhwxri4
 qh0ci9npEQ9mXUhm01SM3aw==
X-Google-Smtp-Source: AGHT+IFUrF3nY//FbHCmRJnSjf8PGBS6sQaGnh0boWKFjVAtouYQCTp8sIA3TCct7jxHiBbbS2BbPQ==
X-Received: by 2002:a05:6a20:72a8:b0:220:78b9:f849 with SMTP id
 adf61e73a8af0-2431b84772cmr2759936637.24.1755664479355; 
 Tue, 19 Aug 2025 21:34:39 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-324e264c470sm857925a91.25.2025.08.19.21.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 21:34:38 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 99FDF436C400; Wed, 20 Aug 2025 11:34:35 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux F2FS <linux-f2fs-devel@lists.sourceforge.net>
Date: Wed, 20 Aug 2025 11:34:29 +0700
Message-ID: <20250820043432.22509-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820043432.22509-1-bagasdotme@gmail.com>
References: <20250820043432.22509-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300; i=bagasdotme@gmail.com;
 h=from:subject; bh=u0ScB7oJe040CLbxIigtJvBlv0iClHGKbewou78MoPk=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlL/bf16/pGnG/fE1Mh+bX6z5z990Jvaqz0O2F2ZdmOq
 veHasWOdJSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAiXlqMDM/Pz1jXukfId9cn
 3vzSh1w7Os7z7LMXuCETknaP2Xfhwf0Mf8XsdM4cvGx/bvWhE/+ulORMa/l0aWXPoV25/Bk9/t4
 CG9gB
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Write hint policy table has two rows which act as section
 rows: buffered io and direct io, yet these rows are written as normal rows
 instead. Column-span them. Signed-off-by: Bagas Sanjaya ---
 Documentation/filesystems/f2fs.rst
 | 2 ++ 1 file changed, 2 insertions(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [bagasdotme(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
X-Headers-End: 1uoaX7-0006Vp-4P
Subject: [f2fs-dev] [PATCH 3/6] Documentation: f2fs: Span write hint table
 section rows
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
Cc: Daeho Jeong <daehojeong@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Yangtao Li <frank.li@vivo.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Yuanye Ma <yuanye.ma20@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Write hint policy table has two rows which act as section rows: buffered
io and direct io, yet these rows are written as normal rows instead.

Column-span them.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/filesystems/f2fs.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 132c3080ad5c4c..85e015b712c2e1 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -800,11 +800,13 @@ ioctl(COLD)           COLD_DATA                WRITE_LIFE_EXTREME
 extension list        "                        "
 
 -- buffered io
+------------------------------------------------------------------
 N/A                   COLD_DATA                WRITE_LIFE_EXTREME
 N/A                   HOT_DATA                 WRITE_LIFE_SHORT
 N/A                   WARM_DATA                WRITE_LIFE_NOT_SET
 
 -- direct io
+------------------------------------------------------------------
 WRITE_LIFE_EXTREME    COLD_DATA                WRITE_LIFE_EXTREME
 WRITE_LIFE_SHORT      HOT_DATA                 WRITE_LIFE_SHORT
 WRITE_LIFE_NOT_SET    WARM_DATA                WRITE_LIFE_NOT_SET
-- 
An old man doll... just what I always wanted! - Clara



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B435B0150F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Jul 2025 09:46:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OGfkEEFXms6CdUZu0RdcdLZkLewIo3T1UN979epjh8=; b=jnzaxAyQdzjsOibUju3/Bv1+io
	v4zlCQPVJ89F9nL5qePoNe6vmjAdiCoc0OIeyFBiZ9P3xvNHIlmej4hX2yfV055booPBPDAVft1D3
	JBZqshN34dekGY10AUl5mNjULIFa9ZcZEUMcB+fpECFHWhzIdzF42bMulBFpEDXAx69E=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ua8SU-000849-FB;
	Fri, 11 Jul 2025 07:46:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ua8SS-00083s-KN
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 07:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vyqm4H6icIZcBTy1THQNLUPfx0JcL9FYnmWVfz6IIM8=; b=RWsO5DPBiCZzUw3HG7MuzksVW0
 UmnftL24Z8aPDCL7t4IXPmeEUiiYkqzW/OizD65jWOgrV5i1osqIODxASYp8aBx6P7tEQ8ifJqQOm
 SeK8bwtUyQvI6G920myz2dwMS1e/czWCEEWaGosjqUJzHT5KXPZ2zZCT8QnQzp51liIM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vyqm4H6icIZcBTy1THQNLUPfx0JcL9FYnmWVfz6IIM8=; b=lPcLLZjsbVssTTOupWBIGud1zJ
 aMN3ZgQApY2pWnkVcIp2BoqCiSbIksU2cOMKnb+0/y4kXwQnCYpM1Ru2g0WCSo2OnngMz7ukYmvan
 KnIp0sVqsi+QcvOmnT7a0mtHZsURjqwgq/BGZDI5qmYr8W8f8vzwudFf3mZYUPvXQspQ=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ua8SS-0002Ww-7d for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 07:46:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8CA9FA54CE5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Jul 2025 07:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE892C4CEEF;
 Fri, 11 Jul 2025 07:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752219961;
 bh=j4+swoHX+DAtakgkxsV0G7jFsxIYg7EeRuEso0X+C1Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e1smtlM+2yr8XImHNY5eCt1F9FjoO0AhOOVXTdz/i6sFc4z99ui1FT2GPfyrGSLZy
 REEisYXPU+78HJ4E0npwURvXMb1D/KujzOzUG95u+sGnSuymx0CZ0iZuhwtXEu8Fni
 f36xSS2bX5QsSP0/6HG+NMs1gcPs8cCn8mOkO+m2zFKTVhD9s3JKjoGS9Gb2vJpZJ/
 c/agqCHBg07jbNsdY0gvZRtqZkGXn7MUKk4Km+iFqX/7xkoN41LZEO/geeRnLXsfan
 QQKNrIh2OWilpbfO36YkscJocNEMJ6LShGHn8vjbzSFPp27eIMIrzXA/JmSMwfaAnc
 XRUvyaRnDuFaA==
To: jaegeuk@kernel.org
Date: Fri, 11 Jul 2025 15:45:50 +0800
Message-ID: <20250711074551.216069-2-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250711074551.216069-1-chao@kernel.org>
References: <20250711074551.216069-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise,
 mkfs.f2fs may persist truncated path of main device.
 - mkfs.f2fs /mnt/f2fs/0123456789012345678901234567890123456789012345678901234
 \ -c /mnt/f2fs/012345678901234567890123456789012345678901234567890123 -f
 - mount /mnt/f2fs/0123456789012345678901234567890 [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ua8SS-0002Ww-7d
Subject: [f2fs-dev] [PATCH 2/3] mkfs.f2fs: fix to limit length of main
 device path in f2fs_parse_options()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Otherwise, mkfs.f2fs may persist truncated path of main device.

- mkfs.f2fs /mnt/f2fs/0123456789012345678901234567890123456789012345678901234 \
  -c /mnt/f2fs/012345678901234567890123456789012345678901234567890123 -f
- mount /mnt/f2fs/0123456789012345678901234567890123456789012345678901234
  /mnt/f2fs/loop

F2FS-fs (loop0): Mount Device [ 0]: /mnt/f2fs/012345678901234567890123456789012345678901234567890123,      511,        0 -    3ffff
F2FS-fs (loop0): Failed to find devices

Signed-off-by: Chao Yu <chao@kernel.org>
---
 mkfs/f2fs_format_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 3a8fde0..f0bec4f 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -384,6 +384,12 @@ static void f2fs_parse_options(int argc, char *argv[])
 		mkfs_usage();
 	}
 
+	if (c.ndevs > 1 && strlen(argv[optind]) > MAX_PATH_LEN) {
+		MSG(0, "Error: main device path %s should be equal or "
+				"less than %d characters\n",
+				argv[optind], MAX_PATH_LEN);
+		mkfs_usage();
+	}
 	/* [0] : META, [1 to MAX_DEVICES - 1] : NODE/DATA */
 	c.devices[0].path = strdup(argv[optind]);
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

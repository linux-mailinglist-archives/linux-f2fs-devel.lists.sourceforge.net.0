Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A314BC224F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 07 Oct 2025 18:46:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rPWTfVyIkGZbyYytdYfYIKQCPcD1Y/WhLsjNmvcdGQ8=; b=g1ihqbvcdXb1e+v4NMIgFxnm1t
	YeiDUki7Ska42cuzxaJOkMZHx6ChuLDD0qzPRCtFjaYvyYihLfXEY00+k3WNYQWFHPV6v05EnblsM
	g64eQLhT4Kafp1US/d3+I5l23tkEShEgBRBF5B8Dqp3BRe9YtKtajXNlEopQ2KS8OARM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6ApW-000594-V9;
	Tue, 07 Oct 2025 16:46:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1v6ApW-00058w-Ah
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Oct 2025 16:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oeG9oeMq3V/BRy9XfGgniPTDeM9j7ii3LAYxjxadWNg=; b=KaFyFUvT643qbTrn/aYeodN6yl
 qGJM7R5erKTXszMXZMnLi0zAIRPFzPwLr1lBmIV1/fz40fdod4eB/SelOdbFXmhWn2Tk2GQ/X3E9E
 A3PuLAKYhlcGjD+DMfCg1nFI7B25lHWTXjx4Y8hEcRQhImtu+YhWTNgCjqYK6Xn7LJqg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oeG9oeMq3V/BRy9XfGgniPTDeM9j7ii3LAYxjxadWNg=; b=X
 1sfPCWCDsar+BwCljNLWoduPY4yGLTU0xdmy5+elgBVJEv5llexdA6260x11OGN3ttKJcjweRhuWI
 xL6cKvD1efn3xHFtxLYziwlGKuPyk0zJbOCwWHpZjCRaIXiXG3KqPKE0UNH53AP6DxeATh7rvIZuC
 ozLPD9yHnHfiwQ6w=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v6ApV-0002AY-Td for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Oct 2025 16:46:26 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-330469eb750so7760575a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 07 Oct 2025 09:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759855580; x=1760460380; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oeG9oeMq3V/BRy9XfGgniPTDeM9j7ii3LAYxjxadWNg=;
 b=EN14nhzfl61me/mUhw1kzCmwCoRtMv5QmwoHDHCg0bSzKR/gHDVrPscTnFHwm6279c
 RWyw0Zj914URMNW/zyZ5EkeE8hL13ocafliOYWnKUD8gg33egeiTL7Zot0j+u88tpZEk
 ZqGliDC8jR4QTmDqeXSGGUnQhc0v/wcwHRbwg4lDoj43HuKOg35YkGzEQVflS983EnXZ
 9Pn/RC6y35yaQ18U8ohgKvVK4BCQ8k/rneow0Vcgn0GuJNo68vg4ZIWl72HKpIvNOn0C
 7tD76xzD6N/9uftLg/wZZTRRdiVwZmfGc6+bSOtP1cU1jEaMHLB+sPurtOaE7zqjqyQ1
 9dCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759855580; x=1760460380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oeG9oeMq3V/BRy9XfGgniPTDeM9j7ii3LAYxjxadWNg=;
 b=E14Kl+/0abvqTiJl7Ti7tKbHR3rU40tUcE6/v0+8qOjKDsTgldutMdiaLJfXHb84hS
 fmbDNfsb3MVnNE/ri8vHj8k7vxvGyS0PzK9lSEKVd3i/ezzZhFDnP3fJc7aZXivYzKB/
 el8FLkiuRw4MRP76FgcFheEQ9RVOkbR486+hoZo5GS5XQHlclaezlm5KKiQMrv7wA2CX
 F96FBlnm7kB5kIm2KFG4SwAR5uUBtVEJwmYzHF+FV75kDFyVcJFQhRVqq0ESo3NEhVlP
 n+faN8yH7IjZ0Dx0QZ5SEWX52uoOiEVeWxs/l2POPrYSKKDyzb/dlwc5b93jqBK0Ohpx
 gIXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXONxN8Azv0/ZyxeWMV/HaR2vO+kqfZvDNCkXPY1gdD4yX6ZdRbX/sYu6EwX/ZkMnHcnC0iVdtufoziX96IhAft@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzMggVsKAuqmGB5lauS03IARNPUcoL1y+Za8CD4EBR0eiAUMo2S
 0P2k6gsLiyKw7yPGw5LLRgn3iJjAC8ZxsKfoKXST9FHVaSAsxC68Doxc
X-Gm-Gg: ASbGncvEECV37CLrvaE9O6TelmSm32Qc/PoL7bquE/U2Zpu2Ub8qeM5hTaMI11jwjPl
 AMCIl9SUWkwQproq0kh4dPAMLByQJgmYha8lq52N2T4Zm/nAYpEqBtnsjrLGdrTnHcFSMs0lhMI
 qmesbXQ3FfsXV5D+qUywH4EJSwEa5S1KOI77Bp1IXHj/3ENk3Pd1rVWYfBMWZeJG6DS/Gu25ZVS
 52jqVrk7nZgPMdzuceip5cOjQ0v6N4oF1VdejdM8MUk4EX7Q17m2Mr8uPWLv0nsLhP31Xb00so/
 V/WI9oH9VAPlZeo5TIfrOQlDCk7ratfUAU7oL1pUlFRIBmHvlYTMuKwrcEnqQgIv5wYeNhsmX2A
 qGR7WWtd2NuXYofegVGhxI7CMciLvHVwn2GutTDm9OJOKGjMBopc/k3KeYRZwpKkKoegol3ebR6
 yfWEWXknEmZ0Yc6u3qQZGQ0J13rabaGw/MTt2h
X-Google-Smtp-Source: AGHT+IGgdyL9Z/s6avlLrqCHpOmrQPCcVtMXKZ1vrT7JttZd3PpRzeNrKsvQMIUPfcpRZ3c+WWGGhw==
X-Received: by 2002:a17:90b:3890:b0:338:3156:fc44 with SMTP id
 98e67ed59e1d1-33b513758bbmr187306a91.18.1759855580227; 
 Tue, 07 Oct 2025 09:46:20 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:c285:14a:3e06:9c08])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6099ad9405sm15548751a12.10.2025.10.07.09.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 09:46:19 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  7 Oct 2025 09:46:14 -0700
Message-ID: <20251007164614.3631594-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Zoned storage devices provide marginal
 over-capacity
 space, typically around 10%, for filesystem level storage control. By utilizing
 this extra capacity, we can safely reduce the default 'valid_thresh_ratio'
 to 80. This action helps to significantly prevent excessive garbage collection
 (GC) and the resulting power cons [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1v6ApV-0002AY-Td
Subject: [f2fs-dev] [PATCH] f2fs: set default valid_thresh_ratio to 80 for
 zoned devices
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

Zoned storage devices provide marginal over-capacity space, typically
around 10%, for filesystem level storage control.

By utilizing this extra capacity, we can safely reduce the default
'valid_thresh_ratio' to 80. This action helps to significantly prevent
excessive garbage collection (GC) and the resulting power consumption,
as the filesystem becomes less aggressive about cleaning segments
that still hold a high percentage of valid data.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/gc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 24e8b1c27acc..6c4d4567571e 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -25,7 +25,7 @@
 #define DEF_GC_THREAD_CANDIDATE_RATIO		20	/* select 20% oldest sections as candidates */
 #define DEF_GC_THREAD_MAX_CANDIDATE_COUNT	10	/* select at most 10 sections as candidates */
 #define DEF_GC_THREAD_AGE_WEIGHT		60	/* age weight */
-#define DEF_GC_THREAD_VALID_THRESH_RATIO	95	/* do not GC over 95% valid block ratio for one time GC */
+#define DEF_GC_THREAD_VALID_THRESH_RATIO	80	/* do not GC over 80% valid block ratio for one time GC */
 #define DEFAULT_ACCURACY_CLASS			10000	/* accuracy class */
 
 #define LIMIT_INVALID_BLOCK	40 /* percentage over total user space */
-- 
2.51.0.618.g983fd99d29-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

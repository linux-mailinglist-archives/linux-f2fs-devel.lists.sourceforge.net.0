Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 248FDAE1637
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Jun 2025 10:35:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXF8C+g6jOS5bngnup4AQo7gto8bEYHw3vqHscAbvy4=; b=nUCXQ00VDatcKKtJoavvErtXn+
	AXdq+iz4OKy20kMoSDh2711XGtuyfHfkDcQVj0iLqsbEdtCUk58baYfXFtJZVgu+FFXtcJ3zToXlS
	8O/ZQSaXoQheZBhS8PvhKG5MyP8M0ze2G69x5yBLj2aRzVcFynjnS3/uexCUmdCh9610=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uSXE0-0001yq-Ng;
	Fri, 20 Jun 2025 08:35:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <33xtVaAwKALQdjlomUeiqmecaiiafY.Wig@flex--jprusakowski.bounces.google.com>)
 id 1uSXDy-0001yB-MO for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jun 2025 08:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4CL1bQlA742vza1ucSKTw1PY9KB+oxRzPkNlh4M4pto=; b=GSNpqDbVJgYbbO1hN7S11BhDxp
 qMzMaM0hsCbe9XXGERU9MlRoI7TADYgAaOjDIOi2QOpJ7Ftn95Ny398UqXRz6QfiNn3uMqJIULqmi
 y5lOR8FE6hsDHXAzI2QbckpBUwKl5Dg9nS7zfBnUJuUbl6IShU8kqBsVB+8ctKgt5W30=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4CL1bQlA742vza1ucSKTw1PY9KB+oxRzPkNlh4M4pto=; b=XWkN1/7bFYU+BleDEPMsYHukjk
 cYoWIoQmo97o1fGqEu5OSvfwRG4AT4YiTq3ubFlE+nDytekV0LqWBlc7uGEugofFTxEXFc+bZPNEk
 XoW+i3hrluVbI+LpnDi6uOTUhB/gZL3K32dQvOFLyN3OqA7uAzWZCMeKS30vSGyZLaQg=;
Received: from mail-ej1-f73.google.com ([209.85.218.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uSXDy-0005zD-D4 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jun 2025 08:35:50 +0000
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-adb5f5f43dfso124097766b.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 Jun 2025 01:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750408539; x=1751013339;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=4CL1bQlA742vza1ucSKTw1PY9KB+oxRzPkNlh4M4pto=;
 b=Y5w/hqoRAqe32Q3o7KHAZALeHM9JQbmCcK9GGpIm6U+FR3A0L1YQ8ld4ugZJPvUNyB
 kzhco5T8hE+IWGeu0v7zXPtEyjlX9Pn9y7d2VEkRDlbTC6huAKmX8DB1QArj1qFblF6h
 SJJ1GtlYrA877ETddCF44zpU6X6hSAZaTAVC1YI3/ZcokwZZhAq7L2uXdFqtwrEfhmlE
 urUHNZDrDowx/OExqN81EZHyCZ4DYA0goLokNEIHhylVUtArVechu3kV527YvY/EXljv
 L0bkayyMyv+ld492LFTRu09F56DG9Ggba3wwv5rKGMj64bO80QRn37OgDLpuZldTB8Xw
 bEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750408539; x=1751013339;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4CL1bQlA742vza1ucSKTw1PY9KB+oxRzPkNlh4M4pto=;
 b=G449fJEZONSPW+2YkDXyyUTZX+r1lIp7RNv9bCxXsBbv/wjIZDXwYQ/bQL9IyPN92f
 ltTC/28By6m/vxIUMxjmDw5AvOVBx1drhqUVAY0lMI81iCs3ao6V7WFNSIvV5eNSN3Yq
 SNOT0vml1o9pjZMGYlKFYsiDJEw/b/GBCwajpO3aNviC+bYzMEvW3ikvesIvcvmgw0z6
 1gMqEtY9CSi2SdMASFT/HXUlPs8+jgTDuslMtHVgI/xW3ZakdYDc7Wo7BrE5A/5MLy9C
 3LiY7N/mc7lY09x+aNUjCqjpWNdU6uFbFlthbacoajahuYylsFM0yE1CJCm+Eyfwtlec
 5c9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqWsv9F6Ivk4ykX5a1s0eM19/3URWFezLVCrixf0SkdqNS6rrSZwOWx+rracVizJ1PTwThkHxl06qBZlDhVsz1@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywmkt+YKDJ0BmDyBKy75p1YWKfKF5E2CfhIuCuggzl+VOSUGlLG
 fthrTCMIJ0+MY7eoZbz4H0CCuI8Xf2EOFm1RVGbXN7NTTR7E0VkRCnhvaiYW+mawAzfzyA2aJYn
 AUe84NEDzEtI9+0JVkquSEa1pw8rWRA==
X-Google-Smtp-Source: AGHT+IF4tZG0Isf803il3uovoSlgHM3LPmKA/KM/U7e2VBzmiMXZSp5i1opvLOvcgFCthTxn4/E2EVjFrZOkLICoe/I=
X-Received: from edbeg40.prod.google.com
 ([2002:a05:6402:28a8:b0:608:faa3:8a99])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4415:b0:607:f31f:26de with SMTP id
 4fb4d7f45d1cf-60a1ccad8femr1597328a12.1.1750408159572; 
 Fri, 20 Jun 2025 01:29:19 -0700 (PDT)
Date: Fri, 20 Jun 2025 08:29:06 +0000
In-Reply-To: <20250620082906.2122560-1-jprusakowski@google.com>
Mime-Version: 1.0
References: <20250620082906.2122560-1-jprusakowski@google.com>
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250620082906.2122560-2-jprusakowski@google.com>
To: Zorro Lang <zlang@kernel.org>, Chao Yu <chao@kernel.org>,
 fstests@vger.kernel.org
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: fiemap does not support compressed extents correctly and the
 defragmentation check fails. Signed-off-by: Jan Prusakowski
 <jprusakowski@google.com>
 --- tests/generic/018 | 2 ++ 1 file changed, 2 insertions(+) 
 Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.73 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uSXDy-0005zD-D4
Subject: [f2fs-dev] [PATCH v1 1/1] generic/018: do not run the test if a
 compressed filesystem is used
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
From: Jan Prusakowski via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jan Prusakowski <jprusakowski@google.com>
Cc: jaegeuk@kernel.org, Jan Prusakowski <jprusakowski@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

fiemap does not support compressed extents correctly and the defragmentation
check fails.

Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
---
 tests/generic/018 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/generic/018 b/tests/generic/018
index 501960d7..52b48dca 100755
--- a/tests/generic/018
+++ b/tests/generic/018
@@ -13,6 +13,8 @@ _begin_fstest auto fsr quick defrag
 . ./common/filter
 . ./common/defrag
 
+# Fiemap doesn't work well with compressed extents
+_require_no_compress
 
 # We require scratch so that we'll have free contiguous space
 _require_scratch
-- 
2.50.0.rc2.701.gf1e915cc24-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

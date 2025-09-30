Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D18BAB075
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Sep 2025 04:37:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2Aw7EuaJsqEpXOGB7rit4hEjUToE3dy1RrJRyF0lqE=; b=B5ULiQ7a3GqPRmWli1vGpCHWCA
	oiLBMNLTYZx4PlmvgdiVbBy1BKa/JeHD/xYx9vZmXsBIv6RoI//AhL3ckDCSDVs7BrisOYzeQfGx1
	acFg0ynuHj4o/EFSFBaJETHbQ8dpXQmPCZlLmwlUee90+2KPSPn00rqDQPnpDlP0ubBk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3QF4-0004la-AX;
	Tue, 30 Sep 2025 02:37:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1v3QF2-0004l6-Sl
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 02:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fsj4UMF2nC8/PURWT6cwaqD+iW/Vhfe6PwR7/rdfo4k=; b=AqkpkUW+4TY0NUbME2hxstET7C
 1BvjBshLI4RlV/NpTUZIR+8KtFRzdpR54EJZfJaP/ybyvoeMePe3VWYlHz00FTPbFhQ1WttEWL7Dx
 x4B5S/VxvUbkhHWd3zLKBv+VTF41yLoiLeQ7e9hMueioB4atoFWrN625HaEq3o/eSDks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fsj4UMF2nC8/PURWT6cwaqD+iW/Vhfe6PwR7/rdfo4k=; b=W9YuucRFSZBBKrM5IKavmxfSU2
 eU2eYW9vtUDPq/Rz1jsss0IOiDsHSNjyC1tYxKZKxf0WL+kwjbT8PZn9Da0VAgHAikKbQ2Yk3T0G5
 5i3YcLp7sboGmg97n1kPaxpS5wsmgPt/UmBd5CxX0sS2IU9lad8JMH/Z50/B1AVhKVCo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3QF2-0004TA-GV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 02:37:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D596B60333
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Sep 2025 02:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76219C4CEF4;
 Tue, 30 Sep 2025 02:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759199833;
 bh=wzIvNrQfhnaupa0QA6ax8A7ZbA07H2aTj6yXk1iowB8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GVpk3hjYnX0S7uF+v4NsRGUWjIPd1s0sdEL1jQhBUKeNbK+w7MC8uhQ+uD1SyJPp8
 +aHK0/908HO6Ym0MrQw0SB5IV51dtdxgLMrOYSwGJVMgBZd89i1Kzm3L+nmEfS86QO
 rPZ9GeYYlLrMh9GwJEONfNo7b2BUt8k41dYSqQ4GWldi/LU+SE6EwdzDZ407NbrByA
 +BIEQhOCHp0l5XYZFaeXpu6bCRO3cRmoK178vZbgL+HX0/CObf6eASUwh5AHZzC0mb
 GdqhRne03t1OEjYr9PqdOPOIjpcqghZHTvjrBUZDfvSJ9kDZq2SzGCyC5+IA+I/vSN
 /utgwcWq2WqqA==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 30 Sep 2025 02:37:04 +0000
Message-ID: <20250930023704.3019074-5-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
In-Reply-To: <20250930023704.3019074-1-jaegeuk@kernel.org>
References: <20250930023704.3019074-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 tools/f2fs_io/f2fs_io.c
 | 4 ++++ 1 file changed, 4 insertions(+) diff --git a/tools/f2fs_io/f2fs_io.c
 b/tools/f2fs_io/f2fs_io.c index 22f9968a35e9..d07e6c6b1bfe 100644 ---
 a/tools/f2fs_io/f2fs_io.c
 +++ b/tools/f2fs_io/f2fs_io.c @@ -101,6 +101,10 @@ static void *ali [...]
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v3QF2-0004TA-GV
Subject: [f2fs-dev] [PATCH 5/5] f2fs_io: let's try to get contigous memory
 if possible
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 22f9968a35e9..d07e6c6b1bfe 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -101,6 +101,10 @@ static void *aligned_xalloc(size_t alignment, size_t size)
 
 	if (!p)
 		die("Memory alloc failed (requested %zu bytes)", size);
+
+	if (madvise(p, size, MADV_HUGEPAGE))
+		die("Madvise failed (requested %zu bytes)", size);
+
 	return p;
 }
 
-- 
2.51.0.618.g983fd99d29-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

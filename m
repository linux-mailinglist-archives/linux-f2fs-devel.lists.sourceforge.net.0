Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7592ECF0834
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 04 Jan 2026 03:08:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1knzMVMIebKXWYJd43ZL5KojllMcEEGubsn7DDSXc4=; b=MdoKCk0tKMjNNuJe8m2OOMxezf
	/Jq7eXtUTgTRk5iCjDm92yZPSEx5lo1wefpkaCszIWylMvwqfn/dbQX5y39k8RFekC/EAqtppf/3u
	WCT2t+2ROoQ9Zcu3s7uHTe4fxhrOoi2qmyDikFiGIEET5KuDTDsULJoxBCL3UN757Ypg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcDXj-0000hh-6U;
	Sun, 04 Jan 2026 02:08:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vcDXi-0000hV-33
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RaTHwTh6cL/zFrWB+BHi/jV9iYFBaEjWilqDjZbvJvI=; b=dQaHbF6tJj+PiJ9YZBW9gUCo92
 6M/CgEKNgeFsujdat1hWDl3svN1kp4b1JL1u/CTwgMwvvYSgVZ6R2R61Qzofo6NyeSf8Ieor260v6
 DQgiVXQ9NkcP/pkfh8HF3LZEB3NKktUgWBLP5XITCARNdLISUpQzjOC/F6Dfm1KPI3yA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RaTHwTh6cL/zFrWB+BHi/jV9iYFBaEjWilqDjZbvJvI=; b=AMvgPpZNn4IzX3GgTNzkDdh+Bd
 a8+/Ok7EPYJDsVsWZoxosBsGcvp/RtrpO8n6iARl5ybJekvBqe04t2wBxDRwBC43zDVh1txHh6m6W
 w+IlmFhcFrdG+OUHyVOf5ujpNWc5AM9l2fPfbpz2zBhsVbhVvl+x8kqRZPBb1+C2YBp8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcDXh-0005oP-Mr for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2D6766016C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  4 Jan 2026 02:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB32EC16AAE;
 Sun,  4 Jan 2026 02:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767492498;
 bh=60UVB4W5HK+obx+wEZMpdwOTBdFj32mqZwuFWRScR+w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZoazZiuwPCE+vC2O0jz0M+ltH+/h3k/TMp4s/4C/5NKV/3Eo9OZvASKTHg9HbPZGO
 +kw+F1tXPKFt8JrtyFpSQ7fsl9S/PIPzTRVYPuD+Q4d4PAGQGNvSHvOsT8hYh57ka6
 Jh1wiRTiBiKPAIJp58SyJtIexpfRfKNL6KlidcwYSDOgS5U9inos28O1q/FXF3MZur
 82cnZQC8S0za3rPJgA4DbnwZxMF0SteWFTdeV83VzPl0DCh19nV/AvMrWN7iHlMqKW
 a5VmK9MpC70f7qsEfJHEpMBwPZOU33Bi8JczJpItdqzjuY3c5lRqnoWGxngd/gbR6O
 XvNvdGdqq7oZw==
To: jaegeuk@kernel.org
Date: Sun,  4 Jan 2026 10:07:26 +0800
Message-ID: <20260104020729.1064529-11-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
In-Reply-To: <20260104020729.1064529-1-chao@kernel.org>
References: <20260104020729.1064529-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Sometimes, f2fs_io_schedule_timeout_killable(HZ) may delay
 for about 2 seconds,
 this is because __f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT)
 may delay for about 2 * DEFAULT_SCHEDULE_TIMEOUT due t [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vcDXh-0005oP-Mr
Subject: [f2fs-dev] [PATCH 11/14] f2fs: fix timeout precision of
 f2fs_io_schedule_timeout_killable()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Sometimes, f2fs_io_schedule_timeout_killable(HZ) may delay for about 2
seconds, this is because __f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT)
may delay for about 2 * DEFAULT_SCHEDULE_TIMEOUT due to its precision, but
we only account the delay as DEFAULT_SCHEDULE_TIMEOUT as below, fix it.

f2fs_io_schedule_timeout_killable()
..
	timeout -= DEFAULT_SCHEDULE_TIMEOUT;

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c4d3b37821d6..54cde9a0e24c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4985,13 +4985,12 @@ static inline void __f2fs_schedule_timeout(long timeout, bool io)
 
 static inline void f2fs_io_schedule_timeout_killable(long timeout)
 {
-	while (timeout) {
+	unsigned long last_time = jiffies + timeout;
+
+	while (jiffies < last_time) {
 		if (fatal_signal_pending(current))
 			return;
 		__f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT, true);
-		if (timeout <= DEFAULT_SCHEDULE_TIMEOUT)
-			return;
-		timeout -= DEFAULT_SCHEDULE_TIMEOUT;
 	}
 }
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

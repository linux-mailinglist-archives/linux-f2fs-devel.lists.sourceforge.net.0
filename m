Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4026481AC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Dec 2022 12:29:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p3bYq-0007di-Ek;
	Fri, 09 Dec 2022 11:29:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ssawgyw@gmail.com>) id 1p3bYX-0007cI-1N
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Dec 2022 11:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aoo/cX4IZ2UyYHO4YqGyALy4RhYqCFL96tWg9Kbsz+s=; b=jEfaNDxxyx5upyhOygHAcRFx7Z
 UWB0HeQIdqZJ4dkVkunOU7MMmnIgsyYszvBpbD0rzI59s/JK5i5hSCgcnOhfuA1gwO4SDQpISDbJe
 Yj6W2dJktHZwQJEa/6kEVfi+dvOTkrmxMZ+ri9SnQii0Ud+SJgvG4rxuqIUFXJb2qQaU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aoo/cX4IZ2UyYHO4YqGyALy4RhYqCFL96tWg9Kbsz+s=; b=A
 7o8DTQPqZCR6mhCEYzBDkfydrUm7Q1Ue+3eXfQ1Y9AtE38C1wFakY97yu7/s8T76uXgqCgqFQdWP8
 8sAqDp4J6cmFJ/Zqh2o//3uczu93Pz66WwFs0ZQDOxhyaj43xQ4gw/9gIHaY/7QJEz9sKNOlGYXw/
 dVR7uBnykurYC66E=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p3bYW-0003DF-EG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Dec 2022 11:28:40 +0000
Received: by mail-pl1-f174.google.com with SMTP id p24so4588634plw.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 09 Dec 2022 03:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aoo/cX4IZ2UyYHO4YqGyALy4RhYqCFL96tWg9Kbsz+s=;
 b=lD9K6jv4/lVYwOsAhaAFdI95eUCppnuBLupdI7ZkjSU9kHf+Hr6DEtcYLu6hfcww/1
 DPGqdp0WrQgVeYdQjIbf52rnlTV633MXGhWCO66EPnSTs++nOizV6GhLmKrs+7EZYpDY
 mziZITxDfBncjmeVtcm6cEEA7Yz1nL6RvcemAdDL+xSLWR6PFTyvgVkKkgwEPcptYrW7
 m5OrBul3dYdV4TrUydP1AhMNhbOw428Q+cK7Vw0MgdQfyZS96QXxEjMoN+p/x1S+V6cC
 usMQrXf4IS9S2YyNzIyz2tOSFSQbVgu1b8On3DW9Eily6tQTu8xEmS8MJryzplcn7mlc
 8+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aoo/cX4IZ2UyYHO4YqGyALy4RhYqCFL96tWg9Kbsz+s=;
 b=HHPjXsczDBbr0S6zokAWJH4nmIEUIG+KhHrebd12BSHzR6DeBCYDw9fdDgU8mqNODU
 W2xJLTeVInIyGbSMLlBP9mtIW2GywI90deDOYx8PSulHXoSKJOf1AVK+sB2HoIemIM3x
 fRsTkjrdZujSiY/3mBd3RfyjP38a3gEjL2GIil7WTMKDkVwsukuZ4gfaUSCE7W48/Yxx
 Tch+ye//jKbMAOltzIx8BfBqb2CAM4uQUWBJPkkFNsDrjlE5vjn9GIDld+Huy7h9z21x
 q/q90tKedCnBfVAzQlfBiI/B3/TmsOTtEy5oiCWOqVAX9C09U3pxiR4FFQN2uqmyudAz
 wsEg==
X-Gm-Message-State: ANoB5pkqf8hCy5oPLrf2n5SqZwtC0S0lBMmrEiy675Ua6pFDxW2Ukyi3
 gBdhLwVNkr8UaIdwxtylARQ4sF2s/1FSIYAU
X-Google-Smtp-Source: AA0mqf6OzkKnmKhBujUklLEHyQsbCNBr0/7+6lnit808FFzDxnyPrrCUypLZ4qB4K+mT5+UlJpp8ig==
X-Received: by 2002:a05:6a20:9e04:b0:a7:929d:4017 with SMTP id
 ms4-20020a056a209e0400b000a7929d4017mr5600945pzb.9.1670585314836; 
 Fri, 09 Dec 2022 03:28:34 -0800 (PST)
Received: from VirtualBox.. ([129.227.152.6]) by smtp.gmail.com with ESMTPSA id
 r1-20020a63ce41000000b004790eb3fee1sm837928pgi.90.2022.12.09.03.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:28:34 -0800 (PST)
From: Yuwei Guan <ssawgyw@gmail.com>
X-Google-Original-From: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri,  9 Dec 2022 19:28:13 +0800
Message-Id: <20221209112813.73700-1-Yuwei.Guan@zeekrlife.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In non-foreground gc mode, if no victim is selected, the gc
 process will wait for no_gc_sleep_time before waking up again. In this
 subsequent
 time, even though a victim will be selected, the gc proces [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ssawgyw[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.174 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1p3bYW-0003DF-EG
Subject: [f2fs-dev] [PATCH] f2fs: do decrease_sleep_time() if any of the
 victims have been selected
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In non-foreground gc mode, if no victim is selected, the gc process
will wait for no_gc_sleep_time before waking up again. In this
subsequent time, even though a victim will be selected, the gc process
still waits for no_gc_sleep_time before waking up. The configuration
of wait_ms is not reasonable.

After any of the victims have been selected, we need to do
decrease_sleep_time() to reduce wait_ms.

If it is GC_URGENT_HIGH or GC_URGENT_MID gc mode,
wait_ms will keep urgent_sleep_time after executing decrease_sleep_time().

In decrease_sleep_time() wait_time will be reduced to max_sleep_time
from no_gc_sleep_time, if *wait is no_gc_sleep_time. And then it goes
down in the next step.

Signed-off-by: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
---
 fs/f2fs/gc.c | 2 ++
 fs/f2fs/gc.h | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index f0c6506d8975..c023ffeb9268 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -141,6 +141,8 @@ static int gc_thread_func(void *data)
 			/* don't bother wait_ms by foreground gc */
 			if (!foreground)
 				wait_ms = gc_th->no_gc_sleep_time;
+		} else {
+			decrease_sleep_time(gc_th, &wait_ms);
 		}
 
 		if (foreground)
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 19b956c2d697..6402584dcd72 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -150,8 +150,13 @@ static inline void decrease_sleep_time(struct f2fs_gc_kthread *gc_th,
 {
 	unsigned int min_time = gc_th->min_sleep_time;
 
-	if (*wait == gc_th->no_gc_sleep_time)
+	if (*wait == gc_th->urgent_sleep_time)
+		return;
+
+	if (*wait == gc_th->no_gc_sleep_time) {
 		*wait = gc_th->max_sleep_time;
+		return;
+	}
 
 	if ((long long)*wait - (long long)min_time < (long long)min_time)
 		*wait = min_time;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

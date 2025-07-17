Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECA8B093CD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Jul 2025 20:21:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0X+ouSKfYRLMSL4+bcvRB4uuRN7sv0es9kqJpVxiaNU=; b=aMCxBLDSYbF36DygSI+k3gxG/4
	rCdq7kfAwpKM3gE+xXbU+QOKp5jUZpaOJmpS07Sgw+SzZp07vAGY2/JrbTJt4a3UOOoeQ3HegZQn6
	kgRBVktNjWQlmOkcLEIyw58JsUN84jgMmJnqjx/goBBUej1IC9NVpadOKc1TtQJRoq/Y=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ucTEC-0006Dl-So;
	Thu, 17 Jul 2025 18:21:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3DT95aAcKALohmzqqjjlttlqj.htr@flex--chullee.bounces.google.com>)
 id 1ucTEB-0006Df-QG for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Jul 2025 18:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mfXgZvOQlG/9husypXNws7ooRDQP6iBVEudkKK8jYDQ=; b=d9+VG7TFgyTxeVCg9VnP0LmQrU
 siEJV1aIowsZVOu6cwwqFbGCG+GYFpZZ5eLQtRmVGSe0SusJQbP7RcIx3arY1pV5F0UxCxcq5p+pP
 h4muLy3hYdlc9Uh8foKxTGWR16C6ZgGRiANJsOSh8Px3lLYZRdoCll6OKFGoqqNV3ONQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mfXgZvOQlG/9husypXNws7ooRDQP6iBVEudkKK8jYDQ=; b=a
 /AHj2HVOZURrhatg6RRL649ibYXDcnZiJfIiikCABcm5hwlLEKzV+zc/eEuQ5VuHY1PLlwTyvmDJm
 X3+PpEtFnfq8ohQvsIXXfw8AvVrPiAa5CP/x4q5kcQxoRzLQZNC8jNXeEIxQZb/xOAOOFofWFopMq
 o6zx7Pl4StvIXBZQ=;
Received: from mail-pf1-f201.google.com ([209.85.210.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ucTEB-0006EN-F8 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Jul 2025 18:21:07 +0000
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-74b29ee4f8bso1234151b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Jul 2025 11:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752776462; x=1753381262;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mfXgZvOQlG/9husypXNws7ooRDQP6iBVEudkKK8jYDQ=;
 b=vMnnXk2kOh5NKXxKWSmJzIIOkZimRwwzyEkcKCAKEESaLWSSaITCahzvouSYgaAzOL
 B07CknPwm2TDYP0uem9LcpDQJkRYGyp3E9o3NhkXhCA0OxLj4snENv6BOy7ZCxgyvRB3
 CHloOniXcqocEu7qEYVGFLuZ03c4vlfyxyaG9twMhBajNgtpylxthSO3/WeL0YaPOrpM
 TLfEcMJIWQnvFvgd2nNyf3kT/rCO+571nIMSoSgr65nLB1pmMV6wnmSsmKPqmZRRkqzC
 Ti+KhG4GAtE7IbvIxzE8nze75xVDTm6Q7XRQdkThwn6FU5YNae7V6MGIYs9TdMma+FON
 dRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752776462; x=1753381262;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mfXgZvOQlG/9husypXNws7ooRDQP6iBVEudkKK8jYDQ=;
 b=dnkCzcH53cfUClSSLh83BY+cA1wU5tAiWfveIknw/X5AFHx/yqcDcL2bwatEsNgWQU
 NasWy/6BA+L5ch6Unqx7yZE+MDJdfhXjnb8FfL+TKSqmdR43yi5YNfqHZkAQsR39sWiG
 7801vRVI66MvsS/iQdbiy2HmB1zU7KNSdLr3gCJkiRr+sHTVkCNJe6IwOYsmQ15NbB6S
 4aR1fZNuWwDXiihJAkE/L6Dnx6DePPH4+lraWqx7KqU6z264plkzmDAoYon/mn5Syo7W
 ejYghZPdZJGLbENNoAALdomlX3RlNTCRCh1h9Agilj1IjxgJt+4gx8UxSvEz3RIfa/ux
 vitQ==
X-Gm-Message-State: AOJu0YxmMvOHJaEfBOP3DQuMQGf+HiUjtO86XaBldUShBmhtulbxN2e4
 PFSb62KbONNahdydAfhBInsMJtqIt6UOmRq6KtOgFsQ1RtnMEcLfwp744PYzymkkq+bxsxL3MvJ
 1yyLXWX++sQ==
X-Google-Smtp-Source: AGHT+IEQ7rkPHnS9YRb93MIrU94SXzzNy6ODI8qIl500/SQedeEGhzCYI8tNFn7RDdPKRc1b+Gbk6Oa91Jd5
X-Received: from pfbgt11.prod.google.com ([2002:a05:6a00:4e0b:b0:73e:665:360])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:14d0:b0:74e:aa6f:eae1
 with SMTP id d2e1a72fcca58-75723e744d2mr10645238b3a.14.1752776461663; Thu, 17
 Jul 2025 11:21:01 -0700 (PDT)
Date: Thu, 17 Jul 2025 11:20:57 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250717182057.1284333-1-chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The ino_t type can be defined as either 'unsigned long' or
 'unsigned long long'. Signed-off-by: Daniel Lee <chullee@google.com> ---
 tools/f2fs_io/f2fs_io.c | 4 ++-- 1 file changed, 2 insertions(+),
 2 deletions(-)
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.201 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1ucTEB-0006EN-F8
Subject: [f2fs-dev] [PATCH] f2fs_io: fix format mismatch for ino_t
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
From: Daniel Lee via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Lee <chullee@google.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The ino_t type can be defined as either 'unsigned long' or
'unsigned long long'.

Signed-off-by: Daniel Lee <chullee@google.com>
---
 tools/f2fs_io/f2fs_io.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 8e81ba9..595d1e6 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -2329,8 +2329,8 @@ static void do_test_lookup_perf(int argc, char **argv, const struct cmd_desc *cm
 		if (!verb)
 			continue;
 
-		printf("%-8lu %-10s %-9d %-8jd %s\n",
-			dp->d_ino,
+		printf("%-8llu %-10s %-9d %-8jd %s\n",
+			(unsigned long long)dp->d_ino,
 			(dp->d_type == DT_REG) ?  "regular" :
 			(dp->d_type == DT_DIR) ?  "directory" :
 			(dp->d_type == DT_FIFO) ? "FIFO" :
-- 
2.50.0.727.gbf7dc18ff4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

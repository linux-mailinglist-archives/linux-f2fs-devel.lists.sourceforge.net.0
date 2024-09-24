Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D69589843F0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Sep 2024 12:45:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1st33A-0004uH-29;
	Tue, 24 Sep 2024 10:45:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <thorsten.blum@linux.dev>) id 1st338-0004uB-AF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 10:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/vV73Ujg2kdpt2Xjvs7nGirCJKlS64rCSJatuWlU+cY=; b=P45PCqu/86mK1j+BAjvZ/1HZeu
 q7/3emGKGCgM+SE84dx/DTVMvECCDVVp1HidD2WMqPkTCeVLjBtPpoy7pY5cGARYBGSSmCNLQXHDE
 7seUiuH+Wh9M1kC22l8HdDuJbDssemIfJqUJVhvZyGyzenUffKp3DJ6P5AZkmtdiIT9A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/vV73Ujg2kdpt2Xjvs7nGirCJKlS64rCSJatuWlU+cY=; b=S
 EQC5NMIvaJhvH5leiSBgyVTpGZSiRzTog8DtVAPPi6e534EyJy7dJykgQXNFsrSFoewRsAHozYWrW
 elValupVRg4c68jcNk+0hY+dwqani2idpYqGe1tUdSAYg66/4qtjGiC9LlO2WPYnqMchJHpwIgQlw
 e7ieuP4Dvj7I2Wyo=;
Received: from out-179.mta0.migadu.com ([91.218.175.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1st337-00023U-Ha for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 10:45:42 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1727173747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/vV73Ujg2kdpt2Xjvs7nGirCJKlS64rCSJatuWlU+cY=;
 b=lQdwNACKDxDxUIZ2BpzJ9Z0cjPOaXwxBRpKrJAFwmi4PIoqVVYe3qethJctPr/Y/XeX+A3
 h/ksDHzwGCrqojSdaZsK9A5B3mFk95JfSORcKf1UIdyzsNq4M0cx+5JS/9ho2AfHEYslV1
 zi/wYAo774HPDeuZJhJ8gX6Nf4MujM0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 24 Sep 2024 12:28:01 +0200
Message-ID: <20240924102800.240209-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use struct_size() to calculate the number of bytes to
 allocate
 for a cloned acl. Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
 --- fs/f2fs/acl.c | 5 ++--- 1 file changed, 2 insertions(+), 3 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1st337-00023U-Ha
Subject: [f2fs-dev] [PATCH] f2fs: Use struct_size() helper to improve
 f2fs_acl_clone()
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
Cc: linux-kernel@vger.kernel.org, Thorsten Blum <thorsten.blum@linux.dev>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use struct_size() to calculate the number of bytes to allocate for a
cloned acl.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/f2fs/acl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
index 8bffdeccdbc3..1fbc0607363b 100644
--- a/fs/f2fs/acl.c
+++ b/fs/f2fs/acl.c
@@ -296,9 +296,8 @@ static struct posix_acl *f2fs_acl_clone(const struct posix_acl *acl,
 	struct posix_acl *clone = NULL;
 
 	if (acl) {
-		int size = sizeof(struct posix_acl) + acl->a_count *
-				sizeof(struct posix_acl_entry);
-		clone = kmemdup(acl, size, flags);
+		clone = kmemdup(acl, struct_size(acl, a_entries, acl->a_count),
+				flags);
 		if (clone)
 			refcount_set(&clone->a_refcount, 1);
 	}
-- 
2.46.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

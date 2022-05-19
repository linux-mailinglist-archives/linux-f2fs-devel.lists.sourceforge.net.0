Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F00F052C955
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 May 2022 03:41:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrVAS-0002sU-CX; Thu, 19 May 2022 01:41:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nrVAQ-0002s6-Sh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 01:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=atre0gevBapG892Z5MCr4UG6DoQZjiUC2HRYoTG/Dic=; b=fnK9ja8KBdjwooxvaXEHkMrZyb
 GaKZSoFwEDUbVLSZBM2aGMnaCZ7dR3zrxnDm0VK645JsmdDWnYXyTqSp7Aw9dnKfU5s4t8wNkvz84
 NzB3PGHdp59YRsbhPGv5xOhq98Bd6ilZKUvUCnChyqDrcSCiEFPQH/b3sS6p42xjflcc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=atre0gevBapG892Z5MCr4UG6DoQZjiUC2HRYoTG/Dic=; b=NotEgQVTiv5iTJ6FwDbpWcSx/W
 TNFsVm9L6bXutCGCsnndo6RxvTPt8qcSpBlFYPtXOc3ftlGffeuQgBZW/T2FLsxH07MpsNo/yf/rG
 fD8TnQGZd4nvX80XaLDtJqmWiGj5BIHM9xdcHV8XFllxrCfWwhfhttlnlEt+/0a9WupA=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrVAP-0001VT-62
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 01:41:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 3E05C1F45360
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652924482;
 bh=j8df1m1ueLIlcWV9hGb6El2JjRXuC81I9Nolg4K+vGk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S4f3LpbjQilmM/4gPEAXf//62irWB+u+G4oJcb7xk0RELrFoaNa5wfnZny7cgGUBW
 dD8k36a5HJxHKdeic6ZFNrKApaoB5lsvhyejXH9aeIWZdk+So1FoPt3Juo+Q3/NFpn
 WjpPVOsjGh+H1AfgsetAw2g7TVxSe6Iin6D0X6Eel5BUL71OjoddbpwRQp+b099z1A
 AQGBkBKRbQmBzPMUdEH9m6yQm1nnrWX1NUo6xu/WYeIjnJ+tDYgSA+Aj14e9Fi/qz7
 4/y6StMqgSXKC2J55sdyRJgW6ZGSo5WkTbPbR1vQO39XiBl7vQ0v7PExAwxtB4ODUg
 jcY5Ha5cviYjw==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 ebiggers@kernel.org
Date: Wed, 18 May 2022 21:40:42 -0400
Message-Id: <20220519014044.508099-7-krisman@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519014044.508099-1-krisman@collabora.com>
References: <20220519014044.508099-1-krisman@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If the volume is in strict mode, ext4_ci_compare can report
 a broken encoding name. This will not trigger on a bad lookup, which is caught
 earlier,
 only if the actual disk name is bad. Reviewed-by: Eric Biggers
 <ebiggers@google.com>
 Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com> 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
X-Headers-End: 1nrVAP-0001VT-62
Subject: [f2fs-dev] [PATCH v6 6/8] ext4: Log error when lookup of encoded
 dentry fails
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
Cc: linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>,
 kernel@collabora.com, Eric Biggers <ebiggers@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If the volume is in strict mode, ext4_ci_compare can report a broken
encoding name.  This will not trigger on a bad lookup, which is caught
earlier, only if the actual disk name is bad.

Reviewed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

---

changes since v4:
  - Reword error message (Eric)

Changes since v1:
  - reword error message "file in directory" -> "filename" (Eric)
---
 fs/ext4/namei.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 98295b03a57c..8fbb35187f72 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1396,6 +1396,9 @@ static bool ext4_match(struct inode *parent,
 			 * only case where it happens is on a disk
 			 * corruption or ENOMEM.
 			 */
+			if (ret == -EINVAL)
+				EXT4_ERROR_INODE(parent,
+					"Directory contains filename that is invalid UTF-8");
 			return false;
 		}
 		return ret;
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDBDC27EB3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 01 Nov 2025 13:57:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSIS+g1DWpyPBKTp6Oq1tSlJAlfiV0WBhg55dKFXAbU=; b=j+BmOz4xnPezSPwWEgw3+3sgKO
	nDoxiAfmARb9FyVJ8Z692/e3+M5YVBVVR2pPND0UQdwYg0wXHqpLeroAZrFg7zxPdZY9a74zTC6zn
	2ZQL0cl7RPDiT5+v9juW1H7jdaCx8XG3JxEqWQIsIAjfpj43T92j9EPjktErm+U8To9Q=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFBAX-0007h8-1J;
	Sat, 01 Nov 2025 12:57:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlatistiv@gmail.com>) id 1vFBAV-0007h1-Bj
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Nov 2025 12:57:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cWKdMEjFczqiSseno1SbcYTWU+7mZhr1wnVQJoT8m64=; b=eEktjauZ9P5mGjFz23GU0K//FG
 6yR+5a+cz2tcPWpVNc7ON6VxPJglwdtzluX96ZT2mMjcsm7OBTFArf5zkVKlv1VVc0K0wzgJmCw5L
 7dkyjY4JyPEyU29a+zomxIJLpFtzE0rjzMakIaBl66A8/98aGc3fE4Lb5MPy2DC9Xu3U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cWKdMEjFczqiSseno1SbcYTWU+7mZhr1wnVQJoT8m64=; b=TXdtyxw3nMOKPVDlQ/Eqdg7HG7
 yl5aLjfR5MzLW7RPaikKHT2CIMP44zmV78+l/0oNxDIBTnYXLxxHsGx0iYAnliQ54sHKzn5zLtlOU
 NZ34jW0Om/jIf+3m70ZFku3GX8Q+oz7O9wzFtgiX6Ygbvy4v5lhfT13dyGp7WNFAf+QY=;
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vFBAU-0008Q1-Te for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Nov 2025 12:57:19 +0000
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso38886205e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 01 Nov 2025 05:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762001827; x=1762606627; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cWKdMEjFczqiSseno1SbcYTWU+7mZhr1wnVQJoT8m64=;
 b=JSe1VFihZ/u1FHTJVzgxkqTSsiTFxQ4yq/xf7KwzwpthQAdWkIZjoKIIe2DXW6Dza0
 UHy2fHE0ngqaPfS7qf41gxm6AVoaGrd7lBOOClUK5tsyBcBsmc/f8X0e3UnZMvilI6RO
 /JUkX/caUWzh4OkAvT6W34/rRUyZe2M0/9OROfWSodz2lnMybaXn7ppUUehTXJGcuaaH
 WICykCeYtwRgUh1AO8XBBW+wRLNRhNCoesem75CihY/FajSthJi+gAr4PgqW8MNdklOA
 YnpPshQDYGCqy6E8ORyD5xrDDyOL63dc8HCfvi9tzxnxdeYRfqPFSboA6FyxEBrincjO
 lqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762001827; x=1762606627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cWKdMEjFczqiSseno1SbcYTWU+7mZhr1wnVQJoT8m64=;
 b=mqLRChT7vNzocowEZjXsEe84W/xK9K2++2B4ujhGovE/zdW0LgoIhUUrjze+Bz0rGM
 atqYQqSh+krJtZat1SUIeefgxdMQsDI84sFQVRKF5i7crtKcnPSaN4Jva8x8xptUDaGI
 jVLX07ZoFFMt7rUb4NTisKPZMJhwEVvGpOA1vvxLkmGb/rvZ6Rja1xOx7tnDQgB+VwI4
 pxNvPTUdq8dNoqnEjSxfurxw/ZAtPi+zsrYJRK2KW5zcdsPCTP9yHQkTAVuVFbPI/1cC
 +KNjyGF2ZQ1DdijvJjQp03rH+EN75U+zigviwXdTn9tKo325NjN2a3M5q6ODAWLlmq0b
 x4sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz72ljIK+c7Qb39IVbwUsp8Q+GpuK10v69QGTIRmptkvzbHpH8n7I9hgys5rb/OGza+anle11T2BrFJmZIWfC+@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwbRcRzMFnRpYK05w6DUnSlF4HE/HnThm8D4G0GID8e/dteAKhV
 43fCjPnHN69sJGE2N2XMeFPazwlloZk/Joa7aPHwh2CKLWCZe6s6AzKEu84QnV/R
X-Gm-Gg: ASbGnctZf53zCBFR3hUcb0dOxBrziYNsnnYuUoeGLtW5QCJfHmAP6k4+Hux5QOWOErd
 Y3tHRwUnnhNnHH8bBJvBMRsythcuhkbKTxF47meqD4iRDulQiJ3a8PTTNoxuR8LcrtjaBgccJim
 spnXFrDCCGE3M5Y72PbYMlhMOEiKdZpXar7hA7GKG84WGCbCHjSeuioneVFuWum8jL8xYekD4C4
 BAIZK6k48YnwosTGKbLt6/gQfWq1SzYLdPMUjVw3bgSpa90WPv9f86cRfgxzDeUFk2cZgqP48iV
 SBc695x0bXr3mOXIxgGh0lLTq6AxMhyuF8ezfQuTVdSyt0MlFj0uqL9oKul8Ro1jO6+tRWh+c3t
 bg8uHjLt0zQtPNLmyubV8gJARtE9fZoYWJdswDXYAf7ycG7STF5dX3Wul479/1Pzzc5cLi6LBzX
 tRY5BeAEEtRg9UpWmpSgcazR9OSwr7X/bo
X-Google-Smtp-Source: AGHT+IHvGjk8Ah1Fx4qTSdPIY7y0Q5flgx6ul0HOMtKhPjD29is/NlNCRvL/ugm2YCTq2bo/oqsYFQ==
X-Received: by 2002:a05:6000:43c5:20b0:429:b857:6fb7 with SMTP id
 ffacd0b85a97d-429bd6ac095mr5276612f8f.52.1762001827234; 
 Sat, 01 Nov 2025 05:57:07 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13f2b5asm8827647f8f.40.2025.11.01.05.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Nov 2025 05:57:06 -0700 (PDT)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Sat,  1 Nov 2025 14:56:16 +0200
Message-ID: <55522ef8f3424e563ff18a720c709dcb065091af.1761993022.git.zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1761993022.git.zlatistiv@gmail.com>
References: <cover.1761993022.git.zlatistiv@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add check for inode->i_nlink == 1 for directories during
 unlink, 
 as their value is decremented twice, which can trigger a warning in drop_nlink.
 In such case mark the filesystem as corrupted and retur [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [46.10.223.24 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zlatistiv(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.46 listed in wl.mailspike.net]
X-Headers-End: 1vFBAU-0008Q1-Te
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: Add sanity checks before unlinking
 and loading inodes
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
Cc: david.hunter.linux@gmail.com,
 syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, khalid@kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add check for inode->i_nlink == 1 for directories during unlink,
as their value is decremented twice, which can trigger a warning in
drop_nlink. In such case mark the filesystem as corrupted and return
from the function call with the relevant failure return value.

Additionally add the 2 checks for i_nlink == 0 and i_nlink == 1 in
sanity_check_inode in order to detect on-disk corruption early.

Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
Tested-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
 fs/f2fs/inode.c | 10 ++++++++++
 fs/f2fs/namei.c | 15 +++++++++++----
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 8c4eafe9ffac..089cbf3646f0 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -294,6 +294,16 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
 		return false;
 	}
 
+	if (unlikely(inode->i_nlink == 0)) {
+		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
+			  __func__, inode->i_ino);
+		return false;
+	} else if (S_ISDIR(inode->i_mode) && inode->i_nlink == 1) {
+		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
+			  __func__, inode->i_ino);
+		return false;
+	}
+
 	if (f2fs_has_extra_attr(inode)) {
 		if (!f2fs_sb_has_extra_attr(sbi)) {
 			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 40cf80fd9d9a..d13077bad482 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -572,10 +572,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 	if (unlikely(inode->i_nlink == 0)) {
 		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
 			  __func__, inode->i_ino);
-		err = -EFSCORRUPTED;
-		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
-		f2fs_folio_put(folio, false);
-		goto out;
+		goto corrupted;
+	} else if (S_ISDIR(inode->i_mode) && inode->i_nlink == 1) {
+		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
+			  __func__, inode->i_ino);
+		goto corrupted;
 	}
 
 	f2fs_balance_fs(sbi, true);
@@ -601,6 +602,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 
 	if (IS_DIRSYNC(dir))
 		f2fs_sync_fs(sbi->sb, 1);
+
+	goto out;
+corrupted:
+	err = -EFSCORRUPTED;
+	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
+	f2fs_folio_put(folio, false);
 out:
 	trace_f2fs_unlink_exit(inode, err);
 	return err;
-- 
2.51.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

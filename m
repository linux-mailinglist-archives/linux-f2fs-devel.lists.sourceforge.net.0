Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C5C5BD1D9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Sep 2022 18:07:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oaJIO-0002Vb-Hx;
	Mon, 19 Sep 2022 16:07:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1oaJIN-0002VV-Lm
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 16:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NxcT9yfl2abMJw9DM1eH/T20vzORpzIvlZXJurx26RE=; b=CXNjolCy8S2hB6+zu1+I+pmMAM
 4eMs5vYtk/m4MSvZNI68vATwicxY1DpN4Xm1J5NQLdpbs0D6jZ8AGtnCyij3sFAWplQZyr5JyV2AV
 XU3aV+q4ChVxp250fIgLfNrqPWb6+tl201EEnGF/z9O0AqILI2cjNLSgY3psVkqqAxHE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NxcT9yfl2abMJw9DM1eH/T20vzORpzIvlZXJurx26RE=; b=B
 cs6sUjYfKwHichHphw4PPcZKN3piGpAXnCe+YPEdQL9A1FHJg+Ae4IVGs5ahUs6yUKSQEqxPrQJXO
 dKelWMFB33hDHuxA9lOTH3FDZYC6TGCgiWfQ6ZaOQgn/OTwO0Mbr+ctK3co0A3HzySC3bjw1WcZG/
 74iDLQc6qfYo+Oiw=;
Received: from mail-pg1-f172.google.com ([209.85.215.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oaJIV-00DWvg-0j for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 16:07:08 +0000
Received: by mail-pg1-f172.google.com with SMTP id t190so4120815pgd.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Sep 2022 09:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=NxcT9yfl2abMJw9DM1eH/T20vzORpzIvlZXJurx26RE=;
 b=maDiqhBNsV6lo52BJPHJwLGbeFXravruIwnLi0mQzVSFG+68m+Id46itDw9QAqD1+8
 6qFH+13UP/oC45Q0fN7+IOeMntZoHjhZLe87aVx8d0n3fUNDZT5zik0Y/N5jp9jEZUD6
 OeMnHlgNLnxVqh8pCCfZBdVV4fJtuHyR6zwEGAtESPrgj9aM6m02oPZWSlxlqk8pCOhA
 X2nh4kVmO8kdR7ov9CWiezdOasRAcRx5k1mXOlSJ5aSZhkdBMbp9oFXDLPUSkvF/kmR6
 6BTRZTk5QzXPI3IIYXoEVil1LKqHB3ECjTayZ43piN1F5sSw8+t0EhBIkAdHlmTjqLOR
 TsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=NxcT9yfl2abMJw9DM1eH/T20vzORpzIvlZXJurx26RE=;
 b=MDYrzrq2b6TGWBFICBCZv8UWk3hpKcTEbvtfGL2JOr2HxZiAh2J1JuAjZ43oNrvnfP
 XbV2px/WP6TgTGurFhhjSba4gQJFq37HfNl9tkHQjmvI2Fvr4NmD4gXf2JaK6iRiUbvX
 KZfRAtLHbQarGRxI/17vAr/Ca8oMZCwZjwPQYZGh8qzmWc6vWVMgvMbFR4opVSOMxr60
 AXH1Nf0cy3S7NpLK+DxPLLbNp4+yhkBJ+JOlHmHJvHbfIlwDlVVNAasFLfV7VQ/0OPT+
 TSq06vVqNm5dbH5Qc2GKEJEnrClVr8yZjf/o7666ntIbZulbwK8M469nfOt489rvo+pf
 d1SQ==
X-Gm-Message-State: ACrzQf2rDyJ7lhxcZipjwigXu7vOBT0kYZJ4nxt64QWG54mIqmZ8IX54
 6Xk9hmJcMbgcZqjZ3vtMFvk=
X-Google-Smtp-Source: AMsMyM42kmO3rvMQqqjf9P0ZvKNgtirXERlHkmJwT0j4PZw1RoK4yUTQOYDloWj4IDQ5gKQiNpvM/g==
X-Received: by 2002:a63:5d52:0:b0:439:36bb:c07c with SMTP id
 o18-20020a635d52000000b0043936bbc07cmr16602300pgm.272.1663603614068; 
 Mon, 19 Sep 2022 09:06:54 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:8958:94cc:1777:6efd])
 by smtp.gmail.com with ESMTPSA id
 4-20020a631944000000b00419b66846fcsm18667682pgz.91.2022.09.19.09.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 09:06:53 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 19 Sep 2022 09:06:43 -0700
Message-Id: <20220919160644.2219088-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong We need to make sure i_size doesn't change
 until atomic write commit is successful and restore it when commit is failed.
 Signed-off-by: Daeho Jeong --- fs/f2fs/f2fs.h | 1 + fs/f2fs/file.c | 16
 +++++++++-------
 fs/f2fs/inode.c | 3 +++ fs/f2fs/segment.c | 4 +++- 4 files changed,
 16 insertions(+), 8 deletions(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.172 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1oaJIV-00DWvg-0j
Subject: [f2fs-dev] [PATCH 1/2] f2fs: correct i_size change for atomic writes
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

We need to make sure i_size doesn't change until atomic write commit is
successful and restore it when commit is failed.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/f2fs.h    |  1 +
 fs/f2fs/file.c    | 16 +++++++++-------
 fs/f2fs/inode.c   |  3 +++
 fs/f2fs/segment.c |  4 +++-
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index dee7b67a17a6..539da7f12cfc 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -821,6 +821,7 @@ struct f2fs_inode_info {
 	unsigned int i_cluster_size;		/* cluster size */
 
 	unsigned int atomic_write_cnt;
+	loff_t original_i_size;		/* original i_size before atomic write */
 };
 
 static inline void get_extent_info(struct extent_info *ext,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5efe0e4a725a..4f9b80c41b1e 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1989,6 +1989,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct inode *pinode;
+	loff_t isize;
 	int ret;
 
 	if (!inode_owner_or_capable(mnt_userns, inode))
@@ -2047,7 +2048,10 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 		goto out;
 	}
-	f2fs_i_size_write(fi->cow_inode, i_size_read(inode));
+
+	isize = i_size_read(inode);
+	fi->original_i_size = isize;
+	f2fs_i_size_write(fi->cow_inode, isize);
 
 	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
 	sbi->atomic_files++;
@@ -2087,16 +2091,14 @@ static int f2fs_ioc_commit_atomic_write(struct file *filp)
 
 	if (f2fs_is_atomic_file(inode)) {
 		ret = f2fs_commit_atomic_write(inode);
-		if (ret)
-			goto unlock_out;
-
-		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
 		if (!ret)
-			f2fs_abort_atomic_write(inode, false);
+			ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
+
+		f2fs_abort_atomic_write(inode, ret);
 	} else {
 		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 1, false);
 	}
-unlock_out:
+
 	inode_unlock(inode);
 	mnt_drop_write_file(filp);
 	return ret;
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index cde0a3dc80c3..64d7772b4cd9 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -30,6 +30,9 @@ void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync)
 	if (f2fs_inode_dirtied(inode, sync))
 		return;
 
+	if (f2fs_is_atomic_file(inode))
+		return;
+
 	mark_inode_dirty_sync(inode);
 }
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 460048f3c850..143b7ea0fb8e 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -193,8 +193,10 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 	if (!f2fs_is_atomic_file(inode))
 		return;
 
-	if (clean)
+	if (clean) {
 		truncate_inode_pages_final(inode->i_mapping);
+		f2fs_i_size_write(inode, fi->original_i_size);
+	}
 	clear_inode_flag(fi->cow_inode, FI_COW_FILE);
 	iput(fi->cow_inode);
 	fi->cow_inode = NULL;
-- 
2.37.3.968.ga6b4b080e4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9915D71FF34
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Jun 2023 12:25:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q51yW-0004qv-TA;
	Fri, 02 Jun 2023 10:25:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <korotkov.maxim.s@gmail.com>) id 1q51yS-0004qo-Vi
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Jun 2023 10:25:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/jj1O46supYZQ6EgVsnICE1i2BRpwPTQQNp8V1JYxNI=; b=iFIXO0CMsoppnGL7z/hkS1WsjH
 mnQc2vRxSMmIG6n0564hwESyCGzYIJpXSpUJCuua9uUxGc5QYZluGYla4YX0BNLcH9xiqcSFZ1VTh
 e2ElJZBjMI75NAdDZzwVKiNQ170ogdUufKtaXNOpk36H0FmydgQifTz0g/q58NCOcOsQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/jj1O46supYZQ6EgVsnICE1i2BRpwPTQQNp8V1JYxNI=; b=a
 0ET1Xlb2/C6Q03CIX/rXLrRVmhYI8HFoRVynpwvSfcooOIfPn3LIEteKOnVbjhXTDMONY8nMXiOXY
 fpMUQf6htP82vggn5N8KpzmyMvoNopGWRGxKM7IopRa695vOfPZ6k7VAgtLLS3a3JNkAuNEiEyEWQ
 t39BBDNw4124GJ7g=;
Received: from mail-lj1-f173.google.com ([209.85.208.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q51yO-009B0s-3Q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Jun 2023 10:25:37 +0000
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2b1b30445cfso2717781fa.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 02 Jun 2023 03:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685701525; x=1688293525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/jj1O46supYZQ6EgVsnICE1i2BRpwPTQQNp8V1JYxNI=;
 b=G3V/4dE+RfcB1/+lAoMiJXrWskD6qNl7ISISMdmRLxydOSd9wsRJGGMqiE1ygozzU+
 q44Fb9OOhiWEpEZsYm6DXn6PfosoRCU+EMzZ/oWu5Y6yloslK3qAV5MumwOEbCAitcSH
 trCUy7KNMbhod80sO/+P2P4V/g88ahCW+KtU/5UqwaJ0MD61Ld31O+6EjJIJGH3RioQc
 jYNMe0TBZEP8Fpp3rCX/Muk79yniyNX1ROauyjQT6M7DT8vAUoRBNkC1QcXTs9cW1e4/
 a7URtJwTkDUlo6RDiJFMiZUEFlHqd8/5zXoYLI1qEKqcjHBD3f1vDBnZlUdvQ8Mi7R28
 1yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685701525; x=1688293525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/jj1O46supYZQ6EgVsnICE1i2BRpwPTQQNp8V1JYxNI=;
 b=fqf+OFJ6fpYhporyeiirAKqdJHN30WYmK1v7fH3O/OPAmMCK3Dz/RqzbFDQMLdc+78
 4zoSFUJadnqcULvCl95t1pL4qDEivG/yvu6QdbMSEhjym6ISeD1wIfdvOs2eBq7tQ8F1
 Ux7Sv4WhKN4NV758BrjL7pyhP1DWSxbqmneq5l1NbKJMYT0G/lVl+YsiBmIQoma9wpMm
 Gtvey1a0HqynY5uohSxm18EFPsKVr7zYb3L52brElS6hSsAwnPoFHBnL6mHNSDZuakJO
 egnCms+7xNLU5mm0442h5/KCIx7iQapoXuyAhdj+6pNjSi0Zt72x5EyuTUrMVrRe3inD
 qDlA==
X-Gm-Message-State: AC+VfDxPAqT5hEGQiK8hSp5U7w3T+pvnptcgjQIzZ6ScmHKJ+FMbiUNy
 98UB3aIVHtI+PITrUVkVSXQ=
X-Google-Smtp-Source: ACHHUZ4iDwswwyKqRxMf0fIyOT74rSYBzuOxRUeX0wR4q+8LeV/h7ciM86UatUYdYRCzX7RGkcYtmw==
X-Received: by 2002:a2e:7003:0:b0:2a7:b986:3481 with SMTP id
 l3-20020a2e7003000000b002a7b9863481mr1260122ljc.41.1685701525118; 
 Fri, 02 Jun 2023 03:25:25 -0700 (PDT)
Received: from mkorotkov.rasu.local ([212.22.67.162])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a2e300d000000b002af25598f07sm171739ljw.78.2023.06.02.03.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 03:25:24 -0700 (PDT)
From: Maxim Korotkov <korotkov.maxim.s@gmail.com>
To: Chao Yu <chao@kernel.org>
Date: Fri,  2 Jun 2023 13:24:51 +0300
Message-Id: <20230602102451.602105-1-korotkov.maxim.s@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In error handling cases,
 the function exited without releasing
 memory Signed-off-by: Maxim Korotkov --- changelog: fixed code review remarks
 fsck/dir.c | 10 +++++++--- 1 file changed, 7 insertions(+), 3 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [korotkov.maxim.s[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.173 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.173 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q51yO-009B0s-3Q
Subject: [f2fs-dev] [PATCH v2] fsck.f2fs: fix memleak in f2fs_create()
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
Cc: Maxim Korotkov <korotkov.maxim.s@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In error handling cases, the function exited without releasing memory

Signed-off-by: Maxim Korotkov <korotkov.maxim.s@gmail.com>
---
changelog: fixed code review remarks
 fsck/dir.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index 4a3eb6e..29c89de 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -704,7 +704,8 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 	ret = convert_inline_dentry(sbi, parent, ni.blk_addr);
 	if (ret) {
 		MSG(0, "Convert inline dentry for pino=%x failed.\n", de->pino);
-		return -1;
+		ret = -1;
+		goto free_parent_dir;
 	}
 
 	ret = f2fs_find_entry(sbi, parent, de);
@@ -713,6 +714,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 					de->name, de->pino, ret);
 		if (de->file_type == F2FS_FT_REG_FILE)
 			de->ino = 0;
+		ret = 0;
 		goto free_parent_dir;
 	}
 
@@ -728,7 +730,8 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 		if (hardlink_ni.blk_addr == NULL_ADDR) {
 			MSG(1, "No original inode for hard link to_ino=%x\n",
 				found_hardlink->to_ino);
-			return -1;
+			ret = -1;
+			goto free_child_dir;
 		}
 
 		/* Use previously-recorded inode */
@@ -750,6 +753,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 	if (ret) {
 		MSG(0, "Skip the existing \"%s\" pino=%x ERR=%d\n",
 					de->name, de->pino, ret);
+		ret = 0;
 		goto free_child_dir;
 	}
 
@@ -804,7 +808,7 @@ free_child_dir:
 	free(child);
 free_parent_dir:
 	free(parent);
-	return 0;
+	return ret;	
 }
 
 int f2fs_mkdir(struct f2fs_sb_info *sbi, struct dentry *de)
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

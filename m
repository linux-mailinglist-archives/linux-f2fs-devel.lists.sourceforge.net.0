Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FFD586F4C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Aug 2022 19:08:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oIYtx-0006Tj-Qm; Mon, 01 Aug 2022 17:08:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daeho43@gmail.com>) id 1oIYtw-0006Tc-0c
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Aug 2022 17:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sZ45skYt+QsgiGTf4iZf0SoM7IKDU7UG5QSoVFTYwAc=; b=A0PguhC+SCXtQGI2T4pjLXwlws
 e81Lx1CzWfpSE/EFDn2ApokkEQe7fopZtHbYfiT4lPpthEL32zmUlNYt7gXpH/ENBRr1c9GqB0bdK
 yVxv/lepU9BvV6mU5Pj2V+yuIcd5BfB8h+DpKYE2RrX8qvWows902kkU9gmHGuDcQoes=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sZ45skYt+QsgiGTf4iZf0SoM7IKDU7UG5QSoVFTYwAc=; b=W
 AyOQXya9ctZ2kGULX3YSQyTtMK8VYPPzlS2Ns4EkPj3/wBFYNMCux0SgMobFqNYF0mTPqDc1APcXh
 SngYy//5Z0Cj7OrKFgzRvETJ208mhxW1HBBz/7fcQe4otUKBaaIeOmvlFRnW1BmmXArYKNnY6Er7h
 qJrSe2C7IMiNMYno=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oIYtv-00HWRy-Md
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Aug 2022 17:08:20 +0000
Received: by mail-pl1-f178.google.com with SMTP id y15so11023380plp.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 Aug 2022 10:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sZ45skYt+QsgiGTf4iZf0SoM7IKDU7UG5QSoVFTYwAc=;
 b=S1Rkuu/J6jIsBqpQF9a8DvfpIbwnSiUOHdlSoTNQU376k14NEV3caGP+nm1b1kY2lh
 sg428cIGSQwqZ7fBHHM2iZPgahmmlkl1hcDQfyali+bW/oMkV2aFrSNUgYaNfsidkLZf
 g1/ekzFmMOQNCsX9auIRZaSzCXjmRGZOOQnHHIuXWKj3+diImEBGjzJrfOWS/pz1tO7y
 ESAUK7BTm2FNY5IMpREGjNGQa4XrNhNsDCAn/+7IVzML16M2NRFzFw4IWc/RyvxTVgaL
 SpzGOkR2ydsBTxUE4rFtYX6253nagZFyGlzPeD6RdNWdocdEflKXpNYkSKfM2c4/vfpg
 XLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sZ45skYt+QsgiGTf4iZf0SoM7IKDU7UG5QSoVFTYwAc=;
 b=EnccUfz2w1sy1h3oElR2tSdkB79Hr82t6G45L5tU1DF2srMeQ8qrgr4JlO3tBgi0xQ
 jXoaYDdvlhfuC9naglg8oVgLR4I96H1u/CmGSEbrYInCAOWvRkkgM2MNeKR/0OWxpfGZ
 B63x4AOdedKPra6OtSdrK5jG9+GVdxZMjgkWWmHGIR9QyWDA0Hs3zjyETgsRTGXZMvpN
 C41+FZgK5rzEDweos3D+IvASw+uwiAPU5sKAPngjMMoA6EAvwt0K+BNfxW0mks4NcVWJ
 sCVZ5gNrqgyo77qAXdz6ah9eb8MyO8YKfVgqbPEpuAM1RbKyEmdv1CPUzgnMWjVPo2U3
 1Igw==
X-Gm-Message-State: ACgBeo2Y6E9VKlmH7phCipsF5AwWxfp2nu/K8p2gFzqqK2xt9KSSahed
 v76+RUEdL7jL7XRODfvQW4M=
X-Google-Smtp-Source: AA6agR42ymQ0MfxHchByUpL+k4EHuOPvSrtG10vX5VfJu6H2/wiCihFxnQpZj+Ujz5EmgnxNvK2pKg==
X-Received: by 2002:a17:90b:3a8b:b0:1f5:2048:cbab with SMTP id
 om11-20020a17090b3a8b00b001f52048cbabmr319291pjb.196.1659373694054; 
 Mon, 01 Aug 2022 10:08:14 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:7c40:5eed:9318:104a])
 by smtp.gmail.com with ESMTPSA id
 f185-20020a6251c2000000b0052b9351737fsm9185056pfb.92.2022.08.01.10.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 10:08:13 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  1 Aug 2022 10:08:08 -0700
Message-Id: <20220801170808.1692711-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong F2FS_IOC_ABORT_VOLATILE_WRITE was used to
 abort a atomic write before. However it was removed accidentally. So revive
 it by changing the name, since volatile write had gone. Signed-off-by: Daeho
 Jeong Fiexes: 7bc155fec5b3("f2fs: kill volatile write support") ---
 fs/f2fs/file.c
 | 30 ++++++++++++++++++++++++++++-- include/uapi/linux/f2fs.h | 2 +- 2 files
 changed, 29 inser [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.178 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oIYtv-00HWRy-Md
Subject: [f2fs-dev] [PATCH] f2fs: revive F2FS_IOC_ABORT_VOLATILE_WRITE
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

F2FS_IOC_ABORT_VOLATILE_WRITE was used to abort a atomic write before.
However it was removed accidentally. So revive it by changing the name,
since volatile write had gone.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Fiexes: 7bc155fec5b3("f2fs: kill volatile write support")
---
 fs/f2fs/file.c            | 30 ++++++++++++++++++++++++++++--
 include/uapi/linux/f2fs.h |  2 +-
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8098ed890e94..29711e5b6983 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2109,6 +2109,31 @@ static int f2fs_ioc_commit_atomic_write(struct file *filp)
 	return ret;
 }
 
+static int f2fs_ioc_abort_atomic_write(struct file *filp)
+{
+	struct inode *inode = file_inode(filp);
+	struct user_namespace *mnt_userns = file_mnt_user_ns(filp);
+	int ret;
+
+	if (!inode_owner_or_capable(mnt_userns, inode))
+		return -EACCES;
+
+	ret = mnt_want_write_file(filp);
+	if (ret)
+		return ret;
+
+	inode_lock(inode);
+
+	if (f2fs_is_atomic_file(inode))
+		f2fs_abort_atomic_write(inode, true);
+
+	inode_unlock(inode);
+
+	mnt_drop_write_file(filp);
+	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
+	return ret;
+}
+
 static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
@@ -4054,9 +4079,10 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_start_atomic_write(filp);
 	case F2FS_IOC_COMMIT_ATOMIC_WRITE:
 		return f2fs_ioc_commit_atomic_write(filp);
+	case F2FS_IOC_ABORT_ATOMIC_WRITE:
+		return f2fs_ioc_abort_atomic_write(filp);
 	case F2FS_IOC_START_VOLATILE_WRITE:
 	case F2FS_IOC_RELEASE_VOLATILE_WRITE:
-	case F2FS_IOC_ABORT_VOLATILE_WRITE:
 		return -EOPNOTSUPP;
 	case F2FS_IOC_SHUTDOWN:
 		return f2fs_ioc_shutdown(filp, arg);
@@ -4725,7 +4751,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_COMMIT_ATOMIC_WRITE:
 	case F2FS_IOC_START_VOLATILE_WRITE:
 	case F2FS_IOC_RELEASE_VOLATILE_WRITE:
-	case F2FS_IOC_ABORT_VOLATILE_WRITE:
+	case F2FS_IOC_ABORT_ATOMIC_WRITE:
 	case F2FS_IOC_SHUTDOWN:
 	case FITRIM:
 	case FS_IOC_SET_ENCRYPTION_POLICY:
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index 352a822d4370..3121d127d5aa 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -13,7 +13,7 @@
 #define F2FS_IOC_COMMIT_ATOMIC_WRITE	_IO(F2FS_IOCTL_MAGIC, 2)
 #define F2FS_IOC_START_VOLATILE_WRITE	_IO(F2FS_IOCTL_MAGIC, 3)
 #define F2FS_IOC_RELEASE_VOLATILE_WRITE	_IO(F2FS_IOCTL_MAGIC, 4)
-#define F2FS_IOC_ABORT_VOLATILE_WRITE	_IO(F2FS_IOCTL_MAGIC, 5)
+#define F2FS_IOC_ABORT_ATOMIC_WRITE	_IO(F2FS_IOCTL_MAGIC, 5)
 #define F2FS_IOC_GARBAGE_COLLECT	_IOW(F2FS_IOCTL_MAGIC, 6, __u32)
 #define F2FS_IOC_WRITE_CHECKPOINT	_IO(F2FS_IOCTL_MAGIC, 7)
 #define F2FS_IOC_DEFRAGMENT		_IOWR(F2FS_IOCTL_MAGIC, 8,	\
-- 
2.37.1.455.g008518b4e5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

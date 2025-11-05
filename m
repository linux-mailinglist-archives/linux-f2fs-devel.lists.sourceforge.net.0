Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B067C354C4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 05 Nov 2025 12:10:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqbrWZkDBpdHp8WS1uKh5djn1TwXBE0NpNSlmSbB73A=; b=ADTK+3f/uPCJ52u7gSo0RM/+yB
	8eUWneMONPLDQSmQIV32V+r1WvIWBFn9vFKalcMrM38lDpHXULh5nqPWIjMQSXKjSkrgZSU/8BPuS
	qWV0f04dKwd49M8gWBUZusQqQzkow6jaDJv44G0U22UMb0JDM6X81Vczz3BnTsvnVMs0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGbP4-0001nv-LC;
	Wed, 05 Nov 2025 11:10:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlatistiv@gmail.com>) id 1vGbP3-0001no-5j
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 11:10:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dSJdhsMEI+4YuimZ1hmkS4JUtetSOHWFOs9qPgUuN/8=; b=iq4sH0dYHosYIiaHuvImD6wke0
 ypn1d9LYVFqH7e3mSW4Md3k/dBZQ7BaqkJGEz6y3QPwC1rRjO2eXUqTFRem44TGNhgtb2/jKkVt/+
 Xn94jgbwSMbP5bBi4adzA9NWyQC89r2SAOJpDOG0Iq9K/NvqA9k1HfzRAJ0XgqCRB3hE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dSJdhsMEI+4YuimZ1hmkS4JUtetSOHWFOs9qPgUuN/8=; b=A0taq6Utu4dpU/xIsFmDsfweFi
 zPfXbBXmR3xfGsyMVae4axRFag/z57GEkkIi53bud9Tq+mitEvwcDh/kvYzeLcn9VAf024OcYGiut
 PftOPVNg79x0VdpV4mv19gQurXmV+mr5C62ItY9PqSG1380IJENRDwZs7ZnmpP+LV0Jo=;
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vGbP1-0005Ff-TF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 11:10:12 +0000
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-47114a40161so16977315e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Nov 2025 03:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762341000; x=1762945800; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dSJdhsMEI+4YuimZ1hmkS4JUtetSOHWFOs9qPgUuN/8=;
 b=H2ksaXz8tW2v5JYALP0xBUIFM+bCcwDs5LgHn9W2Mmd9cf5G+pEHW0ZPG6wxuLr7zw
 aG3RP2hYfHUfulWaVOtopAqbar3CSvok32OBglUu0wTLcAHDCkajDuIJiZWYnYYcmdmG
 qwGZpZL8wig92/qMgy/FPaaMDzHyZyR/nuHXdcyGvyYUq2uoX/cvBOvMTyQXUmvF9X+D
 64AO8dYfWiRpc2K3PqGr/sv4c0iQfYEB3pNXPjR4guKZ2t8NWnW/5d77ZajtCcDmO6Ze
 y4fL7lMOxqADesbFHZCF2/a+z82UcwXQ34pD4jZdIYOoIFiYJopz/Ov49jZe44Orzktd
 bohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762341000; x=1762945800;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dSJdhsMEI+4YuimZ1hmkS4JUtetSOHWFOs9qPgUuN/8=;
 b=upxiguG7ImjDGZwLm1NBCRxOX7JdWY6XTIGxwEY4NI0FV45tM+ho68jpoo+rQKcm5U
 77iAWrO1CAwBOQo2s07v4YfDGGKbsU8yNbr/0/HqUSk1zbqjG/dAtEJYdlNlpIgFxcJk
 Z9610B1iRdjBPeQSlJH2vAiz+Iix3y5z1gvvNe2IgKlhhnUsnTQO3+4X1Hg3yOkThdo4
 Q7Yj2DnfTR+Dsu8H4GQw1FEPzzjqhlixUbCnrF/7NlOkLBaiwsHuLcqhZ3sgIq9zpKdm
 9tOSGuvMD59fqhvRKRmzVKrvEX174kOQ6ZzGDH0i5548hhFP1pnPwgIfdCXtWbAtP1yI
 XBVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9xwdjCc3sQBrunLEfDTE9ItUJbg7ZtlBCFNdomNxduAKVW+JCgPv6XlVN8N/tYhtKp9zSbhEk+xxf5isovUbA@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyKQn2IX08tkL5zI/OI/YG2B37Wk15Fi1zKulfgditdEyL8pBx0
 G6vg06iAh6IVpg6N+2uquH61rZX2T9gk20MGOSwRNrmpjSEjwqQ6aRf1
X-Gm-Gg: ASbGncuJsr53HH9E9nRvlYbsv1U7Ym8tZTcmCzslX201frYO9PnWYhF+hSxd3LU/igo
 xnyTLTJV1nbcb62ATn8pDaU0w4pzp0Khv1QT+TXmdJ8QkUJn/lC8IUni3Ztuz1hu1vuHdbK0Nrt
 9Cw2t0XjR8Fkc9cwCyO25ItlhuPYkp+FnqcV32H3WGl/FZ5tutTyno8IchgpBGxe8TmhQM9Lc7U
 DC4IBjFZHtcJq7fcc6b9M63kCuIztngwfMI8p0pwsQIIMqHpHwIwtLcsklVv+rT2ncUs7vVWqb5
 s30AkTdkOIpr36ehQIdLQVh/uumNOpuAO9blbGdvLlsMNLyW5h6i4lo76KS4/mmlzwb4bByn9oB
 rcmVUBWUUrGmmkYWOJyMHHZZPg8X/iU7o41pUbqbaZ41FlThaJrA7Df4C6FHGDGY+/SJYz6huO2
 m8wYVERjPSSLw=
X-Google-Smtp-Source: AGHT+IFgNrtalxzChmeyomCPGlCrqR2rqh01/vklcS8njZxeR/kapLNbNRzhAZqZQMVsHdryQdmTfA==
X-Received: by 2002:a05:600c:4583:b0:475:dde5:d91b with SMTP id
 5b1f17b1804b1-4775cdc8ea6mr25282445e9.17.1762340999987; 
 Wed, 05 Nov 2025 03:09:59 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c42adsm39728415e9.4.2025.11.05.03.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 03:09:58 -0800 (PST)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  5 Nov 2025 13:09:43 +0200
Message-ID: <c56dfb1f6a27cd04a91d41a0448a26118c7cdc38.1762339963.git.zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1762339963.git.zlatistiv@gmail.com>
References: <cover.1762339963.git.zlatistiv@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zlatistiv(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.44 listed in wl.mailspike.net]
X-Headers-End: 1vGbP1-0005Ff-TF
Subject: [f2fs-dev] [PATCH v4 2/2] f2fs: Add sanity checks before unlinking
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
 linux-kernel-mentees@lists.linuxfoundation.org, stable@kernel.org,
 "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add check for inode->i_nlink == 1 for directories during unlink,
as their value is decremented twice, which can trigger a warning in
drop_nlink. In such case mark the filesystem as corrupted and return
from the function call with the relevant failure return value.

Additionally add the check for i_nlink == 1 in
sanity_check_inode in order to detect on-disk corruption early.

Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
Tested-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
 fs/f2fs/inode.c |  6 ++++++
 fs/f2fs/namei.c | 17 ++++++++++++-----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 8c4eafe9ffac..e2405b79b3cc 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -294,6 +294,12 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
 		return false;
 	}
 
+	if (S_ISDIR(inode->i_mode) && unlikely(inode->i_nlink == 1)) {
+		f2fs_warn(sbi, "%s: directory inode (ino=%lx) has a single i_nlink",
+			  __func__, inode->i_ino);
+		return false;
+	}
+
 	if (f2fs_has_extra_attr(inode)) {
 		if (!f2fs_sb_has_extra_attr(sbi)) {
 			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 40cf80fd9d9a..849cfdc57b30 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -570,12 +570,13 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 	}
 
 	if (unlikely(inode->i_nlink == 0)) {
-		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
+		f2fs_warn(sbi, "%s: inode (ino=%lx) has zero i_nlink",
 			  __func__, inode->i_ino);
-		err = -EFSCORRUPTED;
-		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
-		f2fs_folio_put(folio, false);
-		goto out;
+		goto corrupted;
+	} else if (S_ISDIR(inode->i_mode) && unlikely(inode->i_nlink == 1)) {
+		f2fs_warn(sbi, "%s: directory inode (ino=%lx) has a single i_nlink",
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
+	set_sbi_flag(sbi, SBI_NEED_FSCK);
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

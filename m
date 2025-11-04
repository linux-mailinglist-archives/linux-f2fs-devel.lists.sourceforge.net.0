Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B386BC30060
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 04 Nov 2025 09:47:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IF35nliHgrikclAgGHv3KpXNHM2sLobTbrPQNWy8xkM=; b=jMKUB7LYqhguUmKzsBB3DEZ6CY
	rR9x06mocaCBiywK/sDYkaP8Qw/Gdp2/ZPFEYwTmIKGhXsNWaS8sb0rvxgj+NblAU4BZmYScSrRD+
	CpjKjZLUZAAmknzgBV+XBdfFdRC1+yj6+CXYF5Goj6Q7QflHlxZLpXnyC1Dk36GOr64E=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGCgk-0007PG-IH;
	Tue, 04 Nov 2025 08:46:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlatistiv@gmail.com>) id 1vGCgj-0007OT-13
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Nov 2025 08:46:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rK9/r+IfnFlfj3Kuw96HA2MKcOpR1Q7/bmqW3PPyDGM=; b=lvvplV7vS+6Inj3oNBQYTqv9wq
 ASZyGrj/Sfg+bq1asMQhdremGG36J1aV1RGAn7OVouXAR5F7uVyTMSfX7quND7AkDudtVlJYju8lZ
 nrgj8viOWdr1kKH9pckhHI4mTJ9mSQLpGXOVeGrLfQzwpkPxE3OcfB+iy3bXB1vZ74BE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rK9/r+IfnFlfj3Kuw96HA2MKcOpR1Q7/bmqW3PPyDGM=; b=kH18B3++ViVek9c9qb/S71EY0q
 wDLBiFZP912XkeCU/NLYSL7CEdegh1hKT05Ie7xe+BTeZYR5BINCs6j8SIz3iCQNEwHIzwRNKMOBn
 Q/2GowOsFXkprRYbLhRqgG3r456OaMuP/gdVPC9s5qkYyug9pwyAjnkkqOL1PsPaPs2w=;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vGCgi-0007Lj-Bg for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Nov 2025 08:46:48 +0000
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47755a7652eso3360535e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Nov 2025 00:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762246002; x=1762850802; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rK9/r+IfnFlfj3Kuw96HA2MKcOpR1Q7/bmqW3PPyDGM=;
 b=nauJbCoYM3Lr+VGRJZLfjVUardGCqh2zg6/W/ZPn3Ov+c60PNyLvkNFAiUktvH9jAZ
 WFekbZ9ka1GLw6OIcZyYENm/EsPebA/uG+9I6vBvZxFyXU6QKg8s1psyzSmz2LmuNovh
 typivg+9POFnMZTv9awXj5LiDAdrYLhva8ao0YRyGsr1m+qUtn3Y2QmqwI3pn3xk+2sm
 dsdZ9Okmx6SmR/hraO8rvj+MHhSKiT8KWYIkAy1w8ofAfL1m9L4OEF2gxWu/EaXU28Nd
 hwnfh0W/VMF1ol3znbxA16sUENrsjGqmPOStff1A75HswjHl+QQXa5DhT9T9WJWiHJjo
 E0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762246002; x=1762850802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rK9/r+IfnFlfj3Kuw96HA2MKcOpR1Q7/bmqW3PPyDGM=;
 b=hczlBLK+BTg2IxJBvOMVK+aBkwrwLwsnJMWWnTk/VNnJU8dDC16bzilSyXjqOYIXnF
 jEzJd5fvcgWrRethqlNv5ebvQ3qGYueSneW/nziiQTIo5yvqT90L8LDBvofN7tb3U/qp
 /EfkJFvABD0tzuNHs/ENyMEet7+mNMmUmVYoSePIq8ZXtOWki08yI9wIYZsBitDZqYrs
 r69OWccZRvG4jepvJz9DHPqF1Ms7yYr6wMGGWKj2cphUf+sapG52F1ASYtHcKXXdtkvT
 VC8shdxZ1ERNw+ea82YKyjC7tGqV5tRhi3K2cLg1kFElUsLGq6nqiWJcwFN1WFHvfXdJ
 3L/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoh6H01sXp70P0WX+kdsGwBgXXYGiCL3SEd8B2Y19Tj5HUTS44SdMRjySClCRqZm3pK1LmsoeK7lhOT+8EJ++s@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxLFQ5ae8A3yI9DvQAzVRIh0lT2d82Df4Uxh1I5xEQitiKf1A5p
 YUXckhhTi8WDLIIf7E5+jKlAwmUQps2Om02mzpQ/ZIr6GOof6Es9aSi4
X-Gm-Gg: ASbGncvqc1KtCmTFAQ/Ctp5uS4nT3U+DckEtAi2oDRbxj1X/nEcyEbHPnZwGYTbAh3q
 U0GJXqKSUYxduptWelWG5vkwArIoxYwHlKQLaUlWV1JG9Or6ipHPPD+hcKZBZEZqKumCEn2W774
 HvWUcQ2CkaI6K7cW83v2cNLl3DdQnpYVT6DLqdQju1oyURSuvkA2zpzeuUruSGVTSlgBJ2ChFeu
 0ka8fIn8ULRVna9i4r3nW9k9L4oWiazjT3tIqrpYcmN+fiBZSQjsj/eJh3QSFx9WmG6gdfBpTJa
 3o/raiZKzI/akr8IpUSKlBIU6bYFXihs5Sr4F4cZv3+SEGXEpGJJQot+V2drUyCr3q9vTHEBk19
 99jQXtsyjpkntX9SHWlnyBoXCzCkaJ9kVsQx/JJqdmxO1+cXlyrfWsKPPYD+Lfp3TlFleV5rclJ
 UuYe9lJWxK2TGxOnyTV7FQsQ==
X-Google-Smtp-Source: AGHT+IGhgCX2NfeSdDb0gpSYu/I4DorVKH+J4uT9I1EZQvppI43csdNacLNGraQ9BsMWF4m2sbtX8Q==
X-Received: by 2002:a05:600d:4350:b0:477:3543:3a4a with SMTP id
 5b1f17b1804b1-47735433f88mr92298435e9.2.1762246001456; 
 Tue, 04 Nov 2025 00:46:41 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c394e33sm200375535e9.13.2025.11.04.00.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 00:46:41 -0800 (PST)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  4 Nov 2025 10:46:20 +0200
Message-ID: <ef5cfc5cee26e34586e7415de41d865a360e0d98.1762184787.git.zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1762184787.git.zlatistiv@gmail.com>
References: <cover.1762184787.git.zlatistiv@gmail.com>
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
 [209.85.128.51 listed in wl.mailspike.net]
X-Headers-End: 1vGCgi-0007Lj-Bg
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs: Add sanity checks before unlinking
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

Additionally add the check for i_nlink == 1 in
sanity_check_inode in order to detect on-disk corruption early.

Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
Tested-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
 fs/f2fs/inode.c |  6 ++++++
 fs/f2fs/namei.c | 15 +++++++++++----
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 8c4eafe9ffac..b808e1dc2ae7 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -294,6 +294,12 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
 		return false;
 	}
 
+	if (S_ISDIR(inode->i_mode) && unlikely(inode->i_nlink == 1)) {
+		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
+			  __func__, inode->i_ino);
+		return false;
+	}
+
 	if (f2fs_has_extra_attr(inode)) {
 		if (!f2fs_sb_has_extra_attr(sbi)) {
 			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 40cf80fd9d9a..65af1d56a99e 100644
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
+	} else if (S_ISDIR(inode->i_mode) && unlikely(inode->i_nlink == 1)) {
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

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58515BB7129
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Oct 2025 15:48:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZdN6aN6FY+nWTtXtqTqJf5dZ/vpcSVE+PdQYF4YK3cQ=; b=T99SSPe0/RvOZXE9epctfV8p4f
	2r6iJXiIIdbxacDMYcMHDHYSqztoWW4vBO7G7wsL2f5E3QDLb/K65yz9bff8twkgjRfMW0h1uxdUE
	ZLLQTKIf74vb9ijEe8YMdWCtJMkLfzvVFLAHhZSkwfZBAnJR/+Ay30to3WVBR9FEDWj8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v4g8X-0006UA-RB;
	Fri, 03 Oct 2025 13:47:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlatistiv@gmail.com>) id 1v4g8W-0006U3-CE
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 13:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SXz1taGyCnsjIOklnSCeHrVpWlskjbKzfy7PmtERQsU=; b=BFZXn01YdFE7ujbUQd0fQrR41z
 hxoG1SkUyo5fDmvTqOPL8Jwqz+q9QrAs75TZFgG4qM6kQycflWlzKxIW5T6aIIjWOkUj7eA4zIAOG
 +ll+a1YuLqsD67QH9N1IUtnlvyUuwm9uMhHZPZyKaASHlw1m1PISBafVPA0XdAYcxrWw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SXz1taGyCnsjIOklnSCeHrVpWlskjbKzfy7PmtERQsU=; b=B
 qeqRPX92XNi0qZHaLaabCJVKj6xNo4r6Bb0gnCHm1URjfwGz/tsQXHT1dIs42s0pasuguEdWv8Zyz
 lA0R5luOiPCwFZqYsX/aB0mO8qt9Mp1/bFdtW5E/eaO5z1ZzqPHb9nF41OMilVj14B35Zbx/DwZbi
 41pLSUAREOiczBX4=;
Received: from mail-ed1-f53.google.com ([209.85.208.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v4g8V-0000GZ-Rj for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 13:47:52 +0000
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6228de280a4so4593369a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 03 Oct 2025 06:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759499260; x=1760104060; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SXz1taGyCnsjIOklnSCeHrVpWlskjbKzfy7PmtERQsU=;
 b=fQLA7soSgINj6aFz825bHUskoigkZeMYPs9IuZbkvVEtzzuEEauxqFDDeOMWjYEpQF
 qGjmPHFPR/a6UdS+PK2+Gt3hBic38/0BiG8ovmX1S6K/0/0mESv7mGG6sd3JoK2+igio
 CAJRBtQYuhazBR3N9eNkTwsYx8V/r25RsNJ6N1DKQi8HU54XXjGKAbfGcz66ROTM2qe/
 27dQ1Kdalz0wk5kvLGyXuJJuUTYdPkMjiplKsZXKygSFvYsBfCliqGZVjr/Q/16eeNfe
 Gp1xZumK5nWh9dNNJeHCh77KGyJIClg5bUDusJYcooJBkVcJaYy1q4IyxGWaXJMwXer3
 AYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759499260; x=1760104060;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SXz1taGyCnsjIOklnSCeHrVpWlskjbKzfy7PmtERQsU=;
 b=jHfSzUQuKE6ZwNjM9KLuCNHCTx+LP41CM+BcNNQYd5FP43ixQG/Ru01knEwYSj62mW
 IsjcAOjHvd0DM1taTXxt9/p1U861p1ExXaMq5DH2yEieaAuf7FSrxOca9Ts4uMPgiC3W
 dGS8QBtEa6jPfFlRhqOQoUA1lhnk8CqfMQcUc7My+ZJ+s7NPRSVBlqd8HnuA84xXASyp
 GahBeS22GSSgH2WQ4JeUBgWOucRqiwKNpn29vvPpGKg2eqHFVjRau07+bKBvXYuhj5pU
 DDEW2iWuJ7rcopV1JFiC+zQiO4S2/VWlkYdxAzrMLAY12JTWfNhFetNVyBQJIna0meF1
 +L+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh78HIcDnpi7XA4i0rrxj4C+eitYrltU/kufkoHrZyrnS9kRl91KRyExb8G6d8n8waDjDOii8okg52W4DMIfrK@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxpYs63w6t8u0U2L2YlmgrTdjhec2BaeU5r9TFvGw6+Q8WOWHKo
 J5MgBPoXUT/hfRD43AMvQoD0D3iu8J0x75rQTzR7QHAifJWgA2mNZzuH
X-Gm-Gg: ASbGncvbqMPQl+NTmI1L3JTgxnI934Yu0V3q0WaGeZ7NaLexqrsyRU64qtGNqpvuRS9
 rtjd7A+jtg5t6szPp+8MjUKX7vGzdGPWtsSWbHujGZnEqnHKhcBEvYqvl0tP5+t544vDMNKtLsN
 DMRhoAppYLIXRr2PfxoVXKAsxzH1oIP8BBfdZjwgco7wjINffevjH6pA8E9v3pezFhC4+68KZUz
 3VxeM9sv8LfLFBO2X7inmyjbpyfRuB72VBpNTOmXbLST/sHNJCZP9qNvbB6tp6MjTovpF0KQ2Zb
 faP55eevopc4fnXUUOsMh+dFwGqS3F7XrER7ZblkUI930fl4sC05mWi8RN5FYzWnvJKOYWMDWMZ
 p2vd3rcfJjSMBJPAvti0ulhCPlL3CmJRxLRs41hsOl3tZUGUP+wzKqJhIbRL//0c08Ujv7olBBQ
 SQRlMhu/OYICaHow==
X-Google-Smtp-Source: AGHT+IGT22rMOS7zpkVXCQktJ+CXsz5d60nlco16amfiTaRrE8PNlBBx+BmcaTn1+GNMGJdxBxc5Uw==
X-Received: by 2002:a05:6402:5250:b0:62f:2afa:60e6 with SMTP id
 4fb4d7f45d1cf-639346c8b7dmr3139059a12.7.1759499259990; 
 Fri, 03 Oct 2025 06:47:39 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-637881011e9sm4009560a12.25.2025.10.03.06.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 06:47:39 -0700 (PDT)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  3 Oct 2025 16:47:31 +0300
Message-ID: <20251003134731.470392-1-zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Current i_nlink corruption check does not take into account
 directory inodes which have one additional i_nlink for their "." entry. Add
 additional check and a common corruption path. Reported-by:
 https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
 Fixes: 81edb983b3f5 ("f2fs: add check for deleted inode") Signed-off-by:
 Nikola Z. Ivanov --- fs/f2fs/namei.c | 28 +++++++ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zlatistiv(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.53 listed in wl.mailspike.net]
X-Headers-End: 1v4g8V-0000GZ-Rj
Subject: [f2fs-dev] [PATCH] f2fs: Perform sanity check before unlinking
 directory inode
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

Current i_nlink corruption check does not take into account
directory inodes which have one additional i_nlink for their "." entry.

Add additional check and a common corruption path.

Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
Fixes: 81edb983b3f5 ("f2fs: add check for deleted inode")
Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
 fs/f2fs/namei.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index b882771e4699..68b33e8089b0 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -502,12 +502,14 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 		goto out;
 	}
 
-	if (inode->i_nlink == 0) {
+	if (unlikely(inode->i_nlink == 0)) {
 		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
 			  __func__, inode->i_ino);
-		err = -EFSCORRUPTED;
-		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
-		goto out_iput;
+		goto corrupted;
+	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
+		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
+			  __func__, inode->i_ino);
+		goto corrupted;
 	}
 
 	if (IS_ENCRYPTED(dir) &&
@@ -533,6 +535,9 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
 				ino, IS_ERR(new) ? PTR_ERR(new) : err);
 	return new;
+corrupted:
+	err = -EFSCORRUPTED;
+	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
 out_iput:
 	iput(inode);
 out:
@@ -572,10 +577,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 	if (unlikely(inode->i_nlink == 0)) {
 		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
 			  __func__, inode->i_ino);
-		err = -EFSCORRUPTED;
-		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
-		f2fs_folio_put(folio, false);
-		goto fail;
+		goto corrupted;
+	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
+		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
+			  __func__, inode->i_ino);
+		goto corrupted;
 	}
 
 	f2fs_balance_fs(sbi, true);
@@ -601,6 +607,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 
 	if (IS_DIRSYNC(dir))
 		f2fs_sync_fs(sbi->sb, 1);
+
+	goto fail;
+corrupted:
+	err = -EFSCORRUPTED;
+	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
+	f2fs_folio_put(folio, false);
 fail:
 	trace_f2fs_unlink_exit(inode, err);
 	return err;
-- 
2.51.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B3DC354C0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 05 Nov 2025 12:10:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgpfCsL5HcJ4819M2qB3aGiove/JIkFD8BIByqDPHPA=; b=Bkb++fICPi5NeoEgOCMNhPh+gQ
	GGDzgjKj/eDf/EGI4DAcLA55vPc/AQ4nJRwcU5AowODeEuGLBbMtRw0PO7FDab6uwYX/VuQvF/19w
	PpGRo5DNZ2SAo8KxoeoXwfHuYeBv7hHIegELbAcS1jPilUsY9djus3YMl8pj9Yh4y6wk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGbOv-0007Dc-4V;
	Wed, 05 Nov 2025 11:10:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlatistiv@gmail.com>) id 1vGbOu-0007DQ-0z
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 11:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s7tqhsuXnKDfa3LKYm+5yorAhNtlPrbMypXt017HtZM=; b=kpy98z0pXverJg6BUiTvDBH1ds
 RWlu8mBjO25MtBCGbQjEUWWr7+GV63zFGvMEoAzL4feu+q/S1LpeVcUgbqd+XXstX//Pr/7zWvHd6
 yhsSWFlAa91RcsGKQ3q9ZxvvMdQvXGN80W0gMYTA63/0+nSPtzGoE2gdteal0pL2CPi0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s7tqhsuXnKDfa3LKYm+5yorAhNtlPrbMypXt017HtZM=; b=FKmvvBTa7fVqGMbC69NnYF7dG6
 nQ2OmOJh6t9tusBul9XmsGxVOPdtNzpTxkD52DQmhhqLjrJjU0b7Ubf7M9srz0GAtQHEW51kDvtiR
 6W1nJNWid+onQQ3O80JKx9k+bgXxo3tCyG8gOym+YZEoAkjhedo5Y7av55MdHhSnf0Xg=;
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vGbOu-0005F6-Fe for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 11:10:04 +0000
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4775a52e045so4308655e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Nov 2025 03:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762340998; x=1762945798; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s7tqhsuXnKDfa3LKYm+5yorAhNtlPrbMypXt017HtZM=;
 b=LC8qACnX6jkwpW+AtbB4U2MXm58jTyQ7jXJF6Wqumrig13IaxfzVQ9FxMYr4WqxFuJ
 LHEAVvfJ8D7UMGRe45xtr4Ofg6QAdp5Q60niCkuoYu1jGy0OxR5lIIshSy0+/SN8HQG9
 JgZio5FElNPFPeqgCCjVNVtFcV2MPs5GeNwmxbFjDrbSHRgu2Iyj0+r/F5yDz/Ghscql
 30Oz/BaGE+GDscRmiY0CoSMpT9GbcvvVXUg4sPLePGmY17vSs7bPJQ1nONPrBU5Wt9dV
 ePQp/zgRzG03ZnWf3uh91UQlV0c4OsAKx7lDyDnxbhfz0kboZ8CkLGgQSLYqwPc0ZI0N
 goOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762340998; x=1762945798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s7tqhsuXnKDfa3LKYm+5yorAhNtlPrbMypXt017HtZM=;
 b=p4vnm7ad3h5LAs9ceoNA4MZluYMc2HIKg9ln+pwPh7rPVnbnSygIRMHiDEU5TyaHoy
 OEUPQqLdt9N5rQdc/kQha9N7GfG+CTRRhGdYLHulT2BfmeH8odAlMOPKm5/FmBfwFFvT
 9IW+1lu82e4vw/ImnYATZF8clj+LFAl+Toy2oRapzKsH25J7UdIssSbSslnHutI6TGe9
 PprJ30SbjrZN9i6pFSNvBitWKoqQe45J+M6DbNJIDcDzLyV69yvXEezjNI+3LGTvF5EY
 /zZepb5VGYrn47l/NHu5lUsXdYHMNt/LPdZ2ATfsprOtWjJJsJJdj9ypAEI+mlsJKga0
 z2ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl8tEaiklLiVLzJ8v156Zaj+eXnUwA8tzADJcp0hka44FgRRkNYycqC9ycaRycGuRnebkastPbHCMs3MWrAnHL@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwRfvydojNXDtwMGcAfSOlLqnwKTcEN6VOBP9tqYlogcpiZK5AP
 n5XBfzZFdQbtTVaVWacC496KTQYTIr1DRGsKRrtxqJEyq60NgG+ONa2C
X-Gm-Gg: ASbGncsnHF8n1Iz38MiG2bK7G1WoUiditfezr8t7dUkvYgf/U7Uh9+G3Yim5Q2lhTD8
 kuKrK0WdDHefBmr+C0l8F9fpBUMA8+9I9bzVnDK6b1ynXM7+h7wMcnhGK1q4Xdwby9VtyCqHouP
 xMEIsgST66cZRwGYxjMYUQ874y+xdlmJ9qlxUYu9plai5PWb05k2SX14CZOhDwyQCQOvVHUZ9LL
 nlVq3djV4X+I/iPo7teKzHnBo6wV7XbjauE5daQGXpm6y4YfxZEix183+XZ/46pGbRz8KZRSbKG
 +EHXqA3QjCTwfOlMzHm+Mryu/lCWZ0EPN/lI5KwknNfmysTqp2yvDZWdLLVaCCbJyZGleyAaTmj
 n9/5yuIP/ltdgipXV3IEbKnf1H9XQ8bw2PRQkduymFRn0GPDaKkH2wOaez+Dl2yRH9MU4BujQnV
 7r2+avspgQXoM=
X-Google-Smtp-Source: AGHT+IHJpcEdw1607F+Ey1V4LbwjmDQawpeGTA8lma3MVtT0pEJj48H/kPwEqm38rL5rx3ziZa4wPw==
X-Received: by 2002:a05:600c:3487:b0:471:115e:9605 with SMTP id
 5b1f17b1804b1-4775ce3d8a1mr28339055e9.35.1762340997771; 
 Wed, 05 Nov 2025 03:09:57 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c42adsm39728415e9.4.2025.11.05.03.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 03:09:57 -0800 (PST)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  5 Nov 2025 13:09:42 +0200
Message-ID: <eb59e101f0b201afb65cb40b38e1b1598039ac82.1762339963.git.zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1762339963.git.zlatistiv@gmail.com>
References: <cover.1762339963.git.zlatistiv@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Rename "fail" label to "out" as it's used as a default exit
 path out of f2fs_unlink as well as error path. Signed-off-by: Nikola Z. Ivanov
 --- fs/f2fs/namei.c | 14 +++++++------- 1 file changed, 7 insertions(+),
 7 deletions(-) 
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
 [209.85.128.54 listed in wl.mailspike.net]
X-Headers-End: 1vGbOu-0005F6-Fe
Subject: [f2fs-dev] [PATCH v4 1/2] f2fs: Rename f2fs_unlink exit label
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
Cc: david.hunter.linux@gmail.com, linux-kernel@vger.kernel.org,
 khalid@kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, stable@kernel.org,
 "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Rename "fail" label to "out" as it's used as a default
exit path out of f2fs_unlink as well as error path.

Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
 fs/f2fs/namei.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index b882771e4699..40cf80fd9d9a 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -552,21 +552,21 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 
 	if (unlikely(f2fs_cp_error(sbi))) {
 		err = -EIO;
-		goto fail;
+		goto out;
 	}
 
 	err = f2fs_dquot_initialize(dir);
 	if (err)
-		goto fail;
+		goto out;
 	err = f2fs_dquot_initialize(inode);
 	if (err)
-		goto fail;
+		goto out;
 
 	de = f2fs_find_entry(dir, &dentry->d_name, &folio);
 	if (!de) {
 		if (IS_ERR(folio))
 			err = PTR_ERR(folio);
-		goto fail;
+		goto out;
 	}
 
 	if (unlikely(inode->i_nlink == 0)) {
@@ -575,7 +575,7 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 		err = -EFSCORRUPTED;
 		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
 		f2fs_folio_put(folio, false);
-		goto fail;
+		goto out;
 	}
 
 	f2fs_balance_fs(sbi, true);
@@ -585,7 +585,7 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 	if (err) {
 		f2fs_unlock_op(sbi);
 		f2fs_folio_put(folio, false);
-		goto fail;
+		goto out;
 	}
 	f2fs_delete_entry(de, folio, dir, inode);
 	f2fs_unlock_op(sbi);
@@ -601,7 +601,7 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 
 	if (IS_DIRSYNC(dir))
 		f2fs_sync_fs(sbi->sb, 1);
-fail:
+out:
 	trace_f2fs_unlink_exit(inode, err);
 	return err;
 }
-- 
2.51.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

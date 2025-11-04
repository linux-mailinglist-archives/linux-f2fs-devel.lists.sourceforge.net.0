Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6A8C30058
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 04 Nov 2025 09:46:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgpfCsL5HcJ4819M2qB3aGiove/JIkFD8BIByqDPHPA=; b=DcvDpNeZVpjnH2Ou+CYXxWoQud
	z9T4PBgh0R4qp3C8Zo0or4YTB4otRbzh1rlyT9oZYiGIXANuQPwis5qjYVAuhnGgsj5KW77hKQyao
	eIXfw3z/8eA+3g3qoUXq76W/EhtnthmI8l/x442eMWKXNgEU1tXqs6An81L07MIFyL54=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGCgj-0005c2-48;
	Tue, 04 Nov 2025 08:46:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlatistiv@gmail.com>) id 1vGCgh-0005bw-Jh
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Nov 2025 08:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s7tqhsuXnKDfa3LKYm+5yorAhNtlPrbMypXt017HtZM=; b=eysiDB7DycC5LOhoMKrV3FL78e
 7yPVobC6oxw1+2lyVMZx9XmA047H3Ay5Yx+u/BbAzwnCfeJvzatp2QLlPJ98G1EhfGyKgGYj395MM
 6ONLbYyWslwBvXn+3Bxq8zPk06+tGMVzSR8DgwOyhex2PviDmbhA+8l5fcXyDYwpxnug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s7tqhsuXnKDfa3LKYm+5yorAhNtlPrbMypXt017HtZM=; b=lmJ+oYDcItEJMV0iys/Ztu5FPv
 9rftRC6NBKRi4ZWdqRwNMoo/sN+LCtCC9LqKM1uqVFfVzu3d4EYJjKu4du6j6LLaLWCht/H6pGptr
 p3LtAEJr7F8AdhxP0xSjDXinlYnY9pCso1uDJZU6N/H+6K1qQ9kk3f0MrY+m7r/iVu3k=;
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vGCgg-0007Lb-Ct for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Nov 2025 08:46:46 +0000
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-426f1574a14so3175704f8f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Nov 2025 00:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762246000; x=1762850800; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s7tqhsuXnKDfa3LKYm+5yorAhNtlPrbMypXt017HtZM=;
 b=B7X4FKKzVYZq/qkim6VqMXEA8choA9dPdQ79Vg84v8rLVgDBHp8UrZi8cKFofzH3yL
 9a1iD4NiMSJbfLrFq4IyLnRUzjQw9K8oFPg8iCC00ALJa+TdW0oEBr0932aAo9RXsWo5
 4imdAYvClbJq4F8klzyQFaVXcJscuPHV/0050SeDVTPwmYL8QzCmBrMsGdK9hfo3P8/W
 PpVQNShS4X4CdJ/rS8pkiNKVQwm2ylCCb17mXZuFj0MttOGVU7jhOqTV+pvTosjqZFM9
 e0az7xlV/Qu0ZuLFlPtdJa3sOtTG/hl0j4wV0D6IN+CPPqU+I0OV5QGUD8mcr1CBHXax
 Bm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762246000; x=1762850800;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s7tqhsuXnKDfa3LKYm+5yorAhNtlPrbMypXt017HtZM=;
 b=ScnLEs3RulmX5Jw66WL89weHYf3BQoO9C2e1f5CqYlk399hYLq8A0KLxy6M6NZhDo3
 p8NrefSwyTTL9C00ODuQf+QEOMoCliaP6yOCOdmYWRpiQn/3t8W3EpD0xggAFT8U644z
 Lo62RS5zz2PKN2MCciNqTeBpwHXq+AmZowr0JuBYpUdhhNxG9luhBYoAvTuQj58gntTM
 YjxSsGhn67q5l3YXVijylhVdMoQoPMPKtahbMaDh4YU8hkbCUgPXtAlWLSocIEkTdJFC
 iSUvggijmJCGXsBcF98grSNlnfaU3ZThrpt3VxjpAFDUA3rthuIRwZ24zkXdmgM7weZ2
 uBuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjGQDnyI/9QXdOk40hEOSY3QAut2ECzYVh3O/6fNvHce0XK4VFCe+GDZZnCGeXAOeN9QCZAWiNc4L/OldhV/eG@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxofDT4CHGRIZ66iXdWFxw7Lt10vDNLkxsIB4Kn5zYG5xOFEDL4
 16gsrZsCZKQ12X+5gpzCVdlebkXIq8Q5uCKapKWbv3wG0nROZU+T4Oed
X-Gm-Gg: ASbGncvxxS21LADugcy/46q5pv9/5ymxIKe2dAg1liyUPRhE0I4fbqA/NZeez01/Jre
 25emDLG+fGkjG5/51+jZH26nTnBg9Dv7bUH4RoOYZpOHxkVsXgHJ6y0VftrtMR5BeaAmJVnZwqq
 YxAnXAUsiou2XmZOJfsPBxL+uzXiL+2Mru2CnyBYiOZHX//sWDUOD/tydQ79eUEr63uPFla2lsr
 X4HhvdYcJYnG7py9ESnk5YegAZwqeVXnrVU2cI2/acmA93Te0xIIfWRTBjNeT960GSITgqjIuuT
 8HE0yvD9iJP7NSCUPBSWhh6HbsmW5KPKPHWTKZvvIduKLDz4J3LTlisbmOmz6gS8ehRZ/JqirLX
 X6b7ksZFidfuEzf26hUzmDK20RsWCQPuEpoNo8G54WutxXW2LyBz30n1DHYey0pgzcKJiKtqNqX
 7KNTeTKWrmIwo=
X-Google-Smtp-Source: AGHT+IFhb38nAneVZaZF5aM3zxV3KnOqbfuBCO2751W1VkzDFRk1Db97GT2Fg6NjK0dH9tASMGTE+A==
X-Received: by 2002:a05:600c:528d:b0:477:ad4:4920 with SMTP id
 5b1f17b1804b1-47730802698mr124956115e9.10.1762245999651; 
 Tue, 04 Nov 2025 00:46:39 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c394e33sm200375535e9.13.2025.11.04.00.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 00:46:39 -0800 (PST)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  4 Nov 2025 10:46:19 +0200
Message-ID: <e4057114d8f7bd12127e8e276c7b904fea84edfc.1762184787.git.zlatistiv@gmail.com>
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
 Content preview: Rename "fail" label to "out" as it's used as a default exit
 path out of f2fs_unlink as well as error path. Signed-off-by: Nikola Z. Ivanov
 --- fs/f2fs/namei.c | 14 +++++++------- 1 file changed, 7 insertions(+),
 7 deletions(-) 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [46.10.223.24 listed in dnsbl-2.uceprotect.net]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.43 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zlatistiv(at)gmail.com]
X-Headers-End: 1vGCgg-0007Lb-Ct
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: Rename f2fs_unlink exit label
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
 linux-kernel-mentees@lists.linuxfoundation.org,
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

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CBAC27EB0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 01 Nov 2025 13:57:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgpfCsL5HcJ4819M2qB3aGiove/JIkFD8BIByqDPHPA=; b=gCXOZ5Z73Z+Ce9kfEnY82AN41w
	iZTUp8PWiKNjElNBYcDxVxv/1G7dRHa80WBbL9TlIWQp7KYnBwbo59ysfoFSmZg7ZQLx7BNXXIVGA
	+tOpuAK+sHpqYRPgS3MNLQhKyXztrk0OIy6E7w4xLUlBMj5zpDBOYaXbvFjTOQwWBnzU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFBAU-0006Md-Ob;
	Sat, 01 Nov 2025 12:57:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlatistiv@gmail.com>) id 1vFBAT-0006MV-Hp
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Nov 2025 12:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s7tqhsuXnKDfa3LKYm+5yorAhNtlPrbMypXt017HtZM=; b=PmRddftiE68fsVni0QrBUinXVl
 rSYiHzC44Q+ly5H5+teLWryURo0FP0YPoKnQRmNBEelMr7quSjZ1mU07Baa5RYZkmWKNQFUSPzTlI
 sS91E97IEHRBRnPyUEOF50IgqeycpUHwe7/6tCd3MUrKtFPVuvpylIcCKCNzxnyOIzro=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s7tqhsuXnKDfa3LKYm+5yorAhNtlPrbMypXt017HtZM=; b=OjNWGByPVkOkYi21ucwyBpnyXy
 CLy9Hrx7NwKzNC/qHm6tMKp+js9xHwIn7971ERn/gwSHuAnGm2vkitpnBAh1PgwSokO5EYDTgYsgF
 WLHjL3G9jYsnHAoBVxws1ctJ5zNMgH8RoC+l4waHos1sv44TwHoQ13fbFZvF2LzX3fss=;
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vFBAT-0008Py-6U for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Nov 2025 12:57:17 +0000
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-477442b1de0so1143605e9.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 01 Nov 2025 05:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762001826; x=1762606626; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s7tqhsuXnKDfa3LKYm+5yorAhNtlPrbMypXt017HtZM=;
 b=DfhKQh2vaH+5U1711cm8zMJS+BuHOnpnLPrx8vBWjRIjIpw+hFxMAA+m7i7S4SKqlY
 HJE1if5A1hwzLxtYEl/bW0UVZS8FPwVayyEM5SZubpcwaCGDovD2Lhsnjs/kGEjYxY05
 Ml8qxWtaefaug8scaf5dUtjopZ6MdkiXISFbEvmFCOjNqXYB/0qNAgcXHPZn5yfpxXQ0
 8jVoXLEYMzePrq2w3rH/G8nVcrPm4kvi7oqECCUFOGrCR4hUEtGoUjq8kgExxFeQm66r
 aNBYT2EYQozbQFPyPkaSXD0XOEAK3McOV1LuKHIf8Xctz5hckiifJk9RBtbVxs2BDjIF
 DgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762001826; x=1762606626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s7tqhsuXnKDfa3LKYm+5yorAhNtlPrbMypXt017HtZM=;
 b=FKrBBz71F0dW8x48PeQNxSQgzpcHBErpkxnJAGIJ93CCpk5K7ga9meXhxH2+7HfJeV
 JnGMFFnC8wVXvGCyVv9hg6NIdls6XYNQndZMN/1BAmpblWXCDANHX2TAJJGKCtR9xzOG
 gepWuT+hoge4mHHaFdzzXF83A3P5J41b7nGdM67XJ4HPG3bcBP03KkmR/f5JOZFE1x28
 LEwb824ez/hCU6XuSt/6jAJRUJ4RHxaTF1AZ1NUUyi5z9gQrgURdwzNsMSGFhxNo7x8a
 Di7iiEMas9CWrEgnQ1FsawvU74xeHgdzPBF9kG7e90mjbQ8mkxzuBS5XoZHZoTJeHqYG
 +oeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCKn87auDLGm1QrB7OrP0ZXonWqZdgmVne9d3ZipubjrRqynQmo3zYt6MoKfGFR7uH3UjCJewyL4jMUONjI0TP@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzX6BpWhDLUyOs4CNgqya9BuFV87KnejOo5cJOIDOEd2si7R6AT
 ifBy9VwasjeIFXRVnGb5EhHe6RQ51uUfAVyRj1wE8QHJPv5LzFsNiQHX
X-Gm-Gg: ASbGncs5rjkaY/ayefdGPJ93VDPZGkDhp2/KDp6gelw8O00Ba5/eK+pF30jksOPlmwp
 7t3pFCkIsyKyGo4z2D7xEIhqqQzL5v92nYvY7BAcnGn7ujbSBNxgXdvvjGS29dvtWIAi4to0+bt
 I01uPEglm6uH4Sbrq5D8au8TvQjQLX8w6xoweZ3kWY+7TOuMuAFZq/2/culpdFwUqaJZ9et7nvp
 ARqcxe5+j1r9tHLXjphtDlKBdL5mMBr8XrOKvm74DsNb65d8U6miI25oQS13wD6ciPkKc7KSHmQ
 nxYBCZA4OyFtJLVj5naBpgjRgpShfz2B44hfpkdzXnQFgbackCNTLif1+H5CP3l99UOHPOYkwjv
 I+E4/pYyq/UXR+rl8ej2vZOI/q/LFCsqEstT1tGexrv8ELQP5qSnj75PzcV20W1W20Orpv2SArh
 m8IIOh+x2r7qsuGhmVvmO9Yg==
X-Google-Smtp-Source: AGHT+IF+6hMxdPsypq2OzLkXb6zVTa57M1Qc3zam7TmfTtf8ewM/quVUBy/DpNUn1Mz5toz+WfQ5EA==
X-Received: by 2002:a05:6000:40c7:b0:425:76e3:81c5 with SMTP id
 ffacd0b85a97d-429bd6827fcmr5619016f8f.17.1762001825457; 
 Sat, 01 Nov 2025 05:57:05 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13f2b5asm8827647f8f.40.2025.11.01.05.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Nov 2025 05:57:04 -0700 (PDT)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Sat,  1 Nov 2025 14:56:15 +0200
Message-ID: <fe3a183f034893e68c6f7ba2773353cfac8de19f.1761993022.git.zlatistiv@gmail.com>
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
 [209.85.128.47 listed in wl.mailspike.net]
X-Headers-End: 1vFBAT-0008Py-6U
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: Rename f2fs_unlink exit label
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

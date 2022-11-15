Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C83986291E8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Nov 2022 07:36:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oupYJ-0003fn-Hf;
	Tue, 15 Nov 2022 06:36:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ssawgyw@gmail.com>) id 1oupYH-0003ff-BU
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 06:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+HKZAEUVQQUBttDmyc7IKUPKjfreDh+ajk8XM2NRY3o=; b=eOnnkobUcRCPCqKnFKptojWUcA
 CJI1YvAbNLz/LtJQpb9FYbcZzK1kyox+aKI7ZGTOzJwSEJQgr0Tdv8UgiiaFcUF8N/rfwZMmxMozi
 aYmcHacUaqQvUFeEOHP7TgdXQhqmSF/kL3efojkRriQc7g+okIXr45DM9F7/UBe4tYh8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+HKZAEUVQQUBttDmyc7IKUPKjfreDh+ajk8XM2NRY3o=; b=IkRCciORrUiGZX7dLRgpfe5F/a
 Xf91fVEdBr7BjEFKWvDB4ycxMFOeb+RlRNUnfrsA368t68M6fsIppZpBPsSm317/C9TTUOy6qTsYR
 Uz0qJp9QztGI9OGZYR9EWx2fIzbvD11oWMBl8GEgkispQA5PCO3cDjT6a/Z2XiS5HgnI=;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oupYG-0008Hn-OB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 06:36:09 +0000
Received: by mail-pl1-f180.google.com with SMTP id g24so12299039plq.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Nov 2022 22:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+HKZAEUVQQUBttDmyc7IKUPKjfreDh+ajk8XM2NRY3o=;
 b=a4yJy1ooSkHn+oYyYqCVoMQVZzD/uU5LFhOK0nPMBaEpYkghqShsP/rETQ1BHs3HXe
 Mty1rEssYGt5wbQmyhAEQGzaLj3QyYSHjvB8UhQKQ28xgmfxW5X7KydjCIbc6LfRS69H
 1mxMokS35vYoggGeNRZvbkKyNsSwiLASJuLqZNTLiwlrYLrySOYaEwJL0r8GsTRu4IvL
 EBzJSjb5XODMKQHHInsT6rpxccfOeXgs7ViB9j6h0xJ1/N8jd6q3C2lIu04kAx3EIQQ+
 Yl2UUgfahLk2gRljblLqXdHpHboy37jImoK2/+B2XV5VvITePgTI0jlyQvwmIUCKHG9E
 utng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+HKZAEUVQQUBttDmyc7IKUPKjfreDh+ajk8XM2NRY3o=;
 b=qOjovmzgliV+GCWbc58CQIsECBxwc6TijqzlvmBFKjpFAtbyIhDiNr8omSQIYtNGli
 tz3CbGolfa6k7zvH0OGzcjFvYfliQRfHk9tC+/aGCeYsnnnBYHvrlvmeWXrS+ALRxdfg
 tEVMagafFkzXTYifNlMdRzkzYmMt1sq8cLHp4cW/BZ3b1bCKdwvFw0gHtsEvWElQfH1B
 0MC4MsEr7aSzuH0dK+61cnCU6iZ+LZeBvUFq8VuWo5ItA1symSZRv6UAjp+cu9IdLRP3
 pOsmVcH5aE3jsGDcK3s93TylkrJDDrJ3aNZHgzzHwv2cgic8NGWQxVSDiMI5T4dXaHft
 WlWQ==
X-Gm-Message-State: ANoB5pnZUAu1hWPBZADJPNDiXhgfxY6CS/diN21wvBEc5Pf76FclgeOx
 n/TUOnlhs3Rug5uRwWNnUm4=
X-Google-Smtp-Source: AA0mqf43JnCfXobNbI1CW7VnWqHCB8eV8NhwkeGxU6gwreo1mX/VPKdstNMos7HR1AZAx69v61zLOw==
X-Received: by 2002:a17:90a:6e04:b0:213:22d:b2e2 with SMTP id
 b4-20020a17090a6e0400b00213022db2e2mr713827pjk.148.1668494163260; 
 Mon, 14 Nov 2022 22:36:03 -0800 (PST)
Received: from VirtualBox.. ([129.227.152.6]) by smtp.gmail.com with ESMTPSA id
 e4-20020a170902d38400b001822121c45asm8767874pld.28.2022.11.14.22.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 22:36:02 -0800 (PST)
From: Yuwei Guan <ssawgyw@gmail.com>
X-Google-Original-From: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 15 Nov 2022 14:35:37 +0800
Message-Id: <20221115063537.59023-4-Yuwei.Guan@zeekrlife.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115063537.59023-1-Yuwei.Guan@zeekrlife.com>
References: <20221115063537.59023-1-Yuwei.Guan@zeekrlife.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Before this patch, the varibale 'readdir_ra' takes effect
 if it's equal to '1' or not, so we can change type for it from 'int' to 'bool'.
 Signed-off-by: Yuwei Guan --- fs/f2fs/dir.c | 2 +- fs/f2fs/f2fs.h | 2 +-
 fs/f2fs/super.c | 2 +- fs/f2fs/sysfs.c | 5 +++++ 4 files changed,
 8 insertions(+), 3 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.180 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.180 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ssawgyw[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oupYG-0008Hn-OB
Subject: [f2fs-dev] [PATCH v2 3/3] f2fs: change type for 'sbi->readdir_ra'
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Before this patch, the varibale 'readdir_ra' takes effect if it's equal
to '1' or not, so we can change type for it from 'int' to 'bool'.

Signed-off-by: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
---
 fs/f2fs/dir.c   | 2 +-
 fs/f2fs/f2fs.h  | 2 +-
 fs/f2fs/super.c | 2 +-
 fs/f2fs/sysfs.c | 5 +++++
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 21960a899b6a..eecbf5d6b002 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -1000,7 +1000,7 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 	struct fscrypt_str de_name = FSTR_INIT(NULL, 0);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(d->inode);
 	struct blk_plug plug;
-	bool readdir_ra = sbi->readdir_ra == 1;
+	bool readdir_ra = sbi->readdir_ra;
 	bool found_valid_dirent = false;
 	int err = 0;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e6355a5683b7..384840216e7f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1693,7 +1693,7 @@ struct f2fs_sb_info {
 	unsigned int total_node_count;		/* total node block count */
 	unsigned int total_valid_node_count;	/* valid node block count */
 	int dir_level;				/* directory level */
-	int readdir_ra;				/* readahead inode in readdir */
+	bool readdir_ra;			/* readahead inode in readdir */
 	u64 max_io_bytes;			/* max io bytes to merge IOs */
 
 	block_t user_block_count;		/* # of user blocks */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3e974c003b77..0d1adfdd0603 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4068,7 +4068,7 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
 					1 << F2FS_IPU_HONOR_OPU_WRITE;
 	}
 
-	sbi->readdir_ra = 1;
+	sbi->readdir_ra = true;
 }
 
 static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index df27afd71ef4..53fbbb87dd0f 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -649,6 +649,11 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "readdir_ra")) {
+		sbi->readdir_ra = !!t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

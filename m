Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F068856E70
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Feb 2024 21:17:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1raiA7-0008Nu-0x;
	Thu, 15 Feb 2024 20:16:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1raiA5-0008No-Cv
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Feb 2024 20:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cRbCvS6akiTk5hc1Brxft3yENJUwXLjbz8kHtexxn8g=; b=Dyz0gK1AUOvvP2JZdheTR9ZcmJ
 6PsFydLdZIt6ht8SDQQJKxoz0AxlNiQcZ9jupSD+eI9eOZe/5PoDykKIrc33SbMAl/E0ZiIjUh5/b
 LECuGEh5erWkOKV5rsT4VJddLveIat6FVRNI3Bj/e3zwy701RHkSPOUZalLK79OJVqR0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cRbCvS6akiTk5hc1Brxft3yENJUwXLjbz8kHtexxn8g=; b=l
 L2DbmM8xPWd1dVxIn0rT3VMg73S/rbAUGzQkIHSr2Fv/j6MOXeS2kxPELnbnjmnQaSaxI9wUtkcUu
 YIoVzIdNXtu2rfNxwBTmram8y/K6J1X+rn3FM3aFFLNvo3OL3GfzTzi1AP0P4G1uIsq/yELgqI5Gx
 LlzDe15bMzUx2pdI=;
Received: from mail-io1-f53.google.com ([209.85.166.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1raiA3-0002aK-I6 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Feb 2024 20:16:48 +0000
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-7bf7e37dc60so68380739f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Feb 2024 12:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708028197; x=1708632997; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cRbCvS6akiTk5hc1Brxft3yENJUwXLjbz8kHtexxn8g=;
 b=GM4qtGhAd34KC6TZZir6wufMKlFNKBJ7Ac+c2fAxX+y8zY7Iaf/iDpwkxXTh79c087
 wwMA+kICyq1/bDNqkk+hbucnl5Y+x4KYiuUXox4lcFuZY/S/fvIH5pVeFsJTrhoaJTbp
 L4NQPVC/eRi7hD7PIVVPey0M4ObSGfJJD/wTJb+5cvkTPdubocoZQetvZ1uZ7BHj5AEI
 48+lJdoJ+V4lPFp5G+y15chW/Ydzw3a1ZoM4cpT7ro0CL5Dw0JNSiLUpYAZtY8JB0ASy
 +XaZWKbf3HrfVunBR5SgRCt2aQmNSnTNDTt1M3Aduhh+DiTjVYYuKNmlweh6uU9sF5Qi
 BGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708028197; x=1708632997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cRbCvS6akiTk5hc1Brxft3yENJUwXLjbz8kHtexxn8g=;
 b=UfQwZVof9I/70nAzIgEXwB0qttt9xNUDuRLirkGbNbr/a9V0J4pFPrJkDwH9gznrRy
 U8Emp/Wo0kAo1ePPmb471V9q+hw7AewAAd5WoUi6pTwulRfBN0r7LHDxKZGwb+dizicV
 OBJuamB7ljdiKp0tJnD1OuraeLvP6MzpBpE7q96KjjJzhhohZuHturIvTHYTRjdA/gcX
 jGeNXIkDat7ujosKYthnbErXc6Hl8oqwa/XAAIGTlhxHN6wRgdMsKo88gKisCZPwq/pr
 Gu0aLu/rS/7rZYvaheKQ5NdfujSUwAle71WDJSs1m8fjTCrSd1uioMSAyUdM+eONR8sZ
 sMRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSzgns7MtJ2+oPQbCIAemzlSYnDQsbTKd1W6e4ZgsVxiYbfOd/+l8KbL+fiKu+Lr5OMgrguLFqFECEFuM/zfldlvPETkTgoCIpEFhbIlDuH1ER7HGmZA==
X-Gm-Message-State: AOJu0Yw3oR6HS6C2stxa+NDnEM7YdZE8Tm5lKOL7XDB44XZZOyJ91tES
 Mdo9d96uvuGOOiJo672k9lsyHKocW6R8xp7SKN0o7s7bxSWatRhi
X-Google-Smtp-Source: AGHT+IFRY0k5Jgy0p7AxCyDD24+LQh095SXYW99gcqvx7TZpeAvHu8G/N9rBnTECSPbh2xe6rqXu8A==
X-Received: by 2002:a05:6e02:1182:b0:363:ba17:8dd with SMTP id
 y2-20020a056e02118200b00363ba1708ddmr2921934ili.15.1708028197279; 
 Thu, 15 Feb 2024 12:16:37 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:3772:8174:2d71:3b60])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a655204000000b005dc26144d96sm1628482pgp.75.2024.02.15.12.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 12:16:36 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 15 Feb 2024 12:16:33 -0800
Message-ID: <20240215201633.2365333-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Fix to support SEEK_DATA and SEEK_HOLE for
 compression files Signed-off-by: Daeho Jeong --- fs/f2fs/file.c | 21
 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.53 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.53 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1raiA3-0002aK-I6
Subject: [f2fs-dev] [PATCH] f2fs: support SEEK_DATA and SEEK_HOLE for
 compression files
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

Fix to support SEEK_DATA and SEEK_HOLE for compression files

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 21c3aa93a8db..aa19d8bed479 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -394,9 +394,20 @@ int f2fs_sync_file(struct file *file, loff_t start, loff_t end, int datasync)
 	return f2fs_do_sync_file(file, start, end, datasync, false);
 }
 
-static bool __found_offset(struct address_space *mapping, block_t blkaddr,
-				pgoff_t index, int whence)
+static bool __found_offset(struct address_space *mapping,
+		struct dnode_of_data *dn, pgoff_t index, int whence)
 {
+	block_t blkaddr = f2fs_data_blkaddr(dn);
+	struct inode *inode = mapping->host;
+	bool compressed_cluster = false;
+
+	if (f2fs_compressed_file(inode)) {
+		block_t first_blkaddr = data_blkaddr(dn->inode, dn->node_page,
+		    ALIGN_DOWN(dn->ofs_in_node, F2FS_I(inode)->i_cluster_size));
+
+		compressed_cluster = first_blkaddr == COMPRESS_ADDR;
+	}
+
 	switch (whence) {
 	case SEEK_DATA:
 		if (__is_valid_data_blkaddr(blkaddr))
@@ -404,8 +415,12 @@ static bool __found_offset(struct address_space *mapping, block_t blkaddr,
 		if (blkaddr == NEW_ADDR &&
 		    xa_get_mark(&mapping->i_pages, index, PAGECACHE_TAG_DIRTY))
 			return true;
+		if (compressed_cluster)
+			return true;
 		break;
 	case SEEK_HOLE:
+		if (compressed_cluster)
+			return false;
 		if (blkaddr == NULL_ADDR)
 			return true;
 		break;
@@ -474,7 +489,7 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 				goto fail;
 			}
 
-			if (__found_offset(file->f_mapping, blkaddr,
+			if (__found_offset(file->f_mapping, &dn,
 							pgofs, whence)) {
 				f2fs_put_dnode(&dn);
 				goto found;
-- 
2.43.0.687.g38aa6559b0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

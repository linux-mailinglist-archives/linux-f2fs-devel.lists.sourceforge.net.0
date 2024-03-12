Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4435879D17
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Mar 2024 21:50:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rk94Q-0000UV-GN;
	Tue, 12 Mar 2024 20:49:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rk94J-0000UK-EV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Mar 2024 20:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bB56P06OHjbd5cYcDuPAUzuPbwD4N6mkH0bYvbyASco=; b=bAdis8QUzPU4i3RfR0T4ghjaVO
 b/5nCs7T/Gc+cSsOS2j8qfA/mlN7jFd4WG65j+BO5qasBQXUjvdF/KnjcuwXwN5doaQ0sugjOdTuo
 0MsC+aGvVdtR7zwLKHup/w1Pl/NE3rfl8QZ2+aSrMyRq/TB/DrWRYzhZIQi+PJwCaEds=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bB56P06OHjbd5cYcDuPAUzuPbwD4N6mkH0bYvbyASco=; b=F
 prJcW9UlKTwvG6Vx3ljJre7dzQ5NqKXoUPIsJaZjVN8OH7nqiyGk+M45L0m3iFPRbbrrUSKRcStoo
 zBseSfRhr0a7ExfARe/6Zh4TwviuZCN2rJJ7eyW6XMII/hPq8vrOBtreenHJsr6C2kIbMcqcoZufd
 laTxhf2VDUDPPs4M=;
Received: from mail-pg1-f171.google.com ([209.85.215.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rk949-0003Hh-BD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Mar 2024 20:49:51 +0000
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-5ce2aada130so348307a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Mar 2024 13:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710276582; x=1710881382; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bB56P06OHjbd5cYcDuPAUzuPbwD4N6mkH0bYvbyASco=;
 b=Eu9R2gmCpX+eBeKVkgGRfnkS8RhU6JdTF3MnDBZxeqYw1MJuUHJXVQcYH0WeATXFNX
 BiYFkxB84ih4kXz/4BwSNW7Ot7USNUIUiiUJk3pWbIfl72tGr27PWuey1vw2bjRLop9+
 1FpEUXGc2CLY5steISEmTF9mZYYH3BbF/0iBQk63/wmjMO1sKvzxS74qvUr9C0lSjhRe
 jW9jlTtmWdBd+rOreaMywaOudYO4f1mYzUSMDKECdITImHUDwDeRbkkEHyaTxG24bCkF
 5IHVYKrDE06eN72OL5THkrvnOrunnigl5ILQMfQxDeXovzh1CGI4xWoMpjCK7ChMkelQ
 9/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710276582; x=1710881382;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bB56P06OHjbd5cYcDuPAUzuPbwD4N6mkH0bYvbyASco=;
 b=jTOndAtHseiNugUQMHEjTPBtvQ5EFW8lpsJC9IiX/BsSe3e2zTUlNXWSBFcq2CabFy
 LiJV/j7EZQex9k58kR5v7bhF7Xd9c2uaOTEbJxe2j2rL/PoOlFMMGXHKusXiUTlX7FWj
 9YMW4qDDQ+veudON68jqoqRd0PsGkOy6guYLmOi7zHE8nK9O+hssT8oJjsQ0seoYi3SS
 0JR5ypQNn4jo9lrqqovOsRWtFGPaa/SNzM7emvqZlvANdWAjbNmJhkkyAtRTZ5C+2UHe
 +yIxw69Zce9SrEel64/U34KiXsW/VinXEioB5aaiCPWnQgKCOdj1c+z+g2Z8f3aJaS94
 ZMyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTaawdb66B/HsZ9zaUEiMwX1cJp/tMb/m54fPw/3OQ8YoKjZ+TKvjwd8tXhielyMDci8P/tKCgP1tDK6mIt8nhjc9XqirfAGyQiUGURZmyLI5d/SNq8Q==
X-Gm-Message-State: AOJu0YzKf9qsnFqQtramRhZrUsTxCqmNnvZhzgFJwHpDhR2K+EZvsCNR
 frLt71YHyPos0Yh9r3PklIXo6s8j6kZWKyD7bjse1qkBeYGItSk0
X-Google-Smtp-Source: AGHT+IGCBd+YyZi0mfy1tRQSsTshYWkyuEEX55fLUykzElnQVOW63tOvfLKwEZDTGkkdyJ1s08PYAQ==
X-Received: by 2002:a05:6a20:948e:b0:1a3:1136:e71e with SMTP id
 hs14-20020a056a20948e00b001a31136e71emr3755548pzb.36.1710276581649; 
 Tue, 12 Mar 2024 13:49:41 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:2d5a:c16f:aa67:a34d])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a656811000000b005dc8702f0a9sm5714191pgt.1.2024.03.12.13.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 13:49:41 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 12 Mar 2024 13:49:34 -0700
Message-ID: <20240312204934.2249696-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong In a case writing without fallocate(), we
 can't guarantee it's allocated in the conventional area for zoned stroage.
 Signed-off-by: Daeho Jeong --- v2: covered the direct io case ---
 fs/f2fs/data.c
 | 14 ++++++++++++-- fs/f2fs/file.c | 4 ++++ 2 files changed, 16 insertions(+), 
 2 deletions(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.171 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.171 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rk949-0003Hh-BD
Subject: [f2fs-dev] [PATCH v2] f2fs: prevent writing without fallocate() for
 pinned files
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

In a case writing without fallocate(), we can't guarantee it's allocated
in the conventional area for zoned stroage.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: covered the direct io case
---
 fs/f2fs/data.c | 14 ++++++++++++--
 fs/f2fs/file.c |  4 ++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c21b92f18463..d3e5ab2736a6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1584,8 +1584,11 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 
 	/* use out-place-update for direct IO under LFS mode */
 	if (map->m_may_create &&
-	    (is_hole || (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO))) {
-		if (unlikely(f2fs_cp_error(sbi))) {
+	    (is_hole || (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
+			 !f2fs_is_pinned_file(inode)))) {
+		if (unlikely(f2fs_cp_error(sbi)) ||
+		    (f2fs_is_pinned_file(inode) && is_hole &&
+		     flag != F2FS_GET_BLOCK_PRE_DIO)) {
 			err = -EIO;
 			goto sync_out;
 		}
@@ -3378,6 +3381,8 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 		f2fs_map_lock(sbi, flag);
 		locked = true;
 	} else if ((pos & PAGE_MASK) >= i_size_read(inode)) {
+		if (f2fs_is_pinned_file(inode))
+			return -EIO;
 		f2fs_map_lock(sbi, flag);
 		locked = true;
 	}
@@ -3407,6 +3412,11 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 	if (!f2fs_lookup_read_extent_cache_block(inode, index,
 						 &dn.data_blkaddr)) {
+		if (f2fs_is_pinned_file(inode)) {
+			err = -EIO;
+			goto out;
+		}
+
 		if (locked) {
 			err = f2fs_reserve_block(&dn, index);
 			goto out;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 82277e95c88f..f98730932fc4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4611,6 +4611,10 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 			return ret;
 	}
 
+	/* For pinned files, it should be fallocate()-ed in advance. */
+	if (f2fs_is_pinned_file(inode))
+		return 0;
+
 	/* Do not preallocate blocks that will be written partially in 4KB. */
 	map.m_lblk = F2FS_BLK_ALIGN(pos);
 	map.m_len = F2FS_BYTES_TO_BLK(pos + count);
-- 
2.44.0.278.ge034bb2e1d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

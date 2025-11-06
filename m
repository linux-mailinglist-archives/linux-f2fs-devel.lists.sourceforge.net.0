Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4A5C39C6A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 06 Nov 2025 10:16:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/uz5eyLIcUQ29aTTVjzyj//A8sy1T5Zi+0soRUjn/g8=; b=dYkJtm2zOhrqcl7GicPhlu4Um3
	QM9ghhHu2EkIcGbjKqVmwRuYyR8bLrUV4HQgjvX3evtSv7wa+XeLBRxboW/Bm3zdnuhsSNxBl6xf6
	1qnjmMh+HvlV4fLgyaJUccciMGJMLKiLeRf1Ht43L4hwuD6L5Mwk5LGT+O2wlEuVi+Y4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGw63-0003eo-FF;
	Thu, 06 Nov 2025 09:16:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vGw62-0003ee-J6
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Nov 2025 09:15:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ooF7eBbdBLn62FfA3kMOSkfefrsd2vAI7cR0pAFRTys=; b=PahOrQ5lZde+VyWQngV7cxy74y
 vz9UJbHtlj7c38khuFlIUwl6Ky0KVg0Wrs1r8YZGz7ByZlFdXjMwDoDytfJekPX5tjlPxMqJOuRZf
 P3ROZ11pblj0F8xIbNFM5y5FhOxJ2OSHNoA3WBClCv+gKqa5WHJD7KbKt9AZfN4JJwXA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ooF7eBbdBLn62FfA3kMOSkfefrsd2vAI7cR0pAFRTys=; b=M
 Ifv8CXsfOdnSfp0iRFyvyl8ZMp9RMXVdTgmzhkszKqm3vSq9Hqklvgc7FPJcsr6PBfUbL8R8+OilQ
 kTjExoivhNScHqWRWitVYJZHPoaipbGbwcMOHoDDitk6sstRSr3WihI/x/pMJ8vVjepCPEbFgKlwG
 mkFmdLKXwBLQRitc=;
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vGw62-0004Cx-RM for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Nov 2025 09:15:59 +0000
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-33292adb180so759788a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 06 Nov 2025 01:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762420548; x=1763025348; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ooF7eBbdBLn62FfA3kMOSkfefrsd2vAI7cR0pAFRTys=;
 b=dcoaQjnFLyFndNkhKnkb3HKQepUoNn67p+QanFubKD6PDUmgbD2RSkxt/4BWx8RKuy
 5WSZlXFIskqnazjSLDn3pyl+dGq+sXMio5t1ujIn+Sb6IR9zP1cNTVuVdviKz/0F3Gy5
 cF44JK3eQqeZ5bBcGDzzMh0g26Mc4GILUBTYa7bA7TWYqSrVV1kC6+TLo/EeLp2iIvks
 EtreXVh68OqGYAz0UL8moEcf+PgUw8omv66mkI4eI7FA3x1B/AB+WALRYVawJHoBc76e
 KFPe4PN3+29R5NriXX7khOR9T1r4ivMYtbIycQptvtQOpoSIzEmzsJGcRKDAPjySmup6
 gzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762420548; x=1763025348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ooF7eBbdBLn62FfA3kMOSkfefrsd2vAI7cR0pAFRTys=;
 b=Icj5PIahPIWw+/ulfCtHpu4ZVaLM4Yt/CmY1DODPTVVgcNs6odyG3Mi+ijUAyaQMUp
 5eZ9dpjzvomvIWrx64u4rxzFq9zzCsYNG3oWpp2pBE3BF8q9+L7cJKRnismQHhosyom7
 3YhCo9eG/BIDjsR0Wq8TC0G6ntLItartElyS5URjvnz4VZm2FtXiGypT5Z374UaCkjCe
 Gyz/qqXsJRn/kqnVJQYAgTSquPn8T1mE1kaKjykvyIF3qnpek+kRLlhYYEjOkCDcPinT
 Z9qeDJYcHgcb45kU2zGQkkRG4UoXNn+olkmNpROHxm54tMyIZIq2+93+BYxZcl6pRCYg
 gAyA==
X-Gm-Message-State: AOJu0Ywdv2F6EEqUMjTEuiW6jrKwk80O4FZsfoNvI0R/Ptub5j4/eAbz
 r5ASsWTIMEwBU3hCqZY6bxXv9VfoqQRmWio/y/x0+LWgmVA37ZO+IWBw
X-Gm-Gg: ASbGncugTm5pSmRONkSbUJNKLkerSHyXuUjLtToK+6eoA8BniY2ilRD6VMN8k4NcCRG
 iiMZCV+nWlxvZbaIQ03zzlKG5IRff0/msbIRnhXwDmT5jtOVr1cahfAkEwShTbPbrqESvn+pEPB
 Z5H+PrMjuk8z5ebP+57ceBpXC81UgV/US4CkhOb9YpXEwzk87FSCO3nrkyjzp73MaRbnOyp5Nhi
 dHOoP9ZIf2Fb45rGY7GzAve3CmrLCr3I4eZ88Lvhma7dHF15V/613xLYko6xeWX4yS6uUbwZtE/
 P7QrcTLFGakrE/WnfwcyfE+go/nBbHFpucO2fTC1LxXzcUkJZixRA6jzmNOopyUFU4eqUnMDEAZ
 jsNm8RHCP4Vpo83uhSnaZQl0lqN0TAd4bH3lJjjjD7GhK1ph04Ke0iEU5hlL6xAPZRbM7bAhfgm
 jSZ7a2icYYbUOlAirQ9AGMZBGpPZBTvxyZyAj1KD1bdkimkswy2eNvKXkuramzxQ==
X-Google-Smtp-Source: AGHT+IE0/0uASpDq1xz87IB5fvtpP41z37TIUUIbgllMm72WVwibonFW8qVN6rQmu2/nSNLR6+IHmA==
X-Received: by 2002:a17:90b:3c82:b0:341:194:5e82 with SMTP id
 98e67ed59e1d1-341a6de6b6dmr8050578a91.30.1762420548049; 
 Thu, 06 Nov 2025 01:15:48 -0800 (PST)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-341d1258262sm672051a91.13.2025.11.06.01.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 01:15:47 -0800 (PST)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu,  6 Nov 2025 17:15:36 +0800
Message-ID: <20251106091537.3063566-1-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang sbi->unusable_blocks_per_sec is used only
 within CONFIG_BLK_DEV_ZONED sections,
 except for CAP_BLKS_PER_SEC and CAP_SEGS_PER_SEC.
 This patch renames unusable_blocks_per_sec to unusable_blocks_per_blkz [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.54 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vGw62-0004Cx-RM
Subject: [f2fs-dev] [PATCH 1/2] f2fs: rename and refactor
 sbi->unusable_blocks_per_sec
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

sbi->unusable_blocks_per_sec is used only within CONFIG_BLK_DEV_ZONED
sections, except for CAP_BLKS_PER_SEC and CAP_SEGS_PER_SEC. This patch
renames unusable_blocks_per_sec to unusable_blocks_per_blkz and ensures
that unusable_blocks_per_blkz is properly enclosed within the
CONFIG_BLK_DEV_ZONED.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/f2fs.h    | 2 +-
 fs/f2fs/segment.c | 3 +--
 fs/f2fs/segment.h | 9 +++++++--
 fs/f2fs/super.c   | 6 +++---
 fs/f2fs/sysfs.c   | 4 ++--
 5 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5b4e9548a231..c47a09c7f7e7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1661,6 +1661,7 @@ struct f2fs_sb_info {
 
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
+	unsigned int unusable_blocks_per_blkz;	/* F2FS unusable blocks per zone */
 	unsigned int max_open_zones;		/* max open zone resources of the zoned device */
 	/* For adjust the priority writing position of data in zone UFS */
 	unsigned int blkzone_alloc_policy;
@@ -1732,7 +1733,6 @@ struct f2fs_sb_info {
 	unsigned int meta_ino_num;		/* meta inode number*/
 	unsigned int log_blocks_per_seg;	/* log2 blocks per segment */
 	unsigned int blocks_per_seg;		/* blocks per segment */
-	unsigned int unusable_blocks_per_sec;	/* unusable blocks per section */
 	unsigned int segs_per_sec;		/* segments per section */
 	unsigned int secs_per_zone;		/* sections per zone */
 	unsigned int total_sections;		/* total section count */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b45eace879d7..54ad774ee338 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -5567,7 +5567,7 @@ static inline unsigned int f2fs_usable_zone_blks_in_seg(
 	block_t seg_start, sec_start_blkaddr, sec_cap_blkaddr;
 	unsigned int secno;
 
-	if (!sbi->unusable_blocks_per_sec)
+	if (!sbi->unusable_blocks_per_blkz)
 		return BLKS_PER_SEG(sbi);
 
 	secno = GET_SEC_FROM_SEG(sbi, segno);
@@ -5599,7 +5599,6 @@ static inline unsigned int f2fs_usable_zone_blks_in_seg(struct f2fs_sb_info *sbi
 {
 	return 0;
 }
-
 #endif
 unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
 					unsigned int segno)
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 1ce2c8abaf48..0a1ca929ce1a 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -69,11 +69,16 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 	((!__is_valid_data_blkaddr(blk_addr)) ?			\
 	NULL_SEGNO : GET_L2R_SEGNO(FREE_I(sbi),			\
 		GET_SEGNO_FROM_SEG0(sbi, blk_addr)))
+#ifdef CONFIG_BLK_DEV_ZONED
 #define CAP_BLKS_PER_SEC(sbi)					\
-	(BLKS_PER_SEC(sbi) - (sbi)->unusable_blocks_per_sec)
+	(BLKS_PER_SEC(sbi) - (sbi)->unusable_blocks_per_blkz)
 #define CAP_SEGS_PER_SEC(sbi)					\
 	(SEGS_PER_SEC(sbi) -					\
-	BLKS_TO_SEGS(sbi, (sbi)->unusable_blocks_per_sec))
+	BLKS_TO_SEGS(sbi, (sbi)->unusable_blocks_per_blkz))
+#else
+#define CAP_BLKS_PER_SEC(sbi) BLKS_PER_SEC(sbi)
+#define CAP_SEGS_PER_SEC(sbi) SEGS_PER_SEC(sbi)
+#endif
 #define GET_START_SEG_FROM_SEC(sbi, segno)			\
 	(rounddown(segno, SEGS_PER_SEC(sbi)))
 #define GET_SEC_FROM_SEG(sbi, segno)				\
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index db7afb806411..c055032593b7 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4333,11 +4333,11 @@ static int f2fs_report_zone_cb(struct blk_zone *zone, unsigned int idx,
 		return 0;
 
 	set_bit(idx, rz_args->dev->blkz_seq);
-	if (!rz_args->sbi->unusable_blocks_per_sec) {
-		rz_args->sbi->unusable_blocks_per_sec = unusable_blocks;
+	if (!rz_args->sbi->unusable_blocks_per_blkz) {
+		rz_args->sbi->unusable_blocks_per_blkz = unusable_blocks;
 		return 0;
 	}
-	if (rz_args->sbi->unusable_blocks_per_sec != unusable_blocks) {
+	if (rz_args->sbi->unusable_blocks_per_blkz != unusable_blocks) {
 		f2fs_err(rz_args->sbi, "F2FS supports single zone capacity\n");
 		return -EINVAL;
 	}
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 6d2a4fba68a2..98d2cb60e806 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1209,7 +1209,7 @@ F2FS_SBI_GENERAL_RW_ATTR(last_age_weight);
 /* read extent cache */
 F2FS_SBI_GENERAL_RW_ATTR(max_read_extent_count);
 #ifdef CONFIG_BLK_DEV_ZONED
-F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
+F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_blkz);
 F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
 #endif
 F2FS_SBI_GENERAL_RW_ATTR(carve_out);
@@ -1383,7 +1383,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(avg_vblocks),
 #endif
 #ifdef CONFIG_BLK_DEV_ZONED
-	ATTR_LIST(unusable_blocks_per_sec),
+	ATTR_LIST(unusable_blocks_per_blkz),
 	ATTR_LIST(blkzone_alloc_policy),
 #endif
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

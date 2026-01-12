Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB85FD10F34
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 08:47:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GGmrVPdSqG95nMhrqjuQj/2jwIWSJWrYxWna+pE8o6Y=; b=CLDkPrfv5bRn/ehlW0Tf9y1pJ5
	8844svzJW7SA98gHSzb0xADNfEIkjyBVCLTGOLVWgF9W5aJpCknl+adxDg77niYMKy9icpUC1iixt
	JWnCqZQqEhcwI39jlfiIoi9cnwbjZ8MpObtrzD2olj5vYWGZlvhM1VAm4WUXGrTv0Qfg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfCeF-0008EH-2I;
	Mon, 12 Jan 2026 07:47:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1vfCeD-0008E8-HC
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 07:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OzJP0UpthqFsaHqtOIbj3L/Hl3UzU6+1jqfoGjhLqtk=; b=dWKM4tsCss5lZxIUbAq2j0FR1p
 qQBKz4AyKF79a6yDW8FZxtTjLcUDmr5tGuP/fDYD+RdkVoDcYhzsfBMvDMZ9kJVzjq0Iiz9d8h56G
 ckV18eeAvmyE4PVt58ya76m/lyVBSJCxMOSv//2Vl7vRzD1sxiDZobEw9Mc2YhWsE6oA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OzJP0UpthqFsaHqtOIbj3L/Hl3UzU6+1jqfoGjhLqtk=; b=K
 MYyWYnXMUrDH4E72gS/nDQpN653JHManpWjHYbJm2jQx4zrUHN5KmwnNp6T6ffslCLX4bHrHm/+dD
 qm9x0aryuZ3E8mFsWdrzzZ/7qhh0T+fQmWs7Qixd8Ev0AC0WTHG1/Bm/TDrv+EpkSBEZxdb+9m+tF
 yESDhjnAtUzvyu8U=;
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vfCeD-0003UX-1z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 07:47:33 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-34c93e0269cso2763984a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 11 Jan 2026 23:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768204042; x=1768808842; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OzJP0UpthqFsaHqtOIbj3L/Hl3UzU6+1jqfoGjhLqtk=;
 b=DV9FZrAruzYVCK6cd1AI9fVpG6hG8oV/CogXuf6PH0U9AO9CGih8qyjV8INfpDMuql
 H5Fsf7SePQS+QtDEkN61XvW+p1GFzvHe2f8CwbeEv7PhrUlW2McS22PCC3Q+QEwO7Azg
 UUZsgb7L8wDrNa8XSd+zN+etaR1qP+dWIMMcaNJehSNt+H8dxs4/oRVCTZwqxW83OEOk
 E8jtq5XKWZ6/7++p+wkrPeIS5JXLMWPNkFGe4bIr/bm7X6FHFldXje0EEn/gPfku2clG
 M/+uJXF9OqjZzyrWjUJk5d5UOWx8raWaf9du3p+Au9G6rk1j81kNtF2LhHoAXIy7nMG5
 oo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768204042; x=1768808842;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OzJP0UpthqFsaHqtOIbj3L/Hl3UzU6+1jqfoGjhLqtk=;
 b=VqTHm4Ate3vhZFMEIJYoLUIkJkCfjBVsDwC8b39GUdElnThSDHHH90eT3fdO3exvfW
 njJEwC3FqCpEOP5WOjx8fZG30dU0swN/mbW0W/uMWLn54UwhqX+n43af4q36mXZ5KmT2
 qzqx0KlBOqFhzaNSopd6uR8j47cnovGQ/dVhDihLiMUiaSQodyMKq8VJ+f+kYwTiMkF+
 4gfjXc6TEs0vWUN7iBM5SBSobM3NrD53qu7vhuy/MncqPzXegPa+w9TocoWEf4mXs7Iy
 aAbG8rzMqMV+iBEl0+Yv6inxVttmr38nKv6vkxcAqQa0px59XnSbqr2JACWYH0oHu0sN
 6nbg==
X-Gm-Message-State: AOJu0YyotwaPVZAp5MF/tdQi+npIge0TZThLRWc1BbPp8pV75K0ueZgI
 kgtyGOBTDkvZWlSIkVpwJfanc9UU5oNm/YrRddPRy64AljWZYbwDYOzg
X-Gm-Gg: AY/fxX71HHbC1Y2r1SAM2XmYM4Qqf9+dJDki0xqDa2o5TSKXXZu772sJecg57NKekNU
 TbgdiUdLWa7NPSi1v9inkZpJjmhySsIgoTlX56hzRQBdvznSXTeFTPkv+YtpYIQs0f8lEZtx10b
 POFqnypo9vgTdJ38e0RBv5Br3yUjTYZUzSyB9sf5ZFaNp3TyHmj6oXUsct698wRehf47X4z7sAN
 K9SYJfxj4haSdsH2S/j8X9koK+mnMgihgtZ86VrWQM6Sn0r/v35kWHA4U6qap7yrcXmchjRMDNi
 b5GuNTwsA8Y3af68pt1617rIyZDIZ1yzjiB1N8ks6RUsMf35tzffLtqdDbhInUQKRqdmPA3nB6+
 3CqKXwye+32NyAIBuA1A3Zw9UZQ40qfZnv+B7ZI7CUmAqbCoL3JGMQPbIFTKKWNKlRT9rVd1bKu
 nvxzo38Xbw6NcshrwYj1+g
X-Google-Smtp-Source: AGHT+IH2/MHJIzmgtKz+8J2Y72gYzifFxUdyTxn+1zjCrajunanK+gFUjreYI8k7Z9EkNuX+whSVOg==
X-Received: by 2002:a17:90b:314c:b0:340:b501:7b83 with SMTP id
 98e67ed59e1d1-34f68c019c2mr14846419a91.10.1768204042258; 
 Sun, 11 Jan 2026 23:47:22 -0800 (PST)
Received: from zyy.mioffice.cn ([2408:8607:1b00:8:ee4e:db5f:cca6:b6bb])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cc9e7e8afsm16509740a12.29.2026.01.11.23.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 23:47:21 -0800 (PST)
From: Yangyang Zang <zangyangyang66@gmail.com>
X-Google-Original-From: Yangyang Zang <zangyangyang1@xiaomi.com>
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Mon, 12 Jan 2026 15:46:35 +0800
Message-ID: <20260112074635.3405176-1-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Clean up code to improve readability,
 no logic changes. Signed-off-by:
 Yangyang Zang --- fs/f2fs/checkpoint.c | 15 +++++++-------- fs/f2fs/f2fs.h
 | 4 ++-- fs/f2fs/file.c | 2 +- 3 files changed, 10 insertions(+),
 11 deletions(-)
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zangyangyang66(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zangyangyang66(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.52 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vfCeD-0003UX-1z
Subject: [f2fs-dev] [PATCH] f2fs: clean up the type parameter in
 f2fs_sync_meta_pages()
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
Cc: Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Clean up code to improve readability, no logic changes.

Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>
---
 fs/f2fs/checkpoint.c | 15 +++++++--------
 fs/f2fs/f2fs.h       |  4 ++--
 fs/f2fs/file.c       |  2 +-
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 3dfc83a0813e..8bb38cfcce6e 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -534,7 +534,7 @@ static int f2fs_write_meta_pages(struct address_space *mapping,
 
 	trace_f2fs_writepages(mapping->host, wbc, META);
 	diff = nr_pages_to_write(sbi, META, wbc);
-	written = f2fs_sync_meta_pages(sbi, META, wbc->nr_to_write, FS_META_IO);
+	written = f2fs_sync_meta_pages(sbi, wbc->nr_to_write, FS_META_IO);
 	f2fs_up_write_trace(&sbi->cp_global_sem, &lc);
 	wbc->nr_to_write = max((long)0, wbc->nr_to_write - written - diff);
 	return 0;
@@ -545,8 +545,8 @@ static int f2fs_write_meta_pages(struct address_space *mapping,
 	return 0;
 }
 
-long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, enum page_type type,
-				long nr_to_write, enum iostat_type io_type)
+long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, long nr_to_write,
+				enum iostat_type io_type)
 {
 	struct address_space *mapping = META_MAPPING(sbi);
 	pgoff_t index = 0, prev = ULONG_MAX;
@@ -607,7 +607,7 @@ long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, enum page_type type,
 	}
 stop:
 	if (nwritten)
-		f2fs_submit_merged_write(sbi, type);
+		f2fs_submit_merged_write(sbi, META);
 
 	blk_finish_plug(&plug);
 
@@ -1450,8 +1450,7 @@ void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
 			break;
 
 		if (type == F2FS_DIRTY_META)
-			f2fs_sync_meta_pages(sbi, META, LONG_MAX,
-							FS_CP_META_IO);
+			f2fs_sync_meta_pages(sbi, LONG_MAX, FS_CP_META_IO);
 		else if (type == F2FS_WB_CP_DATA)
 			f2fs_submit_merged_write(sbi, DATA);
 
@@ -1623,7 +1622,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	int err;
 
 	/* Flush all the NAT/SIT pages */
-	f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
+	f2fs_sync_meta_pages(sbi, LONG_MAX, FS_CP_META_IO);
 
 	stat_cp_time(cpc, CP_TIME_SYNC_META);
 
@@ -1722,7 +1721,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	}
 
 	/* Here, we have one bio having CP pack except cp pack 2 page */
-	f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
+	f2fs_sync_meta_pages(sbi, LONG_MAX, FS_CP_META_IO);
 	stat_cp_time(cpc, CP_TIME_SYNC_CP_META);
 
 	/* Wait for all dirty meta pages to be submitted for IO */
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ded41b416ed7..0479e4feddb8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4047,8 +4047,8 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 			int type, bool sync);
 void f2fs_ra_meta_pages_cond(struct f2fs_sb_info *sbi, pgoff_t index,
 							unsigned int ra_blocks);
-long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, enum page_type type,
-			long nr_to_write, enum iostat_type io_type);
+long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, long nr_to_write,
+			enum iostat_type io_type);
 void f2fs_add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino, int type);
 void f2fs_remove_ino_entry(struct f2fs_sb_info *sbi, nid_t ino, int type);
 void f2fs_release_ino_entry(struct f2fs_sb_info *sbi, bool all);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ce291f152bc3..abcf6f486dd7 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2463,7 +2463,7 @@ int f2fs_do_shutdown(struct f2fs_sb_info *sbi, unsigned int flag,
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
 		break;
 	case F2FS_GOING_DOWN_METAFLUSH:
-		f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_META_IO);
+		f2fs_sync_meta_pages(sbi, LONG_MAX, FS_META_IO);
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
 		break;
 	case F2FS_GOING_DOWN_NEED_FSCK:
-- 
2.43.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

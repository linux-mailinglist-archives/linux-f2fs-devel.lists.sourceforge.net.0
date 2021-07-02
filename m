Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE313BA539
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Jul 2021 23:45:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lzQyj-0004Za-QU; Fri, 02 Jul 2021 21:45:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1lzQyi-0004ZS-AB
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Jul 2021 21:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uVHj1jU9GFC6OPD/uRvI5jmyC+48qLeGOTCGFoZzT0w=; b=In1bEftDkTFUBt2/IuWOnaTen8
 FMDF0hAvLpC0Zu86z/78xHuxfXhw74hhqi5WoT04fw7Y5BNBFNBoVClM6OXehUhLdq8d/WD+qDSjA
 /LHLpzXkoh5Y8fRGEvCVBtAeO6lWDYTJ3gk0zakcOzGXN5QrXDuZSoqbj+gvsO57kIqU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uVHj1jU9GFC6OPD/uRvI5jmyC+48qLeGOTCGFoZzT0w=; b=C
 KczxePhiq9JImAP1ir38S+4Dnzv5tyyiPrRGGPx4omupON81o09cVSUkB12Gm1xHfqxAPe5cHa8wJ
 vTFNsWoTr5RTe718uLtehrJKpojvkiXjU/v9ytF9K3Y+EgLgfpSUnvjJklsztyLRg6M2KmaFzy0Jw
 IngF5eDSDD55cEvI=;
Received: from mail-pj1-f47.google.com ([209.85.216.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lzQyZ-007q3w-9M
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Jul 2021 21:45:40 +0000
Received: by mail-pj1-f47.google.com with SMTP id g24so7296193pji.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 02 Jul 2021 14:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uVHj1jU9GFC6OPD/uRvI5jmyC+48qLeGOTCGFoZzT0w=;
 b=fMshkRIOTpaTjLxL+LchLjk6Lnxp1cmjms30Hzvbv793YH1e2+WIQLL8f7tZ5kk19s
 mBTgcZMpMEd8nYHW1v7Zfsj9jWG7sNI4bbELilTVrZZrQEefSNNQpnXG3Gq6KYlLRAHG
 G8eGAW5sSDBccQEn1h665O4WcfDMyWqgEFZHAJ0aqI9CMg0YvAZj/SDtbFyqXX5lwHtl
 i5R1lssfoJQzGrMsicGIZeMJ6Bj9EthxyjzRrGgzheshsZJ9y/8Rx/aDE6up2QXrtd8I
 IqXxTbWyYJKmBAkqm9L0b/It0Lqjl0MGdOXArxihEapy7Lll9rgHpX+IBeoXL74z5IOr
 4OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uVHj1jU9GFC6OPD/uRvI5jmyC+48qLeGOTCGFoZzT0w=;
 b=X0c+ql2YWuuGIpPOSaI0VSPTV2P61z2zLgjdFLEI689xZDYT6EJHI/K8p43/mZNURb
 Cd4GhtBz1svAk7+HzcjflbEpJN+e3gk8KRrZUoewuRT9AKojmXoU5zX9vyixNk/fs/ns
 GZdWprjxGuUsHlCxuJsdcMKnxohcukHYMleQw1DI/U+AjdNZ58yOZfTKh5rEi4Cc9UmK
 umBOYTfj/OGU95/IBCtzV/H2aDanFj5hIq5m1U/c4GMzIASPsDwokuvvhX+Dt2DLoj6Q
 qNNXIch862cAUUa5mDnU+gnc2eEya28mwpKkgl1+Le3x9+A6uDqhs2ui+kv8jq0+v9dH
 doXA==
X-Gm-Message-State: AOAM533+LD67mNKx6H/BjM1gW4Xn+RuJTUghV6rK7SChy+RP0Brduf01
 iSGDdYCkBG/yQxIv4B7KJH4=
X-Google-Smtp-Source: ABdhPJzBKoMgnj2DUOTp28ranUS89rDOllstCbX8zG9HS6Ns+UO6q9cLuNq7pj9mqu/Yb4jTucz+IQ==
X-Received: by 2002:a17:902:c3c6:b029:128:f061:889d with SMTP id
 j6-20020a170902c3c6b0290128f061889dmr1441481plj.50.1625262325685; 
 Fri, 02 Jul 2021 14:45:25 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:26e9:b6e7:e122:4649])
 by smtp.gmail.com with ESMTPSA id q24sm5121234pgk.32.2021.07.02.14.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 14:45:25 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  2 Jul 2021 14:44:58 -0700
Message-Id: <20210702214458.3876398-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.47 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.47 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lzQyZ-007q3w-9M
Subject: [f2fs-dev] [PATCH] f2fs: add sysfs nodes to get GC info for each GC
 urgent mode
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

Added gc_urgent_dirty_segs and gc_urgent_dirty_segs_mode sysfs nodes.
1) "gc_urgent_dirty_segs" shows how many dirty segments have been
reclaimed by GC during a specific GC urgent mode.
2) "gc_urgent_dirty_segs_mode" is used to control for which gc urgent
mode the "gc_urgent_dirty_segs" node shows.
(1: GC urgent high, 2: GC urgent low)

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 14 ++++++++
 fs/f2fs/f2fs.h                          |  5 +++
 fs/f2fs/gc.c                            |  4 +++
 fs/f2fs/sysfs.c                         | 46 +++++++++++++++++++++++++
 4 files changed, 69 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 95155e4ec7fe..9851c3f2efad 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -493,3 +493,17 @@ Contact:	"Chao Yu" <yuchao0@huawei.com>
 Description:	When ATGC is on, it controls age threshold to bypass GCing young
 		candidates whose age is not beyond the threshold, by default it was
 		initialized as 604800 seconds (equals to 7 days).
+
+What:		/sys/fs/f2fs/<disk>/gc_urgent_dirty_segs
+Date:		July 2021
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Show how many dirty segments have been reclaimed by GC during
+		a specific GC urgent mode (1: GC urgent high, 2: GC urgent low)
+		You can re-initialize this value to "0".
+
+What:		/sys/fs/f2fs/<disk>/gc_urgent_dirty_segs_mode
+Date:		July 2021
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	You can control for which gc urgent mode the "gc_urgent_dirty_segs"
+		node shows (1: GC urgent high, 2: GC urgent low). You can set the
+		value to "0" when you want not to select one of them.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 16ce1ade9fa6..d838c373f188 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1728,6 +1728,11 @@ struct f2fs_sb_info {
 	struct kmem_cache *inline_xattr_slab;	/* inline xattr entry */
 	unsigned int inline_xattr_slab_size;	/* default inline xattr slab size */
 
+	/* For reclaimed dirty segs statistics per each GC urgent mode */
+	unsigned int gc_dirty_segs_mode;	/* GC state for reclaimed dirty segments */
+	u64 gc_urgent_high_dirty_segs;		/* Reclaimed dirty segs in GC_URGENT_HIGH */
+	u64 gc_urgent_low_dirty_segs;		/* Reclaimed dirty segs in GC_URGENT_LOW */
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct kmem_cache *page_array_slab;	/* page array entry */
 	unsigned int page_array_slab_size;	/* default page array slab size */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index da5947b30142..233e2a500379 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1648,6 +1648,10 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 							force_migrate);
 
 		stat_inc_seg_count(sbi, type, gc_type);
+		if (sbi->gc_dirty_segs_mode == GC_URGENT_HIGH)
+			sbi->gc_urgent_high_dirty_segs++;
+		else if (sbi->gc_dirty_segs_mode == GC_URGENT_LOW)
+			sbi->gc_urgent_low_dirty_segs++;
 		migrated++;
 
 freed:
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 6642246206bd..9ede97fe12cf 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -307,6 +307,25 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 		return sysfs_emit(buf, "%u\n", sbi->compr_new_inode);
 #endif
 
+	if (!strcmp(a->attr.name, "gc_urgent_dirty_segs_mode")) {
+		if (sbi->gc_dirty_segs_mode == GC_NORMAL)
+			return sysfs_emit(buf, "0\n");
+		else if (sbi->gc_dirty_segs_mode == GC_URGENT_HIGH)
+			return sysfs_emit(buf, "1\n");
+		else if (sbi->gc_dirty_segs_mode == GC_URGENT_LOW)
+			return sysfs_emit(buf, "2\n");
+	}
+
+	if (!strcmp(a->attr.name, "gc_urgent_dirty_segs")) {
+		if (sbi->gc_dirty_segs_mode == GC_URGENT_HIGH)
+			return sysfs_emit(buf, "%llu\n",
+					sbi->gc_urgent_high_dirty_segs);
+		if (sbi->gc_dirty_segs_mode == GC_URGENT_LOW)
+			return sysfs_emit(buf, "%llu\n",
+					sbi->gc_urgent_low_dirty_segs);
+		return sysfs_emit(buf, "0\n");
+	}
+
 	ui = (unsigned int *)(ptr + a->offset);
 
 	return sprintf(buf, "%u\n", *ui);
@@ -515,6 +534,28 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "gc_urgent_dirty_segs_mode")) {
+		if (t == 0)
+			sbi->gc_dirty_segs_mode = GC_NORMAL;
+		else if (t == 1)
+			sbi->gc_dirty_segs_mode = GC_URGENT_HIGH;
+		else if (t == 2)
+			sbi->gc_dirty_segs_mode = GC_URGENT_LOW;
+		else
+			return -EINVAL;
+		return count;
+	}
+
+	if (!strcmp(a->attr.name, "gc_urgent_dirty_segs")) {
+		if (t != 0 || sbi->gc_dirty_segs_mode == GC_NORMAL)
+			return -EINVAL;
+		if (sbi->gc_dirty_segs_mode == GC_URGENT_HIGH)
+			sbi->gc_urgent_high_dirty_segs = 0;
+		else if (sbi->gc_dirty_segs_mode == GC_URGENT_LOW)
+			sbi->gc_urgent_low_dirty_segs = 0;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -740,6 +781,9 @@ F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_count, max_candidate_cou
 F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_weight, age_weight);
 F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_threshold, age_threshold);
 
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_dirty_segs_mode, gc_dirty_segs_mode);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_dirty_segs, gc_urgent_high_dirty_segs);
+
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
 static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_urgent_sleep_time),
@@ -812,6 +856,8 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(atgc_candidate_count),
 	ATTR_LIST(atgc_age_weight),
 	ATTR_LIST(atgc_age_threshold),
+	ATTR_LIST(gc_urgent_dirty_segs_mode),
+	ATTR_LIST(gc_urgent_dirty_segs),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.32.0.93.g670b81a890-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09724BA8FF7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Sep 2025 13:23:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CGTWLzM0l9xTTv57h6OP2XwIqZdHay/zy9EBgVJr/Qk=; b=eoEHoNOMmYHXvxWhaMi6sXSDll
	c81LVxd/UI4JDyRTnxc/oXEmvf+c9Msj2F+VxV8GNCj8sqFetsKMqzu9GK/jcoZZWjdfW+54HIG2O
	ySUXEyyDoU+pQuChbkvruj1WfNAEH58bMVMkfCupWRlFAfR5Fbt8H7srfYSWhSYAJvGE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3Byj-0005hW-9O;
	Mon, 29 Sep 2025 11:23:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunjunchao@bytedance.com>) id 1v3ByE-0005f6-Ru
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 11:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uvXpI9Uj0P5knWZZSdS525EXKHAxizO3HKQssPn5KvE=; b=CybtSizli9MKj7ZNlyb5crBrV7
 ON9/E2H7C0ksNbIuX58EqVNJBLMc7k2y342+r4w2yoqGpNLrx9kCYL2L5iYHRC9riiMpMCHadeTkx
 848B5cIDdlY3q+rKP9WFr+kIQ97nkI0b+GfIrPMJntbp5FAF+isoIa4GSJ2Qche0YsZE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uvXpI9Uj0P5knWZZSdS525EXKHAxizO3HKQssPn5KvE=; b=P
 564/MUL2QuvsV5ZfXQX1TZsvycYF6UFV7vAMAdMuMJxDWnTMDs0dkMSn5PdLR/W9tnr3dbWUk0lMU
 X2KqxxBdu7IV8/hzvhdoOPilQFi4PcntoCINp6yl8Rt6aZonGEynkUYciV2otmBGBLqjEepU8SkFw
 DtUPSSxJfTNkYiwE=;
Received: from mail-qk1-f179.google.com ([209.85.222.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v3ByE-00039k-Vq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 11:23:07 +0000
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-85a4ceb4c3dso491193285a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Sep 2025 04:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1759144981; x=1759749781;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uvXpI9Uj0P5knWZZSdS525EXKHAxizO3HKQssPn5KvE=;
 b=ZDvGPyBNptkSL711GQapoN00Ujwe6nLFUyS1+pv36WvF6+GsDMT4OlzCLlSALPOtob
 QSrQa1k7cmfXsuxffQFyO/crJJnFj3f9lTVHyv/Q53kz00pUdGaJfdLQqnLD5U1HeyUV
 aCNcLVkRlq7DKnACWoPxd+PQmw2jY6n/zLYeAUEpiD/vB/4ND6kieP2ExfR8GgJzB3Ip
 UlahDrRzhu7FzPBRFX6/NTw5yPEq1RUrnyaejlCz3NPbeDX8/2t2mRCNO0yzb0/jr8Em
 uiSU3k6KZeRTAxX9swlI4blvg52OusOibNCGWyQCCRjlGtQnVRXGmBziYvx0Uf0pBchw
 HAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759144981; x=1759749781;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uvXpI9Uj0P5knWZZSdS525EXKHAxizO3HKQssPn5KvE=;
 b=euLL4j3NC/UCP3480RHDPHqkBrInmH5f2KbjEasf6lM+JCozjt3Jg+93WkzV0V2n7k
 6XxdtF2Xv62YJQKGdCeRg8e/EXG0NBtEAIFOEeNACHxp1Oy5r0JL1SPajkCvZLP7s3lc
 s+L4F+4FA9SP6H0ODLqm8IrMYuPH4PHl5SlbcqoaV0EA6gMdMkVS5c19bKh5AmdeSXcB
 bM2VuT1cCcPs8KpYkqYqlnm5R4EMnqKlG86m02ax6WQFdpulHtUvvqjQ1dW/aTmOBiql
 5TFzef8M1mMpTGUGXrhjXFARtm7dySuivZAEoCoT3oGN80UEPocW453wJ+dIKv8PfSCh
 1OZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMM9yAsnd3XXeTy/aFT7kpTcBSMoyPcIMb0R1MtHmXESSFfWghaQS2iQdaEC4Ks8Nkw3Qv/iDJHAY7SjgMFk5D@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyR/lmkFTGrCoUoywXbhVBagE88I5Bl7ZZkeBnK8tuQY41943V5
 Z9nxQcEmcB/Fupr8TMrW4ohNtx+FNGXtcRkrOzMBSCIQO0G7jFNuMt1dPg5lqTLSH7Ex+3TntnU
 diDX13pc=
X-Gm-Gg: ASbGncua0SRJrX36jmxHo72hpOjjmeIzu0/mqqGostv5FheiQbXP0IrhO/cRogjvPun
 QS9OqTFNK1QIUPnpXZWtQPZuG4W6aLp+oJVlRVoQh8YH+OZvgOzxEn3puPRGQATOo8ul/NXqqIf
 etXgMFxMIbFlvXx9KKFkt6l6LY33gpKpyOMWTRqO3Xv4E4VJAJgDnB1xxUQ0kr5gISPVlyK1+cx
 58RokufKk9IsIdE6ztMWsJXU11qFoRYBgccQTopSSzxB8PBoZO30mdZHjE1bX9xS3t6wgGkHgQc
 7Cj1hWnTIbboSWP1QNTF5958OWV2KrqXFbxqF69ngYXt0kt0ba7r3f3eMJ05n5bHWN0pUa4ht+C
 3mxooylkdyQmOYV4nynNwpaFQvBF6lQqlM6pPDnPB10I=
X-Google-Smtp-Source: AGHT+IEvyHlney3PgQuqnRkmgr8JE86a8eWPctFK7OejS1Uga3alUyrnVrUb4vQVgEIV5QeAISy+vA==
X-Received: by 2002:a17:903:4b07:b0:286:d3c5:4d15 with SMTP id
 d9443c01a7336-286d3c5548amr53962345ad.36.1759144544699; 
 Mon, 29 Sep 2025 04:15:44 -0700 (PDT)
Received: from localhost ([106.38.226.62]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed672aa0asm129207595ad.62.2025.09.29.04.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 04:15:44 -0700 (PDT)
To: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Date: Mon, 29 Sep 2025 19:13:49 +0800
Message-Id: <20250929111349.448324-1-sunjunchao@bytedance.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The logic in wbc_to_tag() is widely used in file systems,
 so modify this function to be inline and use it in file systems. This patch
 has only passed compilation tests, but it should be fine. Signed-off-by:
 Julian Sun <sunjunchao@bytedance.com> --- fs/btrfs/extent_io.c | 5 +----
 fs/ceph/addr.c
 | 6 +----- fs/ext4/inode.c | 5 +---- fs/f2fs/data.c | 5 +---- fs/gfs2/aops.c
 | 5 +---- include/li [...] 
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
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.179 listed in wl.mailspike.net]
X-Headers-End: 1v3ByE-00039k-Vq
Subject: [f2fs-dev] [PATCH v2] fs: Make wbc_to_tag() inline and use it in fs.
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
From: Julian Sun via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Julian Sun <sunjunchao@bytedance.com>
Cc: brauner@kernel.org, tytso@mit.edu, agruenba@redhat.com, jack@suse.cz,
 willy@infradead.org, clm@fb.com, adilger.kernel@dilger.ca, dsterba@suse.com,
 jaegeuk@kernel.org, idryomov@gmail.com, xiubli@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The logic in wbc_to_tag() is widely used in file systems, so modify this
function to be inline and use it in file systems.

This patch has only passed compilation tests, but it should be fine.

Signed-off-by: Julian Sun <sunjunchao@bytedance.com>
---
 fs/btrfs/extent_io.c      | 5 +----
 fs/ceph/addr.c            | 6 +-----
 fs/ext4/inode.c           | 5 +----
 fs/f2fs/data.c            | 5 +----
 fs/gfs2/aops.c            | 5 +----
 include/linux/writeback.h | 7 +++++++
 mm/page-writeback.c       | 6 ------
 7 files changed, 12 insertions(+), 27 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index b21cb72835cc..0fea58287175 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -2390,10 +2390,7 @@ static int extent_write_cache_pages(struct address_space *mapping,
 			       &BTRFS_I(inode)->runtime_flags))
 		wbc->tagged_writepages = 1;
 
-	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
-		tag = PAGECACHE_TAG_TOWRITE;
-	else
-		tag = PAGECACHE_TAG_DIRTY;
+	tag = wbc_to_tag(wbc);
 retry:
 	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
 		tag_pages_for_writeback(mapping, index, end);
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 322ed268f14a..63b75d214210 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -1045,11 +1045,7 @@ void ceph_init_writeback_ctl(struct address_space *mapping,
 	ceph_wbc->index = ceph_wbc->start_index;
 	ceph_wbc->end = -1;
 
-	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages) {
-		ceph_wbc->tag = PAGECACHE_TAG_TOWRITE;
-	} else {
-		ceph_wbc->tag = PAGECACHE_TAG_DIRTY;
-	}
+	ceph_wbc->tag = wbc_to_tag(wbc);
 
 	ceph_wbc->op_idx = -1;
 	ceph_wbc->num_ops = 0;
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 5b7a15db4953..196eba7fa39c 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -2619,10 +2619,7 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
 	handle_t *handle = NULL;
 	int bpp = ext4_journal_blocks_per_folio(mpd->inode);
 
-	if (mpd->wbc->sync_mode == WB_SYNC_ALL || mpd->wbc->tagged_writepages)
-		tag = PAGECACHE_TAG_TOWRITE;
-	else
-		tag = PAGECACHE_TAG_DIRTY;
+	tag = wbc_to_tag(mpd->wbc);
 
 	mpd->map.m_len = 0;
 	mpd->next_pos = mpd->start_pos;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 7961e0ddfca3..101e962845db 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3003,10 +3003,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 		if (wbc->range_start == 0 && wbc->range_end == LLONG_MAX)
 			range_whole = 1;
 	}
-	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
-		tag = PAGECACHE_TAG_TOWRITE;
-	else
-		tag = PAGECACHE_TAG_DIRTY;
+	tag = wbc_to_tag(wbc);
 retry:
 	retry = 0;
 	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 47d74afd63ac..12394fc5dd29 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -311,10 +311,7 @@ static int gfs2_write_cache_jdata(struct address_space *mapping,
 			range_whole = 1;
 		cycled = 1; /* ignore range_cyclic tests */
 	}
-	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
-		tag = PAGECACHE_TAG_TOWRITE;
-	else
-		tag = PAGECACHE_TAG_DIRTY;
+	tag = wbc_to_tag(wbc);
 
 retry:
 	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
diff --git a/include/linux/writeback.h b/include/linux/writeback.h
index a2848d731a46..dde77d13a200 100644
--- a/include/linux/writeback.h
+++ b/include/linux/writeback.h
@@ -240,6 +240,13 @@ static inline void inode_detach_wb(struct inode *inode)
 	}
 }
 
+static inline xa_mark_t wbc_to_tag(struct writeback_control *wbc)
+{
+	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
+		return PAGECACHE_TAG_TOWRITE;
+	return PAGECACHE_TAG_DIRTY;
+}
+
 void wbc_attach_fdatawrite_inode(struct writeback_control *wbc,
 		struct inode *inode);
 
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 3e248d1c3969..ae1181a46dea 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2434,12 +2434,6 @@ static bool folio_prepare_writeback(struct address_space *mapping,
 	return true;
 }
 
-static xa_mark_t wbc_to_tag(struct writeback_control *wbc)
-{
-	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
-		return PAGECACHE_TAG_TOWRITE;
-	return PAGECACHE_TAG_DIRTY;
-}
 
 static pgoff_t wbc_end(struct writeback_control *wbc)
 {
-- 
2.39.5



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

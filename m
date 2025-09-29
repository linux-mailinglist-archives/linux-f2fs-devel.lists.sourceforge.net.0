Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1FBBA8EC6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Sep 2025 12:51:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gR1nq7Cvgdu5HRpKQrGdQYYx3kpadeZOPMTL7FNON4I=; b=J0QOV0AY28krmoWBCUtY47eiXV
	NOYl5MLeCRBiAJzmDZ2x1JAQikAE/zX2ybpBt0UuRNhw4KuqypE9kQ4Y+/0B+7ApWqWJKdERWw0D2
	v+72hbKYo8vrWFuf0lx3gbpYbFP5TYSJQgWJYUl8JSlt5E7osK9bVssU5RdL+C4NdZzc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3BTU-0003Ac-Ef;
	Mon, 29 Sep 2025 10:51:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunjunchao@bytedance.com>) id 1v3BT5-00038O-Is
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 10:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QLANQMIWJTPxhp0UxI/MYcM22Jdt4bQPda2xSN2U3BU=; b=C9pc0n7UPMnHuwvA4im4pVE3sD
 iq00U1WMhcxuFZXICnSdSsQqLISFURNDlofvTAEyIxhS8JX2yjmxlRYCMnIbPjVO+6ZDzpkgC6erS
 9UN2HaGgcbOTe0JkwTxlwqCjeIwLk0ZxfPoSfhtFiWOuYVvlItGWG/dKM+V1OUq0zjZk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QLANQMIWJTPxhp0UxI/MYcM22Jdt4bQPda2xSN2U3BU=; b=A
 kK8HqADwp4RcTH6Skjwj2NMuBUz+lI3LUoUe4pU/sPSzVXMjcA6IHbg3PnC5FiB2PLgoTpHoh9sdJ
 6rM1BDhfX69mHVQRFEwBTZB7oIi+GTk8SR1qxXQjP6vnBMaB6ketmNjaFmxLdfnw1H4IvNv4HoC0a
 PKDMqbYSnIWG7dh0=;
Received: from mail-qt1-f177.google.com ([209.85.160.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v3BT5-0001GA-Qh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 10:50:56 +0000
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4db0b56f6e7so38391741cf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Sep 2025 03:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1759143050; x=1759747850;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QLANQMIWJTPxhp0UxI/MYcM22Jdt4bQPda2xSN2U3BU=;
 b=VCNv4mLp7e0maxS604+QaE0VJQCSohXqnxJqvnGD6hAMtghU7qq2LUluNInxMAxDzE
 gCi6IYTO9L/eeDIN6EydftJ/ujFF7GJNIEP/d9MIPpF7a3hDFHIqMXrltkQiv8EhhQEa
 vGjzrqnJMJ5j0sy94BAafLfyZo5XMSVN1L6Nfp3BiC8btE34A+gyxDlQ9vaN5eHjoWiQ
 w2Y3sXElq+er9eWpI8FfTPu6o4C9reMKm8uizwl+hlGaieNVuc3DmRz6TeVftxwuit3i
 COuSLmdvh0IBIuLujt1uKSvmI6r+P8E0vOc4FMBn3gc6+g7QnyAA3RaWIFsTKDuz64vi
 xy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759143050; x=1759747850;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QLANQMIWJTPxhp0UxI/MYcM22Jdt4bQPda2xSN2U3BU=;
 b=hXFB8abgYz4BQQ0AMUf/2R9FA+Vv6IcjXhCEIi+Qe+viNkuSoKAdnA6l6eJ6cLNnOq
 sWbytJNw9BuSalXWYHZsOyC3Ujs+Rx/8xfCMOAOQc1Jb7mXpQwYB5Fuae+20sx2Q6GcM
 KyEgkGguEiGIjrNJaAtBE10li01gKQ2L5RH0OdTQg/pu/D7cg+/B3haqcxheP98FjY+E
 XBRJtqniGw2Yo/jfc2Wm/I+YLV7zBQBKiEg0Yx8io7bNcTkcTdcp24PCC6iBOYKey3sk
 EX7Dwfun/RmjlYtSv5R1Bb7QfZryTSJteVNUozaDBRHzP5XKiZyt4heTsuWGvm02Fyhm
 C4Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpyyTskhI22g+oy6jLQy2v+ISG4UTAhg9N5wYSSM/Vr3KNHB7C9qV3cr5OilIOMSwpxVEz3SdGI4PbiL+XvCcP@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx3f151Ivq5H2CTMcxzIJwl+LwcFCXtvRNY4mI6C++sC3lrv+fO
 07fHfHfS0lUdKBZH7WgTGJIPn/xB0LJIvchnKTgrO52LDNgkVBXvIyTgLJwQ6Gg+XtU2mBUXmOv
 FkTNLmVg=
X-Gm-Gg: ASbGncvZ5sIpTc3jOOnGYpbslI3KJk3lTvGEP5LnpvDwuTkCtxSrTzgFebJqzBW5h7/
 lqkFSRUvWZRigxJPqVtof5JZ682WeFQenl37q9QTEA9Kkweur7LNeMTaFsgj7ALeLd5+nuNS0n1
 0WdYLKHYltyrUz7Tzy8EoSJn0mTpFB8WcsHhxj5t/h0+mRG7fVbisXU8m5QeGIMI5eo+FSp9+PY
 KxfPBh6M1bJtVb9xMXZOU9CBs32q4y7HfLX6Em8Mqm+45iSwMGxshhP2e52svFryuJDN5xbMxb/
 RZUnz9J0sDYH23EFPlgIfbIBZSmcQZf7IXvYbEelaBr0iUJFjhRNQ2id4Sacao2AFu80QQf318b
 1AkFDCr2SI194Adv6Hsqxx6Neax44ajqVqg==
X-Google-Smtp-Source: AGHT+IGeeirzmmNucPpJRQY6OaCfZcWNOwMOpAFnjpyd+Ec/bpOStvzlr/XHiA7xXQcwxFRBs/UP5Q==
X-Received: by 2002:a17:902:dad0:b0:27e:d66e:8729 with SMTP id
 d9443c01a7336-27ed6799205mr136594755ad.0.1759139747281; 
 Mon, 29 Sep 2025 02:55:47 -0700 (PDT)
Received: from localhost ([106.38.226.135]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6ab640esm126029965ad.128.2025.09.29.02.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 02:55:46 -0700 (PDT)
To: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Date: Mon, 29 Sep 2025 17:55:44 +0800
Message-Id: <20250929095544.308392-1-sunjunchao@bytedance.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The logic in wbc_to_tag() is widely used in file systems,
 so modify this function to be extern and use it in file systems. This patch
 has only passed compilation tests, but it should be fine. Signed-off-by:
 Julian Sun <sunjunchao@bytedance.com> --- fs/btrfs/extent_io.c | 5 +----
 fs/ceph/addr.c
 | 6 +----- fs/ext4/inode.c | 5 +---- fs/f2fs/data.c | 5 +---- fs/gfs2/aops.c
 | 5 +---- include/li [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.177 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1v3BT5-0001GA-Qh
Subject: [f2fs-dev] [PATCH] fs: Make wbc_to_tag() extern and use it in fs.
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
function to be extern and use it in file systems.

This patch has only passed compilation tests, but it should be fine.

Signed-off-by: Julian Sun <sunjunchao@bytedance.com>
---
 fs/btrfs/extent_io.c      | 5 +----
 fs/ceph/addr.c            | 6 +-----
 fs/ext4/inode.c           | 5 +----
 fs/f2fs/data.c            | 5 +----
 fs/gfs2/aops.c            | 5 +----
 include/linux/writeback.h | 1 +
 mm/page-writeback.c       | 2 +-
 7 files changed, 7 insertions(+), 22 deletions(-)

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
index a2848d731a46..884811596e10 100644
--- a/include/linux/writeback.h
+++ b/include/linux/writeback.h
@@ -370,6 +370,7 @@ int do_writepages(struct address_space *mapping, struct writeback_control *wbc);
 void writeback_set_ratelimit(void);
 void tag_pages_for_writeback(struct address_space *mapping,
 			     pgoff_t start, pgoff_t end);
+xa_mark_t wbc_to_tag(struct writeback_control *wbc);
 
 bool filemap_dirty_folio(struct address_space *mapping, struct folio *folio);
 bool folio_redirty_for_writepage(struct writeback_control *, struct folio *);
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 3e248d1c3969..243808e19445 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2434,7 +2434,7 @@ static bool folio_prepare_writeback(struct address_space *mapping,
 	return true;
 }
 
-static xa_mark_t wbc_to_tag(struct writeback_control *wbc)
+xa_mark_t wbc_to_tag(struct writeback_control *wbc)
 {
 	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
 		return PAGECACHE_TAG_TOWRITE;
-- 
2.39.5



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

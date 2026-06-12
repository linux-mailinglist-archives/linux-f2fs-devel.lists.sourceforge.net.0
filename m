Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pllqMaX0K2oZIgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 13:59:33 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A112679310
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 13:59:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Ljj1vNfY;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=OgNt9Jg8;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=X94Fr+38;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="qSztQz/E";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCBsaPwVONyOS4+e0ll2F1RM8i9Ljtg6l/Iut7lVxRw=; b=Ljj1vNfYHYv0z9n2mFLHI+M0MY
	uEcxrxMO1vqo9KZeYNrWkha6PQUfqn6UTc7a0FbXRQRND4vHmwPkgE8iiEoZqN5TZNa/Wdx0dFTZ7
	JAes/bwJZP0J+FEzTxV7Gmh/4z1XdwEi3HcI4ZkGbYaQVf3OXLH7sixf6t47sILBTywc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wY0Xq-00059R-3h;
	Fri, 12 Jun 2026 11:59:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1wY0Xn-00059C-UC
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 11:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y70MTBAstDsZYmRNLu51wG9SWpsb6FBZw5xTSKoj8dw=; b=OgNt9Jg8a4U+WAxvE0Rt+S62Uw
 yYj6R/NDLsTX1DZKO+V2hpfphnsQZlDXqX4g2f8Vk3TQ7pXdPKWOjikMyn4zjEH05yQNqKJqL/iNg
 gRBUirLd1fWFusvM2zblk/pYzAU1Y7LEnmYO1FTVBw6Y30aRFs9ShShFTh5cAihCYp20=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y70MTBAstDsZYmRNLu51wG9SWpsb6FBZw5xTSKoj8dw=; b=X94Fr+38eGxLqm6Kxd+vHCQ/z1
 cI2NoDbBoNXkkPFuqtTTifLZMnBApkgOoXKbkbyg3k0IB5XbKnhri1Sf410toLDXJx4ncMdAhMXdZ
 KthwN3fgod01jSVvhigyIAgpAq3nosdPWdM5AWPhkLtDQXWWwv5jYT9zkUni1+OI8VA4=;
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wY0Xm-0001l3-QV for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 11:59:28 +0000
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-84229481d44so489617b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Jun 2026 04:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781265562; x=1781870362; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y70MTBAstDsZYmRNLu51wG9SWpsb6FBZw5xTSKoj8dw=;
 b=qSztQz/EWWM4SqGf0/gOuCGLtxsIkyTzBUq1laDeuahaPd0GfFqWkpMIZMRSoa1mJY
 KSijybgwelIb9yVhPJbhgph5TX78p2Wfz34MOpCTfJb5YT5ctKB5XrCuiE2lDUtC2jc9
 aZlK1msgu3rNgz2P4HqIQwLIPfTjbj57cwaD3vdNlOiIOg+xrRyDNPKpEq9wGi4iSSj0
 Sv08tRwfU8KLDk+wHdSE6BGf+wTHc8JNWYRtgXBv763HgQSwgZ1VU9pE4HwiPf636UNk
 aEYW5XfjWIuakW6tQ6JTae6vtc+ygU8q2lFmGwS49/94u06aiqdZ9zjcet5J75vtJ0Qz
 GB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781265562; x=1781870362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=y70MTBAstDsZYmRNLu51wG9SWpsb6FBZw5xTSKoj8dw=;
 b=X30hMIt4UO65QYU8v8TYCgrzElrc7VqULXpP0ZrlIbN6xUReCO+Jur3OvB+yCyoWk1
 AOozpC6DjXOK1FoYYBoqUk1on9Qzhu7zURvPOfzsMmLn/pFwDqx8q022S+EenDCJKQFM
 69vWp6YTwm2YzskdDMvkEdR1rvmUggDRNPsYHa0j0ZV5HM1uMRPUmtmb9jIlQPSYJTLj
 QXPbGnb3gBLrhRBMBBzMKyC3MqMnwGFgKXvmr0bDl199WW1pdTMmEr67MFwOkGaJYEWT
 +gwsT5SQV3RtCkCQCA9IY2oiJMR55UgWRNgNAsrsNTyS0aqxVbKgwCUJbglZiGVEtoep
 oUAA==
X-Gm-Message-State: AOJu0YxtMPFVgi207FKkUBP9eLK1/h9/xqlruwvTzz86tKw4QbFjISvf
 zUAdHmZdnrG7eQot3bVgXbXOVTwZ3pNNGSn/y3QG2T/Z17ElsU0167+INWwnDQ==
X-Gm-Gg: Acq92OGP2WqcYVmfpFKCVAuuKpiNlZcRweL/APvA+whBWehOAc71VtDDl2gGocmzTFm
 wlhOeU6NX0UMdT7W2J2X++QhRUZ91NXix8JJe4AXFRW1kqMvwa38FzGr+9tpL0UcBtW0Xb/mqZD
 J8nEDKeAiZrdtMKoLLINtetPx1V7KEHGvQJeZlPitSiRiBIS2p7V/dfgDps6Hra01daxCpLYPGj
 PBo6eW1SAVfoUfjw1VMSZ0h45iUNzY7+onUVTT7fvL6GQw2Wve0CP44baUX4sSqMPmqlX7/BeWi
 GDDbDUAbSjWTVO7SE2w5922mOJyz2oos9Zq/PV0pRyZVIbLDA4NRR7KdVIq3LdjXEqVqgcwW0m1
 xdNxhfIUjdj6B73W1tOCpn7IodMuHW/2dXqVbmpGf23wTE2no09vHjKPY4T1fhPJ8BKDKPWf2+u
 0MJaGwQuKRSmiEWpsntL8QUJ7gNWJ+dTos+D7wUsTdqvynDGNfmPFTvL/Z8XM3iOhUEue1bMZNx
 O+vV3Vp
X-Received: by 2002:a05:6a00:3395:b0:843:497e:b392 with SMTP id
 d2e1a72fcca58-8434cadef86mr2880626b3a.9.1781265561438; 
 Fri, 12 Jun 2026 04:59:21 -0700 (PDT)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8434acf2ac9sm2131197b3a.21.2026.06.12.04.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:59:21 -0700 (PDT)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 12 Jun 2026 19:58:40 +0800
Message-ID: <20260612115839.2065903-6-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang Add F2FS_IOC_GET_READ_CACHE_EXTENTS ioctl
 that allows userspace to retrieve all cached read extents for a given file.
 This uses a two-call pattern similar to fiemap: the first call with
 ext_count=0 qu [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.210.174 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wY0Xm-0001l3-QV
Subject: [f2fs-dev] [PATCH RESEND 5/5] f2fs: add ioctl to export read extent
 cache to userspace for debug
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
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A112679310

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Add F2FS_IOC_GET_READ_CACHE_EXTENTS ioctl that allows userspace to
retrieve all cached read extents for a given file. This uses a two-call
pattern similar to fiemap: the first call with ext_count=0 queries the
node_count, and the second call fetches the actual extent entries.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/extent_cache.c    | 70 +++++++++++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h            |  3 ++
 fs/f2fs/file.c            | 11 ++++++
 include/uapi/linux/f2fs.h | 21 ++++++++++++
 4 files changed, 105 insertions(+)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index e141ffb64e5f..0c10d5639d68 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -14,6 +14,7 @@
 
 #include <linux/fs.h>
 #include <linux/f2fs_fs.h>
+#include <uapi/linux/f2fs.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -1267,6 +1268,75 @@ static void __init_extent_tree_info(struct extent_tree_info *eti)
 	atomic_set(&eti->total_ext_node, 0);
 }
 
+int f2fs_get_read_cache_extents(struct inode *inode,
+			struct f2fs_read_cache_extent __user *uarg)
+{
+	struct extent_tree *et = F2FS_I(inode)->extent_tree[EX_READ];
+	struct f2fs_cache_extent_info *kbuf = NULL;
+	struct f2fs_cache_extent_info largest = {};
+	struct rb_node *node;
+	struct extent_node *en;
+	unsigned int capacity, count = 0;
+	__u32 flags = 0;
+	int ret = 0;
+
+	if (get_user(capacity, &uarg->ext_count))
+		return -EFAULT;
+
+	if (is_inode_flag_set(inode, FI_NO_EXTENT))
+		flags |= F2FS_EXT_FL_NO_EXTENT;
+
+	if (!et || (flags & F2FS_EXT_FL_NO_EXTENT)) {
+		if (put_user(0U, &uarg->ext_count) ||
+		    put_user(flags, &uarg->flags) ||
+		    put_user(0U, &uarg->node_count))
+			return -EFAULT;
+		return 0;
+	}
+
+	if (capacity) {
+		kbuf = f2fs_kvmalloc(F2FS_I_SB(inode), capacity * sizeof(*kbuf), GFP_KERNEL);
+		if (!kbuf)
+			return -ENOMEM;
+	}
+
+	read_lock(&et->lock);
+
+	largest.fofs = et->largest.fofs;
+	largest.blk = et->largest.blk;
+	largest.len = et->largest.len;
+	largest.last_access_mode = et->largest.last_access_mode;
+
+	for (node = rb_first_cached(&et->root); node; node = rb_next(node)) {
+		if (count >= capacity)
+			break;
+		en = rb_entry(node, struct extent_node, rb_node);
+
+		kbuf[count].fofs = en->ei.fofs;
+		kbuf[count].blk = en->ei.blk;
+		kbuf[count].len = en->ei.len;
+		kbuf[count].last_access_mode = en->ei.last_access_mode;
+		count++;
+	}
+
+	read_unlock(&et->lock);
+
+	if (count && copy_to_user(uarg->extents, kbuf,
+				  count * sizeof(*kbuf))) {
+		ret = -EFAULT;
+		goto out;
+	}
+
+	if (put_user(count, &uarg->ext_count) ||
+	    put_user(flags, &uarg->flags) ||
+	    put_user((u32)atomic_read(&et->node_cnt), &uarg->node_count) ||
+	    copy_to_user(&uarg->largest, &largest, sizeof(largest)))
+		ret = -EFAULT;
+out:
+	kvfree(kbuf);
+	return ret;
+}
+
 void f2fs_init_extent_cache_info(struct f2fs_sb_info *sbi)
 {
 	__init_extent_tree_info(&sbi->extent_tree[EX_READ]);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1588b64d04a3..69641fc31c51 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -26,6 +26,7 @@
 #include <linux/part_stat.h>
 #include <linux/rw_hint.h>
 
+#include <uapi/linux/f2fs.h>
 #include <linux/fscrypt.h>
 #include <linux/fsverity.h>
 
@@ -4590,6 +4591,8 @@ void f2fs_update_read_extent_cache(struct dnode_of_data *dn);
 void f2fs_update_read_extent_cache_range(struct dnode_of_data *dn,
 				pgoff_t fofs, block_t blkaddr, unsigned int len,
 				enum extent_access_mode access_mode);
+int f2fs_get_read_cache_extents(struct inode *inode,
+			struct f2fs_read_cache_extent __user *uarg);
 unsigned int f2fs_shrink_read_extent_tree(struct f2fs_sb_info *sbi,
 			int nr_shrink);
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index a3a5d499eadf..66ec9927d667 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3672,6 +3672,14 @@ static int f2fs_ioc_precache_extents(struct file *filp)
 	return f2fs_precache_extents(file_inode(filp));
 }
 
+static int f2fs_ioc_get_read_cache_extents(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+
+	return f2fs_get_read_cache_extents(inode,
+			(struct f2fs_read_cache_extent __user *)arg);
+}
+
 static int f2fs_ioc_resize_fs(struct file *filp, unsigned long arg)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
@@ -4744,6 +4752,8 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_get_dev_alias_file(filp, arg);
 	case F2FS_IOC_IO_PRIO:
 		return f2fs_ioc_io_prio(filp, arg);
+	case F2FS_IOC_GET_READ_CACHE_EXTENTS:
+		return f2fs_ioc_get_read_cache_extents(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -5506,6 +5516,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_COMPRESS_FILE:
 	case F2FS_IOC_GET_DEV_ALIAS_FILE:
 	case F2FS_IOC_IO_PRIO:
+	case F2FS_IOC_GET_READ_CACHE_EXTENTS:
 		break;
 	default:
 		return -ENOIOCTLCMD;
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index 795e26258355..6ff9003bc030 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -45,6 +45,8 @@
 #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
 #define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
 #define F2FS_IOC_IO_PRIO		_IOW(F2FS_IOCTL_MAGIC, 27, __u32)
+#define F2FS_IOC_GET_READ_CACHE_EXTENTS	_IOWR(F2FS_IOCTL_MAGIC, 28,	\
+						struct f2fs_read_cache_extent)
 
 /*
  * should be same as XFS_IOC_GOINGDOWN.
@@ -104,4 +106,23 @@ struct f2fs_comp_option {
 	__u8 log_cluster_size;
 };
 
+struct f2fs_cache_extent_info {
+	__u32 fofs;		/* start file offset in blocks */
+	__u32 blk;		/* start block address */
+	__u32 len;		/* length in blocks */
+	__u32 last_access_mode; /* last access mode of extent_node */
+};
+
+/* flags for f2fs_read_cache_extent */
+#define F2FS_EXT_FL_NO_EXTENT	0x1	/* extent cache disabled for this inode */
+
+struct f2fs_read_cache_extent {
+	__u32 ext_count;	/* in: array capacity; out: mapped extent count */
+	__u32 flags;		/* out: status flags */
+	__u32 node_count;	/* out: total extent nodes in tree */
+	__u32 reserved;
+	struct f2fs_cache_extent_info largest;		/* out: largest extent */
+	struct f2fs_cache_extent_info extents[];	/* out: extent array */
+};
+
 #endif /* _UAPI_LINUX_F2FS_H */
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

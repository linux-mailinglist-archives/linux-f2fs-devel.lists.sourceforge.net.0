Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPX8OJQSEGryTAYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 10:23:48 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD7B5B07E4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 10:23:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUTrMP5LzDAdieFhfVj2UF8IOniD4/ZJ1Ezov8NqVHE=; b=J8PbexDHgQ9EmVQZ20/cI/0CnN
	ObazH7He/BXdiG/LQxtQDaGAeGARmSOJsrwS3v101txRMdA4lLsk4i/nxBEUCuUp3/sCoCXi5A1NJ
	eterhejiCfJwn/ZEQQ2ZST9FT2nJ9y6KFf9BruJ5609r3v2voH/2qR9oAvUNymv6+0AM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQLAX-0001pp-UD;
	Fri, 22 May 2026 08:23:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1wQLAW-0001ph-8Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 08:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xXG6zd2n3hbFOGJqfOlkadsd+T5GPfYhF+znfTs2Ato=; b=bnKlMiLfALDNl8/+ZAES5b+lvW
 5BZS35ttLyzhoH8ZmCESYLMLv4ZLgmeauhoSkT16QtBsY/IYAPWvCdG17ELTnLJp8GE5ElyoWIo4T
 0yjHeK6C8jO8sXgohZuMmv9jPL/4IVEeq2EUH7PzO2RAx3gjcxjKSYOwFfjVF058vyoU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xXG6zd2n3hbFOGJqfOlkadsd+T5GPfYhF+znfTs2Ato=; b=SdylA1KxFA9IreoPRPECmfoeGz
 KEM4FD94IfzKEtrZfMaWvneN5uvDywfjb/qxywFRLetdlxk6dSkH/CjxInKbLGOJ2UlHeGkjWG5ko
 1UDwRmU1y/V2kpnVTt76EVFLq0lgmDSFCIzFp/TbM2pAA6yGWXzFxwVgj3NKA1yREFow=;
Received: from mail3-166.sinamail.sina.com.cn ([202.108.3.166])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQLAU-0007al-Lc for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 08:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1779438223; bh=xXG6zd2n3hbFOGJqfOlkadsd+T5GPfYhF+znfTs2Ato=;
 h=From:Subject:Date:Message-ID;
 b=PLmcLGwt+BbaTUfVtuvCwpVJreCCnHAtjKdCuXd3NRvSRTNPeizcRmBKvNzadmMSY
 4FTRlmgEsoomexP60ue4LKrHIKxkVFyaRSBFFVsYARVzQIdgwha30fhXXIx38RRgpr
 lHpIahyr2sGDK9ZZyRWhiKjGR95WGhPVpHq2bEGY=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.31) with ESMTP
 id 6A10127E00007428; Fri, 22 May 2026 16:23:28 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 9441246816471
X-SMAIL-UIID: 7A0BDA5AA8404BE7AF9EB10B9C828D3F-20260522-162328-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 22 May 2026 16:23:12 +0800
Message-ID: <20260522082213.3725976-7-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522082013.3716237-2-monty_pavel@sina.com>
References: <20260522082013.3716237-2-monty_pavel@sina.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.43.0
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.166 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wQLAU-0007al-Lc
Subject: [f2fs-dev] [PATCH 5/5] f2fs: add ioctl to export read extent cache
 to userspace for debug
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
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[sina.com];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,sina.com:mid]
X-Rspamd-Queue-Id: 7CD7B5B07E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 18a862b9bafa..9abb6045bab6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -26,6 +26,7 @@
 #include <linux/part_stat.h>
 #include <linux/rw_hint.h>
 
+#include <uapi/linux/f2fs.h>
 #include <linux/fscrypt.h>
 #include <linux/fsverity.h>
 
@@ -4589,6 +4590,8 @@ void f2fs_update_read_extent_cache(struct dnode_of_data *dn);
 void f2fs_update_read_extent_cache_range(struct dnode_of_data *dn,
 				pgoff_t fofs, block_t blkaddr, unsigned int len,
 				enum extent_access_mode access_mode);
+int f2fs_get_read_cache_extents(struct inode *inode,
+			struct f2fs_read_cache_extent __user *uarg);
 unsigned int f2fs_shrink_read_extent_tree(struct f2fs_sb_info *sbi,
 			int nr_shrink);
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 7d701f2b8151..902421e050bf 100644
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
@@ -5471,6 +5481,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
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

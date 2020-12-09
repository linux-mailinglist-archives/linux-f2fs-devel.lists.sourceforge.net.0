Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B11E92D3B66
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Dec 2020 07:25:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmsvA-0002n7-Sx; Wed, 09 Dec 2020 06:25:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmsv9-0002mF-3g
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 06:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NKfE+PlqgAnyiUlc+jb21xEU3+yK65w3/Al2g9p4XWk=; b=mnbmLN2wAphQjxyMT4i0fDGsQr
 3gVUplOn1ileJFh94SP3xKw0wfhroHeS9FfUAyNIlSigopgAx93+AjVYZcvLh+gWhnDEMqKzUY2n+
 YPV97wxYQYpuksoAjSp7hO4kNy7VWvUUOp2y3tf+05Vd0flT4jbEaf5akNdnJ7ChJ2+A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NKfE+PlqgAnyiUlc+jb21xEU3+yK65w3/Al2g9p4XWk=; b=SoIm/NC0WqjfULR2m2FLgVG9mr
 UWm/ZYwKU3t6n6pxgRPY8n5mueqXRgyONjr/2aeNrZxRMu+4ZWJed2w7XzFr9kVlI8Ss6r1W/vTCk
 E1ZZwbUf9yJs7lWW4C6XWSJ10xAEADeM3A9bHgy6g5y3Psjx7pFvXBOKbTr5YmTdgqaw=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmsuy-004Zor-5X
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 06:25:49 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CrRq851fzz7Bjx;
 Wed,  9 Dec 2020 14:24:52 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Wed, 9 Dec 2020 14:25:16 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 9 Dec 2020 14:24:56 +0800
Message-ID: <20201209062457.111907-5-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209062457.111907-1-yuchao0@huawei.com>
References: <20201209062457.111907-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kmsuy-004Zor-5X
Subject: [f2fs-dev] [PATCH RESEND 5/6] f2fs: introduce a new per-sb
 directory in sysfs
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

Add a new directory 'stat' in path of /sys/fs/f2fs/<devname>/, later
we can add new readonly stat sysfs file into this directory, it will
make <devname> directory less mess.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/f2fs.h  |  5 +++-
 fs/f2fs/sysfs.c | 69 +++++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 68 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index fbaef39e51df..cb94f650ec3d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1549,9 +1549,12 @@ struct f2fs_sb_info {
 	unsigned int node_io_flag;
 
 	/* For sysfs suppport */
-	struct kobject s_kobj;
+	struct kobject s_kobj;			/* /sys/fs/f2fs/<devname> */
 	struct completion s_kobj_unregister;
 
+	struct kobject s_stat_kobj;		/* /sys/fs/f2fs/<devname>/stat */
+	struct completion s_stat_kobj_unregister;
+
 	/* For shrinker support */
 	struct list_head s_list;
 	int s_ndevs;				/* number of devices */
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 989a649cfa8b..ebca0b4961e8 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -711,6 +711,11 @@ static struct attribute *f2fs_feat_attrs[] = {
 };
 ATTRIBUTE_GROUPS(f2fs_feat);
 
+static struct attribute *f2fs_stat_attrs[] = {
+	NULL,
+};
+ATTRIBUTE_GROUPS(f2fs_stat);
+
 static const struct sysfs_ops f2fs_attr_ops = {
 	.show	= f2fs_attr_show,
 	.store	= f2fs_attr_store,
@@ -739,6 +744,44 @@ static struct kobject f2fs_feat = {
 	.kset	= &f2fs_kset,
 };
 
+static ssize_t f2fs_stat_attr_show(struct kobject *kobj,
+				struct attribute *attr, char *buf)
+{
+	struct f2fs_sb_info *sbi = container_of(kobj, struct f2fs_sb_info,
+								s_stat_kobj);
+	struct f2fs_attr *a = container_of(attr, struct f2fs_attr, attr);
+
+	return a->show ? a->show(a, sbi, buf) : 0;
+}
+
+static ssize_t f2fs_stat_attr_store(struct kobject *kobj, struct attribute *attr,
+						const char *buf, size_t len)
+{
+	struct f2fs_sb_info *sbi = container_of(kobj, struct f2fs_sb_info,
+								s_stat_kobj);
+	struct f2fs_attr *a = container_of(attr, struct f2fs_attr, attr);
+
+	return a->store ? a->store(a, sbi, buf, len) : 0;
+}
+
+static void f2fs_stat_kobj_release(struct kobject *kobj)
+{
+	struct f2fs_sb_info *sbi = container_of(kobj, struct f2fs_sb_info,
+								s_stat_kobj);
+	complete(&sbi->s_stat_kobj_unregister);
+}
+
+static const struct sysfs_ops f2fs_stat_attr_ops = {
+	.show	= f2fs_stat_attr_show,
+	.store	= f2fs_stat_attr_store,
+};
+
+static struct kobj_type f2fs_stat_ktype = {
+	.default_groups = f2fs_stat_groups,
+	.sysfs_ops	= &f2fs_stat_attr_ops,
+	.release	= f2fs_stat_kobj_release,
+};
+
 static int __maybe_unused segment_info_seq_show(struct seq_file *seq,
 						void *offset)
 {
@@ -945,11 +988,15 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 	init_completion(&sbi->s_kobj_unregister);
 	err = kobject_init_and_add(&sbi->s_kobj, &f2fs_sb_ktype, NULL,
 				"%s", sb->s_id);
-	if (err) {
-		kobject_put(&sbi->s_kobj);
-		wait_for_completion(&sbi->s_kobj_unregister);
-		return err;
-	}
+	if (err)
+		goto put_sb_kobj;
+
+	sbi->s_stat_kobj.kset = &f2fs_kset;
+	init_completion(&sbi->s_stat_kobj_unregister);
+	err = kobject_init_and_add(&sbi->s_stat_kobj, &f2fs_stat_ktype,
+						&sbi->s_kobj, "stat");
+	if (err)
+		goto put_stat_kobj;
 
 	if (f2fs_proc_root)
 		sbi->s_proc = proc_mkdir(sb->s_id, f2fs_proc_root);
@@ -965,6 +1012,13 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 				victim_bits_seq_show, sb);
 	}
 	return 0;
+put_stat_kobj:
+	kobject_put(&sbi->s_stat_kobj);
+	wait_for_completion(&sbi->s_stat_kobj_unregister);
+put_sb_kobj:
+	kobject_put(&sbi->s_kobj);
+	wait_for_completion(&sbi->s_kobj_unregister);
+	return err;
 }
 
 void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
@@ -976,6 +1030,11 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
 		remove_proc_entry("victim_bits", sbi->s_proc);
 		remove_proc_entry(sbi->sb->s_id, f2fs_proc_root);
 	}
+
+	kobject_del(&sbi->s_stat_kobj);
+	kobject_put(&sbi->s_stat_kobj);
+	wait_for_completion(&sbi->s_stat_kobj_unregister);
+
 	kobject_del(&sbi->s_kobj);
 	kobject_put(&sbi->s_kobj);
 	wait_for_completion(&sbi->s_kobj_unregister);
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

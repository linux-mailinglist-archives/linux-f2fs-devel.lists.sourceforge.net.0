Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A54A62936A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Nov 2022 09:42:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ourWe-0003UA-Gn;
	Tue, 15 Nov 2022 08:42:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1ourW9-0003Rg-2m
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 08:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xslnBA+KF4gJmp9xg0Mb9zrAfFhSSI+I2OM3qIXHHHk=; b=PaqovyIAo418kxdyxID+55xN5u
 r47q4r7kXSsSrNAbltohGqZyNbCDs0dh1XPFW7Y9FnbLrW/vaSL8lbkIp9bvIdjeGHdl9CC/6UhtY
 eG/ydkhaeE1BTEl8+zSuz5G+HuZ7dfCzrspXgTbjHVYP407raOd10F2QZxhcyiS+talw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xslnBA+KF4gJmp9xg0Mb9zrAfFhSSI+I2OM3qIXHHHk=; b=N
 Bz4ZZmMO7ej0xpIpKTndmo8jHkF4TcLmBFPskigug2+xdT82HvxZvuay7mqHan7TiT5BtqgI4FQYc
 3e9wFTwIEglEMuM+CVayb//Zaozavzab6S9yBpTruAivprqES1Kg6oZFkAs7eVM0THqBZ0BlOky3D
 j/WIcV3hvKATQ8aU=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ourW6-008vAQ-Ct for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 08:42:05 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NBKQp0wQyzHvfB;
 Tue, 15 Nov 2022 16:41:22 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 16:41:51 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 15 Nov
 2022 16:41:51 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 15 Nov 2022 16:46:55 +0800
Message-ID: <20221115084655.84191-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Mounting f2fs with following issue: sanity_check_inode: inode
 (ino=4827) has unsupported log cluster size: 0,
 run fsck to fix ->find_fsync_dnodes
 ->add_fsync_inode ->f2fs_iget_retry ->f2fs_iget ->do_read_inode
 ->sanity_check_inode
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ourW6-008vAQ-Ct
Subject: [f2fs-dev] [PATCH] f2fs: Fix error log cluster size warning in
 sanity_check_inode()
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
From: Zhang Qilong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zhang Qilong <zhangqilong3@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Mounting f2fs with following issue:
sanity_check_inode: inode (ino=4827) has unsupported log cluster size: 0, run fsck to fix

->find_fsync_dnodes
 ->add_fsync_inode
  ->f2fs_iget_retry
   ->f2fs_iget
    ->do_read_inode
     ->sanity_check_inode

It is triggered when entering recovery mode after a system crash.
The root cause is 'i_log_cluster_size' is zero in f2fs inode with
F2FS_COMPR_FL flag. It will resulted in mounting failed, and the
filesystem need to be fscked.

We fix it by adding copying compresion information to f2fs inode
page when recover inode page in f2fs_recover_inode_page().

Cc: stable@vger.kernel.org
Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 fs/f2fs/node.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 83cc8a9e4982..2c4031ed71c9 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2799,6 +2799,14 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page)
 			dst->i_crtime = src->i_crtime;
 			dst->i_crtime_nsec = src->i_crtime_nsec;
 		}
+		if (f2fs_sb_has_compression(sbi) &&
+			F2FS_FITS_IN_INODE(src, le16_to_cpu(src->i_extra_isize),
+						i_log_cluster_size)) {
+			dst->i_compr_blocks = src->i_compr_blocks;
+			dst->i_compress_algorithm = src->i_compress_algorithm;
+			dst->i_log_cluster_size = src->i_log_cluster_size;
+			dst->i_compress_flag = src->i_compress_flag;
+		}
 	}
 
 	new_ni = old_ni;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF83504B0F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Apr 2022 04:29:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngH8r-0001T4-G1; Mon, 18 Apr 2022 02:29:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <yuyufen@huawei.com>) id 1ngH8p-0001Su-0x
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Apr 2022 02:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZlRvBcad01IcGiNtZW2cIVr093Du/0r2RDqcwTKLUjY=; b=BvFiBLbYBDA1NAbBRZ333BSPRD
 xyv9f4eYQrSlmlB15z3zZkevB08N66KRH//FsQkJgukhwTBtHquwxNYjm1mMXzi183L2qO8tw+Dh8
 Z11p+8kuWt+2jeeraMt8xMmQ2lrpS64BhZIYIyy9qHJyhoycLF+vMDGrvpnX/YJGYA40=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZlRvBcad01IcGiNtZW2cIVr093Du/0r2RDqcwTKLUjY=; b=G
 Uj4cLoMU/MmgAUL5+6QvK33s7f9CnIShtXhRPFhKYxqawVB8rRGO/uKJNt6EofGyML7v1az+885bE
 /0xMaKq0FKQ0nKWxaBw/DsZ6ZJZU9SjTAihSK2dy8PLvGb0dBfIwRU+0AymRFoBCj0i9S3Hi8BMJ4
 LR+Bbp2Iazm2qw24=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngH8l-002hQw-Jw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Apr 2022 02:29:24 +0000
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KhW805Ll9zfYkQ;
 Mon, 18 Apr 2022 10:28:32 +0800 (CST)
Received: from dggpeml500009.china.huawei.com (7.185.36.209) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 18 Apr 2022 10:29:14 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500009.china.huawei.com
 (7.185.36.209) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 18 Apr
 2022 10:29:14 +0800
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Mon, 18 Apr 2022 10:43:27 +0800
Message-ID: <20220418024327.1628327-1-yuyufen@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500009.china.huawei.com (7.185.36.209)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Usage: dump.f2fs -I [inode nid] /dev/sda This feature can
 be useful for some bugs caused by system crash. We not only need dump current
 valid node page, but alse the history data in disk, which can give some clues
 for status change of the in [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [45.249.212.187 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ngH8l-002hQw-Jw
Subject: [f2fs-dev] [PATCH v2] dump.f2fs: add -I nid to dump inode by scan
 full disk
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
From: Yufen Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yufen Yu <yuyufen@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Usage:
	dump.f2fs -I [inode nid] /dev/sda

This feature can be useful for some bugs caused by system crash.
We not only need dump current valid node page, but alse the history
data in disk, which can give some clues for status change of the inode.

Signed-off-by: Yufen Yu <yuyufen@huawei.com>
---
 fsck/dump.c     | 29 +++++++++++++++++++++++++++++
 fsck/fsck.h     |  1 +
 fsck/main.c     | 14 +++++++++++++-
 man/dump.f2fs.8 |  7 +++++++
 4 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index fce86c9..7ff0b28 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -539,6 +539,35 @@ static bool is_sit_bitmap_set(struct f2fs_sb_info *sbi, u32 blk_addr)
 			(const char *)se->cur_valid_map) != 0;
 }
 
+void dump_node_scan_disk(struct f2fs_sb_info *sbi, nid_t nid)
+{
+	struct f2fs_node *node_blk;
+	pgoff_t blkaddr;
+	int ret;
+	pgoff_t start_blkaddr = SM_I(sbi)->main_blkaddr;
+	pgoff_t end_blkaddr = start_blkaddr +
+		(SM_I(sbi)->main_segments << sbi->log_blocks_per_seg);
+
+	node_blk = calloc(BLOCK_SZ, 1);
+	ASSERT(node_blk);
+	MSG(0, "Info: scan all nid: %u from block_addr [%lu: %lu]\n",
+			nid, start_blkaddr, end_blkaddr);
+
+	for (blkaddr = start_blkaddr; blkaddr < end_blkaddr; blkaddr++) {
+		ret = dev_read_block(node_blk, blkaddr);
+		ASSERT(ret >= 0);
+		if (le32_to_cpu(node_blk->footer.ino) != nid ||
+				le32_to_cpu(node_blk->footer.nid) != nid)
+			continue;
+		MSG(0, "Info: nid: %u, blkaddr: %lu\n", nid, blkaddr);
+		MSG(0, "node_blk.footer.flag [0x%x]\n", le32_to_cpu(node_blk->footer.flag));
+		MSG(0, "node_blk.footer.cp_ver [%x]\n", (u32)(cpver_of_node(node_blk)));
+		print_inode_info(sbi, node_blk, 0);
+	}
+
+	free(node_blk);
+}
+
 int dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
 {
 	struct node_info ni;
diff --git a/fsck/fsck.h b/fsck/fsck.h
index ce5fffe..0c819f0 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -262,6 +262,7 @@ struct dump_option {
 	int start_ssa;
 	int end_ssa;
 	int32_t blk_addr;
+	nid_t scan_nid;
 };
 
 extern void nat_dump(struct f2fs_sb_info *, nid_t, nid_t);
diff --git a/fsck/main.c b/fsck/main.c
index e4cfdf4..c7ad5ad 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -93,6 +93,7 @@ void dump_usage()
 	MSG(0, "[options]:\n");
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -i inode no (hex)\n");
+	MSG(0, "  -I inode no (hex) scan full disk\n");
 	MSG(0, "  -n [NAT dump nid from #1~#2 (decimal), for all 0~-1]\n");
 	MSG(0, "  -M show a block map\n");
 	MSG(0, "  -s [SIT dump segno from #1~#2 (decimal), for all 0~-1]\n");
@@ -382,7 +383,7 @@ void f2fs_parse_options(int argc, char *argv[])
 		}
 	} else if (!strcmp("dump.f2fs", prog)) {
 #ifdef WITH_DUMP
-		const char *option_string = "d:i:n:Ms:Sa:b:V";
+		const char *option_string = "d:i:I:n:Ms:Sa:b:V";
 		static struct dump_option dump_opt = {
 			.nid = 0,	/* default root ino */
 			.start_nat = -1,
@@ -392,6 +393,7 @@ void f2fs_parse_options(int argc, char *argv[])
 			.start_ssa = -1,
 			.end_ssa = -1,
 			.blk_addr = -1,
+			.scan_nid = 0,
 		};
 
 		c.func = DUMP;
@@ -424,6 +426,14 @@ void f2fs_parse_options(int argc, char *argv[])
 					ret = sscanf(optarg, "%x",
 							&dump_opt.nid);
 				break;
+			case 'I':
+				if (strncmp(optarg, "0x", 2))
+					ret = sscanf(optarg, "%d",
+							&dump_opt.scan_nid);
+				else
+					ret = sscanf(optarg, "%x",
+							&dump_opt.scan_nid);
+				break;
 			case 'n':
 				ret = sscanf(optarg, "%d~%d",
 							&dump_opt.start_nat,
@@ -916,6 +926,8 @@ static void do_dump(struct f2fs_sb_info *sbi)
 		dump_info_from_blkaddr(sbi, opt->blk_addr);
 	if (opt->nid)
 		dump_node(sbi, opt->nid, 0);
+	if (opt->scan_nid)
+		dump_node_scan_disk(sbi, opt->scan_nid);
 
 	print_cp_state(flag);
 
diff --git a/man/dump.f2fs.8 b/man/dump.f2fs.8
index 1ddb7fc..94bf5f3 100644
--- a/man/dump.f2fs.8
+++ b/man/dump.f2fs.8
@@ -10,6 +10,10 @@ dump.f2fs \- retrieve directory and file entries from an F2FS-formated image
 .I inode number
 ]
 [
+.B \-I
+.I inode number
+]
+[
 .B \-n
 .I NAT range
 ]
@@ -52,6 +56,9 @@ is 0 on success and -1 on failure.
 .BI \-i " inode number"
 Specify an inode number to dump out.
 .TP
+.BI \-I " inode number"
+Specify an inode number and scan full disk to dump out, include history inode block
+.TP
 .BI \-n " NAT range"
 Specify a range presented by nids to dump NAT entries.
 .TP
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

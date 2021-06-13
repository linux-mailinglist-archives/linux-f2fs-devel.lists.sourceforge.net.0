Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A64B73A56B3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 13 Jun 2021 07:56:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lsJ6F-0002Hv-I8; Sun, 13 Jun 2021 05:55:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lsJ6D-0002H6-QP
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Jun 2021 05:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nn6TfIRnQ3D+R0Zqu6TO32Q+xxP6AJGsbZrpVMygNwQ=; b=DIn+yY+mCviqpVIVTlMc6ecu5G
 86Y1zCZbFcSe6FmuV3J4SYkFNLVhCNfGf2tOo++9eP+eMFMGNWt8lJAuJT+TLUD3JEo9MPiNXw43s
 LdxNWkV3yrOnAklZ5lwGHBp45o98RWZXYtgWuJ1bGwPo6YRPBgon6Og3jaZfrlai+Hf8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nn6TfIRnQ3D+R0Zqu6TO32Q+xxP6AJGsbZrpVMygNwQ=; b=d
 T2lvp4yyh6rn9X2JaO5DHDzoWblxAmYlOoCwoz/Y5xL9+9e6pSHlhGa+fZQ31DyLThW+Jv12dWB/Q
 RkAEAXRKhzVYm/AsDG/3mdqvqQMQ6WnCpGntZhD7YPaQgSVxAmlnUIJ4/OkRZDqAnS6CYKU0rXSCa
 Ft7Zh0Mv/lX4dQbw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lsJ61-007HPK-NW
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Jun 2021 05:55:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15E4E611CC;
 Sun, 13 Jun 2021 05:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623563732;
 bh=1ATLRdczhzkvB0se9TEZOPBht7+RY7QMzl5jiSz2U/E=;
 h=From:To:Cc:Subject:Date:From;
 b=A56X/LBURpfhEkxQP/5iKfkXlyYkmEOpmw4BtEBSdEFoBbGDbkQsd1kG8BusITtaR
 avmh1TWrT/3wKUaICCzxJz+Qurjuc93cAsK4f5mZ2INRzzNWY0BzS5asr92cka4KSS
 lia/fp4M6NG6TJDtiIjQdjspWfkTqB/V4+HNOUOQVETKdYWDRikkwTJpDIko/J2zfJ
 ODy3HsTU/GvwZLl5n25NR+qO1X81WBENx/cx/LrvvRgeSy/yFioj/uDw1e5yRjegyn
 uWcnQiV2PHCYyj9QtNbsy0se9DWti8H+lmHXfe+pKhfbrinCSP7FoySGyJNbeRFRIf
 6ei8CJXfRB/0g==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 12 Jun 2021 22:55:27 -0700
Message-Id: <20210613055529.2471492-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lsJ61-007HPK-NW
Subject: [f2fs-dev] [PATCH 1/3] dump.f2fs: add -M to get block map
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/dump.c     | 38 +++++++++++++++++++++++++++++++++++++-
 fsck/main.c     |  6 +++++-
 man/dump.f2fs.8 |  7 +++++++
 3 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index 042a2e52edca..e25c70af84ed 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -23,6 +23,9 @@
 
 #define BUF_SZ	80
 
+/* current extent info */
+struct extent_info dump_extent = { 0, 0, 0};
+
 const char *seg_type_name[SEG_TYPE_MAX + 1] = {
 	"SEG_TYPE_DATA",
 	"SEG_TYPE_CUR_DATA",
@@ -227,6 +230,21 @@ void ssa_dump(struct f2fs_sb_info *sbi, int start_ssa, int end_ssa)
 	close(fd);
 }
 
+static void print_extent(bool last)
+{
+	if (dump_extent.len == 1) {
+		printf(" %d", dump_extent.blk);
+		dump_extent.len = 0;
+	} else {
+		printf(" %d-%d",
+			dump_extent.blk,
+			dump_extent.blk + dump_extent.len - 1);
+		dump_extent.len = 0;
+	}
+	if (last)
+		printf("\n");
+}
+
 static void dump_data_blk(struct f2fs_sb_info *sbi, __u64 offset, u32 blkaddr)
 {
 	char buf[F2FS_BLKSIZE];
@@ -237,8 +255,19 @@ static void dump_data_blk(struct f2fs_sb_info *sbi, __u64 offset, u32 blkaddr)
 	/* get data */
 	if (blkaddr == NEW_ADDR || !IS_VALID_BLK_ADDR(sbi, blkaddr)) {
 		memset(buf, 0, F2FS_BLKSIZE);
+	} else if (c.show_file_map) {
+		if (dump_extent.len == 0) {
+			dump_extent.blk = blkaddr;
+			dump_extent.len = 1;
+		} else if (dump_extent.blk + dump_extent.len == blkaddr) {
+			dump_extent.len++;
+		} else {
+			print_extent(false);
+		}
+		return;
 	} else {
 		int ret;
+
 		ret = dev_read_block(buf, blkaddr);
 		ASSERT(ret >= 0);
 	}
@@ -404,6 +433,8 @@ static void dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 		else
 			ASSERT(0);
 	}
+	/* last block in extent cache */
+	print_extent(true);
 
 	dump_xattr(sbi, node_blk);
 }
@@ -433,6 +464,10 @@ static void dump_file(struct f2fs_sb_info *sbi, struct node_info *ni,
 	if (force)
 		goto dump;
 
+	/* dump file's data */
+	if (c.show_file_map)
+		return dump_inode_blk(sbi, ni->ino, node_blk);
+
 	printf("Do you want to dump this file into ./lost_found/? [Y/N] ");
 	ret = scanf("%s", ans);
 	ASSERT(ret >= 0);
@@ -505,7 +540,8 @@ void dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
 
 	if (le32_to_cpu(node_blk->footer.ino) == ni.ino &&
 			le32_to_cpu(node_blk->footer.nid) == ni.nid) {
-		print_node_info(sbi, node_blk, force);
+		if (!c.show_file_map)
+			print_node_info(sbi, node_blk, force);
 
 		if (ni.ino == ni.nid)
 			dump_file(sbi, &ni, node_blk, force);
diff --git a/fsck/main.c b/fsck/main.c
index c07be1edc94e..2588a01799c2 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -93,6 +93,7 @@ void dump_usage()
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -i inode no (hex)\n");
 	MSG(0, "  -n [NAT dump nid from #1~#2 (decimal), for all 0~-1]\n");
+	MSG(0, "  -M show a block map\n");
 	MSG(0, "  -s [SIT dump segno from #1~#2 (decimal), for all 0~-1]\n");
 	MSG(0, "  -S sparse_mode\n");
 	MSG(0, "  -a [SSA dump segno from #1~#2 (decimal), for all 0~-1]\n");
@@ -376,7 +377,7 @@ void f2fs_parse_options(int argc, char *argv[])
 		}
 	} else if (!strcmp("dump.f2fs", prog)) {
 #ifdef WITH_DUMP
-		const char *option_string = "d:i:n:s:Sa:b:V";
+		const char *option_string = "d:i:n:Ms:Sa:b:V";
 		static struct dump_option dump_opt = {
 			.nid = 0,	/* default root ino */
 			.start_nat = -1,
@@ -423,6 +424,9 @@ void f2fs_parse_options(int argc, char *argv[])
 							&dump_opt.start_nat,
 							&dump_opt.end_nat);
 				break;
+			case 'M':
+				c.show_file_map = 1;
+				break;
 			case 's':
 				ret = sscanf(optarg, "%d~%d",
 							&dump_opt.start_sit,
diff --git a/man/dump.f2fs.8 b/man/dump.f2fs.8
index eedba855721f..1ddb7fc5d0d9 100644
--- a/man/dump.f2fs.8
+++ b/man/dump.f2fs.8
@@ -14,6 +14,10 @@ dump.f2fs \- retrieve directory and file entries from an F2FS-formated image
 .I NAT range
 ]
 [
+.B \-M
+.I Block map
+]
+[
 .B \-s
 .I SIT range
 ]
@@ -51,6 +55,9 @@ Specify an inode number to dump out.
 .BI \-n " NAT range"
 Specify a range presented by nids to dump NAT entries.
 .TP
+.BI \-M " Block map"
+Show all the allocated block addresses given inode number.
+.TP
 .BI \-s " SIT range"
 Specify a range presented by segment numbers to dump SIT entries.
 .TP
-- 
2.32.0.272.g935e593368-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4489B3711F1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 May 2021 09:27:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ldSzQ-0000nl-Kg; Mon, 03 May 2021 07:27:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dwoo08.lee@samsung.com>) id 1ldSzO-0000nb-Mt
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 May 2021 07:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k9dfb+FE5RpStYSBGP8Ud4ifK6id3VI4G0/4D/sCfTI=; b=QkAH3Mqr7pXWpwp1kkX2rLroDA
 Ie+OSJhkenzAQuARosDQTQJxbZo7SnWPXSBLJsyeZ3yyLQZhPsFW+OJquNv89LSTgPYu9/bjkF5hk
 W0uyE2SvQ83+SeIWVUhy2x5q+5oKSe61S4fPvaNjQq71IFTX81VuTyLqp9mwuBcE0p6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=k9dfb+FE5RpStYSBGP8Ud4ifK6id3VI4G0/4D/sCfTI=; b=g
 L81xN0M8WOqhAjxIDAoWtJTmiVUAli10CFgIawUo5IV0cJmhGOBBNcYY7H3/JoE0YIjcWquk/5J9g
 WguL8k5WabuxjP3WcKTIyIIXqlXHK3rVDleUU/F+BxC7JG22LbWzaqdSy8Ya8Qa4YbVfPO9hJvb7y
 5ktUltw+LVLxToDc=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ldSzJ-0007ln-1a
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 May 2021 07:27:35 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210503072717epoutp016203f7ea8b23a5b2abe345e15622332b~7fdMzGox42082420824epoutp01N
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 May 2021 07:27:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210503072717epoutp016203f7ea8b23a5b2abe345e15622332b~7fdMzGox42082420824epoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1620026837;
 bh=k9dfb+FE5RpStYSBGP8Ud4ifK6id3VI4G0/4D/sCfTI=;
 h=From:To:Cc:Subject:Date:References:From;
 b=CiikShYkSSL3J2kWZoqnp53rA85dJ0HFx33gD92FwRI99lcaAg7RC8iwyWnuVmUu6
 FOUku5VKVI2ZvKL24c0Qp4zcBxU5uP7cgcI8oSuC5C6zPqRDOkBXaSydtyJOxAD/JO
 bKBk3YBcI/Qf3w7Oolj1gdXAcUxF9VlsqLxpwmKA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20210503072716epcas1p35b08e0269115dccf80d1d06311111616~7fdL28Pvz2737827378epcas1p3e;
 Mon,  3 May 2021 07:27:16 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.154]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4FYZL94P98z4x9Q9; Mon,  3 May
 2021 07:27:13 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 09.B9.10258.EC5AF806; Mon,  3 May 2021 16:27:10 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210503072707epcas1p265555022f85b62cd9f6780fcc34160a6~7fdDxtGQO1121811218epcas1p2L;
 Mon,  3 May 2021 07:27:07 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210503072707epsmtrp14ac19b49f8b2799116d69c419e1d0f13~7fdDxFgRo2923629236epsmtrp1r;
 Mon,  3 May 2021 07:27:07 +0000 (GMT)
X-AuditID: b6c32a38-419ff70000002812-ef-608fa5cedffb
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 33.D2.08637.BC5AF806; Mon,  3 May 2021 16:27:07 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.208]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210503072707epsmtip168d72e1412ccfef32c501775c34121c8~7fdDlPQ3N0162401624epsmtip14;
 Mon,  3 May 2021 07:27:07 +0000 (GMT)
From: Dongwoo Lee <dwoo08.lee@samsung.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  3 May 2021 16:27:03 +0900
Message-Id: <20210503072703.733501-1-dwoo08.lee@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKKsWRmVeSWpSXmKPExsWy7bCmnu65pf0JBv8v81m0HLjBbHFpkbsD
 k8fuBZ+ZPPq2rGIMYIrKtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21
 VXLxCdB1y8wBGq+kUJaYUwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKbAs0CtOzC0uzUvX
 S87PtTI0MDAyBSpMyM5o3fiBtWCfTsXB73+YGxgnq3QxcnJICJhIbFi5gh3EFhLYwShxu8uv
 i5ELyP7EKDH7dgsbhPONUWLW981AVRxgHav3u0LE9zJKHHvayQjhfGGU+HBvLyNIEZuAlsT+
 X8UgU0WAzIkNfxlBbGYBDYkbJ9+ygdjCAtoSV7esALNZBFQl/j3exgpi8wrYSJz58Zcd4jp5
 iZmXvrNDxAUlTs58wgIxR16ieetsZpC9EgL97BJTmjuhGlwkFnQ1MEHYwhKvjm+BiktJvOxv
 g7KrJfov7GeFaG5hlHjbcY0FImEssX/pZCaQB5gFNCXW79KHCCtK7Pw9F+oBPol3X3tYIQHB
 K9HRJgRhqkg0f2SG2bTu/T+ogR4Sfxofs0ICN1bi5qQZjBMY5Wch+WYWkm9mIexdwMi8ilEs
 taA4Nz212LDABDlKNzGC05eWxQ7GuW8/6B1iZOJgPMQowcGsJMI7a0lvghBvSmJlVWpRfnxR
 aU5q8SFGU2D4TmSWEk3OBybQvJJ4Q1MjY2NjCxNDM1NDQyVx3nTn6gQhgfTEktTs1NSC1CKY
 PiYOTqkGJs6PrNa96g/Ozlo8PUXc+4LWrQ/MeU8Fxf4EfvKffUJhxsGK6DDu3QskJvve790m
 ELBv+5UDYQ42P878P61VXKS/xna7hnhMUKCk8btLErMyNbnSH08S0fQxeV1iITl/wWdGfwGn
 Zgf/0Ev8k1dYxVoZpr2/sHLrJImp2i/OqH+NUfZo5bhYzLPuUedTnqnTLKV06sx7d3k+0TgS
 67HpQLDWmcdRHmLNjqs6/7Fbbo5e7qSVM+PX7gWxpfzBrzmPxevtEq6IbvE2OMhf7a9nYG0Q
 qLG4zPrCITPtO/YzM4wcu9cZfvvyIql/orX7JPWzm86dWJqkxlujzFEl23LDU/TAxkfzDnG5
 sM4z6FyqxFKckWioxVxUnAgApbL2uugDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpiluLIzCtJLcpLzFFi42LZdlhJTvf00v4Eg0fveSxaDtxgtri0yN2B
 yWP3gs9MHn1bVjEGMEVx2aSk5mSWpRbp2yVwZbRu/MBasE+n4uD3P8wNjJNVuhg5OCQETCRW
 73ftYuTiEBLYzShxbslVNoi4lMS/NwIQprDE4cPFXYycQCWfGCVW9IJVsAloSez/BRYWATIn
 NvxlBLGZBTQkbpx8ywZiCwtoS1zdsgLMZhFQlfj3eBsriM0rYCNx5sdfdhBbQkBeYual7+wQ
 cUGJkzOfsEDMkZdo3jqbeQIj3ywkqVlIUgsYmVYxSqYWFOem5xYbFhjmpZbrFSfmFpfmpesl
 5+duYgQHk5bmDsbtqz7oHWJk4mA8xCjBwawkwjtrSW+CEG9KYmVValF+fFFpTmrxIUZpDhYl
 cd4LXSfjhQTSE0tSs1NTC1KLYLJMHJxSDUw+9i/OMlzmyd9+br767FlpT5jUdBw7v56PX7Gh
 j+Ojha7CgR3Vd7R2doRXJDhaSVfcO5BWe1jik+TcK3dW3u+tji923rBuFZvN47SXVVOavJTV
 67qt1838+/++8r2fq2vlQmb23zc5uWbZf1OfmsAPMiGvbHgCl+58sdStK3fmjaKDjSc5b++a
 JDvtz8471Y+03y/svriVJZv9YG64dFVBzOpudxvT/d9rAxpecXzf/lfgXOycRz1VFbm6e++w
 HrgswCtad2qm3xfFD2z6J19ebT7XE/V3JveD0iVJS5ZWpMWfNnjAsfTu1hwRrmC5RbWLtvsU
 7mlZcu5n6IdDWpXXLc4JbFHfYP3E8kfu5U/KSizFGYmGWsxFxYkAWlroGpUCAAA=
X-CMS-MailID: 20210503072707epcas1p265555022f85b62cd9f6780fcc34160a6
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210503072707epcas1p265555022f85b62cd9f6780fcc34160a6
References: <CGME20210503072707epcas1p265555022f85b62cd9f6780fcc34160a6@epcas1p2.samsung.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ldSzJ-0007ln-1a
Subject: [f2fs-dev] [PATCH] tools: Introduce f2fslabel
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Although many other filesystems provide a tool for changing volume
label, e.g. e2label for ext filesystem, but f2fs has no way to change
volume label except set it while formatting with mkfs.f2fs.

This introduces f2fslabel, simple tool for changing label of f2fs
volume.

Signed-off-by: Dongwoo Lee <dwoo08.lee@samsung.com>
---
 man/Makefile.am   |   2 +-
 man/f2fslabel.8   |  33 ++++++++++
 tools/Makefile.am |   4 +-
 tools/f2fslabel.c | 149 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 186 insertions(+), 2 deletions(-)
 create mode 100644 man/f2fslabel.8
 create mode 100644 tools/f2fslabel.c

diff --git a/man/Makefile.am b/man/Makefile.am
index 1d16c6f..9363b82 100644
--- a/man/Makefile.am
+++ b/man/Makefile.am
@@ -1,3 +1,3 @@
 ## Makefile.am
 
-dist_man_MANS = mkfs.f2fs.8 fsck.f2fs.8 dump.f2fs.8 defrag.f2fs.8 resize.f2fs.8 sload.f2fs.8 f2fs_io.8
+dist_man_MANS = mkfs.f2fs.8 fsck.f2fs.8 dump.f2fs.8 defrag.f2fs.8 resize.f2fs.8 sload.f2fs.8 f2fs_io.8 f2fslabel.8
diff --git a/man/f2fslabel.8 b/man/f2fslabel.8
new file mode 100644
index 0000000..848ed3b
--- /dev/null
+++ b/man/f2fslabel.8
@@ -0,0 +1,33 @@
+.\" Copyright (c) 2021 Samsung Electronics Co., Ltd.
+.\"
+.TH F2FSLABEL 8
+.SH NAME
+f2fslabel \- Change the label on an f2fs volume
+.SH SYNOPSIS
+.B f2fslabel
+.I device
+[
+.I volume-label
+]
+.SH DESCRIPTION
+.B f2fslabel
+will display or change the volume label on the f2fs located on
+.I device.
+.PP
+If the optional argument
+.I volume-label
+is present, then
+.B f2fslabel
+will set the volume label to be
+.IR volume-label .
+.PP
+Otherwise,
+.B f2fslabel
+will simply show the current label.
+.PP
+.SH AUTHOR
+.B f2fslabel
+was written by Dongwoo Lee (dwoo08.lee@samsung.com).
+.SH AVAILABILITY
+.B f2fslabel
+is available from git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git.
diff --git a/tools/Makefile.am b/tools/Makefile.am
index 56bf2e4..84f0ae4 100644
--- a/tools/Makefile.am
+++ b/tools/Makefile.am
@@ -2,10 +2,12 @@
 
 AM_CPPFLAGS = ${libuuid_CFLAGS} -I$(top_srcdir)/include
 AM_CFLAGS = -Wall
-sbin_PROGRAMS = f2fstat fibmap.f2fs parse.f2fs
+sbin_PROGRAMS = f2fstat fibmap.f2fs parse.f2fs f2fslabel
 f2fstat_SOURCES = f2fstat.c
 fibmap_f2fs_SOURCES = fibmap.c
 parse_f2fs_SOURCES = f2fs_io_parse.c
+f2fslabel_SOURCES = f2fslabel.c
+f2fslabel_LDADD = $(top_builddir)/lib/libf2fs.la
 
 if LINUX
 sbin_PROGRAMS += f2fscrypt
diff --git a/tools/f2fslabel.c b/tools/f2fslabel.c
new file mode 100644
index 0000000..3af845c
--- /dev/null
+++ b/tools/f2fslabel.c
@@ -0,0 +1,149 @@
+#include <f2fs_fs.h>
+#include <fcntl.h>
+
+enum SB_ADDR {
+	SB0_ADDR = 0,
+	SB1_ADDR,
+	SB_MAX_ADDR,
+};
+
+#define SB_MASK(i)	(1 << (i))
+#define SB_MASK_ALL	(SB_MASK(SB0_ADDR) | SB_MASK(SB1_ADDR))
+
+struct f2fs_super_block sb_raw;
+
+static int verify_sb_chksum(struct f2fs_super_block *sb)
+{
+	if (get_sb(checksum_offset) != SB_CHKSUM_OFFSET)
+		return -1;
+
+	if (f2fs_crc_valid(get_sb(crc), sb, get_sb(checksum_offset)))
+		return -1;
+
+	return 0;
+}
+
+static int read_and_check_sb(enum SB_ADDR sb_addr)
+{
+	char buf[F2FS_BLKSIZE];
+	struct f2fs_super_block *sb = &sb_raw;
+
+	if (dev_read_block(buf, sb_addr))
+		return -1;
+
+	memcpy(sb, buf + F2FS_SUPER_OFFSET, sizeof(struct f2fs_super_block));
+
+	if ((get_sb(feature) & F2FS_FEATURE_SB_CHKSUM) &&
+	    verify_sb_chksum(sb))
+		return -1;
+
+	if (get_sb(magic) != F2FS_SUPER_MAGIC)
+		return -1;
+
+	return 0;
+}
+
+static int open_sb(int mode)
+{
+	struct device_info *dev = &c.devices[0];
+	int ret;
+
+	ret = open(dev->path, mode);
+	if (ret < 0) {
+		perror(dev->path);
+		fprintf(stderr, "f2fslabel: Failed to open device: %s\n",
+			dev->path);
+		exit(1);
+	}
+
+	dev->fd = ret;
+
+	ret = read_and_check_sb(SB0_ADDR);
+	if (ret) {
+		ret = read_and_check_sb(SB1_ADDR);
+		if (ret) {
+			fprintf(stderr,
+				"f2fslabel: Invalid f2fs superblock: %s\n",
+				dev->path);
+			exit(1);
+		}
+	}
+
+	return 0;
+}
+
+static void print_label(void)
+{
+	struct f2fs_super_block *sb = &sb_raw;
+	char label[MAX_VOLUME_NAME];
+
+	if (open_sb(O_RDONLY))
+		exit(1);
+
+	utf16_to_utf8(label, sb->volume_name, MAX_VOLUME_NAME, MAX_VOLUME_NAME);
+	printf("%s\n", label);
+}
+
+static void update_superblock(struct f2fs_super_block *sb, int sb_mask)
+{
+	int addr, ret;
+	u_int8_t *buf;
+
+	buf = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(buf);
+
+	if (get_sb(feature) & F2FS_FEATURE_SB_CHKSUM) {
+		set_sb(crc, f2fs_cal_crc32(F2FS_SUPER_MAGIC, sb,
+					   SB_CHKSUM_OFFSET));
+	}
+
+	memcpy(buf + F2FS_SUPER_OFFSET, sb, sizeof(*sb));
+	for (addr = SB0_ADDR; addr < SB_MAX_ADDR; addr++) {
+		if (SB_MASK(addr) & sb_mask) {
+			ret = dev_write_block(buf, addr);
+			ASSERT(ret >= 0);
+		}
+	}
+
+	free(buf);
+}
+
+static void change_label(char *label)
+{
+	struct f2fs_super_block *sb = &sb_raw;
+	int len;
+
+	if (open_sb(O_RDWR))
+		exit(1);
+
+	len = strlen(label);
+	if (len > MAX_VOLUME_NAME) {
+		fprintf(stderr,
+			"f2fslabel: Label should be less than %d characters\n",
+			MAX_VOLUME_NAME);
+		exit(1);
+	}
+
+	utf8_to_utf16(sb->volume_name, label, MAX_VOLUME_NAME, len);
+
+	update_superblock(sb, SB_MASK_ALL);
+}
+
+int main(int argc, char **argv)
+{
+	if (argc < 2 || argc > 3) {
+		fprintf(stderr, "Usage: f2fslabel device [newlabel]\n");
+		exit(1);
+	}
+
+	f2fs_init_configuration();
+
+	c.devices[0].path = argv[1];
+
+	if (argc == 2)
+		print_label();
+	else if (argc == 3)
+		change_label(argv[2]);
+
+	return 0;
+}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

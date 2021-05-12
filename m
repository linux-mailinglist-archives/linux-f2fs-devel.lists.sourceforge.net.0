Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9E837B8E2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 11:09:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgkrp-0007Dh-Tz; Wed, 12 May 2021 09:09:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <dwoo08.lee@samsung.com>) id 1lgkrn-0007DQ-2J
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 09:09:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JTRb1waLUMJEiINQbySRcXNqZklvl+ewTZZGsnzKGNA=; b=EATasyw9o9vKKqizA06/SvZPdg
 WjbAWJ0JHyTIU7TyLdxhf9NVPVqvgX3VugvyhrEJCX042vZ8t/4349YeUboXpSfQM9YYHNyxBH7w4
 w9XFycnfu27mgEwGAIfuGMiD6FoUZgOiPygTcA3WF0+qR7B6iXLfGDZs2wVlUgZstEQw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JTRb1waLUMJEiINQbySRcXNqZklvl+ewTZZGsnzKGNA=; b=I
 tdCJ27RwTL40IETeDssR6eCv7Jn654ivRMT082sDZZpTrSSE2Wx8Gr/Ixx+AeSZNm8vohKWKE7bWN
 ATIF9K3T2/0U+oL2paa+c8CjSC0qG7A2xd+8qKceVe3w6U80/BgrabSlZm6YHaVdoWbfZtMIVOTHe
 2zxElhUDrLckswDs=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgkrb-0055cz-Bd
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 09:09:19 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210512090852epoutp039ec0166dad8063a102a868fce8be8f12~_Rpd5qhZA1660016600epoutp03M
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 May 2021 09:08:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210512090852epoutp039ec0166dad8063a102a868fce8be8f12~_Rpd5qhZA1660016600epoutp03M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1620810532;
 bh=JTRb1waLUMJEiINQbySRcXNqZklvl+ewTZZGsnzKGNA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=jFLI1HZoV+rDr8PE8T9o/f6lXR8txRab3S8eZlo4EZX+g0adWL3zv6tAl3hwv/5RQ
 paML7Q9DFu7icJQHCf3NWO39j8COx8iGOPsc9Rgh6rfaU0Hn6lr4TLAEnmvNJrsE6e
 zsMI+KI4QHVxxVi+t9hLd9vATXaXZNWgbe9n0ijA=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20210512090851epcas1p3ca3e88420d9d1a989527f7b05a15844d~_RpdQPuUz1458814588epcas1p3P;
 Wed, 12 May 2021 09:08:51 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.153]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Fg89F3Pgyz4x9Pw; Wed, 12 May
 2021 09:08:49 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 1B.BF.09701.E1B9B906; Wed, 12 May 2021 18:08:46 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210512090846epcas1p1c19254a0f25b579c697a497fe94f68ad~_RpYR5sFU3224132241epcas1p1V;
 Wed, 12 May 2021 09:08:46 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210512090846epsmtrp1e79b14395cb6a0a6545b0a0987a2cf1d~_RpYRWtWr0190801908epsmtrp1T;
 Wed, 12 May 2021 09:08:46 +0000 (GMT)
X-AuditID: b6c32a36-631ff700000025e5-5a-609b9b1ec905
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 7E.94.08163.E1B9B906; Wed, 12 May 2021 18:08:46 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.208]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210512090846epsmtip12a7b9f827d385bcc19daf7bde406ba26~_RpYFkulk0228602286epsmtip1k;
 Wed, 12 May 2021 09:08:46 +0000 (GMT)
From: Dongwoo Lee <dwoo08.lee@samsung.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 12 May 2021 18:08:42 +0900
Message-Id: <20210512090842.162973-1-dwoo08.lee@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMKsWRmVeSWpSXmKPExsWy7bCmga7c7NkJBqfuKVm0HLjBbHFpkbsD
 k8fuBZ+ZPPq2rGIMYIrKtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21
 VXLxCdB1y8wBGq+kUJaYUwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKbAs0CtOzC0uzUvX
 S87PtTI0MDAyBSpMyM44cSW64LR2xY6fvg2Mt5S6GDk5JARMJPo6HzB3MXJxCAnsYJTYeeM7
 G4TziVHix/I3jCBVQgKfGSWWvC7oYuQA6zi5ThyiZhejxPHeg6wQzhdGib1nZ7GCFLEJaEns
 /1UM0isCZE5s+As2h1lAQ+LGybdsILawgJ7E8fNv2UFsFgFViXv3boDFeQVsJN4+PcUOcZ28
 xMxL39kh4oISJ2c+YYGYIy/RvHU22NUSAt3sEn8eXWSCaHCR2HrsFzOELSzx6vgWqEFSEi/7
 26Dsaon+C/tZIZpbGCXedlxjgUgYS+xfOpkJ5AFmAU2J9bv0IcKKEjt/z4V6gE/i3dceVkhA
 8Ep0tAlBmCoSzR+ZYTate/8PaqCHxJSTh5ghQRgrsXfiG8YJjPKzkHwzC8k3sxD2LmBkXsUo
 llpQnJueWmxYYIQcoZsYwalLy2wH46S3H/QOMTJxMB5ilOBgVhLhFUuanSDEm5JYWZValB9f
 VJqTWnyI0RQYvhOZpUST84HJM68k3tDUyNjY2MLE0MzU0FBJnDfduTpBSCA9sSQ1OzW1ILUI
 po+Jg1Oqgcm9c1XejyORfeVmZ+/NPpj/3dQtfWZgmOeBY2dnr639+WDndZnlF2oClPalzDi1
 unL/xK2TL3n8/dK5X3ZexN6j9wI2/Touk3qg+7lPaNZxSaFHirM4zu+2+H026XfV+QcCbKpX
 5a5oLtDZ1yPJ+d/T1+Ya2/HJH2wf/KhpP+3UPrn3nuC6H0++5ce0pF6INtP9//jg9oW/2vlO
 n2iNN9BqltzBLGhgfDjl16Rv1QcsEz/Nv+mzJuyHc7fJZFab7Ov/3lxuvaLx1uyc7YHZ3xNV
 nzQcUdS/tWRC1LSsaYqfP1WWrknrrLp450Lgz9sOeum8iavOHKxfozmpdqOa5srIb3Ly3KFz
 +pNlON2Weuj/UWIpzkg01GIuKk4EANQDGx7mAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkluLIzCtJLcpLzFFi42LZdlhJTldu9uwEg9dbOSxaDtxgtri0yN2B
 yWP3gs9MHn1bVjEGMEVx2aSk5mSWpRbp2yVwZZy4El1wWrtix0/fBsZbSl2MHBwSAiYSJ9eJ
 dzFycQgJ7GCUeHhzFxtEXEri3xsBCFNY4vDhYoiST4wSe2ftBithE9CS2P8LKM7JIQJkTmz4
 ywhiMwtoSNw4+ZYNxBYW0JM4fv4tO4jNIqAqce/eDbA4r4CNxNunp8DiEgLyEjMvfWeHiAtK
 nJz5hAVijrxE89bZzBMY+WYhSc1CklrAyLSKUTK1oDg3PbfYsMAoL7Vcrzgxt7g0L10vOT93
 EyM4lLS0djDuWfVB7xAjEwfjIUYJDmYlEV6xpNkJQrwpiZVVqUX58UWlOanFhxilOViUxHkv
 dJ2MFxJITyxJzU5NLUgtgskycXBKNTDt/JLzKzN0p4ZbZN+tfEvO7W1vt3XUJbgs6l93wWDz
 4pnXWcJOz189xX+fq9KyEmaBpwpxssLvy//siNq4zjaK5ZCmVr4lq9SlwpDvP5p/ZQtJzzdp
 Vl8R8C5TpGjV/M6bvF3ntuxh7z/y7UVDquix8L8nGo5clDrs6dUv1Ppgwq2ZfwPVF4rdaemd
 3HaVQ/7zw9S2lftSNrCkPn7QpTBj28v2E58PuJhtYdv2jqHt98fArcbSdk7y69MY3ydlPGp2
 f55WmsipnJMks403QDhKIKmKccP5wxdzv047JCSisJ6j7G1B6LsHStqn3u9S5eqOkE9dJGaV
 n1ahfbVlV/8ho7QH9RMuXpB+axbyKFaJpTgj0VCLuag4EQDbv88QlAIAAA==
X-CMS-MailID: 20210512090846epcas1p1c19254a0f25b579c697a497fe94f68ad
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210512090846epcas1p1c19254a0f25b579c697a497fe94f68ad
References: <CGME20210512090846epcas1p1c19254a0f25b579c697a497fe94f68ad@epcas1p1.samsung.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lgkrb-0055cz-Bd
Subject: [f2fs-dev] [PATCH v2] tools: Introduce f2fslabel
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

Changes in v2:
- Integrated into fsck/main.c instead of individual tool

 fsck/Makefile.am  |  1 +
 fsck/main.c       | 79 +++++++++++++++++++++++++++++++++++++++++++++++
 include/f2fs_fs.h |  2 ++
 man/Makefile.am   |  2 +-
 man/f2fslabel.8   | 33 ++++++++++++++++++++
 5 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 man/f2fslabel.8

diff --git a/fsck/Makefile.am b/fsck/Makefile.am
index e7d599c..e31d416 100644
--- a/fsck/Makefile.am
+++ b/fsck/Makefile.am
@@ -18,3 +18,4 @@ install-data-hook:
 	ln -sf fsck.f2fs $(DESTDIR)/$(sbindir)/defrag.f2fs
 	ln -sf fsck.f2fs $(DESTDIR)/$(sbindir)/resize.f2fs
 	ln -sf fsck.f2fs $(DESTDIR)/$(sbindir)/sload.f2fs
+	ln -sf fsck.f2fs $(DESTDIR)/$(sbindir)/f2fslabel
diff --git a/fsck/main.c b/fsck/main.c
index 64efa87..6a9668a 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -155,6 +155,14 @@ void sload_usage()
 	exit(1);
 }
 
+void label_usage()
+{
+	MSG(0, "\nUsage: f2fslabel [options] device [volume-label]\n");
+	MSG(0, "[options]:\n");
+	MSG(0, "  -V print the version number and exit\n");
+	exit(1);
+}
+
 static int is_digits(char *optarg)
 {
 	unsigned int i;
@@ -177,6 +185,8 @@ static void error_out(char *prog)
 		resize_usage();
 	else if (!strcmp("sload.f2fs", prog))
 		sload_usage();
+	else if (!strcmp("f2fslabel", prog))
+		label_usage();
 	else
 		MSG(0, "\nWrong program.\n");
 }
@@ -722,6 +732,39 @@ void f2fs_parse_options(int argc, char *argv[])
 			}
 		}
 #endif /* WITH_SLOAD */
+	} else if (!strcmp("f2fslabel", prog)) {
+#ifdef WITH_LABEL
+		const char *option_string = "V";
+
+		c.func = LABEL;
+		while ((option = getopt(argc, argv, option_string)) != EOF) {
+			switch (option) {
+			case 'V':
+				show_version(prog);
+				exit(0);
+			default:
+				err = EUNKNOWN_OPT;
+				break;
+			}
+			if (err != NOERROR)
+				break;
+		}
+
+		if (argc > (optind + 2)) { /* unknown argument(s) is(are) passed */
+			optind += 2;
+			err = EUNKNOWN_ARG;
+		} else if (argc == (optind + 2)) { /* change label */
+			c.vol_label = strdup(argv[optind + 1]);
+			argc--;
+		} else { /* print label */
+			/*
+			 * Since vol_label was initialized as "", in order to
+			 * distinguish between clear label and print, set
+			 * vol_label as NULL for print case
+			 */
+			c.vol_label = NULL;
+		}
+#endif /* WITH_LABEL */
 	}
 
 	if (err == NOERROR) {
@@ -971,6 +1014,36 @@ static int do_sload(struct f2fs_sb_info *sbi)
 }
 #endif
 
+#ifdef WITH_LABEL
+static int do_label(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
+
+	if (!c.vol_label) {
+		char label[MAX_VOLUME_NAME];
+
+		utf16_to_utf8(label, sb->volume_name,
+			      MAX_VOLUME_NAME, MAX_VOLUME_NAME);
+		MSG(0, "Info: volume label = %s\n", label);
+		return 0;
+	}
+
+	if (strlen(c.vol_label) > MAX_VOLUME_NAME) {
+		ERR_MSG("Label should not exceed %d characters\n", MAX_VOLUME_NAME);
+		return -1;
+	}
+
+	utf8_to_utf16(sb->volume_name, (const char *)c.vol_label,
+		      MAX_VOLUME_NAME, strlen(c.vol_label));
+
+	update_superblock(sb, SB_MASK_ALL);
+
+	MSG(0, "Info: volume label is changed to %s\n", c.vol_label);
+
+	return 0;
+}
+#endif
+
 #if defined(__APPLE__)
 static u64 get_boottime_ns()
 {
@@ -1084,6 +1157,12 @@ fsck_again:
 		c.func = FSCK;
 		c.fix_on = 1;
 		goto fsck_again;
+#endif
+#ifdef WITH_LABEL
+	case LABEL:
+		if (do_label(sbi))
+			goto out_err;
+		break;
 #endif
 	default:
 		ERR_MSG("Wrong program name\n");
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index cdcce2c..5d49ed1 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -35,6 +35,7 @@
 #define WITH_DEFRAG
 #define WITH_RESIZE
 #define WITH_SLOAD
+#define WITH_LABEL
 #endif
 
 #include <inttypes.h>
@@ -343,6 +344,7 @@ enum f2fs_config_func {
 	DEFRAG,
 	RESIZE,
 	SLOAD,
+	LABEL,
 };
 
 enum default_set {
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
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

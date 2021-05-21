Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F8E38C4FF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 May 2021 12:33:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lk2Sp-0005Tx-7d; Fri, 21 May 2021 10:33:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <dwoo08.lee@samsung.com>) id 1lk2Sn-0005Tm-Q5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 May 2021 10:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=43IvwOJnsL9N/6Fzsbz03An+SSdsuDcZ+kUxhZaEFwY=; b=C5tpClOt3Tfpt4oIZvQIIaSqIb
 0gIPJ0FI0noGDWJYag1vSI53FpV6WSJM9ScDMdlIlI1tXI0nDK06OvY95o5P3w60IiOuPXFPZKXg2
 1qcldmnwrAlcAeddwiP7Le+8tDKNR/5imoUFht0v9k4WFD8Bpwuf3qEjEoFPsT/3ICeQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=43IvwOJnsL9N/6Fzsbz03An+SSdsuDcZ+kUxhZaEFwY=; b=g
 h2Zr/ZAv+XI2ozJSQJ52HU4hid/KE0CGZtzpK54y/38WEm9m3ud/gq9JTjYiNwcrVokyahGtpNDX7
 aUffw1wcq9vkaXz+nE2hFZvk9rXXX773597yPxXvMYRQKSZUfm+t07UB7z20J3lcZJui2A/4oFJjt
 +k0UipeIlq5ygDv4=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lk2Sc-0000cy-To
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 May 2021 10:33:05 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210521103249epoutp0290936561ddad65afc33a58f3a9d06fc8~BDmVS2QAG1310313103epoutp02N
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 May 2021 10:32:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210521103249epoutp0290936561ddad65afc33a58f3a9d06fc8~BDmVS2QAG1310313103epoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1621593169;
 bh=43IvwOJnsL9N/6Fzsbz03An+SSdsuDcZ+kUxhZaEFwY=;
 h=From:To:Cc:Subject:Date:References:From;
 b=poUwAy9ggqOKwN4rajclUhfKKjUaE/aaOobVm9zSXLKyOrAk7Ve4LeY0Gfszy7qYQ
 KOKBv16PntdGXZQFbuQ3+k4eIerRqDixsmHLI39n3r3Y3NsIg3bKNEUMq5eI6rzld4
 g3vntzsTB826Yw1JIIDOm4biJL1mgQHCYxYOVgIk=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20210521103248epcas1p4e78a9daaf3686c3a7243c5e9aa429848~BDmU3TCu90457204572epcas1p4e;
 Fri, 21 May 2021 10:32:48 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.155]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Fmjby45XYz4x9Ps; Fri, 21 May
 2021 10:32:46 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 0A.AE.09578.C4C87A06; Fri, 21 May 2021 19:32:44 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20210521103244epcas1p3ca430731d1ea20559aef4e3e68e49870~BDmQjRywa0927909279epcas1p36;
 Fri, 21 May 2021 10:32:44 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210521103244epsmtrp17a6a62f22ec762c0d17343320dd7de7f~BDmQip4711929419294epsmtrp1f;
 Fri, 21 May 2021 10:32:44 +0000 (GMT)
X-AuditID: b6c32a35-fcfff7000000256a-e6-60a78c4c0c23
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 40.3D.08637.B4C87A06; Fri, 21 May 2021 19:32:43 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.208]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210521103243epsmtip15c3f1ac6d31a439d7403c80d38042b85~BDmQWj_Z20717907179epsmtip1u;
 Fri, 21 May 2021 10:32:43 +0000 (GMT)
From: Dongwoo Lee <dwoo08.lee@samsung.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 21 May 2021 19:32:38 +0900
Message-Id: <20210521103238.261204-1-dwoo08.lee@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGKsWRmVeSWpSXmKPExsWy7bCmnq5Pz/IEg18HRSxaDtxgtri0yN2B
 yWP3gs9MHn1bVjEGMEVl22SkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qba
 Krn4BOi6ZeYAjVdSKEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFFgW6BUn5haX5qXr
 JefnWhkaGBiZAhUmZGf8fGJUMEmnYun12SwNjBOVuxg5OSQETCQ2/JnO0sXIxSEksINR4tKf
 l4wQzidGif6ZPawQzjdGiVVvnrLBtHw4tIgJIrGXUWLbgYfMEM4XRol3HVuBhnFwsAloSez/
 VQzSIAJkTmz4ywhiMwtoSNw4+RZskLCAnsTRGQdYQGwWAVWJfwuOMIHYvAI2Epc2/2SFWCYv
 MfPSd3aIuKDEyZlPWCDmyEs0b50NtldCYDK7xLXl6xkhGlwkWg7sgLpUWOLV8S3sELaUxMv+
 Nii7WqL/wn5WiOYWRom3HddYIBLGEvuXTmYCeYBZQFNi/S59iLCixM7fc6Ee4JN49xUULBxA
 cV6JjjYhCFNFovkjM8ymde//QQ30kPjw7ixYXEggVuLjzhOsExjlZyH5ZhaSb2Yh7F3AyLyK
 USy1oDg3PbXYsMAQOU43MYITmJbpDsaJbz/oHWJk4mA8xCjBwawkwsvtuDxBiDclsbIqtSg/
 vqg0J7X4EKMpMHwnMkuJJucDU2heSbyhqZGxsbGFiaGZqaGhkjhvunN1gpBAemJJanZqakFq
 EUwfEwenVAOT2NQEn827GZJ313ib7TuxoybV6vhP7u1VhmfTq091hPfumGWYyvy4x+rEhcnv
 Y/V+eUm9eSfRKfxr7Re3qvelUU9FBGxVLZkall2SyKxnet6ko50fwWnyNzd5Rvj/jw9+LLcs
 mzfBq2rSjNldWvdrG9g1zuawFS94nl45a++OJJdMoWcnfvw+r5shPD1CQFfS2DI/blrKNf1N
 s9nTX881eKRnNM9R22Ub2+PwuY8n9LldE19Q6XDx/qMJtwp3G71b2bfiWE/Elwlhn4v33P94
 9qGMbOH1T7q6jadWPfsmnL99nYmYXfdRNqfq8tXcp42u3pEuKr3auXxx+bm9ySU1pZf7fe/w
 +O+f6lmgvqNAiaU4I9FQi7moOBEAClsXXOkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmluLIzCtJLcpLzFFi42LZdlhJTte7Z3mCwbYJVhYtB24wW1xa5O7A
 5LF7wWcmj74tqxgDmKK4bFJSczLLUov07RK4Mn4+MSqYpFOx9PpslgbGicpdjJwcEgImEh8O
 LWLqYuTiEBLYzSjxZOFeti5GDqCElMS/NwIQprDE4cPFECWfGCWOrPrBDhJnE9CS2P+rGGSM
 CJA5seEvI4jNLKAhcePkWzYQW1hAT+LojAMsIDaLgKrEvwVHmEBsXgEbiUubf7JCnCAvMfPS
 d3aIuKDEyZlPWCDmyEs0b53NPIGRbxaS1CwkqQWMTKsYJVMLinPTc4sNCwzzUsv1ihNzi0vz
 0vWS83M3MYLDSUtzB+P2VR/0DjEycTAeYpTgYFYS4eV2XJ4gxJuSWFmVWpQfX1Sak1p8iFGa
 g0VJnPdC18l4IYH0xJLU7NTUgtQimCwTB6dUA9P0+MKMyZUVH7tWd7t4dRQsUC6atb/7hVDJ
 vb6zLEUvVD2+8AtvX8mQdP5nlIVi+i8n06S+cN2UTZn6Et/nnE7sfSkWG7srY+Nk/8ry22bH
 fn28MHOO4SoPefYZCxNX25Q/XfM/NZG91yh/he7+0PVzVj2ZqRCU/P66yt1GVcbFZteE1i/j
 3/U24c3fxZ8Ej7ra/Tw8oyhZcefcTT0B50WzUo+kPDBmd14uLiz7tFVb4J/ttbK4Pw9OtG5e
 t/KuuBNnkPG5LjWOR/HhTPzT+nQ+bW237VKw+Xh8zaXNnHw8P5ddqPq29fgyz12M26Yq6/pP
 vtil+8hkpcykmeJCm2aZ6dWx/nvy6vn2srxfl4yVWIozEg21mIuKEwECS2MwlgIAAA==
X-CMS-MailID: 20210521103244epcas1p3ca430731d1ea20559aef4e3e68e49870
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210521103244epcas1p3ca430731d1ea20559aef4e3e68e49870
References: <CGME20210521103244epcas1p3ca430731d1ea20559aef4e3e68e49870@epcas1p3.samsung.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: makefile.am]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lk2Sc-0000cy-To
Subject: [f2fs-dev] [PATCH v3] tools: Introduce f2fslabel
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

Changes in v3:
- Use volume label parameter directly rather duplicating it

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
index 64efa87..f42ab0c 100644
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
+			c.vol_label = argv[optind + 1];
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

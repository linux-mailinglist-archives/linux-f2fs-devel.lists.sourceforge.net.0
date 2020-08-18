Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9256D248406
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Aug 2020 13:42:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pc2/jGQsevUfxW4j5eok83d3gbVCU1PKNgiBGZPrUOs=; b=ZF5qCn7K7zcAg15ivLbYTnBaBR
	WyazvQY6WbFj/JpRx6upO3AOQ+vMoX0BA95GtddGYZwkuJ3qL8B4yS6ci05I4mN09/QTlSOOn0gxu
	qJVW1sm3l+HYDdc6rUxYAVTe7L0ylpiGGc+rXWSiBeQxkz+lIJ/9hmDiuoXYICt/GQNk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k800L-0005NX-MG; Tue, 18 Aug 2020 11:42:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3ALk7XwcKAGESBNLADRFNNFKD.BNL@flex--tcombes.bounces.google.com>)
 id 1k800K-0005NM-7O
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Aug 2020 11:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A4qZJ43yB2MCyVWnX8/FA39RBWOFzlU3xc9rhLKP5/c=; b=W4lfrx9LEP2MdF38gKmqI+QTrV
 fhRHzjU21hK/2A/R3JC0Q596mMGrqEF4Dyd62IQQQ0XiQJd/9Pp1m6zCx2ahMoSOkpc4ZJ0mbrgAn
 WfNTul7ULdg9k8DbILlphnqjgwaeBNFBs2z+5MFGCWpVOZwAnyol2AJLz5p44/GRzOs4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=A4qZJ43yB2MCyVWnX8/FA39RBWOFzlU3xc9rhLKP5/c=; b=c
 Ce+WfWe/a79Z6ui8bd4TAnXSXtY5c1Ui6YF2MHct5Q3NAk60+MKpvYcBf/l8h1QlrkESMX680QMqa
 Lq+DVaHlkoZ4dmUfZoj9i5S5TpJUvis2IDtxdu6IPfFnLZ4yGy+P/UTLE18Lxej2J/jlMfjErtiUX
 yF0DpfwODqpN3GhU=;
Received: from mail-wr1-f73.google.com ([209.85.221.73])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k800H-00FD6S-VM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Aug 2020 11:42:12 +0000
Received: by mail-wr1-f73.google.com with SMTP id t3so8140043wrr.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Aug 2020 04:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=A4qZJ43yB2MCyVWnX8/FA39RBWOFzlU3xc9rhLKP5/c=;
 b=eQ5Thm8ro9WKbX0J0TNMPwpSlMhVxUXYA9q1cW9DTa+M8iJ3VVp5r+89JnLfZeLFeF
 nH8FpY3Rr397cAHQy2lAB/rR86dcqM239rEonrHCXFmLVABgsZzu9HNY+CCPmGa755lu
 lw3L5tkNzUm0t8/o/ESOQ4gMGgSmyNIbrqQgYJ6tgg6vjXGXswkrntubkGaYble7pFKD
 myamsjWM9fn/opcSi+kzbi/WTWcbBu2XepqBW7L1WvuH+drJRaaDZ4sF/NvLDvaPrFy7
 IJ4klaR86ks13LyHJmeeI+a4V9vIN4tUq6lMELG3uiU/+Ne52rLeJmSXaP5grvHzaPDQ
 Pm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=A4qZJ43yB2MCyVWnX8/FA39RBWOFzlU3xc9rhLKP5/c=;
 b=b9iKBoOVfLpR8LVtJJJegbAQ221NMapRq5u/NlxmR21xNGaW9UdyX8hVZMlfZOGWMH
 +OwFgL7Jc/KgqjFCPoOuNOjGE9hoUllwIgEW+akNNJ1PLztIHcFiSK3OpdBd7/gmU/vu
 8u1SGvnh9gxilZjENnbTnLRRbPTbZdw1dMP1VNEXSFrZjP4Q8YSCx8UNm+cZ6UK+9K6n
 XdkhQ0LC79XbOMEN2Mw+toQooiJvhp4QX6ZuS+MGCM0kJz/mVwEIggGEvqme6sDB+IOE
 aEsNjleE3Jt7Xeig9mBDF4IqYuDf0u/Rd6nwx9QtGCpVldqDvivIO8ARs4tl2HU+Iig2
 7pDg==
X-Gm-Message-State: AOAM531ny39D/910czlWin+ZPd3d1AqX5e5O4fZgsO7LYmbTmv0AFs66
 4sLRKdTLtCLCB/fXH4y5mw7o7t3nL9KkdVBE9zivDfg6d5BWnwuXDkkiBa+W5sx+snfqT1JBxrE
 vaZB8mZwHeMY5YEu1/Om5dMpq+W0WT3Yi5ytGnTgH8+zOWJ8Y3O32Ms5wgFgkiiuWWcIxB1bbxv
 yQOgixoNjI
X-Google-Smtp-Source: ABdhPJwM30WVmT5wCC1B/y5//Ztfsj29dsKJXdZS+JkFJgKBU0tG2EW4PSt0Slk93c7kyfZGqtvgFUUgblAv
X-Received: by 2002:a7b:c954:: with SMTP id i20mr20420064wml.189.1597749504418; 
 Tue, 18 Aug 2020 04:18:24 -0700 (PDT)
Date: Tue, 18 Aug 2020 11:18:07 +0000
Message-Id: <20200818111807.3287440-1-tcombes@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.73 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.73 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1k800H-00FD6S-VM
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: add -r (fake_seed) flag
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
From: Theotime Combes via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Theotime Combes <tcombes@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

r flag sets the checkpointing seed to 0 (initially used to
remove randomness for apex generation)

Signed-off-by: Theotime Combes <tcombes@google.com>
---
 include/f2fs_fs.h       | 1 +
 man/mkfs.f2fs.8         | 6 ++++++
 mkfs/f2fs_format.c      | 2 +-
 mkfs/f2fs_format_main.c | 6 +++++-
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index a9982f0..e6f996b 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -407,6 +407,7 @@ struct f2fs_configuration {
 	__le32 feature;			/* defined features */
 
 	/* mkfs parameters */
+	int fake_seed;
 	u_int32_t next_free_nid;
 	u_int32_t quota_inum;
 	u_int32_t quota_dnum;
diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index 022941f..d517165 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -59,6 +59,9 @@ mkfs.f2fs \- create an F2FS file system
 .B \-q
 ]
 [
+.B \-r
+]
+[
 .B \-R
 .I root_owner
 ]
@@ -212,6 +215,9 @@ Default is disabled.
 Quiet mode.
 With it, mkfs.f2fs does not show any messages, including the basic messages.
 .TP
+.BI \-r
+Sets the checkpointing srand seed to 0.
+.TP
 .BI \-R
 Give root_owner option for initial uid/gid assignment.
 Default is set by getuid()/getgid(), and assigned by "-R $uid:$gid".
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 1639752..d31cca4 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -692,7 +692,7 @@ static int f2fs_write_check_point_pack(void)
 	}
 
 	/* 1. cp page 1 of checkpoint pack 1 */
-	srand(time(NULL));
+	srand((c.fake_seed) ? 0 : time(NULL));
 	cp->checkpoint_ver = cpu_to_le64(rand() | 0x1);
 	set_cp(cur_node_segno[0], c.cur_seg[CURSEG_HOT_NODE]);
 	set_cp(cur_node_segno[1], c.cur_seg[CURSEG_WARM_NODE]);
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 27c1f1d..ac9d8c8 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -59,6 +59,7 @@ static void mkfs_usage()
 	MSG(0, "  -C [encoding[:flag1,...]] Support casefolding with optional flags\n");
 	MSG(0, "  -p number of pinned segments (2MB) [default:0]\n");
 	MSG(0, "  -q quiet mode\n");
+	MSG(0, "  -r set checkpointing seed (srand()) to 0\n");
 	MSG(0, "  -R root_owner [default: 0:0]\n");
 	MSG(0, "  -s # of segments per section [default:1]\n");
 	MSG(0, "  -S sparse mode\n");
@@ -124,7 +125,7 @@ static void add_default_options(void)
 
 static void f2fs_parse_options(int argc, char *argv[])
 {
-	static const char *option_string = "qa:c:C:d:e:E:g:il:mo:O:p:R:s:S:z:t:U:Vfw:";
+	static const char *option_string = "qa:c:C:d:e:E:g:il:mo:O:p:rR:s:S:z:t:U:Vfw:";
 	int32_t option=0;
 	int val;
 	char *token;
@@ -187,6 +188,9 @@ static void f2fs_parse_options(int argc, char *argv[])
 		case 'p':
 			c.pinned_segments = atof(optarg);
 			break;
+		case 'r':
+			c.fake_seed = 1;
+			break;
 		case 'R':
 			if (parse_root_owner(optarg, &c.root_uid, &c.root_gid))
 				mkfs_usage();
-- 
2.28.0.220.ged08abb693-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

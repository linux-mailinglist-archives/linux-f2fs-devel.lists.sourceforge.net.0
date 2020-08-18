Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 288DA2483BB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Aug 2020 13:19:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M4JRtDZJF4UBeN0J4qGJsE8wMmvJhAH5HRXANG7q9I4=; b=QdT3B2+2GehXP1wZ0T/8ZEqHH6
	EnoRAfOFRtWe+Xhu2UTpaCEUU/3i+RSxwS1UpBUz959fcZaBgmGo6EedS6xo8i9s2sr/cpaMl7R7C
	X8HZNcqp6egIS7qNN9JJuxqItiafNjQWowlJF4iZspVPoPVKNH8HQewUfdNgzQZPOzg4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k7ze6-0002C2-B2; Tue, 18 Aug 2020 11:19:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3Hrk7XwcKAH8wfrpehvjrrjoh.frp@flex--tcombes.bounces.google.com>)
 id 1k7ze4-0002Bf-MU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Aug 2020 11:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C1AZ06khjR5ZBXYXL4pjQb6+Fab0fQIRrBREkP1N7Ig=; b=DDBnqaPVBFvLtDzQMvXyC+nzB4
 yubeYltKPJKMHd4uxhgOKw2zVX5GeApn4xqHUFjaBdBt0weGii6PSNa73tgNqGm5Q0gYHGQbJoMNJ
 07EsPSV8mTwZbKt2gWLE5EYqHdKRyGn3Owo96A2GSFza+GnRTGhRp9fHZNIgY93D5o8I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=C1AZ06khjR5ZBXYXL4pjQb6+Fab0fQIRrBREkP1N7Ig=; b=S
 rTHzA5q4gHYxZq99uMtKB0Nk8HNqlpc7evMyV6GrJg7ZndkSR1GtFEDosaFKtNoD7vx1TYCe0q2LG
 R9twohl5jos7lhM42JppMR9hSacGp0NW4MujF3PGlFcjMrHzEW3EKfavdm43nOVca1AZZsu6EOKOF
 5iiYEtsBio/UV3+M=;
Received: from mail-wr1-f74.google.com ([209.85.221.74])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k7ze3-00FCKN-7T
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Aug 2020 11:19:12 +0000
Received: by mail-wr1-f74.google.com with SMTP id s23so8114466wrb.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Aug 2020 04:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=C1AZ06khjR5ZBXYXL4pjQb6+Fab0fQIRrBREkP1N7Ig=;
 b=gmNLTknt0vvsuh64h9rHL6PHRUnZhNXcVIYHXto+D0aNEGOxB501Q+ivNdxeiH9akc
 sWhaNwqyk8DRoVwNaM03suUjt1kslMj8hXPqIe4TC5xuzj7Lh8QPg0+S1DPkUPq7qJo4
 9K5RNWpCHw3qWBYtck2W+DM2V8Bh8bqzeKNlZs+vp442mXuE/hp+B8XV/cQFTRnLR9iu
 e+c2XedDlEveS5o8dDG2IFSLVa+yMTZiEwU+oaJBb0mxdpc+wJw2j8QfxQXaaXCCuP8C
 2RgcvTDO9vLt7XdsDxp44cYK5PRhg+tcVqstkDD3MpnByZmhf6TcYkzZhF6PQPZis4YB
 uO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=C1AZ06khjR5ZBXYXL4pjQb6+Fab0fQIRrBREkP1N7Ig=;
 b=Vvfzl0kIwoQm5DST8ZYZFsJPEv13rblIDpYY2WO+4ytdYLFclheFRXCGWmfPJWRwYz
 JqM1aOhnrXWS1hH/3Ot/7CehED/Vu4pYdnz1eIPLRKYkmJF8MMjWgGWuRmxQ5I0oUeoc
 lkP9GSLg5ZHGPV8sojjXP6WTAZok4GXYzWJz0SMK9y+jUZqa9ee4rZLb4+b60ZTFMHto
 Ro6my06wfT88cvjdF9KHeZEZhCSXONKdZh+IBu5BcycgJnoJZcBltLhGGvp+UtVRzuzj
 P8o4EzWU6R/o5xLO/Tnvto8UzBfPoMphz291ryESCHUuIp04Nv9ZpHZ4c+mRHQByDttS
 voHw==
X-Gm-Message-State: AOAM533kImjX+tQZYU4WiSF9mWMGATxLFErkHH0aiMhD2tNJCVhGj5qz
 Eb9DkFB8AwEShGrQWmXPHH5cGd+aWwb0PyGH0Hgnp3/0AkPwbm6M4NEU1TMQTqDCr13eKmQj/Gd
 3t8p/z+XT1lBtXv6UQ37Qj84+zkDL4umT7/OvBxPy4lcrnRGVBc+CyB9s5yVU3BpDTM11FUrRiU
 iGuHgtRH2S
X-Google-Smtp-Source: ABdhPJw23gHAQmGZSLIYUvDjnn0Y3ql9B42B1fW4oq+1fOQUmNqSQQNhJAZOYUgEUF5ZbiePXyfqhh9QdRQt
X-Received: by 2002:adf:efce:: with SMTP id i14mr20033044wrp.359.1597749534434; 
 Tue, 18 Aug 2020 04:18:54 -0700 (PDT)
Date: Tue, 18 Aug 2020 11:18:50 +0000
Message-Id: <20200818111850.3288644-1-tcombes@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.74 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.74 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1k7ze3-00FCKN-7T
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: add -T flag
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

T flag sets timestamps to a given value

Signed-off-by: Theotime Combes <tcombes@google.com>
---
 include/f2fs_fs.h       |  2 +-
 man/mkfs.f2fs.8         |  8 ++++++++
 mkfs/f2fs_format.c      | 25 ++++++++++++++-----------
 mkfs/f2fs_format_main.c |  6 +++++-
 4 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index a9982f0..3750e56 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -405,6 +405,7 @@ struct f2fs_configuration {
 	int large_nat_bitmap;
 	int fix_chksum;			/* fix old cp.chksum position */
 	__le32 feature;			/* defined features */
+	time_t fixed_time;
 
 	/* mkfs parameters */
 	u_int32_t next_free_nid;
@@ -427,7 +428,6 @@ struct f2fs_configuration {
 	char *mount_point;
 	char *target_out_dir;
 	char *fs_config_file;
-	time_t fixed_time;
 #ifdef HAVE_LIBSELINUX
 	struct selinux_opt seopt_file[8];
 	int nr_opt;
diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index 022941f..729afdf 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -74,6 +74,10 @@ mkfs.f2fs \- create an F2FS file system
 .I nodiscard/discard
 ]
 [
+.B \-T
+.I timestamp
+]
+[
 .B \-w
 .I wanted-sector-size
 ]
@@ -228,6 +232,10 @@ Enable sparse mode.
 Specify 1 or 0 to enable or disable discard policy, respectively.
 The default value is 1.
 .TP
+.BI \-T " timestamp"
+Set inodes times to a given timestamp. By default, the current time will be used.
+This behaviour corresponds to the value -1.
+.TP
 .BI \-w " wanted-sector-size"
 Specify the sector size in bytes.
 Without it, the sectors will be calculated by device sector size.
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 1639752..7414b00 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -35,6 +35,9 @@ struct f2fs_checkpoint *cp;
 #define last_zone(cur)		((cur - 1) * c.segs_per_zone)
 #define last_section(cur)	(cur + (c.secs_per_zone - 1) * c.segs_per_sec)
 
+/* Return time fixed by the user or current time by default */
+#define mkfs_time ((c.fixed_time == -1) ? time(NULL) : c.fixed_time)
+
 static unsigned int quotatype_bits = 0;
 
 const char *media_ext_lists[] = {
@@ -1192,11 +1195,11 @@ static int f2fs_write_root_inode(void)
 	raw_node->i.i_size = cpu_to_le64(1 * blk_size_bytes); /* dentry */
 	raw_node->i.i_blocks = cpu_to_le64(2);
 
-	raw_node->i.i_atime = cpu_to_le32(time(NULL));
+	raw_node->i.i_atime = cpu_to_le32(mkfs_time);
 	raw_node->i.i_atime_nsec = 0;
-	raw_node->i.i_ctime = cpu_to_le32(time(NULL));
+	raw_node->i.i_ctime = cpu_to_le32(mkfs_time);
 	raw_node->i.i_ctime_nsec = 0;
-	raw_node->i.i_mtime = cpu_to_le32(time(NULL));
+	raw_node->i.i_mtime = cpu_to_le32(mkfs_time);
 	raw_node->i.i_mtime_nsec = 0;
 	raw_node->i.i_generation = 0;
 	raw_node->i.i_xattr_nid = 0;
@@ -1213,7 +1216,7 @@ static int f2fs_write_root_inode(void)
 		raw_node->i.i_projid = cpu_to_le32(F2FS_DEF_PROJID);
 
 	if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CRTIME)) {
-		raw_node->i.i_crtime = cpu_to_le32(time(NULL));
+		raw_node->i.i_crtime = cpu_to_le32(mkfs_time);
 		raw_node->i.i_crtime_nsec = 0;
 	}
 
@@ -1350,11 +1353,11 @@ static int f2fs_write_qf_inode(int qtype)
 	raw_node->i.i_size = cpu_to_le64(1024 * 6); /* Hard coded */
 	raw_node->i.i_blocks = cpu_to_le64(1 + QUOTA_DATA(qtype));
 
-	raw_node->i.i_atime = cpu_to_le32(time(NULL));
+	raw_node->i.i_atime = cpu_to_le32(mkfs_time);
 	raw_node->i.i_atime_nsec = 0;
-	raw_node->i.i_ctime = cpu_to_le32(time(NULL));
+	raw_node->i.i_ctime = cpu_to_le32(mkfs_time);
 	raw_node->i.i_ctime_nsec = 0;
-	raw_node->i.i_mtime = cpu_to_le32(time(NULL));
+	raw_node->i.i_mtime = cpu_to_le32(mkfs_time);
 	raw_node->i.i_mtime_nsec = 0;
 	raw_node->i.i_generation = 0;
 	raw_node->i.i_xattr_nid = 0;
@@ -1545,11 +1548,11 @@ static int f2fs_write_lpf_inode(void)
 	raw_node->i.i_size = cpu_to_le64(1 * blk_size_bytes);
 	raw_node->i.i_blocks = cpu_to_le64(2);
 
-	raw_node->i.i_atime = cpu_to_le32(time(NULL));
+	raw_node->i.i_atime = cpu_to_le32(mkfs_time);
 	raw_node->i.i_atime_nsec = 0;
-	raw_node->i.i_ctime = cpu_to_le32(time(NULL));
+	raw_node->i.i_ctime = cpu_to_le32(mkfs_time);
 	raw_node->i.i_ctime_nsec = 0;
-	raw_node->i.i_mtime = cpu_to_le32(time(NULL));
+	raw_node->i.i_mtime = cpu_to_le32(mkfs_time);
 	raw_node->i.i_mtime_nsec = 0;
 	raw_node->i.i_generation = 0;
 	raw_node->i.i_xattr_nid = 0;
@@ -1569,7 +1572,7 @@ static int f2fs_write_lpf_inode(void)
 		raw_node->i.i_projid = cpu_to_le32(F2FS_DEF_PROJID);
 
 	if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CRTIME)) {
-		raw_node->i.i_crtime = cpu_to_le32(time(NULL));
+		raw_node->i.i_crtime = cpu_to_le32(mkfs_time);
 		raw_node->i.i_crtime_nsec = 0;
 	}
 
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 27c1f1d..9433223 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -63,6 +63,7 @@ static void mkfs_usage()
 	MSG(0, "  -s # of segments per section [default:1]\n");
 	MSG(0, "  -S sparse mode\n");
 	MSG(0, "  -t 0: nodiscard, 1: discard [default:1]\n");
+	MSG(0, "  -T timestamps\n");
 	MSG(0, "  -w wanted sector size\n");
 	MSG(0, "  -z # of sections per zone [default:1]\n");
 	MSG(0, "  -V print the version number and exit\n");
@@ -124,7 +125,7 @@ static void add_default_options(void)
 
 static void f2fs_parse_options(int argc, char *argv[])
 {
-	static const char *option_string = "qa:c:C:d:e:E:g:il:mo:O:p:R:s:S:z:t:U:Vfw:";
+	static const char *option_string = "qa:c:C:d:e:E:g:il:mo:O:p:R:s:S:z:t:T:U:Vfw:";
 	int32_t option=0;
 	int val;
 	char *token;
@@ -205,6 +206,9 @@ static void f2fs_parse_options(int argc, char *argv[])
 		case 't':
 			c.trim = atoi(optarg);
 			break;
+		case 'T':
+			c.fixed_time = strtoul(optarg, NULL, 0);
+			break;
 		case 'U':
 			c.vol_uuid = strdup(optarg);
 			break;
-- 
2.28.0.220.ged08abb693-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

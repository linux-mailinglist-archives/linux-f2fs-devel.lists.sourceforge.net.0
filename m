Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 519401A60B6
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 12 Apr 2020 23:35:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jNkGA-0008Tr-Pa; Sun, 12 Apr 2020 21:35:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ericonr@disroot.org>) id 1jNkG9-0008Tb-BH
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Apr 2020 21:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Mime-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Co7lXfjSBDcMuBmUayPbNRRyIWjP0kwp78j32Fb7h3Y=; b=B3Md0wZEY6YlRC9GfOVd2TVj2E
 c13v3z9NlyrVe8jH9KASorSY3qDcU/ZR/Ue7dGmKCplrjiG9DGZFyAIkFB+G/Ts5zJsPJqiuWiDZa
 Ax5awWFwrIChl/8mCD8duFS5lrffhnKfFzrSiIjElXYXHXes7vWCRgLxE9kv8xIr3kl4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Mime-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Co7lXfjSBDcMuBmUayPbNRRyIWjP0kwp78j32Fb7h3Y=; b=ES0fyjt58XZdt9+YikGIVh7nUi
 37b/OWiODtagjoZp/gSmgT8PP7mLL7GP27S3UaQn+VRnaJbF2SxsfbJ1ZPFfJq1BG4NPK3nBtx/sH
 hFpSU8HohkRaDCZ7yVwFRmL+nsrHiVsNefJW41Fiqntnf1h1+Nknr8AbQ6OmVqBOyUvU=;
Received: from knopi.disroot.org ([178.21.23.139])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jNkG5-00DnA8-6P
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Apr 2020 21:35:21 +0000
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id ECB4720695;
 Sun, 12 Apr 2020 23:35:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JxlZWeIlfOdM; Sun, 12 Apr 2020 23:35:09 +0200 (CEST)
From: =?UTF-8?q?=C3=89rico=20Nogueira?= <ericonr@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1586727309; bh=JDSelRAlBrI8quFcL10k7bpo1iUl9npM2wdSv749M2w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=TXaDatjQjvNoHeLu0J193tVXb9dDZ4JH081TQ3a18y8XDj8P46NCa96ID2HxjJQn1
 4+2ueUO7GPw9hAaut35FBa8q6RppR/i/sVvdWDGraNs/2+SpIF37BYjN7PFLTb/Yyx
 cKUNU4+xBVc2saVfyNH6s9XKpchxjogrN304O+yX/6fTCDop4CW6EQzsv1XKH995mI
 xZlgfQBPiUkd7HvHJhuxp8iqAdVijXP9EvibT9c88m+rzEFqd+1BuK7VRfhzXD7lJW
 PUSaYC52iKnhfwbO9n4pgJUttnyYydkheG7Z5YtgiQZHYVfWFTuhoWo9vkPNJQhStv
 Q5ysILfvFdteg==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 12 Apr 2020 18:34:35 -0300
Message-Id: <20200412213435.179726-2-ericonr@disroot.org>
In-Reply-To: <20200412213435.179726-1-ericonr@disroot.org>
References: <20200412213435.179726-1-ericonr@disroot.org>
Mime-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [178.21.23.139 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jNkG5-00DnA8-6P
Subject: [f2fs-dev] [PATCH 1/1] mkfs.f2fs: update manual and help message
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

Add options that were missing from the mkfs.f2fs man page, and explain
them more thoroughly when possible. Special care was given to document
all the features that can be enabled during the creation of the
filesystem.
---
 man/mkfs.f2fs.8         | 141 +++++++++++++++++++++++++++++++++-------
 mkfs/f2fs_format_main.c |  12 ++--
 2 files changed, 124 insertions(+), 29 deletions(-)

diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index f9484eb..022941f 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -13,20 +13,30 @@ mkfs.f2fs \- create an F2FS file system
 ]
 [
 .B \-c
-.I device
+.I device-list
 ]
 [
 .B \-d
-.I debugging-level
+.I debug-level
 ]
 [
 .B \-e
 .I extension-list
 ]
 [
+.B \-E
+.I extension-list
+]
+[
 .B \-f
 ]
 [
+.B \-g
+]
+[
+.B \-i
+]
+[
 .B \-l
 .I volume-label
 ]
@@ -42,6 +52,10 @@ mkfs.f2fs \- create an F2FS file system
 .I feature-list
 ]
 [
+.B \-C
+.I encoding:flags
+]
+[
 .B \-q
 ]
 [
@@ -53,17 +67,23 @@ mkfs.f2fs \- create an F2FS file system
 .I #-of-segments-per-section
 ]
 [
+.B \-S
+]
+[
 .B \-t
 .I nodiscard/discard
 ]
 [
 .B \-w
-.I specific sector_size for target sectors
+.I wanted-sector-size
 ]
 [
 .B \-z
 .I #-of-sections-per-zone
 ]
+[
+.B \-V
+]
 .I device
 .I [sectors]
 .SH DESCRIPTION
@@ -84,45 +104,113 @@ If the value is equal to 1, each of active log areas are initially
 assigned separately according to the whole volume size.
 The default value is 1.
 .TP
-.BI \-c " device"
-Build f2fs with this device additionally, so that user can see all
-the devices as one big volume.
+.BI \-c " device-list"
+Build f2fs with these additional comma separated devices, so that the user can
+see all the devices as one big volume.
+Supports up to 7 devices except meta device.
 .TP
 .BI \-d " debug-level"
 Specify the level of debugging options.
 The default number is 0, which shows basic debugging messages.
 .TP
 .BI \-e " extension-list"
-Specify a file extension list in order f2fs to treat them as cold files.
-The data of files having those extensions will be stored to the cold log.
-The default list includes most of multimedia file extensions such as jpg, gif,
-mpeg, mkv, and so on.
+Specify a list of file extensions that f2fs will treat as cold files.
+The data of files with those extensions will be stored in the cold log.
+The default list includes most of the multimedia file extensions such as
+jpg, gif, mpeg, mkv, and so on.
+.TP
+.BI \-E " extension-list"
+Specify a list of file extensions that f2fs will treat as hot files.
+The data of files with those extensions will be stored in the hot log.
+The default list includes database file extensions, such as db.
 .TP
 .BI \-f
 Force overwrite when an existing filesystem is detected on the device.
 By default, mkfs.f2fs will not write to the device if it suspects that
 there is a filesystem or partition table on the device already.
 .TP
+.BI \-g
+Add default Android options.
+.TP
+.BI \-i
+Enable extended node bitmap.
 .BI \-l " volume-label"
 Specify the volume label to the partition mounted as F2FS.
 .TP
 .BI \-m
 Specify f2fs filesystem to supports the block zoned feature.
-Without it, the filesystem isn't supports the feature.
+Without it, the filesystem doesn't support the feature.
 .TP
 .BI \-o " overprovision-ratio-percentage"
-Specify the percentage over the volume size for overprovision area. This area
-is hidden to users, and utilized by F2FS cleaner. If not specified, the best
-number will be assigned automatically accoring to the partition size.
+Specify the percentage of the volume that will be used as overprovision area.
+This area is hidden to users, and utilized by F2FS cleaner. If not specified, the
+best number will be assigned automatically according to the partition size.
 .TP
 .BI \-O " feature-list"
-Specify a feature list like feature1[feature2,feature3,...] in order f2fs
-filesystem will supports.
-e.g "encrypt" and so on.
+Set additional features for the filesystem. Features are comma separated, and
+the flag can be repeated. The following features are supported:
+.RS 1.2i
+.TP 1.2i
+.B encrypt
+Enable support for filesystem level encryption.
+.TP
+.B extra_attr
+Enable extra attr feature, required for some of the other features.
+.TP
+.B project_quota
+Enable project ID tracking. This is used for projet quota accounting. Requires extra attr.
+.TP
+.B inode_checksum
+Enable inode checksum. Requires extra attr.
+.TP
+.B flexible_inline_xattr
+Enable flexible inline xattr. Requires extra attr.
+.TP
+.B quota
+Enable quotas.
+.TP
+.B inode_crtime
+Enable inode creation time feature. Requires extra attr.
+.TP
+.B lost_found
+Enable lost+found feature.
+.TP
+.B verity
+Reserved feature.
+.TP
+.B sb_checksum
+Enable superblock checksum.
+.TP
+.B casefold
+Enable casefolding support in the filesystem. Optional flags can be passed with
+.B \-C
+.TP
+.B compression
+Enable support for filesystem level compression. Requires extra attr.
+.RE
+.TP
+.BI \-C " encoding:flags"
+Support casefolding with a specific encoding, with optional comma separated flags.
+.RS 1.2i
+.TP 1.2i
+.I encoding:
+.RS 1.2i
+.TP 1.2i
+.B utf8
+Use UTF-8 for casefolding.
+.RE
+.I flags:
+.RS 1.2i
+.TP 1.2i
+.B strict
+This flag specifies that invalid strings should be rejected by the filesystem.
+Default is disabled.
+.RE
+.RE
 .TP
 .BI \-q
 Quiet mode.
-With it, mkfs.f2fs does not show any messages include the basic messages.
+With it, mkfs.f2fs does not show any messages, including the basic messages.
 .TP
 .BI \-R
 Give root_owner option for initial uid/gid assignment.
@@ -133,13 +221,15 @@ Specify the number of segments per section. A section consists of
 multiple consecutive segments, and is the unit of garbage collection.
 The default number is 1, which means one segment is assigned to a section.
 .TP
-.BI \-t " nodiscard/discard"
-Specify 1 or 0 to enable/disable discard policy.
-If the value is equal to 1, discard policy is enabled, otherwise is disable.
+.BI \-S
+Enable sparse mode.
+.TP
+.BI \-t " 1/0"
+Specify 1 or 0 to enable or disable discard policy, respectively.
 The default value is 1.
 .TP
-.BI \-w "sector-size"
-Specify the sector size in bytes along with given target sectors.
+.BI \-w " wanted-sector-size"
+Specify the sector size in bytes.
 Without it, the sectors will be calculated by device sector size.
 .TP
 .BI \-z " #-of-sections-per-zone"
@@ -147,6 +237,11 @@ Specify the number of sections per zone. A zone consists of multiple sections.
 F2FS allocates segments for active logs with separated zones as much as possible.
 The default number is 1, which means a zone consists of one section.
 .TP
+.BI sectors
+Number of sectors. Default is determined by device size.
+.TP
+.BI \-V
+Print the version number and exit.
 .SH AUTHOR
 This version of
 .B mkfs.f2fs
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index d68fc65..204a410 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -44,17 +44,18 @@ static void mkfs_usage()
 	MSG(0, "\nUsage: mkfs.f2fs [options] device [sectors]\n");
 	MSG(0, "[options]:\n");
 	MSG(0, "  -a heap-based allocation [default:0]\n");
-	MSG(0, "  -c [device path] up to 7 devices excepts meta device\n");
+	MSG(0, "  -c device1[,device2,...] up to 7 additional devices, except meta device\n");
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -e [cold file ext list] e.g. \"mp3,gif,mov\"\n");
 	MSG(0, "  -E [hot file ext list] e.g. \"db\"\n");
-	MSG(0, "  -f force overwrite the exist filesystem\n");
+	MSG(0, "  -f force overwrite of the existing filesystem\n");
 	MSG(0, "  -g add default options\n");
 	MSG(0, "  -i extended node bitmap, node ratio is 20%% by default\n");
 	MSG(0, "  -l label\n");
 	MSG(0, "  -m support zoned block device [default:0]\n");
-	MSG(0, "  -o overprovision ratio [default:5]\n");
-	MSG(0, "  -O feature1[feature2,feature3,...] e.g. \"encrypt\"\n");
+	MSG(0, "  -o overprovision percentage [default:auto]\n");
+	MSG(0, "  -O feature1[,feature2,...] e.g. \"encrypt\"\n");
+	MSG(0, "  -C [encoding[:flag1,...]] Support casefolding with optional flags\n");
 	MSG(0, "  -q quiet mode\n");
 	MSG(0, "  -R root_owner [default: 0:0]\n");
 	MSG(0, "  -s # of segments per section [default:1]\n");
@@ -63,8 +64,7 @@ static void mkfs_usage()
 	MSG(0, "  -w wanted sector size\n");
 	MSG(0, "  -z # of sections per zone [default:1]\n");
 	MSG(0, "  -V print the version number and exit\n");
-	MSG(0, "sectors: number of sectors. [default: determined by device size]\n");
-	MSG(0, "  -C [encoding:flag1,flag2] Support casefolding with optional flags\n");
+	MSG(0, "sectors: number of sectors [default: determined by device size]\n");
 	exit(1);
 }
 
-- 
2.26.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

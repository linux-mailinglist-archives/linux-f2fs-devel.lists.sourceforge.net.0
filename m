Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F3125B788
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Sep 2020 02:09:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kDcoG-0004DN-Q8; Thu, 03 Sep 2020 00:09:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rdunlap@infradead.org>) id 1kDcoG-0004DF-5C
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 00:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hGdtzWTOJH/xJcqDn9+d+LpRsI61qKyrC0kC6O8SEnc=; b=NtSbfYbLBfo33sr5ZyuamowLvs
 VjoUbuI4toMnvrxIY+0dGqD/+vq0STcuI39Gyzm3XhTF8ixu4NMz5sASoR9NzljRb3s0j5EeKne+L
 IqYhCMUNws1++hshFvoOjxFs1utOAsW/GUrL+fCyA0ykNAyU8MCb5Fq1sx3pwFas2x3c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:
 Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hGdtzWTOJH/xJcqDn9+d+LpRsI61qKyrC0kC6O8SEnc=; b=a
 +8CH+4rlib6h6ckxzBnWU9k0SdPy1BuUJBDlVXKWCKoqMYAlvaog4sku6mk9gVO7dL1+zBf+734sc
 cN14Eo4fc2xWccj/4Kusan169W2UgcMVHd0kRn7cVDifFabUqCZaEj6fCh1vcaQXE8epuupStN3MR
 JeiWzXxH8kTiR+WI=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kDco9-00AmXL-A5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 00:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=hGdtzWTOJH/xJcqDn9+d+LpRsI61qKyrC0kC6O8SEnc=; b=wLliK9sMwimpwUYSVeXDUCB8uU
 rZXRfMcu6yoTj+Wkjo8RgkaH7GWIwY6U0bvaj7DgVgJtjEYMYeDCaP4c6b+6OpXzE/cAB3IH0twe8
 wAdDhPPGbx7lg8/JQqtZ0alwB2uVKaM7gqdB8PiJrPADJZkMdk/5HNd4DRQ5k8b6KYVX8MR6faTBp
 JUTnzXTzOxuVZRFo+czVDprNdTE6XnrdjMwy/c/7Bfprmhdr7TzeRw1tbcnZPXNy5JmVpEXHnC+pI
 XEx4INOXEwsHRYJW8d+BVjYojic5vQ8wS5TH3xAAbO1E45iVnpJjDjDQ/cHp77s6Qdc1Wx/LUYjuX
 V2hcz/Pw==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDcnq-0000Pp-B4; Thu, 03 Sep 2020 00:08:34 +0000
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jonathan Corbet <corbet@lwn.net>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <96f99afb-c54e-8f46-ebac-80a62f65b876@infradead.org>
Date: Wed, 2 Sep 2020 17:08:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1kDco9-00AmXL-A5
Subject: [f2fs-dev] [PATCH] f2fs: Documentation edits/fixes
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

From: Randy Dunlap <rdunlap@infradead.org>

Correct grammar and spelling.

Drop duplicate section for resize.f2fs.

Change one occurrence of F2fs to F2FS for consistency.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <yuchao0@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
---
 Documentation/filesystems/f2fs.rst |   53 +++++++++++----------------
 1 file changed, 23 insertions(+), 30 deletions(-)

--- linux-next-20200902.orig/Documentation/filesystems/f2fs.rst
+++ linux-next-20200902/Documentation/filesystems/f2fs.rst
@@ -127,14 +127,14 @@ active_logs=%u		 Support configuring the
 			 current design, f2fs supports only 2, 4, and 6 logs.
 			 Default number is 6.
 disable_ext_identify	 Disable the extension list configured by mkfs, so f2fs
-			 does not aware of cold files such as media files.
+			 is not aware of cold files such as media files.
 inline_xattr		 Enable the inline xattrs feature.
 noinline_xattr		 Disable the inline xattrs feature.
 inline_xattr_size=%u	 Support configuring inline xattr size, it depends on
 			 flexible inline xattr feature.
-inline_data		 Enable the inline data feature: New created small(<~3.4k)
+inline_data		 Enable the inline data feature: Newly created small (<~3.4k)
 			 files can be written into inode block.
-inline_dentry		 Enable the inline dir feature: data in new created
+inline_dentry		 Enable the inline dir feature: data in newly created
 			 directory entries can be written into inode block. The
 			 space of inode block which is used to store inline
 			 dentries is limited to ~3.4k.
@@ -203,9 +203,9 @@ usrjquota=<file>	 Appoint specified file
 grpjquota=<file>	 information can be properly updated during recovery flow,
 prjjquota=<file>	 <quota file>: must be in root directory;
 jqfmt=<quota type>	 <quota type>: [vfsold,vfsv0,vfsv1].
-offusrjquota		 Turn off user journelled quota.
-offgrpjquota		 Turn off group journelled quota.
-offprjjquota		 Turn off project journelled quota.
+offusrjquota		 Turn off user journalled quota.
+offgrpjquota		 Turn off group journalled quota.
+offprjjquota		 Turn off project journalled quota.
 quota			 Enable plain user disk quota accounting.
 noquota			 Disable all plain disk quota option.
 whint_mode=%s		 Control which write hints are passed down to block
@@ -303,7 +303,7 @@ Usage
 
 	# insmod f2fs.ko
 
-3. Create a directory trying to mount::
+3. Create a directory to use when mounting::
 
 	# mkdir /mnt/f2fs
 
@@ -339,7 +339,7 @@ The quick options consist of:
                    1 is set by default, which conducts discard.
 ===============    ===========================================================
 
-Note that, please refer manpage of mkfs.f2fs(8) to get full option list.
+Note: please refer to the manpage of mkfs.f2fs(8) to get full option list.
 
 fsck.f2fs
 ---------
@@ -352,7 +352,7 @@ The quick options consist of::
 
   -d debug level [default:0]
 
-Note that, please refer manpage of fsck.f2fs(8) to get full option list.
+Note: please refer to the manpage of fsck.f2fs(8) to get full option list.
 
 dump.f2fs
 ---------
@@ -377,43 +377,36 @@ Examples::
     # dump.f2fs -s 0~-1 /dev/sdx (SIT dump)
     # dump.f2fs -a 0~-1 /dev/sdx (SSA dump)
 
-Note that, please refer manpage of dump.f2fs(8) to get full option list.
+Note: please refer to the manpage of dump.f2fs(8) to get full option list.
 
 sload.f2fs
 ----------
 The sload.f2fs gives a way to insert files and directories in the exisiting disk
 image. This tool is useful when building f2fs images given compiled files.
 
-Note that, please refer manpage of sload.f2fs(8) to get full option list.
+Note: please refer to the manpage of sload.f2fs(8) to get full option list.
 
 resize.f2fs
 -----------
-The resize.f2fs can be used when user want to resize the f2fs-formatted disk
-image, while keeping the stored files and directories.
-
-Note that, please refer manpage of resize.f2fs(8) to get full option list.
-
-resize.f2fs
------------
-The resize.f2fs let user resize the f2fs-formatted disk image, while preserving
+The resize.f2fs lets a user resize the f2fs-formatted disk image, while preserving
 all the files and directories stored in the image.
 
-Note that, please refer manpage of resize.f2fs(8) to get full option list.
+Note: please refer to the manpage of resize.f2fs(8) to get full option list.
 
 defrag.f2fs
 -----------
-The defrag.f2fs can be used to defragmente scattered writtend data as well as
+The defrag.f2fs can be used to defragment scattered written data as well as
 filesystem metadata across the disk. This can improve the write speed by giving
 more free consecutive space.
 
-Note that, please refer manpage of defrag.f2fs(8) to get full option list.
+Note: please refer to the manpage of defrag.f2fs(8) to get full option list.
 
 f2fs_io
 -------
 The f2fs_io is a simple tool to issue various filesystem APIs as well as
 f2fs-specific ones, which is very useful for QA tests.
 
-Note that, please refer manpage of f2fs_io(8) to get full option list.
+Note: please refer to the manpage of f2fs_io(8) to get full option list.
 
 Design
 ======
@@ -427,7 +420,7 @@ consists of a set of sections. By defaul
 segment size identically, but users can easily modify the sizes by mkfs.
 
 F2FS splits the entire volume into six areas, and all the areas except superblock
-consists of multiple segments as described below::
+consist of multiple segments as described below::
 
                                             align with the zone size <-|
                  |-> align with the segment size
@@ -530,7 +523,7 @@ one inode block (i.e., a file) covers::
 			              `- direct node (1018)
 	                                         `- data (1018)
 
-Note that, all the node blocks are mapped by NAT which means the location of
+Note that all the node blocks are mapped by NAT which means the location of
 each node is translated by the NAT table. In the consideration of the wandering
 tree problem, F2FS is able to cut off the propagation of node updates caused by
 leaf data writes.
@@ -610,7 +603,7 @@ When F2FS finds a file name in a directo
 name is calculated. Then, F2FS scans the hash table in level #0 to find the
 dentry consisting of the file name and its inode number. If not found, F2FS
 scans the next hash table in level #1. In this way, F2FS scans hash tables in
-each levels incrementally from 1 to N. In each levels F2FS needs to scan only
+each levels incrementally from 1 to N. In each level F2FS needs to scan only
 one bucket determined by the following equation, which shows O(log(# of files))
 complexity::
 
@@ -751,7 +744,7 @@ WRITE_LIFE_LONG       "
 Fallocate(2) Policy
 -------------------
 
-The default policy follows the below posix rule.
+The default policy follows the below POSIX rule.
 
 Allocating disk space
     The default operation (i.e., mode is zero) of fallocate() allocates
@@ -764,7 +757,7 @@ Allocating disk space
     as a method of optimally implementing that function.
 
 However, once F2FS receives ioctl(fd, F2FS_IOC_SET_PIN_FILE) in prior to
-fallocate(fd, DEFAULT_MODE), it allocates on-disk blocks addressess having
+fallocate(fd, DEFAULT_MODE), it allocates on-disk block addressess having
 zero or random data, which is useful to the below scenario where:
 
  1. create(fd)
@@ -783,7 +776,7 @@ Compression implementation
   cluster can be compressed or not.
 
 - In cluster metadata layout, one special block address is used to indicate
-  cluster is compressed one or normal one, for compressed cluster, following
+  a cluster is a compressed one or normal one; for compressed cluster, following
   metadata maps cluster to [1, 4 << n - 1] physical blocks, in where f2fs
   stores data including compress header and compressed data.
 
@@ -822,7 +815,7 @@ NVMe Zoned Namespace devices
 
 - ZNS defines a per-zone capacity which can be equal or less than the
   zone-size. Zone-capacity is the number of usable blocks in the zone.
-  F2fs checks if zone-capacity is less than zone-size, if it is, then any
+  F2FS checks if zone-capacity is less than zone-size, if it is, then any
   segment which starts after the zone-capacity is marked as not-free in
   the free segment bitmap at initial mount time. These segments are marked
   as permanently used so they are not allocated for writes and



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

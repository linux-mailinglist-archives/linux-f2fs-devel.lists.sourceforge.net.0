Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D634199B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2019 02:43:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1harMQ-0005IC-Qb; Wed, 12 Jun 2019 00:43:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>)
 id 1harMP-0005Hv-Ch; Wed, 12 Jun 2019 00:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vfw0oOGmoDoQhNZ6gbl4+L/CzaRvcJnTWf9lAIe+jMk=; b=CKGVNsJkRLP/5yVor+tWVAlG6g
 GstaIR5YWyMUkABAg4W5Lv/CM9RO/mUG4IjZ1YsvbW3LpxfDlHgXGGhU3rLd/RIwzmgEu8FaZXyNL
 n3T5ETt64bDJtnT0AUrppheNPnDK8kcQlsZWe5FKANNC5GJBJrqq6vnbVl3RNvPb5isA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vfw0oOGmoDoQhNZ6gbl4+L/CzaRvcJnTWf9lAIe+jMk=; b=fSxfNak5DQAXHXAw0q+F0EEaK1
 DMLYSXoCCR7gfZhWeeBIz87aGApUYMX8AYA+Jfg2cvRO7cS7oO4L/xBW1TsQfuCKuNJp9kLufXj3M
 PhEOdbE8hNPta2zxtKOqmfzVCLR8v0DcPz9DTaNdfS0CQggt4MtcGaC5ArvnyNrEqOso=;
Received: from aserp2130.oracle.com ([141.146.126.79])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1harMP-0095ua-60; Wed, 12 Jun 2019 00:43:30 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5C0dMs1001191;
 Wed, 12 Jun 2019 00:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=vfw0oOGmoDoQhNZ6gbl4+L/CzaRvcJnTWf9lAIe+jMk=;
 b=bO2iq3wWsZwN5u9EuAFhjTtI9ycpSom4UsJrrxPDDfn+NmwgYv3zFy/K34pSYwxAAJY+
 DZaOP9lL68z+TJ7EMj6N4pkyf2ev06s/JyMX4DAgDdv8WpN8rWi7NJyyHhIr6RpN//7r
 Xwc7JeyCxUYLQMMlkGw6Ab3j0gu0sDBtufgwiLg74iz03sPSJdjamvCAJGl5xSQhKNr0
 +snWdtcIDcqFBIRmi7Pn/QJQ+P00jK4GGJyBRExNG2AFO7lwKY4BoyAJ9uNDPhKqDD24
 oqmys92C6joD+A9wzAV/VnU2g8YAn7JAzZ+OVvhPYPe6l8dOvGeGUrit/8PecKloHlIN Sg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 2t02herf5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2019 00:43:06 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5C0gvPi126558;
 Wed, 12 Jun 2019 00:43:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 2t04hyn46u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 12 Jun 2019 00:43:05 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5C0h5kT126923;
 Wed, 12 Jun 2019 00:43:05 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2t04hyn46n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2019 00:43:05 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5C0h1IQ008948;
 Wed, 12 Jun 2019 00:43:02 GMT
Received: from localhost (/10.145.179.81)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 11 Jun 2019 17:43:01 -0700
Date: Tue, 11 Jun 2019 17:42:58 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: matthew.garrett@nebula.com, yuchao0@huawei.com, tytso@mit.edu,
 shaggy@kernel.org, ard.biesheuvel@linaro.org, josef@toxicpanda.com,
 clm@fb.com, adilger.kernel@dilger.ca, jk@ozlabs.org, jack@suse.com,
 dsterba@suse.com, jaegeuk@kernel.org, viro@zeniv.linux.org.uk
Message-ID: <20190612004258.GX1871505@magnolia>
References: <156022833285.3227089.11990489625041926920.stgit@magnolia>
 <156022834076.3227089.14763553158562888103.stgit@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156022834076.3227089.14763553158562888103.stgit@magnolia>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9285
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906120002
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1harMP-0095ua-60
Subject: [f2fs-dev] [PATCH v2 1/4] vfs: create a generic checking function
 for FS_IOC_SETFLAGS
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
Cc: linux-xfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 reiserfs-devel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-nilfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Darrick J. Wong <darrick.wong@oracle.com>

Create a generic checking function for the incoming FS_IOC_SETFLAGS flag
values so that we can standardize the implementations that follow ext4's
flag values.

Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
---
v2: fix jfs locking and remove its opencoded flags check
---
 fs/btrfs/ioctl.c    |   13 +++++--------
 fs/efivarfs/file.c  |   18 +++++++++++++-----
 fs/ext2/ioctl.c     |   16 ++++------------
 fs/ext4/ioctl.c     |   13 +++----------
 fs/f2fs/file.c      |    7 ++++---
 fs/gfs2/file.c      |   42 +++++++++++++++++++++++++++++-------------
 fs/hfsplus/ioctl.c  |   21 ++++++++++++---------
 fs/inode.c          |   17 +++++++++++++++++
 fs/jfs/ioctl.c      |   22 +++++++---------------
 fs/nilfs2/ioctl.c   |    9 ++-------
 fs/ocfs2/ioctl.c    |   13 +++----------
 fs/reiserfs/ioctl.c |   10 ++++------
 fs/ubifs/ioctl.c    |   13 +++----------
 include/linux/fs.h  |    2 ++
 14 files changed, 108 insertions(+), 108 deletions(-)

diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index 6dafa857bbb9..f408aa93b0cf 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -187,7 +187,7 @@ static int btrfs_ioctl_setflags(struct file *file, void __user *arg)
 	struct btrfs_inode *binode = BTRFS_I(inode);
 	struct btrfs_root *root = binode->root;
 	struct btrfs_trans_handle *trans;
-	unsigned int fsflags;
+	unsigned int fsflags, old_fsflags;
 	int ret;
 	const char *comp = NULL;
 	u32 binode_flags = binode->flags;
@@ -212,13 +212,10 @@ static int btrfs_ioctl_setflags(struct file *file, void __user *arg)
 	inode_lock(inode);
 
 	fsflags = btrfs_mask_fsflags_for_type(inode, fsflags);
-	if ((fsflags ^ btrfs_inode_flags_to_fsflags(binode->flags)) &
-	    (FS_APPEND_FL | FS_IMMUTABLE_FL)) {
-		if (!capable(CAP_LINUX_IMMUTABLE)) {
-			ret = -EPERM;
-			goto out_unlock;
-		}
-	}
+	old_fsflags = btrfs_inode_flags_to_fsflags(binode->flags);
+	ret = vfs_ioc_setflags_check(inode, old_fsflags, fsflags);
+	if (ret)
+		goto out_unlock;
 
 	if (fsflags & FS_SYNC_FL)
 		binode_flags |= BTRFS_INODE_SYNC;
diff --git a/fs/efivarfs/file.c b/fs/efivarfs/file.c
index 8e568428c88b..f4f6c1bec132 100644
--- a/fs/efivarfs/file.c
+++ b/fs/efivarfs/file.c
@@ -110,16 +110,22 @@ static ssize_t efivarfs_file_read(struct file *file, char __user *userbuf,
 	return size;
 }
 
-static int
-efivarfs_ioc_getxflags(struct file *file, void __user *arg)
+static inline unsigned int efivarfs_getflags(struct inode *inode)
 {
-	struct inode *inode = file->f_mapping->host;
 	unsigned int i_flags;
 	unsigned int flags = 0;
 
 	i_flags = inode->i_flags;
 	if (i_flags & S_IMMUTABLE)
 		flags |= FS_IMMUTABLE_FL;
+	return flags;
+}
+
+static int
+efivarfs_ioc_getxflags(struct file *file, void __user *arg)
+{
+	struct inode *inode = file->f_mapping->host;
+	unsigned int flags = efivarfs_getflags(inode);
 
 	if (copy_to_user(arg, &flags, sizeof(flags)))
 		return -EFAULT;
@@ -132,6 +138,7 @@ efivarfs_ioc_setxflags(struct file *file, void __user *arg)
 	struct inode *inode = file->f_mapping->host;
 	unsigned int flags;
 	unsigned int i_flags = 0;
+	unsigned int oldflags = efivarfs_getflags(inode);
 	int error;
 
 	if (!inode_owner_or_capable(inode))
@@ -143,8 +150,9 @@ efivarfs_ioc_setxflags(struct file *file, void __user *arg)
 	if (flags & ~FS_IMMUTABLE_FL)
 		return -EOPNOTSUPP;
 
-	if (!capable(CAP_LINUX_IMMUTABLE))
-		return -EPERM;
+	error = vfs_ioc_setflags_check(inode, oldflags, flags);
+	if (error)
+		return error;
 
 	if (flags & FS_IMMUTABLE_FL)
 		i_flags |= S_IMMUTABLE;
diff --git a/fs/ext2/ioctl.c b/fs/ext2/ioctl.c
index 0367c0039e68..88b3b9720023 100644
--- a/fs/ext2/ioctl.c
+++ b/fs/ext2/ioctl.c
@@ -60,18 +60,10 @@ long ext2_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		}
 		oldflags = ei->i_flags;
 
-		/*
-		 * The IMMUTABLE and APPEND_ONLY flags can only be changed by
-		 * the relevant capability.
-		 *
-		 * This test looks nicer. Thanks to Pauline Middelink
-		 */
-		if ((flags ^ oldflags) & (EXT2_APPEND_FL | EXT2_IMMUTABLE_FL)) {
-			if (!capable(CAP_LINUX_IMMUTABLE)) {
-				inode_unlock(inode);
-				ret = -EPERM;
-				goto setflags_out;
-			}
+		ret = vfs_ioc_setflags_check(inode, oldflags, flags);
+		if (ret) {
+			inode_unlock(inode);
+			goto setflags_out;
 		}
 
 		flags = flags & EXT2_FL_USER_MODIFIABLE;
diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index e486e49b31ed..5126ee351a84 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -289,16 +289,9 @@ static int ext4_ioctl_setflags(struct inode *inode,
 	/* The JOURNAL_DATA flag is modifiable only by root */
 	jflag = flags & EXT4_JOURNAL_DATA_FL;
 
-	/*
-	 * The IMMUTABLE and APPEND_ONLY flags can only be changed by
-	 * the relevant capability.
-	 *
-	 * This test looks nicer. Thanks to Pauline Middelink
-	 */
-	if ((flags ^ oldflags) & (EXT4_APPEND_FL | EXT4_IMMUTABLE_FL)) {
-		if (!capable(CAP_LINUX_IMMUTABLE))
-			goto flags_out;
-	}
+	err = vfs_ioc_setflags_check(inode, oldflags, flags);
+	if (err)
+		goto flags_out;
 
 	/*
 	 * The JOURNAL_DATA flag can only be changed by
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 45b45f37d347..a969d5497e03 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1670,6 +1670,7 @@ static int __f2fs_ioc_setflags(struct inode *inode, unsigned int flags)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	unsigned int oldflags;
+	int err;
 
 	/* Is it quota file? Do not allow user to mess with it */
 	if (IS_NOQUOTA(inode))
@@ -1679,9 +1680,9 @@ static int __f2fs_ioc_setflags(struct inode *inode, unsigned int flags)
 
 	oldflags = fi->i_flags;
 
-	if ((flags ^ oldflags) & (F2FS_APPEND_FL | F2FS_IMMUTABLE_FL))
-		if (!capable(CAP_LINUX_IMMUTABLE))
-			return -EPERM;
+	err = vfs_ioc_setflags_check(inode, oldflags, flags);
+	if (err)
+		return err;
 
 	flags = flags & F2FS_FL_USER_MODIFIABLE;
 	flags |= oldflags & ~F2FS_FL_USER_MODIFIABLE;
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index d174b1f8fd08..99f53cf699c6 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -136,27 +136,36 @@ static struct {
 	{FS_JOURNAL_DATA_FL, GFS2_DIF_JDATA | GFS2_DIF_INHERIT_JDATA},
 };
 
+static inline u32 gfs2_gfsflags_to_fsflags(struct inode *inode, u32 gfsflags)
+{
+	int i;
+	u32 fsflags = 0;
+
+	if (S_ISDIR(inode->i_mode))
+		gfsflags &= ~GFS2_DIF_JDATA;
+	else
+		gfsflags &= ~GFS2_DIF_INHERIT_JDATA;
+
+	for (i = 0; i < ARRAY_SIZE(fsflag_gfs2flag); i++)
+		if (gfsflags & fsflag_gfs2flag[i].gfsflag)
+			fsflags |= fsflag_gfs2flag[i].fsflag;
+	return fsflags;
+}
+
 static int gfs2_get_flags(struct file *filp, u32 __user *ptr)
 {
 	struct inode *inode = file_inode(filp);
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_holder gh;
-	int i, error;
-	u32 gfsflags, fsflags = 0;
+	int error;
+	u32 fsflags;
 
 	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
 	error = gfs2_glock_nq(&gh);
 	if (error)
 		goto out_uninit;
 
-	gfsflags = ip->i_diskflags;
-	if (S_ISDIR(inode->i_mode))
-		gfsflags &= ~GFS2_DIF_JDATA;
-	else
-		gfsflags &= ~GFS2_DIF_INHERIT_JDATA;
-	for (i = 0; i < ARRAY_SIZE(fsflag_gfs2flag); i++)
-		if (gfsflags & fsflag_gfs2flag[i].gfsflag)
-			fsflags |= fsflag_gfs2flag[i].fsflag;
+	fsflags = gfs2_gfsflags_to_fsflags(inode, ip->i_diskflags);
 
 	if (put_user(fsflags, ptr))
 		error = -EFAULT;
@@ -200,9 +209,11 @@ void gfs2_set_inode_flags(struct inode *inode)
  * @filp: file pointer
  * @reqflags: The flags to set
  * @mask: Indicates which flags are valid
+ * @fsflags: The FS_* inode flags passed in
  *
  */
-static int do_gfs2_set_flags(struct file *filp, u32 reqflags, u32 mask)
+static int do_gfs2_set_flags(struct file *filp, u32 reqflags, u32 mask,
+			     const u32 fsflags)
 {
 	struct inode *inode = file_inode(filp);
 	struct gfs2_inode *ip = GFS2_I(inode);
@@ -210,7 +221,7 @@ static int do_gfs2_set_flags(struct file *filp, u32 reqflags, u32 mask)
 	struct buffer_head *bh;
 	struct gfs2_holder gh;
 	int error;
-	u32 new_flags, flags;
+	u32 new_flags, flags, oldflags;
 
 	error = mnt_want_write_file(filp);
 	if (error)
@@ -220,6 +231,11 @@ static int do_gfs2_set_flags(struct file *filp, u32 reqflags, u32 mask)
 	if (error)
 		goto out_drop_write;
 
+	oldflags = gfs2_gfsflags_to_fsflags(inode, ip->i_diskflags);
+	error = vfs_ioc_setflags_check(inode, oldflags, fsflags);
+	if (error)
+		goto out;
+
 	error = -EACCES;
 	if (!inode_owner_or_capable(inode))
 		goto out;
@@ -308,7 +324,7 @@ static int gfs2_set_flags(struct file *filp, u32 __user *ptr)
 		mask &= ~(GFS2_DIF_TOPDIR | GFS2_DIF_INHERIT_JDATA);
 	}
 
-	return do_gfs2_set_flags(filp, gfsflags, mask);
+	return do_gfs2_set_flags(filp, gfsflags, mask, fsflags);
 }
 
 static int gfs2_getlabel(struct file *filp, char __user *label)
diff --git a/fs/hfsplus/ioctl.c b/fs/hfsplus/ioctl.c
index 5e6502ef7415..862a3c9481d7 100644
--- a/fs/hfsplus/ioctl.c
+++ b/fs/hfsplus/ioctl.c
@@ -57,9 +57,8 @@ static int hfsplus_ioctl_bless(struct file *file, int __user *user_flags)
 	return 0;
 }
 
-static int hfsplus_ioctl_getflags(struct file *file, int __user *user_flags)
+static inline unsigned int hfsplus_getflags(struct inode *inode)
 {
-	struct inode *inode = file_inode(file);
 	struct hfsplus_inode_info *hip = HFSPLUS_I(inode);
 	unsigned int flags = 0;
 
@@ -69,6 +68,13 @@ static int hfsplus_ioctl_getflags(struct file *file, int __user *user_flags)
 		flags |= FS_APPEND_FL;
 	if (hip->userflags & HFSPLUS_FLG_NODUMP)
 		flags |= FS_NODUMP_FL;
+	return flags;
+}
+
+static int hfsplus_ioctl_getflags(struct file *file, int __user *user_flags)
+{
+	struct inode *inode = file_inode(file);
+	unsigned int flags = hfsplus_getflags(inode);
 
 	return put_user(flags, user_flags);
 }
@@ -78,6 +84,7 @@ static int hfsplus_ioctl_setflags(struct file *file, int __user *user_flags)
 	struct inode *inode = file_inode(file);
 	struct hfsplus_inode_info *hip = HFSPLUS_I(inode);
 	unsigned int flags, new_fl = 0;
+	unsigned int oldflags = hfsplus_getflags(inode);
 	int err = 0;
 
 	err = mnt_want_write_file(file);
@@ -96,13 +103,9 @@ static int hfsplus_ioctl_setflags(struct file *file, int __user *user_flags)
 
 	inode_lock(inode);
 
-	if ((flags & (FS_IMMUTABLE_FL|FS_APPEND_FL)) ||
-	    inode->i_flags & (S_IMMUTABLE|S_APPEND)) {
-		if (!capable(CAP_LINUX_IMMUTABLE)) {
-			err = -EPERM;
-			goto out_unlock_inode;
-		}
-	}
+	err = vfs_ioc_setflags_check(inode, oldflags, flags);
+	if (err)
+		goto out_unlock_inode;
 
 	/* don't silently ignore unsupported ext2 flags */
 	if (flags & ~(FS_IMMUTABLE_FL|FS_APPEND_FL|FS_NODUMP_FL)) {
diff --git a/fs/inode.c b/fs/inode.c
index df6542ec3b88..0ce60b720608 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2170,3 +2170,20 @@ struct timespec64 current_time(struct inode *inode)
 	return timespec64_trunc(now, inode->i_sb->s_time_gran);
 }
 EXPORT_SYMBOL(current_time);
+
+/* Generic function to check FS_IOC_SETFLAGS values. */
+int vfs_ioc_setflags_check(struct inode *inode, int oldflags, int flags)
+{
+	/*
+	 * The IMMUTABLE and APPEND_ONLY flags can only be changed by
+	 * the relevant capability.
+	 *
+	 * This test looks nicer. Thanks to Pauline Middelink
+	 */
+	if ((flags ^ oldflags) & (FS_APPEND_FL | FS_IMMUTABLE_FL) &&
+	    !capable(CAP_LINUX_IMMUTABLE))
+		return -EPERM;
+
+	return 0;
+}
+EXPORT_SYMBOL(vfs_ioc_setflags_check);
diff --git a/fs/jfs/ioctl.c b/fs/jfs/ioctl.c
index ba34dae8bd9f..b485c2d7620f 100644
--- a/fs/jfs/ioctl.c
+++ b/fs/jfs/ioctl.c
@@ -98,24 +98,16 @@ long jfs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		/* Lock against other parallel changes of flags */
 		inode_lock(inode);
 
-		oldflags = jfs_inode->mode2;
-
-		/*
-		 * The IMMUTABLE and APPEND_ONLY flags can only be changed by
-		 * the relevant capability.
-		 */
-		if ((oldflags & JFS_IMMUTABLE_FL) ||
-			((flags ^ oldflags) &
-			(JFS_APPEND_FL | JFS_IMMUTABLE_FL))) {
-			if (!capable(CAP_LINUX_IMMUTABLE)) {
-				inode_unlock(inode);
-				err = -EPERM;
-				goto setflags_out;
-			}
+		oldflags = jfs_map_ext2(jfs_inode->mode2 & JFS_FL_USER_VISIBLE,
+					0);
+		err = vfs_ioc_setflags_check(inode, oldflags, flags);
+		if (err) {
+			inode_unlock(inode);
+			goto setflags_out;
 		}
 
 		flags = flags & JFS_FL_USER_MODIFIABLE;
-		flags |= oldflags & ~JFS_FL_USER_MODIFIABLE;
+		flags |= jfs_inode->mode2 & ~JFS_FL_USER_MODIFIABLE;
 		jfs_inode->mode2 = flags;
 
 		jfs_set_inode_flags(inode);
diff --git a/fs/nilfs2/ioctl.c b/fs/nilfs2/ioctl.c
index 9b96d79eea6c..0632336d2515 100644
--- a/fs/nilfs2/ioctl.c
+++ b/fs/nilfs2/ioctl.c
@@ -148,13 +148,8 @@ static int nilfs_ioctl_setflags(struct inode *inode, struct file *filp,
 
 	oldflags = NILFS_I(inode)->i_flags;
 
-	/*
-	 * The IMMUTABLE and APPEND_ONLY flags can only be changed by the
-	 * relevant capability.
-	 */
-	ret = -EPERM;
-	if (((flags ^ oldflags) & (FS_APPEND_FL | FS_IMMUTABLE_FL)) &&
-	    !capable(CAP_LINUX_IMMUTABLE))
+	ret = vfs_ioc_setflags_check(inode, oldflags, flags);
+	if (ret)
 		goto out;
 
 	ret = nilfs_transaction_begin(inode->i_sb, &ti, 0);
diff --git a/fs/ocfs2/ioctl.c b/fs/ocfs2/ioctl.c
index 994726ada857..467a2faf0305 100644
--- a/fs/ocfs2/ioctl.c
+++ b/fs/ocfs2/ioctl.c
@@ -106,16 +106,9 @@ static int ocfs2_set_inode_attr(struct inode *inode, unsigned flags,
 	flags = flags & mask;
 	flags |= oldflags & ~mask;
 
-	/*
-	 * The IMMUTABLE and APPEND_ONLY flags can only be changed by
-	 * the relevant capability.
-	 */
-	status = -EPERM;
-	if ((oldflags & OCFS2_IMMUTABLE_FL) || ((flags ^ oldflags) &
-		(OCFS2_APPEND_FL | OCFS2_IMMUTABLE_FL))) {
-		if (!capable(CAP_LINUX_IMMUTABLE))
-			goto bail_unlock;
-	}
+	status = vfs_ioc_setflags_check(inode, oldflags, flags);
+	if (status)
+		goto bail_unlock;
 
 	handle = ocfs2_start_trans(osb, OCFS2_INODE_UPDATE_CREDITS);
 	if (IS_ERR(handle)) {
diff --git a/fs/reiserfs/ioctl.c b/fs/reiserfs/ioctl.c
index acbbaf7a0bb2..92bcb1ecd994 100644
--- a/fs/reiserfs/ioctl.c
+++ b/fs/reiserfs/ioctl.c
@@ -74,13 +74,11 @@ long reiserfs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 				err = -EPERM;
 				goto setflags_out;
 			}
-			if (((flags ^ REISERFS_I(inode)->
-			      i_attrs) & (REISERFS_IMMUTABLE_FL |
-					  REISERFS_APPEND_FL))
-			    && !capable(CAP_LINUX_IMMUTABLE)) {
-				err = -EPERM;
+			err = vfs_ioc_setflags_check(inode,
+						     REISERFS_I(inode)->i_attrs,
+						     flags);
+			if (err)
 				goto setflags_out;
-			}
 			if ((flags & REISERFS_NOTAIL_FL) &&
 			    S_ISREG(inode->i_mode)) {
 				int result;
diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index 4f1a397fda69..bdea836fc38b 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -107,18 +107,11 @@ static int setflags(struct inode *inode, int flags)
 	if (err)
 		return err;
 
-	/*
-	 * The IMMUTABLE and APPEND_ONLY flags can only be changed by
-	 * the relevant capability.
-	 */
 	mutex_lock(&ui->ui_mutex);
 	oldflags = ubifs2ioctl(ui->flags);
-	if ((flags ^ oldflags) & (FS_APPEND_FL | FS_IMMUTABLE_FL)) {
-		if (!capable(CAP_LINUX_IMMUTABLE)) {
-			err = -EPERM;
-			goto out_unlock;
-		}
-	}
+	err = vfs_ioc_setflags_check(inode, oldflags, flags);
+	if (err)
+		goto out_unlock;
 
 	ui->flags = ioctl2ubifs(flags);
 	ubifs_set_inode_flags(inode);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index f7fdfe93e25d..1825d055808c 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3546,4 +3546,6 @@ static inline struct sock *io_uring_get_socket(struct file *file)
 }
 #endif
 
+int vfs_ioc_setflags_check(struct inode *inode, int oldflags, int flags);
+
 #endif /* _LINUX_FS_H */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

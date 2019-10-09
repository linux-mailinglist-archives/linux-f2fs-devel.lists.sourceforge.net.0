Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 988CFD18B3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Oct 2019 21:25:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iIHa2-0004pg-Ob; Wed, 09 Oct 2019 19:25:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <arnd@arndb.de>) id 1iIHa0-0004ot-DS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Oct 2019 19:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dxs1u7c2bciEzprx2dHjq2PEf8lekbaefd+HGVmBGbg=; b=AyvmVOI3dzf+NtETPQMhlX5vw1
 /mi1j9arOju9OH/bhm2Loqnqh6G8lm2Cd3qYbjxCj+mTR0Gtjx7vTdNUfXm42vTLJwtHs3BYtk/UH
 BWF4PUD82wJY/GXd+qgDAETTdVQuwQlhxS0VIPv2XKluK++nLCZEDOcCABeizkPiedJs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dxs1u7c2bciEzprx2dHjq2PEf8lekbaefd+HGVmBGbg=; b=HFpnyx1vhjxb8Kg+2vgA4gHfKZ
 Ej2nnw0si9XzeS9PTSTjBT8acAEXk+OeBEV2252/9cQsUnAXPOL8D7fmJYGa2WQu68wpY+2Fko2An
 PGbHbYUtCZOMxF1l4AU/lOW5tTG1YmrIYCPj4MKiH7YCWO3myZ3/8qieN0+1S9irrQw0=;
Received: from mout.kundenserver.de ([212.227.126.135])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iIHZy-00BilP-A9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Oct 2019 19:25:00 +0000
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Mbzdn-1hfexe4BV1-00dXse; Wed, 09 Oct 2019 21:11:18 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Date: Wed,  9 Oct 2019 21:10:31 +0200
Message-Id: <20191009191044.308087-31-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191009190853.245077-1-arnd@arndb.de>
References: <20191009190853.245077-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Yt5Qym2EiThPkdPiZuVWsOArs8kXwnMpYv8e8jcFHq6aBlEUl35
 2IN5+k0io/Ejnt6hQYqU5PeavuhijMbDbcKRb1ZxQ/6UItKgQqaET9+WeQFtRybNXL/7Evn
 QrMfvNL1I0AWYpCpt9cUDrfru1T2gMRukpp+x7ARQhmEKsY4PWg2oSrpD+oymHu2Kj+/KUc
 T+MrdQgXOJZMCEpqnSOug==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1nBtJNjPBvo=:7mjC6L+65MWbtPrIb9xgMZ
 XR2uLfxAmtsgMEIv+GmsJ5L8gFv1uGKjkQFvRONgUO3TVzaOJyvSAh/HWQnFdHJOb+yM9vn4W
 wk2hzPlnxtWQuo1TiLugynrY3D8efoLcoPrL5eSeCsRVc1NgyQ9E1hnDoqho2YMdg0t0Dv6bR
 PVO+azFlpLuyoeGnSXNSMcXz7ka7EDF6Fjta5Z7F+S4fYVxwEwFWpQg8tU7iBPcOwRcRztMHq
 QABwaWZExa1uwCZxZJFeXjReNJTruY/9eTgufxHpdvp6Ttf/6fDoXeobYbSKopCk7a76YC3Mc
 +Vb5/gcrGB9nzd9FVvzSMO7CTDanomaWDBVwDuQAReozG0LpYvVSEzPikOGV5O1dCh2K5LDLk
 5+kb5Chpgo0N48POcyzNwG2WrSpLUbFa0cSeSf18XCoIx4q64a13A6Nhwa01jNa0zyCNIs6ga
 8TvxUhbCAA9gshLC3niQrl1NMLqnSP+yqtmcF+nBl54QQsS+2u2rUlcIjHQSVu3UMy3QpXUx8
 2M345BpVjO54I+fe8H43f4gT0kc7VNbLlhxH3Gu+OmQhcAyFTBRzx5scgllRNC0MyXWBcBYAr
 urbzBHlxf5505DYuGKUi8zLgfb04TiuJzb7zvvXEcdodWf+hXzuhlXxhD3r5zrPxWpoyDgCBL
 Ohpot80Xif/fV5lpoHIy5LGXpIv7R92s1VpPUCjCE8ckARnohNXaskimHlsnnpz0ed59XljT+
 N61rSbfPJ8bVYPpYo0ZyF76hTQ3fuTdtPskCy78P/ll2iljokIxb392PMZ7/BuF4XZnQnjtVS
 PYE9PJb2WIrJhD+pspnjg6/wy5zDFAARYkMvP1xEUEk8zsbBf7o3GIWtnShbGJ5uofbLshYtw
 DP1fYpteGDR4McHRuYQw==
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: arndb.de]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [212.227.126.135 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iIHZy-00BilP-A9
Subject: [f2fs-dev] [PATCH v6 30/43] fs: compat_ioctl: move FITRIM emulation
 into file systems
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
Cc: linux-nilfs@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Remove the special case for FITRIM, and make file systems
handle that like all other ioctl commands with their own
handlers.

Cc: linux-ext4@vger.kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Cc: linux-nilfs@vger.kernel.org
Cc: ocfs2-devel@oss.oracle.com
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/compat_ioctl.c  | 2 --
 fs/ecryptfs/file.c | 1 +
 fs/ext4/ioctl.c    | 1 +
 fs/f2fs/file.c     | 1 +
 fs/hpfs/dir.c      | 1 +
 fs/hpfs/file.c     | 1 +
 fs/nilfs2/ioctl.c  | 1 +
 fs/ocfs2/ioctl.c   | 1 +
 8 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/compat_ioctl.c b/fs/compat_ioctl.c
index 1e740f4406d3..b20228c19ccd 100644
--- a/fs/compat_ioctl.c
+++ b/fs/compat_ioctl.c
@@ -345,8 +345,6 @@ static int ppp_scompress(struct file *file, unsigned int cmd,
 static unsigned int ioctl_pointer[] = {
 /* Little t */
 COMPATIBLE_IOCTL(TIOCOUTQ)
-/* 'X' - originally XFS but some now in the VFS */
-COMPATIBLE_IOCTL(FITRIM)
 #ifdef CONFIG_BLOCK
 /* Big S */
 COMPATIBLE_IOCTL(SCSI_IOCTL_GET_IDLUN)
diff --git a/fs/ecryptfs/file.c b/fs/ecryptfs/file.c
index feecb57defa7..5fb45d865ce5 100644
--- a/fs/ecryptfs/file.c
+++ b/fs/ecryptfs/file.c
@@ -378,6 +378,7 @@ ecryptfs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		return rc;
 
 	switch (cmd) {
+	case FITRIM:
 	case FS_IOC32_GETFLAGS:
 	case FS_IOC32_SETFLAGS:
 	case FS_IOC32_GETVERSION:
diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index 0b7f316fd30f..e8870fff8224 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -1360,6 +1360,7 @@ long ext4_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	}
 	case EXT4_IOC_MOVE_EXT:
 	case EXT4_IOC_RESIZE_FS:
+	case FITRIM:
 	case EXT4_IOC_PRECACHE_EXTENTS:
 	case EXT4_IOC_SET_ENCRYPTION_POLICY:
 	case EXT4_IOC_GET_ENCRYPTION_PWSALT:
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 29bc0a542759..57d82f2d2ebd 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3403,6 +3403,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_RELEASE_VOLATILE_WRITE:
 	case F2FS_IOC_ABORT_VOLATILE_WRITE:
 	case F2FS_IOC_SHUTDOWN:
+	case FITRIM:
 	case F2FS_IOC_SET_ENCRYPTION_POLICY:
 	case F2FS_IOC_GET_ENCRYPTION_PWSALT:
 	case F2FS_IOC_GET_ENCRYPTION_POLICY:
diff --git a/fs/hpfs/dir.c b/fs/hpfs/dir.c
index d85230c84ef2..f32f15669996 100644
--- a/fs/hpfs/dir.c
+++ b/fs/hpfs/dir.c
@@ -325,4 +325,5 @@ const struct file_operations hpfs_dir_ops =
 	.release	= hpfs_dir_release,
 	.fsync		= hpfs_file_fsync,
 	.unlocked_ioctl	= hpfs_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
 };
diff --git a/fs/hpfs/file.c b/fs/hpfs/file.c
index 1ecec124e76f..b36abf9cb345 100644
--- a/fs/hpfs/file.c
+++ b/fs/hpfs/file.c
@@ -215,6 +215,7 @@ const struct file_operations hpfs_file_ops =
 	.fsync		= hpfs_file_fsync,
 	.splice_read	= generic_file_splice_read,
 	.unlocked_ioctl	= hpfs_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
 };
 
 const struct inode_operations hpfs_file_iops =
diff --git a/fs/nilfs2/ioctl.c b/fs/nilfs2/ioctl.c
index 91b9dac6b2cc..4ba73dbf3e8d 100644
--- a/fs/nilfs2/ioctl.c
+++ b/fs/nilfs2/ioctl.c
@@ -1354,6 +1354,7 @@ long nilfs_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case NILFS_IOCTL_SYNC:
 	case NILFS_IOCTL_RESIZE:
 	case NILFS_IOCTL_SET_ALLOC_RANGE:
+	case FITRIM:
 		break;
 	default:
 		return -ENOIOCTLCMD;
diff --git a/fs/ocfs2/ioctl.c b/fs/ocfs2/ioctl.c
index d6f7b299eb23..2d517b5ec6ac 100644
--- a/fs/ocfs2/ioctl.c
+++ b/fs/ocfs2/ioctl.c
@@ -985,6 +985,7 @@ long ocfs2_compat_ioctl(struct file *file, unsigned cmd, unsigned long arg)
 			return -EFAULT;
 
 		return ocfs2_info_handle(inode, &info, 1);
+	case FITRIM:
 	case OCFS2_IOC_MOVE_EXT:
 		break;
 	default:
-- 
2.20.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

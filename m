Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31092655470
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Dec 2022 21:37:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p8onA-0003RM-TX;
	Fri, 23 Dec 2022 20:37:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p8on1-0003QD-9x
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 20:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IlQ4AZVLaRGn0b7mAEpQpaMCiLoFhSmHaLxhN++R7NU=; b=lktKPPAQHihmbRHtNMAAEqj6eK
 RlAelkL8DZ5jDuGj0TE/oBH9duJtBI2iORlcBv/I7LpjEMt7AGBmF6dYrbB3M8lyF4GVgDVWiLim3
 qo35l3hWf20dLmvJVkBJl+BaL7XV3q9TmSZKHGJ8NimQJQIeYy36XSSMR3TefwwGmYmg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IlQ4AZVLaRGn0b7mAEpQpaMCiLoFhSmHaLxhN++R7NU=; b=FhR1XKFBJg1IbfH5OjC9EqS9hA
 lswbNUSODhD29KfjG8CT5jiSpAzVU4mUz77OVkXdfzrzN+aWQUUfnKfLevi6Ozj8nFC6PivoLu1Vi
 4TmZZ3OzY6jXYoKNihDmh1hXbWxZl0GLhQM/Dva7wbDnuCkdmsBALO/OkEvkRlMBKk/g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p8on0-009S3p-NI for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 20:37:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D381B61D28;
 Fri, 23 Dec 2022 20:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D60C433D2;
 Fri, 23 Dec 2022 20:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671827820;
 bh=qLoSGFi2QkFfE5PAtk38FT/yWSIKsO+TzvgyJfycJFQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XQdKCLLelfI4SoxzCMAnCUtgdS+h9/wA0ND1Sx878oRw5ipn2eXs8emLgIEWu7IIf
 JBsFNvEu/j58OSutvkMWLShj6wyhrUy37JNS2DnPwotL4+tmwysUERhVyhSs7ei+h9
 NKtBVyxLlMbc7C4ITMY+Kw7pVpPh7GXAnZFYIueqVWBYPwPpAXrpLLXbi8ujGYPUD5
 QFlSPCJd9Yuo0zOm5Dldc8Jq66Lwkia/3lxTXrKYU+xSn7wVnfBP2VDx3inq3A52bz
 ChvrTaw6ccDIJgTioKbE631T7CAD6ukJcDD2rq+lINmp6BCvnCVN2Uz2bCbYl+fKG8
 rgFvJqVI6oY7w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 23 Dec 2022 12:36:38 -0800
Message-Id: <20221223203638.41293-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221223203638.41293-1-ebiggers@kernel.org>
References: <20221223203638.41293-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Now that the needed
 changes have been made to fs/buffer.c, ext4 is ready to support the verity
 feature when the filesystem block size is less than the page size. So remove
 the mount-time check that pr [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p8on0-009S3p-NI
Subject: [f2fs-dev] [PATCH v2 11/11] ext4: allow verity with fs block size <
 PAGE_SIZE
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
Cc: Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that the needed changes have been made to fs/buffer.c, ext4 is ready
to support the verity feature when the filesystem block size is less
than the page size.  So remove the mount-time check that prevented this.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fsverity.rst | 8 +++++---
 fs/ext4/super.c                        | 5 -----
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
index 948d202545240..c0c8a25b41bb8 100644
--- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -497,9 +497,11 @@ To create verity files on an ext4 filesystem, the filesystem must have
 been formatted with ``-O verity`` or had ``tune2fs -O verity`` run on
 it.  "verity" is an RO_COMPAT filesystem feature, so once set, old
 kernels will only be able to mount the filesystem readonly, and old
-versions of e2fsck will be unable to check the filesystem.  Moreover,
-currently ext4 only supports mounting a filesystem with the "verity"
-feature when its block size is equal to PAGE_SIZE (often 4096 bytes).
+versions of e2fsck will be unable to check the filesystem.
+
+Originally, an ext4 filesystem with the "verity" feature could only be
+mounted when its block size was equal to the system page size
+(typically 4096 bytes).  In Linux v6.3, this limitation was removed.
 
 ext4 sets the EXT4_VERITY_FL on-disk inode flag on verity files.  It
 can only be set by `FS_IOC_ENABLE_VERITY`_, and it cannot be cleared.
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 16a343e8047d4..798cb19e2258b 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -5336,11 +5336,6 @@ static int __ext4_fill_super(struct fs_context *fc, struct super_block *sb)
 		}
 	}
 
-	if (ext4_has_feature_verity(sb) && sb->s_blocksize != PAGE_SIZE) {
-		ext4_msg(sb, KERN_ERR, "Unsupported blocksize for fs-verity");
-		goto failed_mount_wq;
-	}
-
 	/*
 	 * Get the # of file system overhead blocks from the
 	 * superblock if present.
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14986B1F8FE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Aug 2025 10:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmURx28x0ySod+i3TFWduOjY9qtxXrY8AX77UMhYIIk=; b=XQXNjP25vsIcaQzDyEhiaqbVCt
	emsMkfMjp9zPjBCYRxvcxWjPrHOJhAHXbyDxqJstBHF82nMBysdVoc1HEBfM4Cjhtsc7mWuOAHUeF
	+OY3/ils2T84DaeMnqdnqgPRUcAsRphP+ygjPpOykMeSchEXOIxivkYVhYcOSFIuz7CA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ul0yb-00021C-AC;
	Sun, 10 Aug 2025 08:00:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ul0ya-000212-08
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2NwDaiGFdBYmd/Y31sl4wpRsTj7KrLr20RpyUh4KpK8=; b=aGe0lxvzhv0Z4Hj+3QVyR0uxSc
 BRooMlqPtR50Muu0xS7zJ9odT/TMqCzQxUVJdPfa4yoYHN48ATZ8A0diaXMnjmes9dYSZyq34RatI
 MXNdA3c0xS1wpuFFX3ru6T3dYcOLzt8RjR3Rvdpad2w3p7K5WPvT3otnxroxw+LUGWrA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2NwDaiGFdBYmd/Y31sl4wpRsTj7KrLr20RpyUh4KpK8=; b=F6LlP6f4wLWMp5S98z+JAaNbcm
 l7qdg3sqkltN4NJbIVxk7WW/kaygxEtcTfKOga8dtHU0UYa13AIXOpLaJ+AbaKBmWUy9RDNTFIXi6
 fgo41JfQEg/U3x8PZikw32T299dgj6LwWiecJ4Nc4LMYK8h3tYsmFu1ohaeaGFCBii5I=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ul0yZ-000116-IV for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 31BE45C56FD;
 Sun, 10 Aug 2025 08:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2CAC4CEF7;
 Sun, 10 Aug 2025 08:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754812809;
 bh=0QKYi4i563jkQBHgIWsIphouZcaUjg0BpGQZ0ifH+ao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QDcjjnngyBOJ5esSVTp3mHZ3is51fgNdzKZ8LmYnb33VmjyO9RcMLkqreDQTZwjrB
 2Rl6SoPZ9JRA6iNZndXA9iVpPeh/w8BMSKuWPZBt+w/RQvB/3uKBDXfMFh6p/7GRSV
 UgE3NLSJpf1mCsoM8OWYSmiwvjGefsN0I+CUPLy7lbyEuiQKbAK/MamSqDeEggHRBN
 BoQw6FAVCBXodbd4VKYsNP+5j/531I3hzTyxmBD1qdvjet8VZdYSWx14mRU83iJioL
 S3lzoNyBVxRI9jJ7QQ1L0oYfj7MOwRDwOpfXI9AVowxFIhA1A2xbk96nakWEhhadeK
 MgFISk3CIGUnA==
To: linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev
Date: Sun, 10 Aug 2025 00:56:56 -0700
Message-ID: <20250810075706.172910-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Move the fscrypt_inode_info pointer into the
 filesystem-specific
 part of the inode by adding the field ext4_inode_info::i_crypt_info and
 configuring
 fscrypt_operations::inode_info_offs accordingly. This is a prerequisite for
 a later commit that removes inode::i_crypt_info, saving memory and improving
 cache efficiency with filesystems that don't support fscrypt. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ul0yZ-000116-IV
Subject: [f2fs-dev] [PATCH v5 03/13] ext4: move crypt info pointer to
 fs-specific part of inode
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Move the fscrypt_inode_info pointer into the filesystem-specific part of
the inode by adding the field ext4_inode_info::i_crypt_info and
configuring fscrypt_operations::inode_info_offs accordingly.

This is a prerequisite for a later commit that removes
inode::i_crypt_info, saving memory and improving cache efficiency with
filesystems that don't support fscrypt.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/ext4/crypto.c | 2 ++
 fs/ext4/ext4.h   | 4 ++++
 fs/ext4/super.c  | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/fs/ext4/crypto.c b/fs/ext4/crypto.c
index 0a056d97e6402..cf0a0970c0956 100644
--- a/fs/ext4/crypto.c
+++ b/fs/ext4/crypto.c
@@ -225,10 +225,12 @@ static bool ext4_has_stable_inodes(struct super_block *sb)
 {
 	return ext4_has_feature_stable_inodes(sb);
 }
 
 const struct fscrypt_operations ext4_cryptops = {
+	.inode_info_offs	= (int)offsetof(struct ext4_inode_info, i_crypt_info) -
+				  (int)offsetof(struct ext4_inode_info, vfs_inode),
 	.needs_bounce_pages	= 1,
 	.has_32bit_inodes	= 1,
 	.supports_subblock_data_units = 1,
 	.legacy_key_prefix	= "ext4:",
 	.get_context		= ext4_get_context,
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 01a6e2de7fc3e..c897109dadb15 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -1180,10 +1180,14 @@ struct ext4_inode_info {
 
 	/* Precomputed uuid+inum+igen checksum for seeding inode checksums */
 	__u32 i_csum_seed;
 
 	kprojid_t i_projid;
+
+#ifdef CONFIG_FS_ENCRYPTION
+	struct fscrypt_inode_info *i_crypt_info;
+#endif
 };
 
 /*
  * File system states
  */
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index c7d39da7e733b..0c3059ecce37c 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1468,10 +1468,13 @@ static void init_once(void *foo)
 	INIT_LIST_HEAD(&ei->i_orphan);
 	init_rwsem(&ei->xattr_sem);
 	init_rwsem(&ei->i_data_sem);
 	inode_init_once(&ei->vfs_inode);
 	ext4_fc_init_inode(&ei->vfs_inode);
+#ifdef CONFIG_FS_ENCRYPTION
+	ei->i_crypt_info = NULL;
+#endif
 }
 
 static int __init init_inodecache(void)
 {
 	ext4_inode_cachep = kmem_cache_create_usercopy("ext4_inode_cache",
-- 
2.50.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

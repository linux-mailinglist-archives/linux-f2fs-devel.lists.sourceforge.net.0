Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E40B1F906
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Aug 2025 10:00:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcB+YUEY4CXuZKbNcnqN4cygt4D7aYuGR56KUyDGK04=; b=gRsFon2Io11dIR4EBxeQatoGqQ
	rahxcrmKtEFy0tLIf7xoBrTKWAk70/D+U68tuTh44//L+1+c+1FEmYaUVP5lFhqPfPXd4201EM78D
	CFLnbukXt6vraCdZg2kawEvtG1qHUyHJIRX/CndqYXFKmiDFr7JK2VYS3pujFfiOfwzk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ul0yc-0002YD-NR;
	Sun, 10 Aug 2025 08:00:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ul0yb-0002Xu-3V
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TsQ9RUxC/P1M8vyR7p5WTzc9ZZaVmiCuBZOhmUzI2XA=; b=MyIYh5Dz4IzQbrpIJZ06L+bEtT
 kdXcrDuYKYsfBDW8eYkY56DvYFX7LO7ZUsoqHGTACCwkwMa9tVkFivfyMl/sO0U3GYWwZ9lcFfPfw
 NfU6JRCZajhml8xv3GvXVSAP7PQ9CcwofQzvTHefovMxAnKUkow1P598QW9IXQHIKPMA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TsQ9RUxC/P1M8vyR7p5WTzc9ZZaVmiCuBZOhmUzI2XA=; b=hPHEJUmrIiEOMoQ4zbdUG4N9hf
 mzvd9m1RliX8jSfvm7Y4K5mwex/yyvugNjF+kb4f6jvYOPUJ8S40BgnI9EpoHq914C5wvuJRa8Jgl
 4I9IZoFiOrKXaCLed/g1JyFWVgG7vKCHfCai4JJEMHFA4GSWqLMIWluicnCeY93ljRTM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ul0ya-00011H-N8 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6880B45C5F;
 Sun, 10 Aug 2025 08:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0353DC4CEFB;
 Sun, 10 Aug 2025 08:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754812810;
 bh=bmB+BqOK47AQ74zOAlenVEXHIBC1qQuTYrDPLOSDJDw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o3Ppu9lCK+UMIRCJ649FLlexF8zz+c5Fny3h+DogkpOBxxoTI+SD12otxBd4HJPGN
 KrDlaO+YuVwOT5khIksO9p/0SHCSpmXkMAtaa9ZYhjNb+HopBdHl5Dgaq7wIamHvE4
 Lx0RUvlNHg9683rs5qCfE6WCKJafDQIjyfimusDQPjsBQCFnURsh7M1PygjfbmsQsO
 TcauGSZNJ/T+xRc3iJJaE+4/RX8mbkSg3olk0B9E8OMQ3IYEwZXXP7hfpdQCMrWXxi
 v6M244Sk1mMSGGyYMPXvvqKBHDNMb/N2yOcxgbUKe/kBGuifA8XvEt1Ov4Sxny0gpD
 tevQolZt9j7OA==
To: linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev
Date: Sun, 10 Aug 2025 00:56:59 -0700
Message-ID: <20250810075706.172910-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Move the fscrypt_inode_info pointer into the
 filesystem-specific
 part of the inode by adding the field ceph_inode_info::i_crypt_info and
 configuring
 fscrypt_operations::inode_info_offs accordingly. This is a prerequisite for
 a later commit that removes inode::i_crypt_info, saving memory and improving
 cache efficiency with filesystems that don't support fscrypt. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ul0ya-00011H-N8
Subject: [f2fs-dev] [PATCH v5 06/13] ceph: move crypt info pointer to
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
the inode by adding the field ceph_inode_info::i_crypt_info and
configuring fscrypt_operations::inode_info_offs accordingly.

This is a prerequisite for a later commit that removes
inode::i_crypt_info, saving memory and improving cache efficiency with
filesystems that don't support fscrypt.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/ceph/crypto.c | 2 ++
 fs/ceph/inode.c  | 1 +
 fs/ceph/super.h  | 1 +
 3 files changed, 4 insertions(+)

diff --git a/fs/ceph/crypto.c b/fs/ceph/crypto.c
index cab7226192073..7026e794813ca 100644
--- a/fs/ceph/crypto.c
+++ b/fs/ceph/crypto.c
@@ -131,10 +131,12 @@ static const union fscrypt_policy *ceph_get_dummy_policy(struct super_block *sb)
 {
 	return ceph_sb_to_fs_client(sb)->fsc_dummy_enc_policy.policy;
 }
 
 static struct fscrypt_operations ceph_fscrypt_ops = {
+	.inode_info_offs	= (int)offsetof(struct ceph_inode_info, i_crypt_info) -
+				  (int)offsetof(struct ceph_inode_info, netfs.inode),
 	.needs_bounce_pages	= 1,
 	.get_context		= ceph_crypt_get_context,
 	.set_context		= ceph_crypt_set_context,
 	.get_dummy_policy	= ceph_get_dummy_policy,
 	.empty_dir		= ceph_crypt_empty_dir,
diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
index fc543075b827a..480cb3a1d639a 100644
--- a/fs/ceph/inode.c
+++ b/fs/ceph/inode.c
@@ -663,10 +663,11 @@ struct inode *ceph_alloc_inode(struct super_block *sb)
 
 	INIT_WORK(&ci->i_work, ceph_inode_work);
 	ci->i_work_mask = 0;
 	memset(&ci->i_btime, '\0', sizeof(ci->i_btime));
 #ifdef CONFIG_FS_ENCRYPTION
+	ci->i_crypt_info = NULL;
 	ci->fscrypt_auth = NULL;
 	ci->fscrypt_auth_len = 0;
 #endif
 	return &ci->netfs.inode;
 }
diff --git a/fs/ceph/super.h b/fs/ceph/super.h
index cf176aab0f823..25d8bacbcf440 100644
--- a/fs/ceph/super.h
+++ b/fs/ceph/super.h
@@ -461,10 +461,11 @@ struct ceph_inode_info {
 
 	struct work_struct i_work;
 	unsigned long  i_work_mask;
 
 #ifdef CONFIG_FS_ENCRYPTION
+	struct fscrypt_inode_info *i_crypt_info;
 	u32 fscrypt_auth_len;
 	u32 fscrypt_file_len;
 	u8 *fscrypt_auth;
 	u8 *fscrypt_file;
 #endif
-- 
2.50.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE9+Jk4svGnXuAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 18:03:10 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD402CF531
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 18:03:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oB4axe7PD0of2d/lhUkqIk7iodwUTXne0vB8ZolAeJU=; b=duZqrqJ+CNs26xcLWdKmrA7lBp
	AMrqhQQoTfEuTbOwuNoCh0TajkC+CVcH19T47/uSfCZ1Thin/RjlQWeB/A+Oj3+f00apkAi1SYE06
	tzsOtR1DBirmRAaj2giXqSe3VJB4fEpHlMfBdPq2DoGALUHuosvx6ryOVTGiI05sm2GI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w3Gm2-0008D2-9D;
	Thu, 19 Mar 2026 17:03:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1w3Gm0-0008Cw-PQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 17:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HD/UaJFRtiDmy0zD7PkW/rOPgZAROnFteUAme20UPEo=; b=dnZvXTA6qHJ1OSgPfiQ3qNy8gp
 JDacBj5hwQ7tScTQyCZIsf73b/r8+rFTAKcQK0lxV9NRyxVl3jGjO9BbEk87Mju+q5Pke3XpeGdF2
 kHRmXP4DjKX0Vf5d2J87duJAXO/5tirhs8XQaja8/yRAXvEFvhaLj/wAQvy81fuNZef8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HD/UaJFRtiDmy0zD7PkW/rOPgZAROnFteUAme20UPEo=; b=diganookZc38hHeNxK0Da5THGM
 1hPH0VTmHMtD372E+FrGerrLM/vtkb+fY26tNE6fZlJoVwLrnuzvapiHWS/P+U1hLS7TTd2+Iyih+
 7S560Dms1PduY9ph8g46RWX254tEY9yLs8wd6ZaGHvq9PVyg+y51dIuQXyxXe74EJyzg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w3Gm0-0005dr-4f for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 17:03:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8EF0660133;
 Thu, 19 Mar 2026 17:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A16C2BCB7;
 Thu, 19 Mar 2026 17:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773939773;
 bh=Byf1cwORL1INFmB0vVpuuOrSdnyoaKhaNjaLPHFDNkE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U3DJZSYsADWKm9OBfUSy+JCXTiKOCWZFF3C3UTVP9tNjob71wOWh7jnd37fOV3sIW
 sH+kPI3Jj8Rsq67o3RBc+IAcjElAaZbw5rWrJ4tH3tkXrHjuBCYmopgwfTqMI1FYu9
 bjb7bqfHvpw1JiHlXVXvRjx8X1vV8EkmzqCoFvGn9i9maUzfli9kE0lpi59HagJvbq
 ieFXzFSeBeyxjkhJx3Hb77MiHrKjvET8zzW+rqHgYKXfsa6NB3C7jrmq/g76WvdQL9
 bo/ikKjWRF1eQUWIvWhH7lHH2AYp/OHNlaY4S2dv06JIBDAE/b9tKXhvyrxrp0gr7I
 6xeEd41E1yQoA==
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Date: Thu, 19 Mar 2026 18:01:52 +0100
Message-ID: <20260319170231.1455553-6-aalbersh@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260319170231.1455553-1-aalbersh@kernel.org>
References: <20260319170231.1455553-1-aalbersh@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Let filesystem iterate over hashes in the block and check
 if these are hashes of zeroed data blocks. XFS will use this to decide if
 it want to store tree block full of these hashes. Signed-off-by: Andrey
 Albershteyn
 <aalbersh@kernel.org> Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
 --- fs/btrfs/verity.c | 6 +++++- fs/ext4/verity.c | 4 +++- fs/f2fs/verity.c
 | 4 +++- fs/verit [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w3Gm0-0005dr-4f
Subject: [f2fs-dev] [PATCH v5 05/25] fsverity: pass digest size and hash of
 the empty block to ->write
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
From: Andrey Albershteyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, djwong@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-xfs@vger.kernel.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 3BD402CF531
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Let filesystem iterate over hashes in the block and check if these are
hashes of zeroed data blocks. XFS will use this to decide if it want to
store tree block full of these hashes.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 fs/btrfs/verity.c        | 6 +++++-
 fs/ext4/verity.c         | 4 +++-
 fs/f2fs/verity.c         | 4 +++-
 fs/verity/enable.c       | 4 +++-
 include/linux/fsverity.h | 6 +++++-
 5 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
index 0062b3a55781..6d8d3808d75d 100644
--- a/fs/btrfs/verity.c
+++ b/fs/btrfs/verity.c
@@ -773,11 +773,15 @@ static struct page *btrfs_read_merkle_tree_page(struct inode *inode,
  * @buf:	Merkle tree block to write
  * @pos:	the position of the block in the Merkle tree (in bytes)
  * @size:	the Merkle tree block size (in bytes)
+ * @zero_digest:	the hash of a merkle block-sized buffer of zeroes
+ * @digest_size:	size of zero_digest, in bytes
  *
  * Returns 0 on success or negative error code on failure
  */
 static int btrfs_write_merkle_tree_block(struct file *file, const void *buf,
-					 u64 pos, unsigned int size)
+					 u64 pos, unsigned int size,
+					 const u8 *zero_digest,
+					 unsigned int digest_size)
 {
 	struct inode *inode = file_inode(file);
 	loff_t merkle_pos = merkle_file_pos(inode);
diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index ca61da53f313..347945ac23a4 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -374,7 +374,9 @@ static void ext4_readahead_merkle_tree(struct inode *inode, pgoff_t index,
 }
 
 static int ext4_write_merkle_tree_block(struct file *file, const void *buf,
-					u64 pos, unsigned int size)
+					u64 pos, unsigned int size,
+					const u8 *zero_digest,
+					unsigned int digest_size)
 {
 	pos += ext4_verity_metadata_pos(file_inode(file));
 
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 92ebcc19cab0..b3b3e71604ac 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -270,7 +270,9 @@ static void f2fs_readahead_merkle_tree(struct inode *inode, pgoff_t index,
 }
 
 static int f2fs_write_merkle_tree_block(struct file *file, const void *buf,
-					u64 pos, unsigned int size)
+					u64 pos, unsigned int size,
+					const u8 *zero_digest,
+					unsigned int digest_size)
 {
 	pos += f2fs_verity_metadata_pos(file_inode(file));
 
diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index 42dfed1ce0ce..ad4ff71d7dd9 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -50,7 +50,9 @@ static int write_merkle_tree_block(struct file *file, const u8 *buf,
 	int err;
 
 	err = inode->i_sb->s_vop->write_merkle_tree_block(file, buf, pos,
-							  params->block_size);
+							  params->block_size,
+							  params->zero_digest,
+							  params->digest_size);
 	if (err)
 		fsverity_err(inode, "Error %d writing Merkle tree block %lu",
 			     err, index);
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 35bb76093de5..535e16a9c37d 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -124,6 +124,8 @@ struct fsverity_operations {
 	 * @buf: the Merkle tree block to write
 	 * @pos: the position of the block in the Merkle tree (in bytes)
 	 * @size: the Merkle tree block size (in bytes)
+	 * @zero_digest: the hash of a merkle block-sized buffer of zeroes
+	 * @digest_size: size of zero_digest, in bytes
 	 *
 	 * This is only called between ->begin_enable_verity() and
 	 * ->end_enable_verity().
@@ -131,7 +133,9 @@ struct fsverity_operations {
 	 * Return: 0 on success, -errno on failure
 	 */
 	int (*write_merkle_tree_block)(struct file *file, const void *buf,
-				       u64 pos, unsigned int size);
+				       u64 pos, unsigned int size,
+				       const u8 *zero_digest,
+				       unsigned int digest_size);
 };
 
 #ifdef CONFIG_FS_VERITY
-- 
2.51.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

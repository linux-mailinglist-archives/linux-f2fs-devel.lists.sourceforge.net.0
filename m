Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFttD1BT/GlOOAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 07 May 2026 10:54:40 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5654E53D2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 07 May 2026 10:54:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQsNpPU8Iu7sdO2XCcZ3ekEfi7q5XH7eVSAA3BIbEKo=; b=ZaxDh0aW249+A0KRIyg1MuIClq
	S12Yo9rdhC4L09bn+qaLFIk1wxS/Jo2rnRlrZWJ7LSaMCxXogfajbI0B9dLrdscAR8ouDak+K4sbB
	7BYzA4FhAzuOSPCz8qsQr0Id0WaCjKSwnyBNG+TFxAzibAsPXAkp+FcWCn6vR70hZxYw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wKuVA-0004Pk-FH;
	Thu, 07 May 2026 08:54:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wKuUt-0004Ng-55
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 May 2026 08:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KQ6v8/XE00gOuJZ2DMrbUuMMEc2T2hPgO5EDoJ7YR40=; b=P3A//BpHbgw+gdVVqUgmM0HCQO
 oWXaGz7ciwhXXgw1n8HckKFaWlucM/xlAatBqEzkZo7TfWc8QZgDlEm+YeJqks8oq1QTJfn5PSYcx
 MMnJCtFAXtW98Og9Kt2w5Qb2xooolRqW7r1OlVk6NitBf/f8+61AgX0gIG248OKk9H5I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KQ6v8/XE00gOuJZ2DMrbUuMMEc2T2hPgO5EDoJ7YR40=; b=kbO0+ndKioh5JV4l0GxzET6gKf
 miuYN4rUmBLgORxKHw2WO9BAMO0XYvKHdkz14Z2jZeKdq7zjW23yrDfzwtms6J8O2LBG2KWvoEeeW
 xA9MK08KqfWMGQT62rt1+5kp3QbBTUuh+QDIf1bV2eNAIjG/I+CwYiWj2Qo1cd9W45oY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wKuUs-0002B3-C7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 May 2026 08:54:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AE83C6015B;
 Thu,  7 May 2026 08:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AEEC2BCF6;
 Thu,  7 May 2026 08:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778144047;
 bh=+3MOBq8tIY5WA12oHUqvFyZTiNAU0Ok39mLnTTLF1eI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Hf1rEPyGANCuYQ7YKRRwV5yBSC8evixdncEO8rWGMR0WR4Nsps3pDS2jTI0rnKtLt
 y+DYSQNTHmxxeLqAt1PeU26Sb5Mme0XF7yjJoIreHh6Rvfqzo3AW0zO45JvQNG7gSw
 xYcNsxt9IEbI/C4QK4zM8mAdzXEZT35WenZ19ufSaPEl7yP/3c6XsPUlqJNyffZZuR
 8x4HXKmq6t5rq8rOzlrEBIQbvDdfGHvZ+n6RNFpiGEKk8AEXfXs0FKyGawlnssm4/j
 uCvywPgMOjg9Bnj4aYqRocEoyixWanE7Gtie++/0sOv8RP5msDdSsWYRS7U0b1RCES
 7tiuvwAcqNh+w==
Date: Thu, 07 May 2026 04:52:59 -0400
MIME-Version: 1.0
Message-Id: <20260507-case-sensitivity-v14-6-e62cc8200435@oracle.com>
References: <20260507-case-sensitivity-v14-0-e62cc8200435@oracle.com>
In-Reply-To: <20260507-case-sensitivity-v14-0-e62cc8200435@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2557;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=2Xqe+DnVGNfulHUCzpURt2jTiqbh233GQupN+nsg0Mc=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp/FL1C5mDGpvp30dRY5KP6ZnwqtQTdP+Z+qnSK
 Q5uR+sJ2nGJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCafxS9QAKCRAzarMzb2Z/
 lwuXEACa4c+VWDx7SluEICLuKov7wz0q/wseO2CxWD3z9f+GG4fX65+R4PFHZkMI3jSs9Bzn/6f
 Rtez7Uuma1cKsuRzAFAGy3lFkKPap6hmQLYJ/Spr4ogk1pCdbdAx/LNlesBokrtrVRyCXPMzTpC
 dzU+j488BxnZ/wgJazZP0eTxc86KAHZxKI9LhQLDa9e4GhoGrcpAQvvAuufVA6twz3dhhkNfFup
 BZWUCqXlPX0IDqpwCbNOcVYyApdNTqoodYg21PetZHWrXl0bq7C+C0zYFhadREeD/zQmYqKYOIJ
 gScmSNLDK1J41O/lEuxcv84gb9B0KRqAOM+Iwm9jPZ76gzp20Tx1BLvLjEGDHI8UsnnZzO5bxB7
 SuU2vVIdBEr5YL7vyT4+DcYunp2OM++OQemb/N1uEuj3m7Wh3kAUcwrmf2tQouSGdXyjHrgWYaT
 6F47y/hZUXeFfr3pysxzrAT/Vvgj4kWDBYLhVL+E/Hil/ZhU/rIwEV63s0LqlQ2u7QcM3vdE2ZS
 uY4wBGnnjlZDROR2ZquBMCJI99w6BrssdudAc8MRo6Tg1BNlGlnIPGq27iECL7z5x2fl8UGRITC
 8Uuu+yR1uGnSoVBCjHFaEII3u6E7ui4b6Ef7um+HcjezYfL/ETmLztgfeRaMiSdWcA2n3GLlrRQ
 5glsn2QUUGfOjCQ==
X-Developer-Key: i=chuck.lever@oracle.com; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Chuck Lever <chuck.lever@oracle.com> Report HFS case
 sensitivity behavior via the FS_XFLAG_CASEFOLD flag. HFS is always
 case-insensitive
 (using Mac OS Roman case folding) and always preserves case at rest. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wKuUs-0002B3-C7
Subject: [f2fs-dev] [PATCH v14 06/15] hfs: Implement fileattr_get for case
 sensitivity
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
From: Chuck Lever via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chuck Lever <cel@kernel.org>
Cc: pc@manguebit.org, yuezhang.mo@sony.com, cem@kernel.org,
 Roland Mainz <roland.mainz@nrubsig.org>,
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 linux-cifs@vger.kernel.org, sfrench@samba.org, slava@dubeyko.com,
 linux-ext4@vger.kernel.org, linkinjeon@kernel.org, sprasad@microsoft.com,
 frank.li@vivo.com, ronniesahlberg@gmail.com, glaubitz@physik.fu-berlin.de,
 jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp, linux-nfs@vger.kernel.org,
 tytso@mit.edu, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, Chuck Lever <chuck.lever@oracle.com>,
 hansg@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 9A5654E53D2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:roland.mainz@nrubsig.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:linux-nfs@vger.kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[manguebit.org,sony.com,kernel.org,nrubsig.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[cel@kernel.org]
X-Rspamd-Action: no action

From: Chuck Lever <chuck.lever@oracle.com>

Report HFS case sensitivity behavior via the FS_XFLAG_CASEFOLD
flag. HFS is always case-insensitive (using Mac OS Roman case
folding) and always preserves case at rest.

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>
Reviewed-by: Roland Mainz <roland.mainz@nrubsig.org>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/hfs/dir.c    |  1 +
 fs/hfs/hfs_fs.h |  2 ++
 fs/hfs/inode.c  | 14 ++++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/fs/hfs/dir.c b/fs/hfs/dir.c
index f5e7efe924e7..c4c6e1623f55 100644
--- a/fs/hfs/dir.c
+++ b/fs/hfs/dir.c
@@ -328,4 +328,5 @@ const struct inode_operations hfs_dir_inode_operations = {
 	.rmdir		= hfs_remove,
 	.rename		= hfs_rename,
 	.setattr	= hfs_inode_setattr,
+	.fileattr_get	= hfs_fileattr_get,
 };
diff --git a/fs/hfs/hfs_fs.h b/fs/hfs/hfs_fs.h
index ac0e83f77a0f..1b23448c9a48 100644
--- a/fs/hfs/hfs_fs.h
+++ b/fs/hfs/hfs_fs.h
@@ -177,6 +177,8 @@ extern int hfs_get_block(struct inode *inode, sector_t block,
 extern const struct address_space_operations hfs_aops;
 extern const struct address_space_operations hfs_btree_aops;
 
+struct file_kattr;
+int hfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
 int hfs_write_begin(const struct kiocb *iocb, struct address_space *mapping,
 		    loff_t pos, unsigned int len, struct folio **foliop,
 		    void **fsdata);
diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
index 89b33a9d46d5..f41cc261684d 100644
--- a/fs/hfs/inode.c
+++ b/fs/hfs/inode.c
@@ -18,6 +18,7 @@
 #include <linux/uio.h>
 #include <linux/xattr.h>
 #include <linux/blkdev.h>
+#include <linux/fileattr.h>
 
 #include "hfs_fs.h"
 #include "btree.h"
@@ -699,6 +700,18 @@ static int hfs_file_fsync(struct file *filp, loff_t start, loff_t end,
 	return ret;
 }
 
+int hfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
+{
+	/*
+	 * HFS compares filenames using Mac OS Roman case folding, so
+	 * lookup is always case-insensitive. Names are stored on disk
+	 * with case intact; CASENONPRESERVING stays clear.
+	 */
+	fa->fsx_xflags |= FS_XFLAG_CASEFOLD;
+	fa->flags |= FS_CASEFOLD_FL;
+	return 0;
+}
+
 static const struct file_operations hfs_file_operations = {
 	.llseek		= generic_file_llseek,
 	.read_iter	= generic_file_read_iter,
@@ -715,4 +728,5 @@ static const struct inode_operations hfs_file_inode_operations = {
 	.lookup		= hfs_file_lookup,
 	.setattr	= hfs_inode_setattr,
 	.listxattr	= generic_listxattr,
+	.fileattr_get	= hfs_fileattr_get,
 };

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

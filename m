Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAb0MbYe7Gm7UgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Apr 2026 03:53:58 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 653F9464898
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Apr 2026 03:53:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3CQp8e57uAOe8FCcAV3Pdw15eOSUEQR3bJBC2Nsf2c=; b=A9zdUJ8x/PGWjWrT5m0zWme0n7
	TCcLWFbYhmAhrLCG+BejANB52dcoWKgbpERon+JAhEzRiAonda3kD3EZ+qnh3Ku7tq4SUK9BQ56eb
	ie+Xlk7HVfAVC9snzhUnvTeHVuNDQmkXNsAah6KJrHDKtekp3+kqMRhPPjS2koOPPUBc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wGSDX-0000zC-IA;
	Sat, 25 Apr 2026 01:53:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wGSDV-0000yw-KC
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Apr 2026 01:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M/7/V/k/Bmmpax7NK7kxqzrwsf3Kkw6njfEj/5j4DXc=; b=OXgHxZ6fIDhn54ooiw16VK/6wq
 1QHxdc6KdEHaXeawVAIbP/xfSPM+/OE06808JExYIerG0VZeheoFujkr4kiaSaYMS8iDSF4HJ0tqQ
 OxIhjPmRH+lLWpyHyTVl20aV6PxYtqvuOL5/nj964E5lxJczPbbYwoWJbJae3q5hu6es=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M/7/V/k/Bmmpax7NK7kxqzrwsf3Kkw6njfEj/5j4DXc=; b=TaBBDMSh3KrQ3/V5beGFSy24Fy
 JTYQ9x8N+jtJv5MHSjedHXH80se79wKSp9qqnl430z2fpWwJO14ZJHDoJSzwZ5BgS6MWcnunDwoAc
 zUA13jD3pK6I6MlcgQACCErBfpQnIgY7zNg10rbtCIhbS0Tc5EqKdtvDj+vkchOfM+nM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wGSDS-00031E-BB for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Apr 2026 01:53:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 251EE600CB;
 Sat, 25 Apr 2026 01:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C33C2BCB2;
 Sat, 25 Apr 2026 01:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777082033;
 bh=a2oUrA0xe//8KXon7nK7LgDRTlRSr3NVpBGjFd6WwfA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=U3pOlnwSxVJOTPZCG1rItktWaaT+CJXRd9dITPdS9ijvMcfdNFdGR6FZyX0UQDHa2
 XNl9nHoebtbyi62S+XY9NFTbI93SO6ajt8XK+WGATwifUUvTj7y0JOZOfy9AZai36Z
 QUqbiO/jVvZ9oC785y6vsupXySSjok5gDqbs7fqEk632z5tFI7eEb0U4RXwavQms65
 ElCAyV/ab8+R7tAyOhj4FongoS7ndytQFJu3Nor8/ToZJ61nXa2s8Vc49JuUuiSF4L
 HIIloSmOIBc7SFSpY9w/2OZQyh7NwiKtLvcEmQaPgx39usg00h9PtKJXSgRTKWulQP
 nQAPf4+3yFhTg==
Date: Fri, 24 Apr 2026 21:53:14 -0400
MIME-Version: 1.0
Message-Id: <20260424-case-sensitivity-v11-12-de5619beddaf@oracle.com>
References: <20260424-case-sensitivity-v11-0-de5619beddaf@oracle.com>
In-Reply-To: <20260424-case-sensitivity-v11-0-de5619beddaf@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4581;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=mSjVyU0+7gMxVOpF8jjeXoK0ARUH2lVZI4wCKuXJ6hY=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp7B6Rt/F187q66PiYnbIHIdzE1i9SQMnias3kh
 kph+eacFZmJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCaewekQAKCRAzarMzb2Z/
 l8ZCEACdBgejkIxR+MOjjazHhQE0Xe0Bphrmcgr3a8BAlqU+JfW4oyWYpCg6A13uPzS/70Glcia
 NEAueRbIy8hlIc3d/PikUCXr2w5eDsCPVMxujl+SE/PC1pK8PYFDdJUq4N4ZZ02u+kZ5XRNO7bp
 Qk6iQW9nTTtadaIYIniKTlyp6zSldA4C9N7UJ9Zr9XHuTnHvhz5ZNF/n7OVjUOsjx02RpoBM4Vx
 zTv6aOULc6CBZMVe+pqlBxY9n6BM/Mx+Kg1h6ueqwODwqzOGN8rAqKedSNfAnXnTHbWgfwzGOmA
 QFayP5c7JpTE9Ive/TaGi6DnaxT6M6y2YOpMPd1oMS4ZzFv6Dd/fm6BTzzh3Tz1srYSPZSLOvHW
 n0hGZDjwrYCn8Qxl/cGaXLr7Xz04rC9G5HGPUanUeOcfUPkfNVzOq1zI3S37/Q62wOolsz+TEQC
 IsEjcFFO73LZGhHyQLG83nuJ7O1KakwQOp0W52vglJSxGJgA0/h16MpkjhtbZr5gZ7oKcwWXFhx
 uVijk4t0wbczoQGfMWd20yKploZicGSdV4fyylTSBSKVkEmNbzbEkfh11mJq4C8Y9Vzx5Zo3Iif
 HB2KPWCcuQgewuLpAR/BX6EJDe0WANNoxBH3tO3QdFUjvl8hgOk09W5/XsslBhIbReLK4+szKkw
 x5Wb8RRoYF7ci1Q==
X-Developer-Key: i=chuck.lever@oracle.com; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chuck Lever <chuck.lever@oracle.com> Upper layers such
 as NFSD need a way to query whether a filesystem handles filenames in a
 case-sensitive
 manner so they can provide correct semantics to remote clients. Without this
 information, NFS e [...] 
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
X-Headers-End: 1wGSDS-00031E-BB
Subject: [f2fs-dev] [PATCH v11 12/15] isofs: Implement fileattr_get for case
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
X-Rspamd-Queue-Id: 653F9464898
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:roland.mainz@nrubsig.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:linux-nfs@vger.kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[manguebit.org,sony.com,kernel.org,nrubsig.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
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
	HAS_REPLYTO(0.00)[cel@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:mid,oracle.com:email,nrubsig.org:email]

From: Chuck Lever <chuck.lever@oracle.com>

Upper layers such as NFSD need a way to query whether a
filesystem handles filenames in a case-sensitive manner so
they can provide correct semantics to remote clients. Without
this information, NFS exports of ISO 9660 filesystems cannot
advertise their filename case behavior.

Implement isofs_fileattr_get() to report ISO 9660 case handling
behavior via the FS_XFLAG_CASEFOLD flag. The 'check=r' (relaxed)
mount option enables case-insensitive lookups, and this setting
determines the value reported. By default, Joliet extensions
operate in relaxed mode while plain ISO 9660 uses strict
(case-sensitive) mode. All ISO 9660 variants are case-preserving,
meaning filenames are stored exactly as they appear on the disc.

Case handling is a superblock-wide property, so the callback
must report the same value for every inode type. Regular files
previously had no inode_operations; introduce
isofs_file_inode_operations to carry the callback. Symlinks
previously shared page_symlink_inode_operations; introduce
isofs_symlink_inode_operations, which wires page_get_link
alongside the callback, so that fileattr queries on a symlink
reach the isofs implementation instead of returning
-ENOIOCTLCMD. The flag is set in both fa->fsx_xflags and
fa->flags so FS_IOC_FSGETXATTR and FS_IOC_GETFLAGS agree.

Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Roland Mainz <roland.mainz@nrubsig.org>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/isofs/dir.c   | 24 ++++++++++++++++++++++++
 fs/isofs/inode.c |  3 ++-
 fs/isofs/isofs.h |  5 +++++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/fs/isofs/dir.c b/fs/isofs/dir.c
index 2fd9948d606e..1db6b0db3808 100644
--- a/fs/isofs/dir.c
+++ b/fs/isofs/dir.c
@@ -14,6 +14,7 @@
 #include <linux/gfp.h>
 #include <linux/filelock.h>
 #include "isofs.h"
+#include <linux/fileattr.h>
 
 int isofs_name_translate(struct iso_directory_record *de, char *new, struct inode *inode)
 {
@@ -267,6 +268,17 @@ static int isofs_readdir(struct file *file, struct dir_context *ctx)
 	return result;
 }
 
+int isofs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
+{
+	struct isofs_sb_info *sbi = ISOFS_SB(dentry->d_sb);
+
+	if (sbi->s_check == 'r') {
+		fa->fsx_xflags |= FS_XFLAG_CASEFOLD;
+		fa->flags |= FS_CASEFOLD_FL;
+	}
+	return 0;
+}
+
 const struct file_operations isofs_dir_operations =
 {
 	.llseek = generic_file_llseek,
@@ -281,6 +293,18 @@ const struct file_operations isofs_dir_operations =
 const struct inode_operations isofs_dir_inode_operations =
 {
 	.lookup = isofs_lookup,
+	.fileattr_get = isofs_fileattr_get,
+};
+
+const struct inode_operations isofs_file_inode_operations =
+{
+	.fileattr_get = isofs_fileattr_get,
+};
+
+const struct inode_operations isofs_symlink_inode_operations =
+{
+	.get_link = page_get_link,
+	.fileattr_get = isofs_fileattr_get,
 };
 
 
diff --git a/fs/isofs/inode.c b/fs/isofs/inode.c
index efee53717f1c..68c286b7cc35 100644
--- a/fs/isofs/inode.c
+++ b/fs/isofs/inode.c
@@ -1427,6 +1427,7 @@ static int isofs_read_inode(struct inode *inode, int relocated)
 
 	/* Install the inode operations vector */
 	if (S_ISREG(inode->i_mode)) {
+		inode->i_op = &isofs_file_inode_operations;
 		inode->i_fop = &generic_ro_fops;
 		switch (ei->i_file_format) {
 #ifdef CONFIG_ZISOFS
@@ -1442,7 +1443,7 @@ static int isofs_read_inode(struct inode *inode, int relocated)
 		inode->i_op = &isofs_dir_inode_operations;
 		inode->i_fop = &isofs_dir_operations;
 	} else if (S_ISLNK(inode->i_mode)) {
-		inode->i_op = &page_symlink_inode_operations;
+		inode->i_op = &isofs_symlink_inode_operations;
 		inode_nohighmem(inode);
 		inode->i_data.a_ops = &isofs_symlink_aops;
 	} else if (S_ISCHR(inode->i_mode) || S_ISBLK(inode->i_mode) ||
diff --git a/fs/isofs/isofs.h b/fs/isofs/isofs.h
index 506555837533..a3cda3430020 100644
--- a/fs/isofs/isofs.h
+++ b/fs/isofs/isofs.h
@@ -197,7 +197,12 @@ isofs_normalize_block_and_offset(struct iso_directory_record* de,
 	}
 }
 
+struct file_kattr;
+int isofs_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
+
 extern const struct inode_operations isofs_dir_inode_operations;
+extern const struct inode_operations isofs_file_inode_operations;
+extern const struct inode_operations isofs_symlink_inode_operations;
 extern const struct file_operations isofs_dir_operations;
 extern const struct address_space_operations isofs_symlink_aops;
 extern const struct export_operations isofs_export_ops;

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

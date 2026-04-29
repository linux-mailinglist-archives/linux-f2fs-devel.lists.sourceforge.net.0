Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPdrHQBJ8mnDpQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2026 20:08:00 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E93294989D7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2026 20:07:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYIxfse7nBbPnf+GPaVmEpIo39we5icR35gMwhK2/8M=; b=ShUPiRMU7XJJdUknJuigol4HWY
	R3BUEszzd/8CBpdd0FC+OzQhIeLNGHtIN6BK0yNA0fmjuYOL1816UMEEHKqplJVHz3JAqvYEp6ao+
	up7VSXw2sn08TaflaN1GVaKq5Mm9JkN1gzORjcBimO4s+gpanifV0h5t+FublOxErlow=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wI9KL-0007Ua-38;
	Wed, 29 Apr 2026 18:07:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wI9KJ-0007UR-5V
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Apr 2026 18:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VhvxauimFK5NAhqFYc67ug8slC/9/uxvMYlNbME097o=; b=jVjo9NmXI1FplVEOVCl0AHC6Ro
 IxLAqtdNlVmas3jvPZMV5LgI6/zpKJ3LjcgLWlPqQuNntPFOGyqDDRtBsvciEhNI4YHnkq7gJBxP4
 4XjEg+E5cyfa4XCpmyg7RX7OXrVrXWxwTHwHEdbhO5KeBGYiZlJxI6ELiF3+j+K2oTAE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VhvxauimFK5NAhqFYc67ug8slC/9/uxvMYlNbME097o=; b=CoaX3jjcLi0GzLToestQwBFN1Y
 wRvJwuL44z6RFFrvEA/D/wO8y1J5aFz7lRUHNQX0EsWxk/e1KL5sr4RNFNVvxnaIQPuIiaPjmjkLF
 YJEm1KtL+y9Nnl8niajqRwtSaVKE/HRhkgNXufre2Sv4VyN9pvR7hDhCBn5TUFw2fx0k=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wI9KG-000157-5U for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Apr 2026 18:07:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DA6C94454D;
 Wed, 29 Apr 2026 18:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80CF2C2BCF6;
 Wed, 29 Apr 2026 18:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777486065;
 bh=MCKLEZC7Qx1FnQ0cZy8w8gaJqor/Oy2yvhPP57H1cWo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=c2vqU1+DIgO1ouuDvKAm9SaitSoOX/+UnmaoqiRd2TpFdxO43KFDX+GyhO0QQB+p9
 I1DO7IuT5fkPmJRz0mqf/qAX0FXwEFkYFPlpGQzvZICgK/9lp0JirZYrKzXi65qzU+
 tJXK5qmPsBqJyvoI95WxV2PWF1AGmOqdsyhU90sh2zsOQ6SUuiAOsbRmYTz7aEKURg
 9pYuFXOJle8/Ln8V+hJKEpnIe5PBhKdQYfKo5jAYPfv/qsPd0TBns7AQyouVSycHMu
 2Mvj+mK0HAGWGYd+4iRmb1EimiKagrBVCZJiXz43qFu7w8M8H7uIkKcIuW68etct2t
 f7NHQ9ynk1vfQ==
Date: Wed, 29 Apr 2026 14:07:18 -0400
MIME-Version: 1.0
Message-Id: <20260429-case-sensitivity-v12-7-8057123bebe0@oracle.com>
References: <20260429-case-sensitivity-v12-0-8057123bebe0@oracle.com>
In-Reply-To: <20260429-case-sensitivity-v12-0-8057123bebe0@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2621;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=yr1QdNRA2c3h2NX2KtSKVIgsso0huI4pF/+aMWQ1VYs=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp8kjd//ugpCe7RL1EFdZg6sAR5attDISWJ2/Tn
 /1es/HNDSKJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCafJI3QAKCRAzarMzb2Z/
 l154D/9sRJhZpYvAf/Om/gyeeuNnLwAQO4y4xNSbS+uEm4PDRZFhge2kGJ+SMta5gU0M03jOjnO
 3ZcxFkqNMtVwAy/r53i4MW8p2Onx16VAHPmElEk1k/g9nlfux7Yl6rWG1kPGaDIx0aBlqxnFQs2
 cvYj9veBZOCDu0wsRSNg8WddAJyvQqj/ZJE+eh1/k/b7kbrURHTRHN6PzuYAmZmExXiMQWdlIXe
 NKBwHjr+hLLT/1UBwzh858oV4uFb6+Qk4Fb1xTNKJG2LDc4bi7R6Z5P2VBoOnbj6wuSWZ2cjgnF
 H/TJOgzycFT4QJ9in+k2NxRdcSMJmNljc/Ut+JL25EFKxMSxOEOvvFsiBtAilV5EfJZTyA0EL0/
 9SvMmy9vQ/I69CPIjf3HmoDgB3kvq/L68iMy4iSDqxFgedBXmo4dtAPEBzTI2SbVDeDuWcqkdnE
 BYRE3z4ZzO6sBozJX2bTBM9rmpzZcpR0Hbw33t4cPGwxOL7WFogGOGHjSYR949N1SGi/TcBz6hv
 Nm9f9fngHfqrBgyoTp6O9qSlWM7boe7iTy13sBBMxhZ6RJ6l21/Mv6a5PmOuOP7sHg/pbBhfbb0
 BwAbhYVp4MgRdNYar+AUg7hDroNpOGETgdAYbXqHhAN2YuoX2DZl+XxTHlVOqTXfUb3y2rf399N
 ZU8mxwunytdSlnQ==
X-Developer-Key: i=chuck.lever@oracle.com; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chuck Lever <chuck.lever@oracle.com> Add case
 sensitivity
 reporting to the existing hfsplus_fileattr_get() function via the
 FS_XFLAG_CASEFOLD
 flag. HFS+ always preserves case at rest. Case sensitivity depends on how
 the volume was formatted: HFSX volumes may be either case-sensitive or
 case-insensitive, 
 indicated by the HFSPLUS_SB_CASEFOLD superblock flag. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wI9KG-000157-5U
Subject: [f2fs-dev] [PATCH v12 07/15] hfsplus: Report case sensitivity in
 fileattr_get
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
X-Rspamd-Queue-Id: E93294989D7
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
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.851];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:mid,oracle.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,nrubsig.org:email,dubeyko.com:email]

From: Chuck Lever <chuck.lever@oracle.com>

Add case sensitivity reporting to the existing hfsplus_fileattr_get()
function via the FS_XFLAG_CASEFOLD flag. HFS+ always preserves case
at rest.

Case sensitivity depends on how the volume was formatted: HFSX
volumes may be either case-sensitive or case-insensitive, indicated
by the HFSPLUS_SB_CASEFOLD superblock flag.

FS_XFLAG_CASEFOLD is read-only: FS_XFLAG_RDONLY_MASK ensures
FS_IOC_FSSETXATTR strips it. The legacy FS_IOC_SETFLAGS path in
hfsplus_fileattr_set() also allows FS_CASEFOLD_FL through its
allowlist on case-insensitive volumes so that a chattr
read-modify-write cycle does not fail with EOPNOTSUPP.

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>
Reviewed-by: Roland Mainz <roland.mainz@nrubsig.org>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/hfsplus/inode.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
index d05891ec492e..5565c14b4bf6 100644
--- a/fs/hfsplus/inode.c
+++ b/fs/hfsplus/inode.c
@@ -740,6 +740,7 @@ int hfsplus_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 {
 	struct inode *inode = d_inode(dentry);
 	struct hfsplus_inode_info *hip = HFSPLUS_I(inode);
+	struct hfsplus_sb_info *sbi = HFSPLUS_SB(inode->i_sb);
 	unsigned int flags = 0;
 
 	if (inode->i_flags & S_IMMUTABLE)
@@ -748,6 +749,8 @@ int hfsplus_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 		flags |= FS_APPEND_FL;
 	if (hip->userflags & HFSPLUS_FLG_NODUMP)
 		flags |= FS_NODUMP_FL;
+	if (test_bit(HFSPLUS_SB_CASEFOLD, &sbi->flags))
+		flags |= FS_CASEFOLD_FL;
 
 	fileattr_fill_flags(fa, flags);
 
@@ -759,13 +762,24 @@ int hfsplus_fileattr_set(struct mnt_idmap *idmap,
 {
 	struct inode *inode = d_inode(dentry);
 	struct hfsplus_inode_info *hip = HFSPLUS_I(inode);
+	struct hfsplus_sb_info *sbi = HFSPLUS_SB(inode->i_sb);
+	unsigned int allowed = FS_IMMUTABLE_FL | FS_APPEND_FL | FS_NODUMP_FL;
 	unsigned int new_fl = 0;
 
 	if (fileattr_has_fsx(fa))
 		return -EOPNOTSUPP;
 
+	/*
+	 * FS_CASEFOLD_FL reflects HFSPLUS_SB_CASEFOLD, a mount-time
+	 * property. Accept it as a no-op so chattr's RMW round-trip
+	 * succeeds; reject any attempt to enable it on a volume that
+	 * was not formatted case-insensitive.
+	 */
+	if (test_bit(HFSPLUS_SB_CASEFOLD, &sbi->flags))
+		allowed |= FS_CASEFOLD_FL;
+
 	/* don't silently ignore unsupported ext2 flags */
-	if (fa->flags & ~(FS_IMMUTABLE_FL|FS_APPEND_FL|FS_NODUMP_FL))
+	if (fa->flags & ~allowed)
 		return -EOPNOTSUPP;
 
 	if (fa->flags & FS_IMMUTABLE_FL)

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

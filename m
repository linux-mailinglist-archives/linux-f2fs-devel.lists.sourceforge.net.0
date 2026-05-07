Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPV5D1BT/GlnOQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 07 May 2026 10:54:40 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC69D4E53D4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 07 May 2026 10:54:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYIxfse7nBbPnf+GPaVmEpIo39we5icR35gMwhK2/8M=; b=MoYhcPCKnSUo/eQN7JIZbaBO2S
	dIYtpOCypfImu333PuMMxCjDf8VqsAy3lOnOekLUW0dur52171S6/i2H4kTqApdOzGOCxqjtIWz5D
	yjydu9Fj9y220PzmlHcGUii0yYC12hq1tfv9t+9sEK8aPsX5O96i3SWNp4hAS1MxNcfQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wKuVA-0004Pu-Qr;
	Thu, 07 May 2026 08:54:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wKuV9-0004Oq-3F
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 May 2026 08:54:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VhvxauimFK5NAhqFYc67ug8slC/9/uxvMYlNbME097o=; b=N0leOIRnEcX2OOOV9KaVMByHCM
 Tiw1e9/bQcjVhSdZLodY+mHDSRbWDKawsHQWWxXhxK71fibA3Q/YixOrN2GCgi9zNe4TuOB49Wj3Q
 eYrZOdJIgp/joPkxjcMaUwMQcFs8Ftn1HjkC7jF0GRqdvqlfmrZN17W64MNenSCKUb58=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VhvxauimFK5NAhqFYc67ug8slC/9/uxvMYlNbME097o=; b=YwYZHhIYdkbGaMWfI2xi5mvVuO
 3I5XF6tO3ifhclZxc+86YF6kQeoPSvobgqWQOBitUzTp+yPqAuidMWJEs/tdxEu2oGIMO2oHoFBQa
 Cb1eag9GV5ez45K2vQbkoHhsUGYKsAtWTThcSLUvY8u0NgRE84JUGHfxAjXKh1rTwSsA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wKuUz-0002BU-Ic for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 May 2026 08:54:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 00A7F6024D;
 Thu,  7 May 2026 08:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B67C2BCB2;
 Thu,  7 May 2026 08:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778144054;
 bh=MCKLEZC7Qx1FnQ0cZy8w8gaJqor/Oy2yvhPP57H1cWo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JbBPMCPbvUWq/AZqNxKvw1CuQSSQUHimTJHyidbRuyHm7mNYOnBx/8TOo7rFB1sGo
 8F6f7vAmzCP4vwvjMUXTtYKI+nfg/IVKWdlpK8FETxcnFX+hzT74qocmDOV7pbwzRB
 QL5RLNzJRaQRKUKlRQr+SqRQ/p4mVUZkJbLe4yCQukGLfxiJu5x2rRCDq1b9SrNiqK
 T6nOCWC2aZ2yHC6STir5iXWcoaIcY0lErPZy4ICvGusxTsqnEXFIvBA8vhH7+C6rko
 6mlbrMFSvTJB/Q8r62FNMmTIEfOsugaBVLIm1aTn44BMJDvo4r/jnazCAaXDxQCoAm
 trYKTMWx+GtrA==
Date: Thu, 07 May 2026 04:53:00 -0400
MIME-Version: 1.0
Message-Id: <20260507-case-sensitivity-v14-7-e62cc8200435@oracle.com>
References: <20260507-case-sensitivity-v14-0-e62cc8200435@oracle.com>
In-Reply-To: <20260507-case-sensitivity-v14-0-e62cc8200435@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2621;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=yr1QdNRA2c3h2NX2KtSKVIgsso0huI4pF/+aMWQ1VYs=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp/FL1Sam2U6J6T59urOY+86EqRZVFFjEoduGtM
 uf7IC1GQ72JAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCafxS9QAKCRAzarMzb2Z/
 l5GyEACg2sRkHeSvck4ZjxMkPio+UqMmRR5OiaW9/jiwt59VHMhPD6sENsxwjXhcbRCFnj82KrO
 2jqV/aesyDWk6k6VqQa+RA5CCZFYh8fhMrCD+dSzO7MmuTK+qtU5dd6iuSsFBh/yS+WmT9nATMl
 x/kMmQk+pYp7XIc7uGMjSQiedqk59+P1JJx/fS1UBZDnj12YJDrCVeeQMFbCHwvH05l0AaFpNOR
 mN46wI6rx9s9DPdie38+NNRopiHB7wraDHnNvu0655Hky1P+VlPxOI02wPLKdwgkyDaqY3lunUM
 h7e6AF+3is/p1mrEzY8YISbb3Cx+80MVTlHACehQGEqwB9oPGnOdG14tWrg5i/7wvQooLl/PG/F
 6YVNvk6K0ACFmYCi2yLajipMA3ybQhCe69V7YoHGtD1hAK+W5pjdjbcIY8fjgKAt/5ILxCR6hjx
 O9Trom0rs4ZlEmdgoKPS31REkntgOGMmaqxNvB8NL/jhQvEhpGHYxgTPl8gf+3G9ZzzqJem6QjF
 HzKVQbMBOV58d2OrPKmRKYaDGZTnlc8DXXYpDmIgub4d8946l/U9i5iQvnaKGGE63izZXXxbdYa
 mLx8jx5/imR1h/R6jUKv2iZfwMtzOJ0sLPD1i9IuhmICRuT3eQaj9QrrZqLvVmOZbuOgVJBanBz
 ppoitklVcRCApaA==
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wKuUz-0002BU-Ic
Subject: [f2fs-dev] [PATCH v14 07/15] hfsplus: Report case sensitivity in
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
X-Rspamd-Queue-Id: AC69D4E53D4
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

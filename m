Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFHsH7ce7GmpUgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Apr 2026 03:53:59 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C78046489F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Apr 2026 03:53:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfuXSLjRZLGT8N7M2g4TfwNchohyU+FbpA5bZ6Ds0Tg=; b=lCZ2Im+EDwk/m8oWtIZnPAS6lh
	bIqEPR9xyk/2+RO0bt9xkYm9ykmvEInBqRIZ+5cHdLRa4vtrECaVVdmxDuOmk1ddtYqvFgF8kVM0h
	lSvfGF3l64oz3KavQt198BD5QlGuS7jjpxab1Cc4pYui7RxT/gymQsJZ+z1FLA0fPaG4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wGSDU-0007LE-W5;
	Sat, 25 Apr 2026 01:53:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wGSDS-0007Ka-Uu
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Apr 2026 01:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GXissqW8iybfobuQl29f5mWxEh7d3V2a3e4uJOLCuFg=; b=JO8PYbaUMgcrYKKfO1yBJeFl1A
 Vlbt93rK2foiVkNyjl4MOxqS9qQFTVBdDH7EZl4ApNu0R7T5Nz7iaWn92Qi63d6iAag45O1Bq1AsG
 AC54d4Hw+hpiqzV8JCWUzM2iggWlExWdLdo0uWRRUGZTB8KvT6LluvJa/ymA+pAb95XY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GXissqW8iybfobuQl29f5mWxEh7d3V2a3e4uJOLCuFg=; b=nFLQDo8mcExm5Zt1eS6vdO0KGS
 eq96ZIFPKPtv8wsTjoUFYELR0QBtDbhYsd28fGZ1iI36GXru1zbeDYQfIfGRWcq3WaCGbI1gB8rOY
 jHhvtegoKGbWr37hRaN/rpwcBuicaWpM1TGr/jx1BtiZCa27Mnpeu3S4NRQnSSGzITB0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wGSDS-00031W-Ps for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Apr 2026 01:53:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 36BFC600AE;
 Sat, 25 Apr 2026 01:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6F5C2BCB5;
 Sat, 25 Apr 2026 01:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777082023;
 bh=McAV5CNKh/R32ZPI5KLOc1CCIaEWTg3RbqF39WjLumM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Gcm3B2fYKLJtxa8hvELCu3SPnsWf6ztbABIOOGN9y6Q6Mku3H8vvUvPhEe26cC0Xw
 Z002rynAe/XRvkHF6aP2PopMkXjR1Wv8hB2mh6JLJsSR79pPLWRTAOMKe2YvL881/L
 DmHEgCb/DsCfl+V0jk6cYaIteSqEVJU4kF3Avj/Zni2y25qscJdjf21rAVhB8QhduI
 /WwnIVSD9wmACx2XTUi9Hh6m9KM0iFVtwJKLVypZRpLTk+3lkzTWImU8w84g3bPc9U
 YqGL0G2wfLBfhf5pTsvQ6DW6aFBKMHH/I07H+7OagTcG7RXH4xVokcYcNmR8isboPy
 mbCvXANhw3pNg==
Date: Fri, 24 Apr 2026 21:53:10 -0400
MIME-Version: 1.0
Message-Id: <20260424-case-sensitivity-v11-8-de5619beddaf@oracle.com>
References: <20260424-case-sensitivity-v11-0-de5619beddaf@oracle.com>
In-Reply-To: <20260424-case-sensitivity-v11-0-de5619beddaf@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1864;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=RS1NIQW3n5GlbUoKY0pTlmEy0aDu/j9sxZEq/mBzFA4=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp7B6Q6D91o7/MLr7c2zWRs0GCu5gLIEhcOjU7/
 rK0Gf8Oh5yJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCaewekAAKCRAzarMzb2Z/
 l8bkD/kBBqZqXFav38eelQEr/+UzlNvGTeUgVS9X9STU3qv7LpwYVCdXGB8WzzwRr+7Hej9CSTn
 n3jk3qIq5wnKC0c40tNfYadmvQFA9JxWuDuFZe1zukJqTWXuGZ6+Z+Am6LGRRiPOxizUW1C3mJe
 OMYX87ic2p16Ub9McqmRxFhUXXDSfrQtZYiFvm/IBYndrmQNc91C15mMWfM0FvxBosF9lQt+SfK
 3rx4OKRyhtqfqVSED49uc8TSe1ceKHlRJuQdOax3jXSX0jIjPiKB02bF+8uFsB2MtTrn76sMrpD
 jpBv5PdU+/DA2VQyx8u+90lalhH1I99St6XCRyyiCG8VVXO92gaSxMPoN5rO6MxcNre/Hrfb81z
 4wVJncFAXaEbuqWIxo6cMy9og3iNDX8AUddTyemP4Bb6dfBTReddetmqXf7AIf9zzsJGRZU45gz
 GJ84LZLdGAdo9f98rvuXGR8flp4XYcf31g76Z91wIak9nbliy3sPpYJTnmEamYVIT05SK9rXpS0
 wKoSUIjSWxURSsKX8gqaWLjx2LhU8fQGEqqO0j4u3y4cUSD5CcfMgtIvJVTTN33tpa95F5Dm3x5
 A1z+nafZOiH7XEptWSI4JDpBsozEa2cexJwB/fbN1SYaLj7g3Dj67cuNaWO7HFXSGn/GgwKy6PA
 jpxvjWyTsmCFx7w==
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
 as NFSD need to query whether a filesystem is case-sensitive. Add
 FS_XFLAG_CASEFOLD
 to xfs_ip2xflags() when the filesystem is formatted with the ASCIICI feature
 flag. This serves bot [...] 
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
X-Headers-End: 1wGSDS-00031W-Ps
Subject: [f2fs-dev] [PATCH v11 08/15] xfs: Report case sensitivity in
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
X-Rspamd-Queue-Id: 1C78046489F
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

Upper layers such as NFSD need to query whether a filesystem
is case-sensitive. Add FS_XFLAG_CASEFOLD to xfs_ip2xflags()
when the filesystem is formatted with the ASCIICI feature
flag. This serves both FS_IOC_FSGETXATTR (via xfs_fill_fsxattr() in
xfs_fileattr_get()) and XFS_IOC_BULKSTAT (which populates bs_xflags
directly from xfs_ip2xflags()), so bulkstat consumers and per-inode
queries see a consistent view of the filesystem's case-folding
behavior.

XFS always preserves case. XFS is case-sensitive by default, but
supports ASCII case-insensitive lookups when formatted with the
ASCIICI feature flag.

Reviewed-by: Roland Mainz <roland.mainz@nrubsig.org>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/xfs/libxfs/xfs_inode_util.c | 2 ++
 fs/xfs/xfs_ioctl.c             | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/fs/xfs/libxfs/xfs_inode_util.c b/fs/xfs/libxfs/xfs_inode_util.c
index 551fa51befb6..82be54b6f8d3 100644
--- a/fs/xfs/libxfs/xfs_inode_util.c
+++ b/fs/xfs/libxfs/xfs_inode_util.c
@@ -130,6 +130,8 @@ xfs_ip2xflags(
 
 	if (xfs_inode_has_attr_fork(ip))
 		flags |= FS_XFLAG_HASATTR;
+	if (xfs_has_asciici(ip->i_mount))
+		flags |= FS_XFLAG_CASEFOLD;
 	return flags;
 }
 
diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index ed9b4846c05f..5a58fb0bad2b 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -472,6 +472,13 @@ xfs_fill_fsxattr(
 
 	fileattr_fill_xflags(fa, xfs_ip2xflags(ip));
 
+	/*
+	 * FS_XFLAG_CASEFOLD is read-only; hide it from the legacy
+	 * flags view so chattr's RMW cycle does not pass it back to
+	 * xfs_fileattr_set().
+	 */
+	fa->flags &= ~FS_CASEFOLD_FL;
+
 	if (ip->i_diflags & XFS_DIFLAG_EXTSIZE) {
 		fa->fsx_extsize = XFS_FSB_TO_B(mp, ip->i_extsize);
 	} else if (ip->i_diflags & XFS_DIFLAG_EXTSZINHERIT) {

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

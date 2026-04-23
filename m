Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOYWD+Ia6mlyuQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 15:13:06 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 909ED45291B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 15:13:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrfwgtO23JKKUmb3c7r5RK5Q1vCobt3/mlHWUjhCl28=; b=ahQ2oiN/KnynmfFEECeEIsw8qS
	EhXBnPB9iOFYL5iZVB4Xp+m6KVjfkBNvwvHqCw0ZLY59qQQPU2fbYM5Qc7xeCfkCKBN3rTfeG0zGB
	SwTz4uQ18A/OpitIyK/jYe3eNMpa9r4Ut0vCAIsI56R1NJeXhBwXNz/J3/ntzWZUSRys=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFtrX-0002fN-9g;
	Thu, 23 Apr 2026 13:12:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wFtrV-0002fE-58
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Apr 2026 13:12:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7v+otcaBL2NbxAVbHrGKVdmX0qwZr0j/RiEQngkqNZ0=; b=Bl1EmueOjCg3bUIGfAwbO11XQZ
 ZeZDpa0SVRQ2Se3s2K3iFo9mLJSilOKaH9pCqPyZDp9YEVo/kdOvxNtVJwRdtCdqqCthfycs1TZTF
 MU0DQOrs3aIMRG2aRtDtDyIkEKIRCBQTqYUYl252ojWYmFw/mUeBgPlgzbry2+WjgkQ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7v+otcaBL2NbxAVbHrGKVdmX0qwZr0j/RiEQngkqNZ0=; b=gNFNK/SxUgkwetVprfoSUOfkwa
 X3FyLA9NpnhtdDzm8H9yutMY1h9jJJ6JGcHg7EAS+ynds/7gID/x1a0LPCdSQXKEF8z5w54mqcGSV
 Hiv/IYzX3QHdrhphgqtyqXWk1dcelcRwY3kPpGpJALPvzoOiyHp0r/Mv+dyJy/KmGgQE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFtrQ-0006oz-Oh for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Apr 2026 13:12:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 71BA4438AC;
 Thu, 23 Apr 2026 13:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3111DC2BCB4;
 Thu, 23 Apr 2026 13:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776949962;
 bh=jXYqYekRjpF07wlPDKgx2XWDNqQtTHKbLiod79qFffg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=XC3zMZ8GXEPAPGuVPkpcEGJW/IWUfO9lT5X+da8jeEzG30DrtLhAa90rUVt9Gnx3h
 Yh7AnsqQoxVGIIhqTnnZbWpcjwN3ItAVSTFp8tiMrIJUWfD4R9OStiy0ZNAyId4XMw
 d2Z2L5hccCmf7zAV3nqUUdvoQprKmbcKdlOAgW40hdZuQX5OaPfH+A6rab0OZGvDox
 aDv0P/ZQd9E8C+/Pwl8FA05S6P2NtFlWHsLB8dFv7bB7fMTkseIbph+4Tjrtxq6euV
 wCsCmNbnex9K3PvwvS3S8q9VkGxuvMVnUOLmsezHOVvd1EDzUUpalew7yOLN8BACBt
 IegZt8Hz3IuLA==
Date: Thu, 23 Apr 2026 09:12:11 -0400
MIME-Version: 1.0
Message-Id: <20260423-case-sensitivity-v10-8-c385d674a6cf@oracle.com>
References: <20260423-case-sensitivity-v10-0-c385d674a6cf@oracle.com>
In-Reply-To: <20260423-case-sensitivity-v10-0-c385d674a6cf@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=TxMd9+19zfe1kcd7z7IWDwky99GfiXSk/tT0Rl2ZM5c=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp6hq01cfRhNAJt0xx2EbnMwGvHTygaBYN6aRTE
 GINZfCUwkSJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCaeoatAAKCRAzarMzb2Z/
 l+4aD/9AIIDkYsuxGwkaHb0alyjM31f5P4xoH9QnzDFp8NL/UVKvxCdSvFeMeyBHwVa7Fy9ruea
 zMwrMXaFVq2XZWeNySOA0xiFd4HT0xd854+HjYrlIEdnnKtj5zrn3FrAvE3n7mSq5YxhGF9pwhw
 5RavDMmtW/5nOr3HYz1Gp7xrk3hPZOJ2uPXpSOVw9GMxNiotmNg0ZDwjDxSEMkM7+ScHLDGzMFR
 wLhw5l9Rs0mhNYWejSb2IQhDijmYO1Ym35ZiJjNu5ft4ChBGAuoxGL0m5/f8650C7D2PP+Uet9i
 r4Q+ALt7QWYX3HAPWpT2pMx8cFGUD25yODaeNdLKH5AiBlu8KtHiArKHxGo6nIDcxzr5RYhvmYp
 w5CIQChTJ12zqUt2vNfuYzcuNFQxah0Oy3lAmGkW7ZL+juq6mxvkPTy8PJDQvH8wLKBlWDHCpul
 7a2TrzylW2pvpGiW96qRr6ZMwLsQLoWdZl+m5tbuBxniV9qHk/2Qw6yE/bwTx0MySJpVkZZgnZ4
 ty+BBTmKui8m5aOah8Uf621+mouo4Ve7WFdy1i4zWhVUDQgbHt5cn182HB0L7hN8xQrYTHqTyM2
 OKrOHQ/XIP5hQ1O6r2WRIOscUUUEfDJNxwOPDa/Lunw+phN71xW9DR540IhKBRXhREigJfqA7wH
 jFNwOPn3bVc/EfQ==
X-Developer-Key: i=chuck.lever@oracle.com; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chuck Lever <chuck.lever@oracle.com> Report ext4's case
 sensitivity behavior via the FS_XFLAG_CASEFOLD flag. ext4 always preserves
 case at rest. Case sensitivity is a per-directory setting in ext4. If the
 queried inode is a casefolded directory, report case-insensitive; otherwise
 report case-sensitive (standard POSIX behavior). 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wFtrQ-0006oz-Oh
Subject: [f2fs-dev] [PATCH v10 08/17] ext4: Report case sensitivity in
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
X-Spamd-Result: default: False [-6.71 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[manguebit.org,sony.com,kernel.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCPT_COUNT_TWELVE(0.00)[31];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:linux-nfs@vger.kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MAILSPIKE_FAIL(0.00)[216.105.38.7:query timed out];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[cel@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:mid,oracle.com:email]
X-Rspamd-Queue-Id: 909ED45291B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Chuck Lever <chuck.lever@oracle.com>

Report ext4's case sensitivity behavior via the FS_XFLAG_CASEFOLD
flag. ext4 always preserves case at rest.

Case sensitivity is a per-directory setting in ext4. If the queried
inode is a casefolded directory, report case-insensitive; otherwise
report case-sensitive (standard POSIX behavior).

Reviewed-by: Jan Kara <jack@suse.cz>
Acked-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/ext4/ioctl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index 1d0c3d4bdf47..d1d597a13eeb 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -999,6 +999,13 @@ int ext4_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	if (ext4_has_feature_project(inode->i_sb))
 		fa->fsx_projid = from_kprojid(&init_user_ns, ei->i_projid);
 
+	/*
+	 * Case folding is a directory attribute in ext4. Set FS_XFLAG_CASEFOLD
+	 * for directories with the casefold attribute; all other inodes use
+	 * standard case-sensitive semantics.
+	 */
+	if (IS_CASEFOLDED(inode))
+		fa->fsx_xflags |= FS_XFLAG_CASEFOLD;
 	return 0;
 }
 

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

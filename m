Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIreKLQe7GmpUgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Apr 2026 03:53:56 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BBE46487B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Apr 2026 03:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZig6TnBBMDvHECPPdBuk37JF1pQW4+07rwUOu/av6U=; b=nKH1HBnuogs935TZ0MhJ6NYiE3
	MBBp9iXtpPtCeqxQZ7CQATdh5hGbwpnrxV1UC1sW+QpPhNjWwaFlQtxXLd120fhdsBM8fnQX32c0J
	Zy2eIYLCVd5vzFGdEh/d+1CBbmJVaRm6m2+yRfeqB7ZN0Xw6b97RNWLerdqCFBuPW/s4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wGSDS-0003Vq-Tz;
	Sat, 25 Apr 2026 01:53:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wGSDR-0003Ve-2Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Apr 2026 01:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BrUQPqY8D2+RW8hpDh11q4lIXM0/Bl6gbPsIgJSJlco=; b=L27Cs6baTHYZFvxtHqUau+iTGW
 NWWdlvus+Vr1io5t7ARr90hNN38qtkCRQTO5HEx4Nk6ha78bi5kbnstzCDLayVd0xwPF+K5DdLLJp
 3eQnUreWivVESQquGQhKYuJgwot1/iQ5/8pLYkK6mfYBMEjlrPgqKFjT4JiqJmqebUfc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BrUQPqY8D2+RW8hpDh11q4lIXM0/Bl6gbPsIgJSJlco=; b=i0xRyaSg0A5QG/RO4i943KHxot
 Y1POc+1FzAQ+pzAvhRl0wgDLxS3QdFNAUdLWrrRDzcP9ghv0Bt6RDA8uRkslbdVqetI8rpa601Lu4
 v0E9FqZ3yrPjynTG4pPjY6p3wr2WEM6RXiJXuo6FFvEZJvmX57kxaJyRxugtmULL9ow0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wGSDQ-00031E-9I for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Apr 2026 01:53:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AEC9960123;
 Sat, 25 Apr 2026 01:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC06C2BCB6;
 Sat, 25 Apr 2026 01:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777082021;
 bh=oRDGC96aXLrYGoaLGWDMb1hUHb5uY4mVyf16uiV2qPs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=oFIOSmTU2nhLm7K9+JpqJ9d5kWh4Uf7fpNodaD6YWmjrJ4yyGvopEvJViPasI0nmQ
 VK8NZq+CThLHyQdjaq79rzmS56kUemS4V1peJSEVtKktXl/6+3XAFMuYj6d0lHYph8
 kafByR1dboAtJWBjbq8iyRdxQyf6N19kuRjythCLSoRc4TTWOpV64mGE6F7Waeisxi
 G/K854a0Exs9tEfTOWqY+M1QQuz5fS/2X9hCOC4Wvm0/HJQDb4yDheDPLnoxUDY+yl
 LUs0NeatZhbKlgF568h5vyfnZuen2p9Mq0zwV7osGoA59hCN1Aho6GiV7cizMAaAhc
 xS9nLQB+Mlisw==
Date: Fri, 24 Apr 2026 21:53:09 -0400
MIME-Version: 1.0
Message-Id: <20260424-case-sensitivity-v11-7-de5619beddaf@oracle.com>
References: <20260424-case-sensitivity-v11-0-de5619beddaf@oracle.com>
In-Reply-To: <20260424-case-sensitivity-v11-0-de5619beddaf@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=GH3KwkswOpLheXLhG9bp+y8vR50klKh2XxRFWosaGQw=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp7B6QNmj81GM08BqfbJycnCt6uIXkx7PkUPmCT
 PsNKSwA0VmJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCaewekAAKCRAzarMzb2Z/
 l2PBD/wL9qDmPVh0AFBM5UbZyA8/ZailA6PaV0N5R1QyRq5wfKCOp7xkGRD6enKq24kxShCYkpL
 tm1OBWZBPH+lIUiuy+wWPySjdk1BsT0SrppjgXbnVMHzlsTKCPI4daviYHU5EBqEMSPznjqo2pb
 eBB/hFCjyWtk2K6VnDWu/RFxa89dniD1CgkbS4MZh2RgcGkDOBcZ325NEYCE1rg0J3g3vuiQbOF
 Izja/7zVl2L54lEOj/h+BLYPmOXT2T/pIMvcdMNHTcNtEtoMuPfNaOz+Fz01108trrpSH/djHgO
 HrncxA8pcsqiOM4fBOMDrCkPAEjmRQPy7fu2EWu1G/dMXUWYDE7GVJNy8BEAUXZhGDCl9HklwEA
 o+GBAO/7/SKRipZz5PR9oj6uIHQ2ROL23qpKs9jiMqxugb1olcdRth9aEoY7Wyc5fi1Nygj28MF
 0ILw4CdA/2Qq6jlUyKnv1BbWQpslm3T+u4np9UbPWvahRQTpvGFBqFBjzkyxjNjT8jPjnM+kexc
 mF5b/zImKIi/CitshFezOBSvm+MrrwSyvjeGbkmWIH6xfFXLnR6duJnJp8otkzl/s9UpStUkMa0
 JtnhL3Pk8E2UxPjf+oR0oXrb9xVifqi9sHOCMqHCtWUnbtlNoxZkWdr8tHKpY9X5dX8K0iPNEgu
 5Cf62172SzTHlFQ==
X-Developer-Key: i=chuck.lever@oracle.com; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wGSDQ-00031E-9I
Subject: [f2fs-dev] [PATCH v11 07/15] hfsplus: Report case sensitivity in
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
X-Rspamd-Queue-Id: 43BBE46487B
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

Add case sensitivity reporting to the existing hfsplus_fileattr_get()
function via the FS_XFLAG_CASEFOLD flag. HFS+ always preserves case
at rest.

Case sensitivity depends on how the volume was formatted: HFSX
volumes may be either case-sensitive or case-insensitive, indicated
by the HFSPLUS_SB_CASEFOLD superblock flag.

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>
Reviewed-by: Roland Mainz <roland.mainz@nrubsig.org>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/hfsplus/inode.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
index d05891ec492e..38b6eb659a79 100644
--- a/fs/hfsplus/inode.c
+++ b/fs/hfsplus/inode.c
@@ -740,6 +740,7 @@ int hfsplus_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 {
 	struct inode *inode = d_inode(dentry);
 	struct hfsplus_inode_info *hip = HFSPLUS_I(inode);
+	struct hfsplus_sb_info *sbi = HFSPLUS_SB(inode->i_sb);
 	unsigned int flags = 0;
 
 	if (inode->i_flags & S_IMMUTABLE)
@@ -751,6 +752,17 @@ int hfsplus_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 
 	fileattr_fill_flags(fa, flags);
 
+	/*
+	 * HFS+ always preserves case at rest. Standard HFS+ volumes
+	 * are case-insensitive; HFSX volumes may be either
+	 * case-sensitive or case-insensitive depending on how they
+	 * were formatted. HFSPLUS_SB_CASEFOLD is set in both
+	 * case-insensitive variants.
+	 */
+	if (test_bit(HFSPLUS_SB_CASEFOLD, &sbi->flags)) {
+		fa->fsx_xflags |= FS_XFLAG_CASEFOLD;
+		fa->flags |= FS_CASEFOLD_FL;
+	}
 	return 0;
 }
 

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

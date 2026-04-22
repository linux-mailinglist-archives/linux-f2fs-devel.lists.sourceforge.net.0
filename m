Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPcvIyxa6WkfYAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 01:30:52 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A1F44B962
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 01:30:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrfwgtO23JKKUmb3c7r5RK5Q1vCobt3/mlHWUjhCl28=; b=J2t/NbmOWnHpi72QyhEVRNT1e3
	FjMwYCwTO5StkjHmLAmbVQ2m8IpQMBVv+IDQrqj5raYgWal074oFKzlA/zD/4d3RfndgNsolSuCY6
	2lNM6+CUtBp3WQ6QX7nxmqyA/dNF7bW9ohH0s4MueBUTMuCu/cRESYmr2KTR+GE8vZXk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFh1t-00069E-R0;
	Wed, 22 Apr 2026 23:30:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wFh1r-00068U-0i
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Apr 2026 23:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7v+otcaBL2NbxAVbHrGKVdmX0qwZr0j/RiEQngkqNZ0=; b=MooSU4zAfxmkkfIqlTXYn75oqE
 4gM8bDmFvBhBNWbPzLGXpYyCt33kDZLbz2UYy+vpHz5Q2LnHb9/gu+LQmsxr5TdYq0eCysaS9DEpn
 k68o7CCsmm3ACLL8pQfkv8nkeM60oqWaJDKUdcC1PMHsJFj7Q+X4SJyI8/HGspupwTb0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7v+otcaBL2NbxAVbHrGKVdmX0qwZr0j/RiEQngkqNZ0=; b=c7j+/Aap3xQqxgpW5hQxzqBA2r
 cV6Ee9PV1hCnmeNuEs1I/EFLhg0Xn8j36LgDPM47hgdMTt6baVLz77Yw5jaBqt/9HVQvy1IB8Eojf
 Mui8xXXluc3eBG18dAErsUtHKWXWIs74x0ggb8PYKnSE05mE4ff49+6qaoizH6FWWHkI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFh1r-0006eB-4u for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Apr 2026 23:30:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8F0D861871;
 Wed, 22 Apr 2026 23:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA2DC2BCAF;
 Wed, 22 Apr 2026 23:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776900636;
 bh=jXYqYekRjpF07wlPDKgx2XWDNqQtTHKbLiod79qFffg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=usCmrLv+N705MyXz9QrB8eUi0cUHCIrvFrfNer91Gkil+ZqSe+Uv+mIqL5GktgtFe
 TjOetSwCQZv+swwRMS72YUTtt9dUGzzlgHD1ppcULa0xQs4RMgPyaJbjvzBZYhSnYq
 /wFPNefAUCoXjT2xQu7sMk8H5p6E0tyMmqLovYSHiVmrqxVxT9yZGftM7cBHo4NinI
 /nylz9us8rVzQ2+5u+EJ3ki6J7om5kmWngFJlndHlTasQhfiy2xaZ4ppFhoxGbQKG9
 AnANcz94N16eJCPW5f579E20MrlPSYW5hGmP3x2x8SrTK8kBfipy9A6ZLdvD9+Cq6D
 xtdDBTMwMl5Ng==
Date: Wed, 22 Apr 2026 19:30:02 -0400
MIME-Version: 1.0
Message-Id: <20260422-case-sensitivity-v9-8-be023cc070e2@oracle.com>
References: <20260422-case-sensitivity-v9-0-be023cc070e2@oracle.com>
In-Reply-To: <20260422-case-sensitivity-v9-0-be023cc070e2@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=TxMd9+19zfe1kcd7z7IWDwky99GfiXSk/tT0Rl2ZM5c=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp6VoFTp3fLxE8PITfxUL7bNrVobvHogZfU1OlZ
 pifqDEyrSWJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCaelaBQAKCRAzarMzb2Z/
 l5T9D/96IYMw2tXU48HaQ7/wBu/lmh6O/uthEswp4B3E8zUUOZxJEKKCesvcbZ/FPTIZrz6UIC7
 SFZNP4CtwF7mTNW0vhhKzFeM0BNnWfqxfW6TMHfeH2Qsx8RpFIupMQTFy+3vhwe7C8DtI4fdBQt
 KuYkZ8lkPr0G553naFj2d1hTsPGUmsJw5oZLcOcO578GvDJGDbuKZszGbjbOtsrI4Pp0nAdAzaN
 aJhTDHyvFq34U1NEJErK/floRT9eHqpvvjCO2lYLSmvH2Vu/B2C97+sm7As7hNg1piuL/Y3Looh
 N9J1JXeihuV4fSKG0jhE1apayyNxr5UYwqMvpBmP2psp44JYk0Ghf+72TLltpgiMXJu43PUqNs1
 0Sx46M+sQlhOQY9PJD7VM7cwFLTL1ClWHCmeRUeiA1BAocO1DKDqISuSJRwJbNd/bFbKFK4jaWs
 DDV4ki4Urn91xwjvCDNV6cp6h3btk9OSgzm1ZMtvNIQuDunB3G9KH3Kggi2/Nc3jdvjbIOgFOPA
 VvNZxBTTcP05GaxBa2Ux0CyTCpxRtJdgcrwxDLwl44HaCsMSHJ+YVL+/d3q3pk/fkEGDVGZ79rY
 H5465ibEnCmyFesdM/qK7r057UwKAfoqbRP9cDAYiYLgajXD2D+bJatDIgwaX3+ZENYSHC0cMmz
 jRnC0nP6nYek2bg==
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wFh1r-0006eB-4u
Subject: [f2fs-dev] [PATCH v9 08/17] ext4: Report case sensitivity in
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
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:linux-nfs@vger.kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[manguebit.org,sony.com,kernel.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,suse.cz:email,oracle.com:mid,oracle.com:email]
X-Rspamd-Queue-Id: E4A1F44B962
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

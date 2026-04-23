Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG2PC/Qa6mlyuQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 15:13:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A71F245295F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 15:13:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dRYlWyXIWRCtpz+qxoDpCAiDa/datr0IYQ8BNionSQ=; b=KRhYgVSp5RtyJs12dDArs8KU1t
	UrPAV8+vaTHpGCIm+14IWmM42LZfAKguk+uNcy709jR4YHWN0AymRdnJ8Fwk+U1YcXDwPamxOTtZw
	ur2zSbbwjFkdPBv5LYMg+MovVkNLEaCjPWU7GR4OY1oJFWhZBKcXnOddCs3stVEAaxRs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFtro-0003WZ-Jn;
	Thu, 23 Apr 2026 13:13:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wFtrn-0003W8-0C
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Apr 2026 13:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SOF0fH48UDwVxUJHkIYU+fJ1ki2adPeK3Me3pAwEEo8=; b=HhZ5dMXUGuiElkolNekdqNT+2n
 AKjGZt6q2qBy/37Cla8sOGnQWlYPQvFE9GNSHf8gZpARo8B3pXW/ZQnfqGidm4VMObde7L/A5ofZE
 twAweLwPrt1bHF6Zat2Ex7JXZAp47yR+/BKErzsN44mbgE6VOtKcJr7vGzm4DUMz00wc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SOF0fH48UDwVxUJHkIYU+fJ1ki2adPeK3Me3pAwEEo8=; b=YtweP39RGxPd5DWyZHQ/82dis4
 H+hEKBRJdrAfQ9My1gRpbd/OaR/w4QO266cmKW3MLM+2hhKv6u2Ddl/x4zofSvGQK884pHLryTwLN
 doy/YcrOT/wH/QzSUOY16zHnLTfD0puRL0R+bcIRWaHiKeRzBE6WzWvBJnKltVRp6x1M=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFtrm-0006rC-N4 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Apr 2026 13:13:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5E9AF4397B;
 Thu, 23 Apr 2026 13:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F73C4AF0B;
 Thu, 23 Apr 2026 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776949984;
 bh=UNo7HHcDIV7JWpD0f7CVGZkCuGE2I4nW5HuPOm8dnXs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=K4OLhQiL5q2gmBR6fMg7OQc8/AgWzGgE7c8lWakCv7FgQPstzhyPNpp5NVg8rSH5t
 mboZro4Y4RDogKy4pwOYTTBKrM1nSl9+T/ayjwK5XjqPBicW7it5FJsOONHrR9vTxJ
 Em4nM8x6k2v7UjnhrFFcU6nGFe5bpzMFO9Yv2iH5Dpjv9OQ0eAYvP12zCL5VShV54s
 MD1CiSWkCn5D5uE2yRw158f+KjfNGR6ZDQrcaMl9StikZc7kMsAlmk6gXyZp6scNMI
 iFwiMOsMVpSckv3ECa8Psgpi8yqngU7TcH0G6Y1+SeQ/6d/A1XCfyYIuIAkh/plDrG
 RKm2aYHMHvm+A==
Date: Thu, 23 Apr 2026 09:12:20 -0400
MIME-Version: 1.0
Message-Id: <20260423-case-sensitivity-v10-17-c385d674a6cf@oracle.com>
References: <20260423-case-sensitivity-v10-0-c385d674a6cf@oracle.com>
In-Reply-To: <20260423-case-sensitivity-v10-0-c385d674a6cf@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2582;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=/M15phZsxO4dYF/kfeaMD4laDtLmxamo65xsRXL/kkg=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp6hq0lrMRP/taRhAjVj2Nj34LkMZtiUQ1WGFUj
 5GhhBTIsAWJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCaeoatAAKCRAzarMzb2Z/
 l7+iD/9RTr4hntMPxhl7UX1Xa9+pHwyzL17Hm9T+TA6M+p7usu+ddsGl6douosfJVOewO3FyoUV
 kUkhZBoIos+DHr5mWvcU/p0Bmt6IvhCdDIg7EkUJHbOUd+a821W9CDt9NGNwLdWnHU7rJATocLP
 1IGEUvEUEm12ihgZPtNYLLOGf99q7H8f3fkR0RtAxSKaP3KkPkYO5IDkZJlqKdShfxbwU/l0IRD
 3yb59efObNpfct0TPF9BY3UR/YAGA97NsvtptvyitXjtb65xeeFKZVJN7GyAGSkvQ8YFAxiYYLt
 SshlPCE3GLBxxGmAQBgkH56S67IiXI1kxMrddESmsTOExvc0rzaVvm97m9wYoLvy+dmt+12UBJ4
 WUGXgh41TFpWIt1+RYtZ/WBboC0B5IhkSou7z6IlksVYl5G8q/9fUAoQBM79v0B0bNbzWXWfq0a
 WjPFYvD3qovj8sX7CcfPXlXnNU0L40gt+MNRbNGtZjppbWixbTv77TAGbn51rxVQnTfulBLoDpF
 4+VqzzCzM1XTKJCPYOETZ/yhXvjZZtNa5BQVaerGOMBIaCOC7yop2xyTiBOoMevYEA+qaoZzGqz
 9+XTxfknXthMElnBLQC5JLn6zz/IHiwZx5awniQHRHH18z8MiIXnIbCjfrj92Owq7tSiKzrCsNU
 V1E030k7effzOsA==
X-Developer-Key: i=chuck.lever@oracle.com; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chuck Lever <chuck.lever@oracle.com>
 FS_ATTRIBUTE_INFORMATION
 responses have always reported FILE_CASE_SENSITIVE_SEARCH and
 FILE_CASE_PRESERVED_NAMES
 unconditionally. Case-insensitive filesystems like exFAT, and casefolded
 directories on [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wFtrm-0006rC-N4
Subject: [f2fs-dev] [PATCH v10 17/17] ksmbd: Report filesystem case
 sensitivity via FS_ATTRIBUTE_INFORMATION
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
X-Rspamd-Queue-Id: A71F245295F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Chuck Lever <chuck.lever@oracle.com>

FS_ATTRIBUTE_INFORMATION responses have always reported
FILE_CASE_SENSITIVE_SEARCH and FILE_CASE_PRESERVED_NAMES
unconditionally. Case-insensitive filesystems like exFAT, and
casefolded directories on ext4 or f2fs, have no way to signal
their actual semantics to SMB clients.

Now that filesystems expose case behavior through ->fileattr_get,
query it via vfs_fileattr_get() and translate the FS_XFLAG_CASEFOLD
and FS_XFLAG_CASENONPRESERVING flags into the corresponding SMB
attributes. Filesystems without ->fileattr_get continue reporting
default POSIX behavior (case-sensitive, case-preserving).

SMB's FS_ATTRIBUTE_INFORMATION reports per-share attributes from
the share root, not per-file. Shares mixing casefold and
non-casefold directories report the root directory's behavior.

Acked-by: Namjae Jeon <linkinjeon@kernel.org>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/smb/server/smb2pdu.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index ee32e61b6d3c..05245562bcb8 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -14,6 +14,7 @@
 #include <linux/falloc.h>
 #include <linux/mount.h>
 #include <linux/filelock.h>
+#include <linux/fileattr.h>
 
 #include "glob.h"
 #include "smbfsctl.h"
@@ -5541,16 +5542,28 @@ static int smb2_get_info_filesystem(struct ksmbd_work *work,
 	case FS_ATTRIBUTE_INFORMATION:
 	{
 		FILE_SYSTEM_ATTRIBUTE_INFO *info;
+		struct file_kattr fa = {};
 		size_t sz;
+		u32 attrs;
+		int err;
 
 		info = (FILE_SYSTEM_ATTRIBUTE_INFO *)rsp->Buffer;
-		info->Attributes = cpu_to_le32(FILE_SUPPORTS_OBJECT_IDS |
-					       FILE_PERSISTENT_ACLS |
-					       FILE_UNICODE_ON_DISK |
-					       FILE_CASE_PRESERVED_NAMES |
-					       FILE_CASE_SENSITIVE_SEARCH |
-					       FILE_SUPPORTS_BLOCK_REFCOUNTING);
+		attrs = FILE_SUPPORTS_OBJECT_IDS |
+			FILE_PERSISTENT_ACLS |
+			FILE_UNICODE_ON_DISK |
+			FILE_SUPPORTS_BLOCK_REFCOUNTING;
 
+		err = vfs_fileattr_get(path.dentry, &fa);
+		if (err && err != -ENOIOCTLCMD && err != -ENOTTY) {
+			path_put(&path);
+			return err;
+		}
+		if (!(fa.fsx_xflags & FS_XFLAG_CASEFOLD))
+			attrs |= FILE_CASE_SENSITIVE_SEARCH;
+		if (!(fa.fsx_xflags & FS_XFLAG_CASENONPRESERVING))
+			attrs |= FILE_CASE_PRESERVED_NAMES;
+
+		info->Attributes = cpu_to_le32(attrs);
 		info->Attributes |= cpu_to_le32(server_conf.share_fake_fscaps);
 
 		if (test_share_config_flag(work->tcon->share_conf,

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

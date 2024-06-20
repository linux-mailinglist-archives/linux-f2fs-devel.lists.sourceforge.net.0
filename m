Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF7290FBBB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2024 05:43:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sK8hw-0006fh-5x;
	Thu, 20 Jun 2024 03:43:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youling.tang@linux.dev>) id 1sK8hn-0006fJ-Dg
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jun 2024 03:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U4hYVIA6yQ2MONsCKt5U/6Cm9Ie2DwTEa6j9RLjLJdo=; b=ihTXCDRnTxf5bmx7HbU7mXeaow
 b9xNFWRnkwMGseF8xWyCLZTTOk6TgOG6wbC3eul8al1WOanZIrm2JkcCVzc/pB6zxobMrc5bF80fF
 4Gk08TpSQ/vbdeK07YmzpkCdnW+qiaU1nD32tzsSKbB0aykAO6Jt0upGU7wqdNlHdPGw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=U4hYVIA6yQ2MONsCKt5U/6Cm9Ie2DwTEa6j9RLjLJdo=; b=Q
 mCRLdS4e7mvNLy2rmVR+GAZo+CAEb5blYl9qkmPrsLuw+1oHEKGOVN/oA5bR2hTmh3Cyms+W5PFQr
 TcG8MGQuSQ1HpWrmWiJZHS0Drlw0NCn2bU0VJ9TQMSXeE4B4UYx+J39v5skCZfk9ew1UtJ7hwHrQA
 CHlGZ/CeWSE/Q4og=;
Received: from out-176.mta0.migadu.com ([91.218.175.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sK8hm-0005ZS-2s for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jun 2024 03:43:23 +0000
X-Envelope-To: viro@zeniv.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1718853831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=U4hYVIA6yQ2MONsCKt5U/6Cm9Ie2DwTEa6j9RLjLJdo=;
 b=aO6OxvGeYfmnteld4qR4vHnaEEGayn2lxvfnyqniovj11v36kzQfepm/BgRH7Om9UggVDF
 fj+V5+9LdCLt/XqjCrk9qRdvZvcNFhpiL/JpvW4RUd0uOevUJVdSxrS2rcVdrp7aBlJplg
 LjDONSu94rKyMyNh0rkXJW3wrD8At38=
X-Envelope-To: brauner@kernel.org
X-Envelope-To: jaegeuk@kernel.org
X-Envelope-To: chao@kernel.org
X-Envelope-To: miklos@szeredi.hu
X-Envelope-To: jack@suse.cz
X-Envelope-To: linux-fsdevel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-f2fs-devel@lists.sourceforge.net
X-Envelope-To: youling.tang@linux.dev
X-Envelope-To: tangyouling@kylinos.cn
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Youling Tang <youling.tang@linux.dev>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 20 Jun 2024 11:23:33 +0800
Message-Id: <20240620032335.147136-1-youling.tang@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Youling Tang <tangyouling@kylinos.cn> Export
 in_group_or_capable()
 as a VFS helper function. Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
 --- fs/attr.c | 2 -- fs/inode.c | 1 + include/linux/fs.h | 2 ++ 3 files
 changed, 3 insertions(+), 2 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.dev]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.176 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.176 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sK8hm-0005ZS-2s
Subject: [f2fs-dev] [PATCH 1/3] fs: Export in_group_or_capable()
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
Cc: Youling Tang <tangyouling@kylinos.cn>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 youling.tang@linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Youling Tang <tangyouling@kylinos.cn>

Export in_group_or_capable() as a VFS helper function.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 fs/attr.c          | 2 --
 fs/inode.c         | 1 +
 include/linux/fs.h | 2 ++
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/attr.c b/fs/attr.c
index 960a310581eb..825007d5cda4 100644
--- a/fs/attr.c
+++ b/fs/attr.c
@@ -17,8 +17,6 @@
 #include <linux/filelock.h>
 #include <linux/security.h>
 
-#include "internal.h"
-
 /**
  * setattr_should_drop_sgid - determine whether the setgid bit needs to be
  *                            removed
diff --git a/fs/inode.c b/fs/inode.c
index 3a41f83a4ba5..e0815acc5abb 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2538,6 +2538,7 @@ bool in_group_or_capable(struct mnt_idmap *idmap,
 		return true;
 	return false;
 }
+EXPORT_SYMBOL(in_group_or_capable);
 
 /**
  * mode_strip_sgid - handle the sgid bit for non-directories
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 0283cf366c2a..c375a4af7b11 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1926,6 +1926,8 @@ void inode_init_owner(struct mnt_idmap *idmap, struct inode *inode,
 extern bool may_open_dev(const struct path *path);
 umode_t mode_strip_sgid(struct mnt_idmap *idmap,
 			const struct inode *dir, umode_t mode);
+bool in_group_or_capable(struct mnt_idmap *idmap,
+			 const struct inode *inode, vfsgid_t vfsgid);
 
 /*
  * This is the "filldir" function type, used by readdir() to let
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 744C290FBBC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2024 05:43:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sK8hw-0003Pa-La;
	Thu, 20 Jun 2024 03:43:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youling.tang@linux.dev>) id 1sK8hr-0003PQ-1I
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jun 2024 03:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SUmHFYVsSdRNn5kuyX1XQfBw/O2XJKBxeFC/8akhqcc=; b=IC64MJhU3G7uQc/l6m8/vkhhub
 2GPcgofhdqX90qymL1m12gfAPYAFv5A7cjhSn3lliaAnvZJaGAmTon7lx2obJ11tlOQto+AtZrF7U
 FAwHQQjWdnTX+iHFfYjDFchDYouUtDPXMp8ud3Vvx3ynAGZIFDCowustnXH2hC2rf1C0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SUmHFYVsSdRNn5kuyX1XQfBw/O2XJKBxeFC/8akhqcc=; b=RYFcOyHb7TiYDPxR8BN6HfM9Yh
 YdoXBt/yjabWCNnhth6SUGMfaRyI9lR6+0D4By8ytYv6UTCkeo/CHpeyxU0l23ew+JVtoVGnj3jLk
 iBL2yeAquMAol55GN34Zy546ZGagNS+7kI4cULdsEtcl8s+tbtFBuIOlEiRhh21jtwIA=;
Received: from out-176.mta0.migadu.com ([91.218.175.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sK8hr-0005Zw-5r for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jun 2024 03:43:27 +0000
X-Envelope-To: viro@zeniv.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1718853839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SUmHFYVsSdRNn5kuyX1XQfBw/O2XJKBxeFC/8akhqcc=;
 b=FpGmzYaKBkuMDo7Iq/S0iQT3ZIiFEx5kW+x8bcs0MiYI57ry6AMOyq+TRv5jAD1kBs6EOP
 5wmZSNNZXohmoVrx/q4DXXHe7xJuJktrLHwXwAjdtfdih+WsCyZuBsGQTM3uQ7356ly02p
 sGXcDWAZ7Rmpvo91AFFeSa5dR4IyRLk=
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
Date: Thu, 20 Jun 2024 11:23:34 +0800
Message-Id: <20240620032335.147136-2-youling.tang@linux.dev>
In-Reply-To: <20240620032335.147136-1-youling.tang@linux.dev>
References: <20240620032335.147136-1-youling.tang@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Youling Tang <tangyouling@kylinos.cn> Use the
 in_group_or_capable()
 helper function to simplify the code. Signed-off-by: Youling Tang
 <tangyouling@kylinos.cn>
 --- fs/f2fs/acl.c | 3 +-- fs/f2fs/file.c | 4 +--- 2 files changed,
 2 insertions(+), 5 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.176 listed in sa-trusted.bondedsender.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.dev]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.176 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sK8hr-0005Zw-5r
Subject: [f2fs-dev] [PATCH 2/3] f2fs: Use in_group_or_capable() helper
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

Use the in_group_or_capable() helper function to simplify the code.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 fs/f2fs/acl.c  | 3 +--
 fs/f2fs/file.c | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
index ec2aeccb69a3..8bffdeccdbc3 100644
--- a/fs/f2fs/acl.c
+++ b/fs/f2fs/acl.c
@@ -219,8 +219,7 @@ static int f2fs_acl_update_mode(struct mnt_idmap *idmap,
 		return error;
 	if (error == 0)
 		*acl = NULL;
-	if (!vfsgid_in_group_p(i_gid_into_vfsgid(idmap, inode)) &&
-	    !capable_wrt_inode_uidgid(idmap, inode, CAP_FSETID))
+	if (!in_group_or_capable(idmap, inode, i_gid_into_vfsgid(idmap, inode)))
 		mode &= ~S_ISGID;
 	*mode_p = mode;
 	return 0;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5c0b281a70f3..7a23434963d1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -923,10 +923,8 @@ static void __setattr_copy(struct mnt_idmap *idmap,
 		inode_set_ctime_to_ts(inode, attr->ia_ctime);
 	if (ia_valid & ATTR_MODE) {
 		umode_t mode = attr->ia_mode;
-		vfsgid_t vfsgid = i_gid_into_vfsgid(idmap, inode);
 
-		if (!vfsgid_in_group_p(vfsgid) &&
-		    !capable_wrt_inode_uidgid(idmap, inode, CAP_FSETID))
+		if (!in_group_or_capable(idmap, inode, i_gid_into_vfsgid(idmap, inode)))
 			mode &= ~S_ISGID;
 		set_acl_inode(inode, mode);
 	}
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

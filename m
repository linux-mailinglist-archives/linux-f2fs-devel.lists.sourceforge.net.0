Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ADF8C6298
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2024 10:13:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s79kw-0004ni-1w;
	Wed, 15 May 2024 08:12:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s79ku-0004nY-U9
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 08:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BDVDkIzsgfd9JM1PlQKJT3TOlWANe9HPhh9XiFkMnQo=; b=fJrPUoh26m3vS0lGYBvmXo9cQr
 3wpCPqBVyesY11lvrwy7slkeHX4AoxYubGohHLGpnuEQLL0nMyATZEFWaX2oS+mEaSbsGKU5n8W8o
 6nfpGrYX5Jf/eoRX/2Jd04sxdmz/O6gTy0eONqRDoOTsullQU2+iDLczaK6Ryhc6W41o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BDVDkIzsgfd9JM1PlQKJT3TOlWANe9HPhh9XiFkMnQo=; b=G
 C9f3UO5hVqARnkhKLmt04n045PwGbyuU7kIeMNpjC53CHeMssOVvlgI+dRssWovr8fGG/dZ+3cLke
 iEPkVFT0B7G0VExGehLVIbLvOi0a+iU88ZQYyPrSZluTcfTjArKRCVIL/sBvTf2nEdFf1GN3JCpu6
 /9Z21nr+fbeXfHbU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s79ku-0004wY-G6 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 08:12:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5D9646146E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 May 2024 08:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB685C116B1;
 Wed, 15 May 2024 08:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715760765;
 bh=czMNo6nRJc7COieIC50Mp3lh9PWzedr3ZXgWeiNj9QQ=;
 h=From:To:Cc:Subject:Date:From;
 b=tVwn63BWD9TTLpCLWIXhXveu7N22dfhKA/xrSzrZ8n3rgx2KgRIBrD/cq71vK96qG
 wkXUQeID48+sDk/Z0nBYMUzlXWCb7qKXQ3P7yrLYUtQbalGU3i27XfaYp52k7or0kh
 dLyVOHpVYCgY+zUBsxturwkZpCwpdQZbBRLUheGs8KcorZJebrI/c4YwO1PNf5BhkU
 q2bdxpmQGGCptamE7USW4h13xzeG3GQu0U1JE2VgLfXR9TTv9NEikFu6EIrt2BNx0H
 FAzNwQjCcpz6sAWlofkghwKStCpGMsALY93Naqj6y4IgBmjFdpF/li6+5hAz/19Ndc
 VPIS6X50bNYag==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 15 May 2024 16:12:33 +0800
Message-Id: <20240515081233.2463848-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: FS_IOC_GETFSSYSFSPATH ioctl expects sysfs sub-path of a
 filesystem, 
 the format can be "$FSTYP/$SYSFS_IDENTIFIER" under /sys/fs, it can helps
 to standardizes exporting sysfs datas across filesystems. This patch wires
 up FS_IOC_GETFSSYSFSPATH for f2fs, it will output "f2fs/<dev>". 
 Content analysis details:   (-1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.9 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s79ku-0004wY-G6
Subject: [f2fs-dev] [PATCH] f2fs: add support for FS_IOC_GETFSSYSFSPATH
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

FS_IOC_GETFSSYSFSPATH ioctl expects sysfs sub-path of a filesystem, the
format can be "$FSTYP/$SYSFS_IDENTIFIER" under /sys/fs, it can helps to
standardizes exporting sysfs datas across filesystems.

This patch wires up FS_IOC_GETFSSYSFSPATH for f2fs, it will output
"f2fs/<dev>".

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index daf2c4dbe150..1f0f306cbcac 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4481,6 +4481,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
 		(test_opt(sbi, POSIX_ACL) ? SB_POSIXACL : 0);
 	super_set_uuid(sb, (void *) raw_super->uuid, sizeof(raw_super->uuid));
+	super_set_sysfs_name_bdev(sb);
 	sb->s_iflags |= SB_I_CGROUPWB;
 
 	/* init f2fs-specific super block info */
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

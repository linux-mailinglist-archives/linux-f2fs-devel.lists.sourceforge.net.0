Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4721D6D4E71
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Apr 2023 18:54:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjNSC-0005Fg-Fm;
	Mon, 03 Apr 2023 16:54:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pjNSA-0005Fa-GA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 16:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XnwuyQBOjohNBccuQRKNgfjiqtyhbR2pwRuovzXlDq4=; b=SoXaQ/d87QOsrAUj/E9UOXF9BZ
 JudAvbVQWGXmvXh4t1Mr6rf4AJDJ8bqtJCXatL21yJ5d9g3JEgMmGcQr+bp8/GhLSnpLFRE5VzJPJ
 RvmDCA2WaGuiuHketKnszgfL2jyCumxN5w8zRi2QaC/G3agEWhPGYnIpUTgHDKI9tIuk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XnwuyQBOjohNBccuQRKNgfjiqtyhbR2pwRuovzXlDq4=; b=mtpbMAIn2f2R0dd3kacuQ9BZMH
 XaJy5t83y5LbLS3TkCGppR0JWGBEeSibGp9mRJhefjCA4CO1fnpgLuBV/5yIoDpKxKodK4/V7JQR1
 O4LLgFk++3GDjSMr5qzXibM9ACu46arp+yAm04s3vxAqB3lRZv0SeGWbNRGDPidHZV9A=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjNS9-0004Xm-TB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 16:54:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4986F61889
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Apr 2023 16:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D92C4339B;
 Mon,  3 Apr 2023 16:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680540876;
 bh=VVcpYsvPB42S9bhD5icaj68wnU6tD0Ujr7cjnyc0m6s=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=RG56pQe+yzCCW/MbuTaBH80yWs+g5IqypJRlftuPykhevhqMbHz06yUXWtkaVyrb2
 TZVlzvoM/vIoHE4LvoCDDPeODqIn8Kl76Hupl0OUFfjlu3WqYytSJ9g+u+6NS0c11N
 4cGjTDZDbsEfIHM9GWf7h9mJFqsNdoCA6Qq+M9I1HrP9cBUarQKHs29ZMlvE/11IxJ
 mHtfs03+wg+qXIGSJTIklyXZLF1suAw4fCGKRB3D4XQgpsYl5S+O+Ck0PO0LmeU+d3
 RX6tnOB0BrWlptz2N4clpCzRpWGBBdsYWvuEaUyaWmDgstY2bOt09agjXpxSBKdjaS
 0PbYkrFVcPXnw==
Date: Mon, 3 Apr 2023 09:54:34 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <ZCsEytDjqEjQDPiO@google.com>
References: <20230403165038.3018949-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230403165038.3018949-1-jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We got a kernel panic if old_addr is NULL.
 https://bugzilla.kernel.org/show_bug.cgi?id=217266
 BUG: kernel NULL pointer dereference, address: 0000000000000000 Call Trace:
 <TASK> f2fs_commit_atomic_write+0x619/0x990 [f2fs
 a1b985b80f5babd6f3ea778384908880812bfa43]
 __f2fs_ioctl+0xd8e/0x4080 [f2fs [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjNS9-0004Xm-TB
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix null pointer panic in
 tracepoint in __replace_atomic_write_block
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We got a kernel panic if old_addr is NULL.

https://bugzilla.kernel.org/show_bug.cgi?id=217266

BUG: kernel NULL pointer dereference, address: 0000000000000000
 Call Trace:
  <TASK>
  f2fs_commit_atomic_write+0x619/0x990 [f2fs a1b985b80f5babd6f3ea778384908880812bfa43]
  __f2fs_ioctl+0xd8e/0x4080 [f2fs a1b985b80f5babd6f3ea778384908880812bfa43]
  ? vfs_write+0x2ae/0x3f0
  ? vfs_write+0x2ae/0x3f0
  __x64_sys_ioctl+0x91/0xd0
  do_syscall_64+0x5c/0x90
  entry_SYSCALL_64_after_hwframe+0x72/0xdc
 RIP: 0033:0x7f69095fe53f

Fixes: 2f3a9ae990a7 ("f2fs: introduce trace_f2fs_replace_atomic_write_block")
Cc: <stable@vger.kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 72bce3808394..2439d7029e64 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -257,7 +257,7 @@ static int __replace_atomic_write_block(struct inode *inode, pgoff_t index,
 	f2fs_put_dnode(&dn);
 
 	trace_f2fs_replace_atomic_write_block(inode, F2FS_I(inode)->cow_inode,
-					index, *old_addr, new_addr, recover);
+			index, old_addr ? *old_addr : 0, new_addr, recover);
 	return 0;
 }
 
-- 
2.40.0.348.gf938b09366-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D56AF0BF3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Jul 2025 08:49:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QYV5IrdziGD1ctFNCDyIWMDjgpTwLPlUo5IEpc7sD+M=; b=m2+xB0Yp0pQDotbTnoohVvnBlA
	QunNh/vIa+g1qBo/iAElir7T5hI/bppC4i0oMr+yFbTlSQh34s1E3OZpX9Td7kgdNPgQblskKCnJ4
	34Deog7P1yJcgK6gVGM8Hmn7jNbJsTfk3BNfI/Mmj4G6WKQDu8Vfv1VB1qcUul/bp2ng=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWrHp-00025N-UR;
	Wed, 02 Jul 2025 06:49:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uWrHo-00025F-DV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Jul 2025 06:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xVT2MK1MsidfIrDHR3lOMPyjySDVcG6HPVS8pJghZcE=; b=QbcIbvPhlguKYG8iWx5Hmci0RF
 JA/LEE3rKADr8xyOGOx5+NRmQFzrhdZZmIopzwbh++j1Juo6X/+xq51noy5c3DgkCWgmOhbRV0hG2
 Hauh0Z4vQYYqfglgIVZYM1pdVjvFuT5n458NvW4lY1SoL99gKmX0qQfdsIWNyRnvpyHs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xVT2MK1MsidfIrDHR3lOMPyjySDVcG6HPVS8pJghZcE=; b=m
 gG/sSTtYkfMn3pZHlW2k5PQi78v/fr2FD+rYrTXRz6APuuXafA5GOsb+L6fXX1BVny60mXWMqPEPp
 P6LfWdErm6NVpjVjrh2FLogYbIY/vSr0LyDByh03QiWvixjsLpQN+yWBXNJ7P64Rzk4803yU7jUTU
 turhOFOUS+Uln33A=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWrHo-0002iW-1u for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Jul 2025 06:49:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 48A336000A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  2 Jul 2025 06:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D290AC4CEEE;
 Wed,  2 Jul 2025 06:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751438974;
 bh=BPubFNKGvdKys1olDiBUNYKykKsbgSZ1DEu9K8YU6X4=;
 h=From:To:Cc:Subject:Date:From;
 b=LX296OkA/i+AuOF/zQQeLMvUCdbVI1qupnMWDLTLzAbxdTSZjW2KKHOMDcnnBJyRC
 UZjmPD/6jLEwcUx6e/9GxVg1PMoWtWKj9A3fkHo5/Q4lwRRmJYT4MX827sZl2FXq2W
 zuLIEHr8ghqj17cKWaNAwJYpK4/vD7t3NVf51/uOFZVXofM3zm0stIdfcnWvHNcrKB
 Vjg6A8B+H0ve5kEnI0L73LM2HntKDBpwhUDJQu+IYepG3sIb5AhzpDC9FyHQiSNdcN
 gWVRiAca+9U6LtpmNWceR1fKIJzwPSYfM1rHnT1+8TJW7yGmbnO/A4bM8j9bGyDqqa
 A+3f7qe6za2yg==
To: jaegeuk@kernel.org
Date: Wed,  2 Jul 2025 14:49:25 +0800
Message-ID: <20250702064925.1002176-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  We should use "{usr,grp,prj}jquota=" to disable journaled
 quota, rather than using off{usr,grp,prj}jquota. Fixes: 4b2414d04e99 ("f2fs:
 support journalled quota") Signed-off-by: Chao Yu <chao@kernel.org> ---
 Documentation/filesystems/f2fs.rst
 | 6 +++--- 1 file changed, 3 insertions(+), 3 deletions(-) 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uWrHo-0002iW-1u
Subject: [f2fs-dev] [PATCH] f2fs: doc: fix wrong quota mount option
 description
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We should use "{usr,grp,prj}jquota=" to disable journaled quota,
rather than using off{usr,grp,prj}jquota.

Fixes: 4b2414d04e99 ("f2fs: support journalled quota")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/filesystems/f2fs.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 440e4ae74e44..03b1efa6d3b2 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -238,9 +238,9 @@ usrjquota=<file>	 Appoint specified file and type during mount, so that quota
 grpjquota=<file>	 information can be properly updated during recovery flow,
 prjjquota=<file>	 <quota file>: must be in root directory;
 jqfmt=<quota type>	 <quota type>: [vfsold,vfsv0,vfsv1].
-offusrjquota		 Turn off user journalled quota.
-offgrpjquota		 Turn off group journalled quota.
-offprjjquota		 Turn off project journalled quota.
+usrjquota=		 Turn off user journalled quota.
+grpjquota=		 Turn off group journalled quota.
+prjjquota=		 Turn off project journalled quota.
 quota			 Enable plain user disk quota accounting.
 noquota			 Disable all plain disk quota option.
 alloc_mode=%s		 Adjust block allocation policy, which supports "reuse"
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE969896747
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 09:52:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rrvQH-0005pY-TH;
	Wed, 03 Apr 2024 07:52:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sweettea-kernel@dorminy.me>) id 1rrvQ9-0005ng-B8
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 07:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nHUERzTQriQp3SYpHVa/LAE/foJxtB3YfebKGOnOWXQ=; b=hPIQ2/K+zHUdg1OdN45jEsQ+fn
 Jl0Ic2lPePyG4RtJUNhjq9P9m9s0VfyKEgpyFm7kIW1r+rfGCOWJHs1Yy8cIcxV2R1jxzflXbs+9y
 bEJnbw2tG7h5s96UR0uRGIZAT17yIGvgj3c6jr89sZXAydJjfjbv+FxG5NXZ01Ad8Guo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nHUERzTQriQp3SYpHVa/LAE/foJxtB3YfebKGOnOWXQ=; b=eDazbidGhuzFVWgcWfuK6G1Vxd
 eO+ciZ5o6GKE/ZfzQ8U49CYJlAc3DWhvizn+yK4i6fawU1e2a1oVO45NqAXUYdu0nqYzEgvJ0VOAB
 OkFPsOVeOJ4uObiMgyv790IUf2Dt3nWXuenssDWTpxP2exOR8FYrCk5fKXO20nQ1WANA=;
Received: from box.fidei.email ([71.19.144.250])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rrvQ4-0001lf-FU for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 07:52:29 +0000
Received: from authenticated-user (box.fidei.email [71.19.144.250])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.fidei.email (Postfix) with ESMTPSA id 80DCC8083D;
 Wed,  3 Apr 2024 03:33:20 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
 t=1712129601; bh=HBGmAcZ8dQDWLxuQ2gZciGzNPLnws2Iv6wSJvdOp678=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=k9adrljeAgmXUEVqR9T38q7UBFhQ7lETYpMXjsStM0XMGS4eG1T8+pjHdefOZtd+9
 b9sbXDAHqGTeEotki3koqBZ7FT1290d4WlsagN6Z1Jb5RTuog38L7ZzYucpSa1d0f4
 HrhO5RZg8NIYkyjWEsqcLAnOgMmn4utEi4pAOKEYrQOYjdJh36IxT86WJh3JG4pp1O
 xCkF4oXlZ89mQ1Ia6EZPk/hwSHK3lgiNW/6Wm5o0rgE/z8dTkDN+l20XOjvG16oIUL
 bA6z8ZMduHhDyDTpqq0FP2+pz2Eq0VSIBWGUHJdJGV+Y0h8M0aDKiiMOSTHKAOpxIl
 RTUMic1gQE7cQ==
To: Jonathan Corbet <corbet@lwn.net>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Brian Foster <bfoster@redhat.com>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
 Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, kernel-team@meta.com
Date: Wed,  3 Apr 2024 03:22:48 -0400
Message-ID: <20935230b7513031ac497e3afe8446650d20fb1e.1712126039.git.sweettea-kernel@dorminy.me>
In-Reply-To: <cover.1712126039.git.sweettea-kernel@dorminy.me>
References: <cover.1712126039.git.sweettea-kernel@dorminy.me>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
 --- fs/ext4/extents.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-)
 diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c index
 2adade3c202a..4874f757e1bd
 100644 --- a/fs/ext4/extents.c +++ b/fs/ext4/extents.c @@ -2194,7 +2194,7
 @@ static int ext4_fill_es_cache_info(stru [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: dorminy.me]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1rrvQ4-0001lf-FU
Subject: [f2fs-dev] [PATCH v3 07/13] ext4: fiemap: return correct extent
 physical length
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
From: Sweet Tea Dorminy via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
---
 fs/ext4/extents.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
index 2adade3c202a..4874f757e1bd 100644
--- a/fs/ext4/extents.c
+++ b/fs/ext4/extents.c
@@ -2194,7 +2194,7 @@ static int ext4_fill_es_cache_info(struct inode *inode,
 
 	while (block <= end) {
 		next = 0;
-		flags = 0;
+		flags = FIEMAP_EXTENT_HAS_PHYS_LEN;
 		if (!ext4_es_lookup_extent(inode, block, &next, &es))
 			break;
 		if (ext4_es_is_unwritten(&es))
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

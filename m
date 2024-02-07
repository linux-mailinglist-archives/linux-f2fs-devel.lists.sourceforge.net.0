Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BB584C565
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Feb 2024 08:03:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rXbxw-00038B-0D;
	Wed, 07 Feb 2024 07:03:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1rXbxt-000382-S7
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Feb 2024 07:03:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5R02UKikvCKYbrLXJuXS9X034ZeTMfksrr/KqNfhpfg=; b=lqD9EgwTHHfYbSFNi97ptMEvmA
 8G7YGsKMaMG2BuMeMA5Cup+lBi8Je5xmfUpTqFbdhoz9pABQIpR4jkkkMPIbUWBKhmL7q3nYH5OUz
 +3K+VarxfCVGJZ8cCmj/58pVZed0Wjtz8B4LK3EiPkJSk70q/zhkgMXcDIc70y2wES+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5R02UKikvCKYbrLXJuXS9X034ZeTMfksrr/KqNfhpfg=; b=G
 hf2t9L5xGtQ7ou38BUKlP7gTBbMaIVcNLEfb44XPDh+QjuhB5Il5q8RhWFZTxCP1impHxmJZhhKOO
 52r4EX/E+afPwZjaLHAn7Xb115T1xwF4WkyjhJHvnS/SiYN8bmLxbXxlCqgUm2FWTFoGxjpJzCDjj
 uOCj2L18XsKSqjrE=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rXbxr-0002tI-Aq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Feb 2024 07:03:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707288216;
 bh=A2Koex6RA/Pnpr/3Zxy4fTLH4zSUL1TGk+vIg6Cqh1Y=;
 h=From:To:Cc:Subject:Date:From;
 b=BqVpIOAaQXPuUL3DeSNCsgpCJCi/TzAqROL98jFRr0oHyIilvynJxxKXWtkhou7FU
 BeA/Xdhli16LJvEQ49XlrjWC5T/iBZ6W+kRBgc2XQsjMarI4kBWuTye5orvu5zzvMV
 GDeU8RX3RnpkRUhs0Nx6+I8w+Vv7LXor09Z5guvflJR/JrZBh5A6TRuAGDoQXT2OsF
 ORZvzA0nFPWQ/RWOEzV5lFe8l+GjFxD4+9skeuTe6hy/CK+vmK4AT9ZiW34IvNbf5j
 t4EU808xGX+mIsjPxVPr29dizixel/w2wMilmgVqchJarPuFr5Ercrd/nzOn0OcuOS
 IKKOfvFGlT3Nw==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2FCB73780C22;
 Wed,  7 Feb 2024 06:43:32 +0000 (UTC)
To: tytso@mit.edu, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  7 Feb 2024 08:43:00 +0200
Message-Id: <20240207064302.221060-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, I am trying to respin the series here :
 https://www.spinics.net/lists/linux-ext4/msg85081.html
 To make it easier to apply I split it into smaller chunks which address one
 single thing. This series will just convert to qstr the storage of the
 filename currently using fscrypt_str . 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rXbxr-0002tI-Aq
Subject: [f2fs-dev] [RESEND PATCH v9 0/2] Minor cleanup for case insensitive
 path
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
From: Eugen Hristev via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: kernel@collabora.com, adilger.kernel@dilger.ca,
 linux-kernel@vger.kernel.org, eugen.hristev@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

I am trying to respin the series here :
https://www.spinics.net/lists/linux-ext4/msg85081.html

To make it easier to apply I split it into smaller chunks which address
one single thing.
This series will just convert to qstr the storage of the filename
currently using fscrypt_str .

Gabriel Krisman Bertazi (2):
  ext4: Simplify the handling of cached insensitive names
  f2fs: Simplify the handling of cached insensitive names

 fs/ext4/ext4.h     |  2 +-
 fs/ext4/namei.c    | 23 ++++++++++----------
 fs/f2fs/dir.c      | 53 ++++++++++++++++++++++++++--------------------
 fs/f2fs/f2fs.h     | 16 +++++++++++++-
 fs/f2fs/recovery.c |  5 +----
 5 files changed, 58 insertions(+), 41 deletions(-)

-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B8A147785
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jan 2020 05:16:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iuqOe-0004mg-5j; Fri, 24 Jan 2020 04:16:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iuqOc-0004mT-Vr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 04:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l6McDZdNzzbJ7t9QBgp+qrA1ABCkuyBoFsVV0sPBxyQ=; b=YsvXgNl1a6179GyZe3y8txb1rY
 TyIFxLCBIczoUXc7DIR5FFXDC6YROKulG3E7qW0UA8+T9GQMHwCWgMZSj/1UFM8UtW6SJzmi+X8f/
 qvam196Z1bZdOb+f3cpnWUYa6Zsa/DadRuf49JnMY1djeDhLZftd2wpMrBtUMdqqVQcc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l6McDZdNzzbJ7t9QBgp+qrA1ABCkuyBoFsVV0sPBxyQ=; b=Ybhi1cC4LJaI9MlD0+7S7Wdx7P
 Pba2twSoOgTA86j53xl0q6XKTNgiePKV3fULV5COOIuUl9W20FWQn5IdDlZu0sRz5zqfn0PRadmxv
 HwJvqhjqiLKMVWKJYy0//4rwQS4oKg5g+Sc63SkDtbQIaVP9N1xRu38S4SZpGkxMn5vA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iuqOb-00GXd3-TX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 04:16:38 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FA3020709;
 Fri, 24 Jan 2020 04:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579839387;
 bh=P4Jj/gWr+XYP4ZW/azAXDjVKUPcT3QkTSvvtSDH6Vhc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BPaiJTQGk40HlZLsznQzRSJc9o9Th9gzAlhatLMJCgMPcWMtI2UsUc67LfowvfVZ4
 jJioBZxI1A8/iM30EjFE9Icdh1KbkUakBHDX5i0bOjVHzXbR9pOb/MQgoPK729MNoe
 WDPXtAHofn6UblKONZR4z57mGkjIyICk/qRFK39g=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 23 Jan 2020 20:15:48 -0800
Message-Id: <20200124041549.159983-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124041549.159983-1-ebiggers@kernel.org>
References: <20200124041549.159983-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iuqOb-00GXd3-TX
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix dcache lookup of !casefolded
 directories
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Do the name comparison for non-casefolded directories correctly.

This is analogous to ext4's commit 66883da1eee8 ("ext4: fix dcache
lookup of !casefolded directories").

Fixes: 2c2eb7a300cd ("f2fs: Support case-insensitive file name lookups")
Cc: <stable@vger.kernel.org> # v5.4+
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index b56f6060c1a6b..aea9e2806144d 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -1087,7 +1087,7 @@ static int f2fs_d_compare(const struct dentry *dentry, unsigned int len,
 	if (!IS_CASEFOLDED(dentry->d_parent->d_inode)) {
 		if (len != name->len)
 			return -1;
-		return memcmp(str, name, len);
+		return memcmp(str, name->name, len);
 	}
 
 	return f2fs_ci_compare(dentry->d_parent->d_inode, name, &qstr, false);
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

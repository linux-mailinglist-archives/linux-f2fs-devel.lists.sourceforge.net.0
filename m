Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7723FE030
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Sep 2021 18:41:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mLTIQ-0000F4-C4; Wed, 01 Sep 2021 16:41:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1mLTIC-0000Cr-QZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Sep 2021 16:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qzFbGtCn3BX5C3rOT44u5Eq2HXp6L29VGbPhCqeTgok=; b=b0O+GRazaxdd57FbKOy0uWDmPE
 WXyQoSlho6sa1tDoOuiPTrx/XUqBkLIEoDY8/r97PUEF0tgfJlV9iVsh3ZKJ1T4/fjtI/dbGrg4bp
 zGGd5RTAtuOZXUcwVVfdRtGFrPFyfQRESUpmrLr1IN6i7AVXHkfmITf3qDPbjR4ugA/8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qzFbGtCn3BX5C3rOT44u5Eq2HXp6L29VGbPhCqeTgok=; b=kUj7BXTPi5Z9wO1omtWx1TkkXm
 KsgsQvwlUWoVpP9wiCQx7YHPG1QWa9vk0RlI7VsIzOLe/jw8iCSegk32StVX2aZe/N07iRkvTKVbg
 3DpcDSNgciLrI0p38dZVrzaOXp5TUJS4DrAA9oLTSTZyvbMhMZq7aHgrFE6RsEfRCb5g=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mLTIC-00Aa9j-AV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Sep 2021 16:40:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18AB8610A4;
 Wed,  1 Sep 2021 16:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630514445;
 bh=33RC3YogqXCC1E17dtW915hQmiG+ogGdN4NtjjBgfzA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e1SO4KbLU/xzU1M6KMMYOaf9afJ4v/u3OImED28F07LnAtkkEDSyGFpwhjTFY/7mX
 iLnsv55XhW3ZZhRWFEday3Ioh9fNsCmFZuIM5grmwljJK3F3VujCcabRn8akneb4K8
 yA0gnSjU0YfE0msbkWjWShnoQ34G00wT4iKn7/QKTtJW2lUyCsFH09lFpjuDYRVR4H
 B+aQGAqJHVuPhezxASOlzyWbSpqNmogkF7izTuAQC1jRxVAdS1ScrM6LVE1w6B8Fgd
 5mVgOdhCvRz0LaOJUYdJJvZKIwHqbf3pNCUtK7meDb3dXkt3M7/gnjRsPimOHhxObw
 gcbGdJpnciuxA==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Date: Wed,  1 Sep 2021 09:40:39 -0700
Message-Id: <20210901164041.176238-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210901164041.176238-1-ebiggers@kernel.org>
References: <20210901164041.176238-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> commit
 8c4bca10ceafc43b1ca0a9fab5fa27e13cbce99e
 upstream. The stat() family of syscalls report the wrong size for encrypted
 symlinks, which has caused breakage in several userspace programs. 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mLTIC-00Aa9j-AV
Subject: [f2fs-dev] [PATCH 5.4 2/4] ext4: report correct st_size for
 encrypted symlinks
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

commit 8c4bca10ceafc43b1ca0a9fab5fa27e13cbce99e upstream.

The stat() family of syscalls report the wrong size for encrypted
symlinks, which has caused breakage in several userspace programs.

Fix this by calling fscrypt_symlink_getattr() after ext4_getattr() for
encrypted symlinks.  This function computes the correct size by reading
and decrypting the symlink target (if it's not already cached).

For more details, see the commit which added fscrypt_symlink_getattr().

Fixes: f348c252320b ("ext4 crypto: add symlink encryption")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20210702065350.209646-3-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/symlink.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/symlink.c b/fs/ext4/symlink.c
index dd05af983092d..a9457fed351ed 100644
--- a/fs/ext4/symlink.c
+++ b/fs/ext4/symlink.c
@@ -52,10 +52,19 @@ static const char *ext4_encrypted_get_link(struct dentry *dentry,
 	return paddr;
 }
 
+static int ext4_encrypted_symlink_getattr(const struct path *path,
+					  struct kstat *stat, u32 request_mask,
+					  unsigned int query_flags)
+{
+	ext4_getattr(path, stat, request_mask, query_flags);
+
+	return fscrypt_symlink_getattr(path, stat);
+}
+
 const struct inode_operations ext4_encrypted_symlink_inode_operations = {
 	.get_link	= ext4_encrypted_get_link,
 	.setattr	= ext4_setattr,
-	.getattr	= ext4_getattr,
+	.getattr	= ext4_encrypted_symlink_getattr,
 	.listxattr	= ext4_listxattr,
 };
 
-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

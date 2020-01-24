Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBDD147784
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jan 2020 05:16:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iuqOf-0006uR-4C; Fri, 24 Jan 2020 04:16:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iuqOd-0006uA-20
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 04:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L5Dt6ifLtfxpQReGiGa8FPtcvrHCrYklyb55VjlPhvY=; b=XFaIDOStYkA8858Fi9CAehrs3v
 JxbzMtw1nZwhDA3/7OQvUYhFns1C9USrzG3sfuruJp4NegPDZEbRqlqgu++W6lbxveYs3NSV+5S0w
 bgeXRDzkFxyHl7Zx/4Q5Se/sbKIzvj9G4cv6SU6e+PT3gFytkJAswJaV3GoDiDgZo1Ac=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L5Dt6ifLtfxpQReGiGa8FPtcvrHCrYklyb55VjlPhvY=; b=iYzlIv3GFqFdPT0IGa84nfUaJu
 VGPW7kWQpgI/N8r9/M7FRK41KuhaqyYWZWIKqzQ4/flNTLrqB1EXIexvCfkHhB/Q12W4Yx72PBf1x
 JL3V8XAtHp/5Bwu/8gQDQhqigqHPm5d/IaJfC9alsHJaTHN8KZi56HaOhkonF5XAJ/jw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iuqOb-00GXd4-UW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 04:16:39 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 920902070A;
 Fri, 24 Jan 2020 04:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579839387;
 bh=kj/UPIlxMTG1LNrRNQzAQibp9tj2WikH8O930HrmAmU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a67IdEUAnRcrrHdsQK7Nbl5g7OMOKGhUa7H2t42Ofc5V4ViYMbnvhK/a34YlJ+krO
 vmTgWu/vfSimME2bI6MPvtXho8XRo0ExKGAxkWCy262Xx8CsCGhYC/qMYhcQmegp9w
 qkPDAlLSC701dz3K1kcrqiHoKDf0AfVYXDtnfgjk=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 23 Jan 2020 20:15:49 -0800
Message-Id: <20200124041549.159983-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124041549.159983-1-ebiggers@kernel.org>
References: <20200124041549.159983-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.org.uk]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iuqOb-00GXd4-UW
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix race conditions in ->d_compare()
 and ->d_hash()
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

Since ->d_compare() and ->d_hash() can be called in RCU-walk mode,
->d_parent and ->d_inode can be concurrently modified, and in
particular, ->d_inode may be changed to NULL.  For f2fs_d_hash() this
resulted in a reproducible NULL dereference if a lookup is done in a
directory being deleted, e.g. with:

	int main()
	{
		if (fork()) {
			for (;;) {
				mkdir("subdir", 0700);
				rmdir("subdir");
			}
		} else {
			for (;;)
				access("subdir/file", 0);
		}
	}

... or by running the 't_encrypted_d_revalidate' program from xfstests.
Both repros work in any directory on a filesystem with the encoding
feature, even if the directory doesn't actually have the casefold flag.

I couldn't reproduce a crash in f2fs_d_compare(), but it appears that a
similar crash is possible there.

Fix these bugs by reading ->d_parent and ->d_inode using READ_ONCE() and
falling back to the case sensitive behavior if the inode is NULL.

Reported-by: Al Viro <viro@zeniv.linux.org.uk>
Fixes: 2c2eb7a300cd ("f2fs: Support case-insensitive file name lookups")
Cc: <stable@vger.kernel.org> # v5.4+
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/dir.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index aea9e2806144d..d7c9a2cda4899 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -1083,24 +1083,27 @@ static int f2fs_d_compare(const struct dentry *dentry, unsigned int len,
 			  const char *str, const struct qstr *name)
 {
 	struct qstr qstr = {.name = str, .len = len };
+	const struct dentry *parent = READ_ONCE(dentry->d_parent);
+	const struct inode *inode = READ_ONCE(parent->d_inode);
 
-	if (!IS_CASEFOLDED(dentry->d_parent->d_inode)) {
+	if (!inode || !IS_CASEFOLDED(inode)) {
 		if (len != name->len)
 			return -1;
 		return memcmp(str, name->name, len);
 	}
 
-	return f2fs_ci_compare(dentry->d_parent->d_inode, name, &qstr, false);
+	return f2fs_ci_compare(inode, name, &qstr, false);
 }
 
 static int f2fs_d_hash(const struct dentry *dentry, struct qstr *str)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(dentry->d_sb);
 	const struct unicode_map *um = sbi->s_encoding;
+	const struct inode *inode = READ_ONCE(dentry->d_inode);
 	unsigned char *norm;
 	int len, ret = 0;
 
-	if (!IS_CASEFOLDED(dentry->d_inode))
+	if (!inode || !IS_CASEFOLDED(inode))
 		return 0;
 
 	norm = f2fs_kmalloc(sbi, PATH_MAX, GFP_ATOMIC);
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

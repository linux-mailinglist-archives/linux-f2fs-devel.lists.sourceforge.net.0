Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 827E21EAFF4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jun 2020 22:07:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jfqik-0004d7-P2; Mon, 01 Jun 2020 20:07:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jfqik-0004d0-7w
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 20:07:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9iuQw4oBOJmmh92bEqn9/c7IbdmVFU2VnRDwXJhZ5bY=; b=hlGhc710tq/O5DOsDed4V4Gb1W
 FxExyCfQ8c0ypoPY5PiyCUiBi3FE5dWne6F79RT0l/ETaPzbdYH1U4x7XoYQNbzSgRFADr6lKLati
 LWOeEN8ElhBhEXXbFgv+bHBpnjCzYJ4yTVxbYZOAObESE4NnHDrs/MWUFs0cFl0cTe70=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9iuQw4oBOJmmh92bEqn9/c7IbdmVFU2VnRDwXJhZ5bY=; b=T
 duJ16xE+Hm7/r7TeN32czhWV9J5lqCyNrF0M3u7CerKGjPLzAxNAc5P44a/8fsu6AZbh/ykwtZVn9
 wuoK3fsNJKmXaR5/whdH4UjsX4aQur49p5c/RWJA5pL2jinTAG8o1Cpdz1ZS1cSFp4swHBwPQt2Iy
 bcQU1gXq+9M93phI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jfqij-000j3Y-2s
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 20:07:42 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 898D82074B;
 Mon,  1 Jun 2020 20:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591042050;
 bh=WLG4kcqEt9VdTt2Je1rr3PBXsRXzaEOmL6iqofLYZlU=;
 h=From:To:Cc:Subject:Date:From;
 b=U/7r1QVUCvm+wEhm5Ri1zhOAfxcLfglh4KLlLcNS7Ul+dX4GsRGMJKMuQfOpLEixR
 gwU3C/dECGBpe0rLgADp2TyoAXRq6gM/6EYE30LI9Llwg9z18xiFP3PNvAUMGLiTYC
 9kTnCYrYqc79N0QRx7pf5oOhOXRh/o6brZJRhtwY=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-ext4@vger.kernel.org
Date: Mon,  1 Jun 2020 13:05:43 -0700
Message-Id: <20200601200543.59417-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.org.uk]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jfqij-000j3Y-2s
Subject: [f2fs-dev] [PATCH v2] ext4: avoid utf8_strncasecmp() with unstable
 name
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
Cc: Daniel Rosenberg <drosen@google.com>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

If the dentry name passed to ->d_compare() fits in dentry::d_iname, then
it may be concurrently modified by a rename.  This can cause undefined
behavior (possibly out-of-bounds memory accesses or crashes) in
utf8_strncasecmp(), since fs/unicode/ isn't written to handle strings
that may be concurrently modified.

Fix this by first copying the filename to a stack buffer if needed.
This way we get a stable snapshot of the filename.

Fixes: b886ee3e778e ("ext4: Support case-insensitive file name lookups")
Cc: <stable@vger.kernel.org> # v5.2+
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Daniel Rosenberg <drosen@google.com>
Cc: Gabriel Krisman Bertazi <krisman@collabora.co.uk>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---

v2: use memcpy() + barrier() instead of a byte-by-byte copy.

 fs/ext4/dir.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
index c654205f648dd..1d82336b1cd45 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -675,6 +675,7 @@ static int ext4_d_compare(const struct dentry *dentry, unsigned int len,
 	struct qstr qstr = {.name = str, .len = len };
 	const struct dentry *parent = READ_ONCE(dentry->d_parent);
 	const struct inode *inode = READ_ONCE(parent->d_inode);
+	char strbuf[DNAME_INLINE_LEN];
 
 	if (!inode || !IS_CASEFOLDED(inode) ||
 	    !EXT4_SB(inode->i_sb)->s_encoding) {
@@ -683,6 +684,21 @@ static int ext4_d_compare(const struct dentry *dentry, unsigned int len,
 		return memcmp(str, name->name, len);
 	}
 
+	/*
+	 * If the dentry name is stored in-line, then it may be concurrently
+	 * modified by a rename.  If this happens, the VFS will eventually retry
+	 * the lookup, so it doesn't matter what ->d_compare() returns.
+	 * However, it's unsafe to call utf8_strncasecmp() with an unstable
+	 * string.  Therefore, we have to copy the name into a temporary buffer.
+	 */
+	if (len <= DNAME_INLINE_LEN - 1) {
+		memcpy(strbuf, str, len);
+		strbuf[len] = 0;
+		qstr.name = strbuf;
+		/* prevent compiler from optimizing out the temporary buffer */
+		barrier();
+	}
+
 	return ext4_ci_compare(inode, name, &qstr, false);
 }
 
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

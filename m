Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4244D420CA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2019 11:30:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vs/ol6h4Dqqjgz/RJTcDFma7VyYasE1o92+o/WgL/j4=; b=QY7bR01InTI7H7/XLAB/x6ebJL
	+/7bbIGFyZEaCeerfZ1Vw66iOiPMPhpZzQBOyvIFq/h57zmz/iw0X4aZPuStMKlILdwJ+SHpBaqhk
	mpDjBvaLqaZE87rG0j6Wku8TVAcdNBxfXoZ+riqGqq9M2NFan4WviQtqHbh8Oq1+xk4M=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hazaY-0003LE-1J; Wed, 12 Jun 2019 09:30:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3nr4AXQwKAA0u7n0t4n0qnyyt11tyr.p1z@flex--huangrandall.bounces.google.com>)
 id 1hazaV-0003L7-Vq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Jun 2019 09:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9k1XSYdZALmH5hfa8a4AvP07Lnh/NUnZExR+YT8RVJg=; b=ZjD5/xU4cAZQ6kM8dLpLJE+oXa
 ogZA+kAA6aPj9DHXPX1Y/Xis8S1oLo7yssMiWN2k+IDwBECkYrwidGlZs16UKn4U5UdPowOC4fBDG
 /DwukeYVPV7LBGuFcQfpkMXsYYe1/02FN9K35w0aKpxGDVM6wG0IQW8RNbMXKQwhj3es=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9k1XSYdZALmH5hfa8a4AvP07Lnh/NUnZExR+YT8RVJg=; b=b
 njsvVLzL44IepJGyZ2JGHcAeIlAcyf7NdhXLV0naotsu+xsoEg2OGUfsTcmJ92GbtvU01+YVeyGa6
 9eYY+QdrfL59GARXcR9QteXRGd/80cC+Ph2byL5sljk4yMuPhnFO7vYBZXWCqyu4ZsRd7+zPVx25K
 SEbN74Hx7+PGksK8=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hazaS-002ie5-Uy
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Jun 2019 09:30:36 +0000
Received: by mail-yb1-f201.google.com with SMTP id x73so14975734ybe.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Jun 2019 02:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=9k1XSYdZALmH5hfa8a4AvP07Lnh/NUnZExR+YT8RVJg=;
 b=PQ69jBZKOHxDO/Whg1h1b3HMn0jb+jBhbwD60f9UYm+KKj3nXwBXrhdSO1xpxRUGI3
 7cK7dIMJfWnffO9DB6tfoM1dDSdPKSkJ5zviaiG1T840kg7O02vo21jucqKNco5vBXtP
 nnT59IGwweHt1bguh+DDlSq8k7cJdN890iHE7pkIZFIRiwBwkDigJQO3Y5kax6nltu55
 ZyUcbSEPVFgAq3EpsoxgujnREHik+31nO+3gVraPCbY3qQjjsgY+kUoRWFwI2ofTy9eU
 wWoxLnJq2S/7lCcEo27WrwwosrCyB4NfDIxMLi4kpcpYa+ddPkAOyd6jbV4xY8bDKkl0
 m7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=9k1XSYdZALmH5hfa8a4AvP07Lnh/NUnZExR+YT8RVJg=;
 b=fzsFGPs5dpIWZNmOd/P1LzbStdVfso6hMfKSeSJB3xamvyRWXWeH6ZN6bjzxRrbNmP
 8Ham8wvD6pOvN7X50DBwbzYgpm+TFF4IrSTeEt6GXD0XFsuvI9vI7t3V0KdihBjgY+jo
 9Bo6mluUPGjt9Ver9ENGPHHyuAXmP81kPu+9N9prfKnpHbCfpYILddNputMkCDXjRDhY
 g5LP+PJPJs+b1amt4rSKlkywH0Eb2WF+5uOilCeJTdYtx8yWNlcN2vPTKcjzj0D0mSa7
 FoeBFTxSLKiqDGLERktg4MKrB6KpEierBsYCyh4wi2xJ9q7uHqoHBrMOQ/slDi1GSAZD
 KoWg==
X-Gm-Message-State: APjAAAWateI3pVhYRwlGGhswwBJnCp7W399UE9mktYWyP43OwQX4ypm3
 APLdp1emarIQGdHtHJgDgHBHokhCcAXFsQcCIKc=
X-Google-Smtp-Source: APXvYqwoFryJoQr+gF8BtttieF5Om0BeVHO4kvoPuVRSm+6q0gxUUv485INZg3A87cHt7LzA7WMZ/J5NiwFziYzUPsE=
X-Received: by 2002:a25:d407:: with SMTP id m7mr37566390ybf.409.1560329886146; 
 Wed, 12 Jun 2019 01:58:06 -0700 (PDT)
Date: Wed, 12 Jun 2019 16:58:00 +0800
Message-Id: <20190612085800.11947-1-huangrandall@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
To: jaegeuk@kernel.org, yuchao0@huawei.com, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1hazaS-002ie5-Uy
Subject: [f2fs-dev] [PATCH] f2fs: add boundary check in inline_data_addr
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
From: Randall Huang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Randall Huang <huangrandall@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add boundary check in case of extra_size is larger
than sizeof array "i_addr"

Signed-off-by: Randall Huang <huangrandall@google.com>
---
 fs/f2fs/f2fs.h | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 760390f380b6..17f3858a00c3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2660,11 +2660,25 @@ static inline bool f2fs_is_drop_cache(struct inode *inode)
 	return is_inode_flag_set(inode, FI_DROP_CACHE);
 }
 
+#define F2FS_TOTAL_EXTRA_ATTR_SIZE			\
+	(offsetof(struct f2fs_inode, i_extra_end) -	\
+	offsetof(struct f2fs_inode, i_extra_isize))	\
+
 static inline void *inline_data_addr(struct inode *inode, struct page *page)
 {
 	struct f2fs_inode *ri = F2FS_INODE(page);
 	int extra_size = get_extra_isize(inode);
 
+	if (extra_size < 0 || extra_size > F2FS_TOTAL_EXTRA_ATTR_SIZE ||
+		extra_size % sizeof(__le32)) {
+		f2fs_msg(F2FS_I_SB(inode)->sb, KERN_ERR,
+			"%s: inode (ino=%lx) has corrupted i_extra_isize: %d, "
+			"max: %zu",
+			__func__, inode->i_ino, extra_size,
+			F2FS_TOTAL_EXTRA_ATTR_SIZE);
+		extra_size = 0;
+	}
+
 	return (void *)&(ri->i_addr[extra_size + DEF_INLINE_RESERVED_SIZE]);
 }
 
@@ -2817,10 +2831,6 @@ static inline int get_inline_xattr_addrs(struct inode *inode)
 	((is_inode_flag_set(i, FI_ACL_MODE)) ? \
 	 (F2FS_I(i)->i_acl_mode) : ((i)->i_mode))
 
-#define F2FS_TOTAL_EXTRA_ATTR_SIZE			\
-	(offsetof(struct f2fs_inode, i_extra_end) -	\
-	offsetof(struct f2fs_inode, i_extra_isize))	\
-
 #define F2FS_OLD_ATTRIBUTE_SIZE	(offsetof(struct f2fs_inode, i_addr))
 #define F2FS_FITS_IN_INODE(f2fs_inode, extra_isize, field)		\
 		((offsetof(typeof(*(f2fs_inode)), field) +	\
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

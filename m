Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3864F19283B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 13:28:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jH59S-00025r-0C; Wed, 25 Mar 2020 12:28:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+51ae3af3ded1af5ce3db+6058+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jH59R-00025T-4y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 12:28:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bOpFqUPJ9bS+4ZDNHjIcr3PqAyINL9efeQnE7Z928sM=; b=f9wtqkrGujQTJ7cHh1cG9JdGaW
 2x/eFHekxROXlEcKAltmnsVWNJXGdh19nnIMt4C7PNk7ttXUJAo+0vP312vYG/62Dfgck3Cxv5unr
 kIyaOj+JcTcyfGsUs+H6ExkhydsRUENvpOTkSMVkLn8SnKYtjEsp7OwR4H5Mt0oZyiPw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bOpFqUPJ9bS+4ZDNHjIcr3PqAyINL9efeQnE7Z928sM=; b=LCArCH36+0VI3GmR1GeCQvb/Su
 ShIwmuJzS9Vove4KHVDBI3w10BHS5PXFuEGe4/Uz2LOFc8JAMDiGWu3PJyIcaM92pQabp220S5Z48
 RicQsypRkFMP5TrQT1W77DunzHVC7WnlwdX7rdjU7TN09YlcJAYDTd0fpzwAuNqRzsAA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jH59Q-002uiE-3e
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 12:28:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=bOpFqUPJ9bS+4ZDNHjIcr3PqAyINL9efeQnE7Z928sM=; b=kNWzkfmPTk9pYHmfxP86DPRPIq
 M/Ipv+fQiCkDkwXVpxqu3vzY7CjHK4yUGuRcjtkjXDrmI5QP67iBFuZ7wmzjWBRflzTR4Oc10Y3Tw
 TxZGNoKsEh6OdYFpqm6hndtv7nBc0nbnSt/wF5ed6xS4syPSNC5uKBNw5gu3GTreDVpUkm2vzqIHs
 2+NSFdsEglJWkR3iq/8Z4aBgwd4eOWC15tQTykGwIj32DdexPLlCe17ITG83vlBMg3Y7I0hu0ytef
 96sPrnpgCWNGDBo9diiyYhgbp2R0CAcMwkft9oMIFOoTsjaSOofASaFSKdfAc4+7LfRhpUx2citl6
 pM8QRVRA==;
Received: from [2001:4bb8:18c:2a9e:999c:283e:b14a:9189] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH59C-0003No-4o; Wed, 25 Mar 2020 12:28:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Theodore Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Richard Weinberger <richard@nod.at>, linux-xfs@vger.kernel.org
Date: Wed, 25 Mar 2020 13:28:25 +0100
Message-Id: <20200325122825.1086872-5-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200325122825.1086872-1-hch@lst.de>
References: <20200325122825.1086872-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jH59Q-002uiE-3e
Subject: [f2fs-dev] [PATCH 4/4] fs: clean up generic_update_time a bit
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There is no need both the sync and iflag variables - just use dirty as
the indicator for which flag to pass to __mark_inode_dirty, as there
is no point in passing both flags - __mark_inode_dirty will immediately
clear I_DIRTY_TIME if I_DIRTY_SYNC is set.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/inode.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 96cf26ed4c7b..a7d19b1b15ac 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1662,7 +1662,6 @@ static int relatime_need_update(struct vfsmount *mnt, struct inode *inode,
 
 int generic_update_time(struct inode *inode, struct timespec64 *time, int flags)
 {
-	int iflags = I_DIRTY_TIME;
 	bool dirty = false;
 
 	if (flags & S_ATIME)
@@ -1678,9 +1677,7 @@ int generic_update_time(struct inode *inode, struct timespec64 *time, int flags)
 	     !(inode->i_sb->s_flags & SB_LAZYTIME)))
 		dirty = true;
 
-	if (dirty)
-		iflags |= I_DIRTY_SYNC;
-	__mark_inode_dirty(inode, iflags);
+	__mark_inode_dirty(inode, dirty ? I_DIRTY_SYNC : I_DIRTY_TIME);
 	return 0;
 }
 EXPORT_SYMBOL(generic_update_time);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

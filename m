Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A959655456
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Dec 2022 21:37:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p8omx-0003PL-NW;
	Fri, 23 Dec 2022 20:37:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p8omv-0003P4-6n
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 20:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l8P4LiO96AU70qR/laRSg5gCbmzlW0fQ82FdUEyjHoc=; b=KGeYEOfJDnSPZSVjYVJ9R0pLw6
 DQge4ybq6ncfqTTM+idzFUr5SwtAexN/fuUgzVUSm8npMOoq8VrUbEvXAVMyVhvjoAHiuQpqFOmEg
 nWDlvYHvkI9uiEQHNFKZYyVwWUl8M+f7vgHmTIZYOyrkT+zbcSA+wdV3u1KiC27531O8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l8P4LiO96AU70qR/laRSg5gCbmzlW0fQ82FdUEyjHoc=; b=JVoQ5XA228AEmS15kJ1Jc5D2Fk
 IusvsjdAu8KlZr82Ddq7Auz5Qk5s4Ezr7eeXqVDeYo6GvK2HeAvL8hvgtFfEpy1E3BkgxxkLJaOcw
 4EDYOWI/vKsPllYBrn1LsAX3U8P09rLS1uY0oDqYu34nGuVjGPuoaPTAarsx/kfHxsCI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p8omu-00088s-ML for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 20:37:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F45B61EF9;
 Fri, 23 Dec 2022 20:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E024EC433D2;
 Fri, 23 Dec 2022 20:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671827819;
 bh=5f4h1JTh7Ym7YmoePqqN9Pp+PtyJBLUnyId3SNpncmY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h7bOrmUW3fhnTg+x+VidhjcdnxirPqapDdU+dX0eyaJNzRUfcdaufj8eyUp+calwr
 OyiNLgf+6HE7ok378y0UR8FjTJQQu/V1DznM1pWjOE7PgLXgsQgDWeugloXgdPG6FA
 tPb0VywVIDEM6DExy/uSrjb19zUJCNWhJGbf2V8HDg4FS1IlcP6Cms9Te/6XFL+s3y
 8V4j2+7KcN0CTZrn6OOyi+3sqCmbbhvheg/VTaVhJlZcpX/BEPuy2RE4B+/nY9vrQ1
 LlO0ZdiYXFtYTYnXitWhSrTkfxHWDzYdq1mLc1Bdr1nOP35niVNWtEsAM32+mIeGR7
 VSxlsvBM+b0bQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 23 Dec 2022 12:36:35 -0800
Message-Id: <20221223203638.41293-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221223203638.41293-1-ebiggers@kernel.org>
References: <20221223203638.41293-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Now that the
 implementation
 of FS_IOC_ENABLE_VERITY has changed to not involve reading back Merkle tree
 blocks that were previously written, there is no need for ext4_readpage_limit()
 to allow for thi [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p8omu-00088s-ML
Subject: [f2fs-dev] [PATCH v2 08/11] ext4: simplify ext4_readpage_limit()
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
Cc: Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that the implementation of FS_IOC_ENABLE_VERITY has changed to not
involve reading back Merkle tree blocks that were previously written,
there is no need for ext4_readpage_limit() to allow for this case.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/readpage.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index d5266932ce6cd..c61dc8a7c0147 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -211,8 +211,7 @@ static void ext4_set_bio_post_read_ctx(struct bio *bio,
 
 static inline loff_t ext4_readpage_limit(struct inode *inode)
 {
-	if (IS_ENABLED(CONFIG_FS_VERITY) &&
-	    (IS_VERITY(inode) || ext4_verity_in_progress(inode)))
+	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode))
 		return inode->i_sb->s_maxbytes;
 
 	return i_size_read(inode);
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

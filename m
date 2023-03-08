Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B446AFED3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Mar 2023 07:18:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pZn8I-0000eP-Sm;
	Wed, 08 Mar 2023 06:18:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pZn8G-0000eJ-TX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Mar 2023 06:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xSGzKbFH0oC/Du8jv4xu/GF57Qa5JSV1TOJecvwLV1M=; b=TgEv4LiBPEgNnoo8cVo6gc8tCo
 CXMULy3Q8f2j8H54jCgjI3jRrNL6AJE6GrP249VfACX4+WhFxssJ5LmH8gSZZPVax7AYzWEVmeiVK
 7hSnA5y13sAL6lzCG7tXZajYqfz8+ERrBKAlVATAiR5N2oetx9hVDIH7zA0Hhn8C82/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xSGzKbFH0oC/Du8jv4xu/GF57Qa5JSV1TOJecvwLV1M=; b=O
 0GHVgjaD4CL2ensgf2CKq5LIugHpFCdtJoM1M3IkE/Sf5t4m8vJjcLUE4U3Jf1WyR5rkTUr3Rq5vF
 DF43kMM72cZhBB41MlkNZyyTmmmh44AqksTUr0BH4OvCKlMeIz1/0TqePzQfbfrkoA6kmP/b7fi+t
 OpVarikuWX+OTTRk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pZn8G-000Qht-SL for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Mar 2023 06:18:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24C5D6164F;
 Wed,  8 Mar 2023 06:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5297FC433D2;
 Wed,  8 Mar 2023 06:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678256310;
 bh=71aPwkLQex1x+QJiLQLCx21XaqRi77OvXFklt0nE/KE=;
 h=From:To:Cc:Subject:Date:From;
 b=Wh69IBPHpiAWHCRdc7XGE9n8/3JloJVAPmdaCATTPy7SHhDBWNgYKxbHQAU54U1lm
 maBxoRoSsuxbHxhj7slzRSRmwww2Z6pIKPwxyNPJtLd+arjC09rULc4mmn2cbN39H/
 Bvt+8PUuvzp4wKYKNly6ufa4VQmvQ2k7TyvEhbaECTKv9Sg3E3hfqSwBgnqBRa8Bzy
 vC4allIJ6HIzjfNwAdyhf6c5WO7vDydIokwoJcc5gD3gkJCptk0GvzHUxVpuasHjoR
 ghENndS5CCqEd5PMVw0NyWP3pEfyQOCR7goG/9TgXY7m86TMMnXNqWBYdk15BxdiPE
 Rl7ISFoRSasGw==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Date: Tue,  7 Mar 2023 22:17:46 -0800
Message-Id: <20230308061746.711142-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> commit
 844545c51a5b2a524b22a2fe9d0b353b827d24b4
 upstream. When writing a page from an encrypted file that is using
 filesystem-layer
 encryption (not inline encryption), f2fs encrypts the pagecache page into
 a bounce page, then writes the bounce page. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pZn8G-000Qht-SL
Subject: [f2fs-dev] [PATCH 4.19] f2fs: fix cgroup writeback accounting with
 fs-layer encryption
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

commit 844545c51a5b2a524b22a2fe9d0b353b827d24b4 upstream.

When writing a page from an encrypted file that is using
filesystem-layer encryption (not inline encryption), f2fs encrypts the
pagecache page into a bounce page, then writes the bounce page.

It also passes the bounce page to wbc_account_cgroup_owner().  That's
incorrect, because the bounce page is a newly allocated temporary page
that doesn't have the memory cgroup of the original pagecache page.
This makes wbc_account_cgroup_owner() not account the I/O to the owner
of the pagecache page as it should.

Fix this by always passing the pagecache page to
wbc_account_cgroup_owner().

Fixes: 578c647879f7 ("f2fs: implement cgroup writeback support")
Cc: stable@vger.kernel.org
Reported-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
Acked-by: Tejun Heo <tj@kernel.org>
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c63f5e32630ee..56b2dadd623b2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -464,7 +464,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	}
 
 	if (fio->io_wbc && !is_read_io(fio->op))
-		wbc_account_io(fio->io_wbc, page, PAGE_SIZE);
+		wbc_account_io(fio->io_wbc, fio->page, PAGE_SIZE);
 
 	bio_set_op_attrs(bio, fio->op, fio->op_flags);
 
@@ -533,7 +533,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	}
 
 	if (fio->io_wbc)
-		wbc_account_io(fio->io_wbc, bio_page, PAGE_SIZE);
+		wbc_account_io(fio->io_wbc, fio->page, PAGE_SIZE);
 
 	io->last_block_in_bio = fio->new_blkaddr;
 	f2fs_trace_ios(fio, 0);
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

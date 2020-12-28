Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CE82E6A24
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Dec 2020 19:55:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ktxgG-0000HR-TN; Mon, 28 Dec 2020 18:55:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ktxgC-0000HC-So
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Dec 2020 18:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KZOfmF8UiMDBPQ4cWz4LK2NmU2gNSCctfPCuTGD5lNo=; b=YTU/shR5UVM+nrbxtOFRZvYJYB
 XH9l1mbyb37Bmmc9B25XqrpfXXnbKVCzTedksApj0KuUloWLbspnbcd4SW32DyAS4MoHLrm6kJmSy
 s/uBsRDS6NSNmkKigFDt03PnFAiHtFvBHObAmu5m3+9EJzmpehlZOhF00pgJr/RsBx78=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KZOfmF8UiMDBPQ4cWz4LK2NmU2gNSCctfPCuTGD5lNo=; b=ICSieYE7P+hmnto0/qNT+lcJDT
 GF68hYGLDcshLcCf14ooVRKnm2kY8OW2frn59eT7+ZjdEE78SMeaeTEZoL2qjE6INGQRjelEiUKDW
 Y7aaX5fAgHybgew+SSZqlOA4I9Hwz+NbKEf68Orac4ZfBz6t5LkVmu55Z5ERGdo6iIAA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ktxgB-003G44-B3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Dec 2020 18:55:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D183A22AAD;
 Mon, 28 Dec 2020 18:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609181729;
 bh=Qv8XPvD4Whz8DkvwGwAf7mmtYtvGPNNWzNeowimMGrM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k0LLBzMoZ0aHGfOBsg3ITTIW0dgo1gTH+nM+OngQXse5z6gWy3lvNwUyvKs6g+p9M
 WRElB9XR6KPx8r9J9nxTkurn05YA7qHcQ8c89ve1zpJp3m1+uT89+1x2bueSLqkNHh
 3HR9gG6QzcO36mQf1mr1IToFU2ia1oxP6TB107pAeDSlI+9XNgChm5GGD0xvh/uIYP
 5Cv8F1LqjQZ3fb4/NkaXYU9ekLU9g7lHPVkOVRgpEDP+A6Y0ATp2yUuULup5HwyMG5
 4/fQRDmYSPSMECifsZACf/4Fp0VnZXeIUJsGi86UuidY7mBk5IlZQhBtlsqlzYp5w0
 GF1YPOknLE9nA==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Date: Mon, 28 Dec 2020 10:54:31 -0800
Message-Id: <20201228185433.61129-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228185433.61129-1-ebiggers@kernel.org>
References: <20201228185433.61129-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.2 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ktxgB-003G44-B3
Subject: [f2fs-dev] [PATCH 5.4 2/4] ext4: prevent creating duplicate
 encrypted filenames
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

commit 75d18cd1868c2aee43553723872c35d7908f240f upstream.

As described in "fscrypt: add fscrypt_is_nokey_name()", it's possible to
create a duplicate filename in an encrypted directory by creating a file
concurrently with adding the directory's encryption key.

Fix this bug on ext4 by rejecting no-key dentries in ext4_add_entry().

Note that the duplicate check in ext4_find_dest_de() sometimes prevented
this bug.  However in many cases it didn't, since ext4_find_dest_de()
doesn't examine every dentry.

Fixes: 4461471107b7 ("ext4 crypto: enable filename encryption")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20201118075609.120337-3-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/namei.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 36a81b57012a5..59038e361337c 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -2192,6 +2192,9 @@ static int ext4_add_entry(handle_t *handle, struct dentry *dentry,
 	if (!dentry->d_name.len)
 		return -EINVAL;
 
+	if (fscrypt_is_nokey_name(dentry))
+		return -ENOKEY;
+
 #ifdef CONFIG_UNICODE
 	if (ext4_has_strict_mode(sbi) && IS_CASEFOLDED(dir) &&
 	    sbi->s_encoding && utf8_validate(sbi->s_encoding, &dentry->d_name))
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

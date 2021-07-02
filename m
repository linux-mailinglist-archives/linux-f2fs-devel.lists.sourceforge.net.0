Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2933B9C93
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Jul 2021 08:55:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lzD54-0007e8-TU; Fri, 02 Jul 2021 06:55:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1lzD53-0007du-TK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Jul 2021 06:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E21lKequCXZtw5YzrE4jS3OdhQNVb6evsMqWwIKI3+E=; b=j04w7DmFebwhseh55HAQRY32ef
 16JQ3N01jsDu4t69x3rNtMVC4FuuNUnEYStiXK6F10uaiz8shwUPXWSWmaj5CAKaeYtgB07ODI/nw
 LYzdQcS47Szxw2dullsosbIt7M9ARvJlHXNy+bunbpC1vNX9+GIEvmXnlA26zfc3jTv8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E21lKequCXZtw5YzrE4jS3OdhQNVb6evsMqWwIKI3+E=; b=cfqnOEXx/6EUfckG1yHSzBMf5U
 /746OnEDG9u34u3INDqr2Zfg7krBJV6chVSG33fhpgxDdIvjDLsEK0d1KpGxfFtkyxXcHUAwsVBaN
 0Zh1C6L44kCMogaIsmRs402wFyE2MSfb6NYM779Fj+Tuffn/M73KwmyHa/A4zRrlz+WM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lzD4u-0072xK-Pc
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Jul 2021 06:55:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1F366141D;
 Fri,  2 Jul 2021 06:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625208892;
 bh=ayeoPIhe+1s08/UaNpC3a37YFzxNe7bjxypfKHgUNos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M6Yn1TVluxIn/JJFYkOy5+lRoF9vC12KdanEUnM4zrAZOprYGMps7cdmMLWxJavhD
 mMsIbETp12zPxypnUK3ATnelRJfK/ziY6z+UE8cqwU6O5PwhfIgQwQoU14hm6uLind
 jSCdBg2kpZbttNLOu6/+b5gWEVfB37pTDtV2r6pwVIqmr9j0vEv/C8lO6rTVTUJE70
 vWyUq6mQq8ieMYQzHcrz86OZ2WaGZO9Pqf0r5et/J7ZN9XolFqdOt3blxktv9kqDMn
 X75GJK3n3UB3SvY/yPEU/IFeYTarVVr3ncwxhxGL9/z3fyGvleNhmJpv0MU5ie0DPm
 ykMU84u2xEGUw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu,  1 Jul 2021 23:53:50 -0700
Message-Id: <20210702065350.209646-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210702065350.209646-1-ebiggers@kernel.org>
References: <20210702065350.209646-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.0 (++)
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
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lzD4u-0072xK-Pc
Subject: [f2fs-dev] [PATCH 5/5] fscrypt: remove mention of symlink st_size
 quirk from documentation
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
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that the correct st_size is reported for encrypted symlinks on all
filesystems, update the documentation accordingly.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fscrypt.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 44b67ebd6e40..02ec57818920 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -1063,11 +1063,6 @@ astute users may notice some differences in behavior:
 
 - DAX (Direct Access) is not supported on encrypted files.
 
-- The st_size of an encrypted symlink will not necessarily give the
-  length of the symlink target as required by POSIX.  It will actually
-  give the length of the ciphertext, which will be slightly longer
-  than the plaintext due to NUL-padding and an extra 2-byte overhead.
-
 - The maximum length of an encrypted symlink is 2 bytes shorter than
   the maximum length of an unencrypted symlink.  For example, on an
   EXT4 filesystem with a 4K block size, unencrypted symlinks can be up
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8807739C28B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jun 2021 23:35:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=79MUv9z7/2Uokx6+vOvB9liPN9KpsSzdXkQ5bx/X0r4=; b=K4yaIQ0r6DFFzduOZDTF1SmlN
	7rzWB8HB5KaND7lD5rFTAvInnQIN0txJRUXOLly49fNFcZoO8zioQaWrvzsvGghObZqT/WR2Grujf
	b2XB7ov3h3WQ+eXwvUGKtSSmvbkQAa04YndJ94RqaO65vgp0CcYx7eiDxTOwXgR9k7Kvc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lpHTw-00058K-8t; Fri, 04 Jun 2021 21:35:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <3hZa6YAYKAKgaIbgIbOWWOTM.KWU@flex--satyat.bounces.google.com>)
 id 1lpHTu-00058C-Eh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 21:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P+DRV+1kr28zVJ/U3wDOfdSPd3HkANrRfuFzxqlC4Pc=; b=XRK4GmIfhie/Whh2mH2Q14RQG
 yhC1pCToqqFM/Nr9Co+gzJhMZFv6XVeP7pkjS7mkUmIlcNe5wXYdZRBk+0BXZ4T0vNtXnaaffyoAj
 fmSbcVM/dEnwxxQAtHvqBLQQokKzmGgmAsp3bHfyvddUBQ1mwVWQoRdeamde8sALsZayY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P+DRV+1kr28zVJ/U3wDOfdSPd3HkANrRfuFzxqlC4Pc=; b=PxLtL19sL8Jqu1bI0Y9o7ToO7d
 g680Q81G8KaoQZ++ht1tUcSZzjnOMbAtTbfwGDY5SHHGEQBXc3D7oVczpw1LRnBP44PIEOXwKWYn3
 xUiCZV+3NpqKJOnkrNiNleh93YcqZolWQAZzlG4vbwcQmFEMaHg6PCYh6MXeJMI8sPUI=;
Received: from mail-io1-f74.google.com ([209.85.166.74])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lpHTi-00AsOk-Qs
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 21:35:55 +0000
Received: by mail-io1-f74.google.com with SMTP id
 r2-20020a5e95020000b0290435b891bacbso7053510ioj.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 04 Jun 2021 14:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=P+DRV+1kr28zVJ/U3wDOfdSPd3HkANrRfuFzxqlC4Pc=;
 b=BD3ZmfBd88tZgrK5VWyAdL43R8ifUsR8x6sFdE82nRuDKynYAWDrzE4ViAPmykHBE4
 iyytiZIYdAESIcvzY6xdWybqTUGCNisGZiXWYfKieKbymZmV/yt7zvjY9NFl3juibb/s
 ikEDpwDO3GTB7QBr/5PZz/yTynDJQ+EVyDbqXYxqVspW4jHjr6GfHmb6aePCiI+9M6Vd
 nAWhQ+RRLTv2OXSWhOZSnRNx4+nvq3NfPSSnycc4sLlhRuBgnNb++2d32IlTONdzLlpM
 5aRbbSRXEHIXxwZ6wYXd6/i1swYlGsa4c2M1WAwUuXtMLF2EffxUpGOmrT0pPALk2QKG
 mb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=P+DRV+1kr28zVJ/U3wDOfdSPd3HkANrRfuFzxqlC4Pc=;
 b=l0SYkTquwrg/1SGxfqiBP/tcRxUngTZWCj5P/zILBwTZIEZnjWcKaeM9aHAjZg3YKq
 ewEW7m87UyQmSpknZUx1giNA/VuPRaJ09uPaYOQDnG/2JD0olGh2w3LfydthIDdtixVV
 0J1qwkT5W14AA/b/PckYfIxWQu+RmnK3fSbQC4WLB0xSYl2GKar5mk2wdxqd7MUItql/
 YidfI/ZnNK9LTUbiZqovcVT29MkrS9yZIEycbOlK94I8WOau+ZDfURq0pqIy/zUMMlCF
 aKH4LX0DUgx0JPyTsEkfg9fE/2d5mV6EoDb7rC3bpP67xsZ247ME7XDAqpdMaB66dLn7
 hlkg==
X-Gm-Message-State: AOAM53177vRrlTfT4+stabisjnHBN7Uy7y1jhV2GTVkzNg672NlczHAz
 eN0GwarsJuUCHh+4lZ9ZQSEptoVZaVg=
X-Google-Smtp-Source: ABdhPJxmL8KM/5Kv0n8tQo795U2DFcdkGRAYUhSqHM6sj42QWQ+C3ACMCn3W2CeCnI48cqnYWj3LpGGCTK0=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a63:1e55:: with SMTP id
 p21mr6828807pgm.412.1622840965137; 
 Fri, 04 Jun 2021 14:09:25 -0700 (PDT)
Date: Fri,  4 Jun 2021 21:09:07 +0000
In-Reply-To: <20210604210908.2105870-1-satyat@google.com>
Message-Id: <20210604210908.2105870-9-satyat@google.com>
Mime-Version: 1.0
References: <20210604210908.2105870-1-satyat@google.com>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.74 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.74 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1lpHTi-00AsOk-Qs
Subject: [f2fs-dev] [PATCH v9 8/9] f2fs: support direct I/O with fscrypt
 using blk-crypto
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-block@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Satya Tangirala <satyat@google.com>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Wire up f2fs with fscrypt direct I/O support. direct I/O with fscrypt is
only supported through blk-crypto (i.e. CONFIG_BLK_INLINE_ENCRYPTION must
have been enabled, the 'inlinecrypt' mount option must have been specified,
and either hardware inline encryption support must be present or
CONFIG_BLK_INLINE_ENCYRPTION_FALLBACK must have been enabled). Further,
direct I/O on encrypted files is only supported when the *length* of the
I/O is aligned to the filesystem block size (which is *not* necessarily the
same as the block device's block size).

Signed-off-by: Eric Biggers <ebiggers@google.com>
Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c83d90125ebd..a416ea3a1a04 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4181,7 +4181,11 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	int rw = iov_iter_rw(iter);
 
-	if (f2fs_post_read_required(inode))
+	if (!fscrypt_dio_supported(iocb, iter))
+		return true;
+	if (fsverity_active(inode))
+		return true;
+	if (f2fs_compressed_file(inode))
 		return true;
 	if (f2fs_is_multi_device(sbi))
 		return true;
-- 
2.32.0.rc1.229.g3e70b5a671-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

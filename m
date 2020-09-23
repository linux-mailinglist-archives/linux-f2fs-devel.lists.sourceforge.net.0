Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4194274E88
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Sep 2020 03:37:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZNUJlf75FLJ0N0z+SZ+wihdt4qrHdwXe8bb0ib3xMFE=; b=fv49vFfw0/0rGYIOFISG2PhDt
	IoCEwSL0KQ/eoA0CA88MVpVgLZ/f6UyMs8yRCsMYt5KHNPrTH32tJRqCRNBvU+fsZwJo70QVEpmKZ
	HFpUrsqGBYKdab5s9KN1hCRd6PYSlqdnHJC4X6wKYJagCS7GsAnR4rqD2Z9105UypaTJg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKtic-0003HQ-B2; Wed, 23 Sep 2020 01:37:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3Q6BqXwYKADAPdaeQZSaaSXQ.OaY@flex--drosen.bounces.google.com>)
 id 1kKtib-0003HJ-D3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Sep 2020 01:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Iygja5AJutfHm4YvnlwM0dTYeIXTivBw9HNzBAy37AM=; b=J6R4XgHdi3XygmeU3TrRvwxM0
 l68JIRJoYdRJ+yMeR1ZD/S+3P6wZY9IE4EmeSc3aFxIaLpDbyJ82ULQRMAl4w0QH9Gi27AVBsJuia
 gYIXmAzdVVsNS5VyVynQCRIU/2bCOf0Zu/v2LB9DGiKeWN8eRksfoiVKZAqWEMbPWkGGc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Iygja5AJutfHm4YvnlwM0dTYeIXTivBw9HNzBAy37AM=; b=lQCzS3v9XqpIyDrUbYDqHRi8yw
 8xiV6daSRxzGMo22E3/KfYd76kFrLOzpAHu9P3L3L2t3JAZvzIE5zsSWlF66jHkDfEfYYcsjXyfVO
 Z/AgiuUzarodlomVkBHT2yNFCL3PYX0AH0FYMFqlMh54xpVAxpBhLgbWKiJ8/rxuBuBI=;
Received: from mail-pf1-f201.google.com ([209.85.210.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kKtiG-003sNj-Du
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Sep 2020 01:37:13 +0000
Received: by mail-pf1-f201.google.com with SMTP id c197so12703177pfb.23
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Sep 2020 18:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=Iygja5AJutfHm4YvnlwM0dTYeIXTivBw9HNzBAy37AM=;
 b=uuOUEWPHZPuw+wZv2NxYlk5b4qARvVhk9l5VutTgoWWyZcZuyFizEpd19JZZxiAyOb
 N8d29un2MtSSLuDqVDdx9nztGjWduT3vGmFgDh4JHNW7EtDxLNSGgrYx1Rc7lzW4b3I8
 sSdyPuacc0AOb0wygCNqd6lnNi9/DX4DMjG3C2FBiP1Pu9EdYhx1oFuiAV6dTxk7Siks
 /ElKvk36qbnET7SIYDn4ZKBN7NYUpL1HndaHubTYMsiBJU2Z2BhnhFlzXILr7DkR/VMK
 WQG+cZoJpfNOQxgiYQTj/NE4KPzx1aIFC1HCVvXnLQbft4QsCMTIFurk39tiFbW3k595
 L4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Iygja5AJutfHm4YvnlwM0dTYeIXTivBw9HNzBAy37AM=;
 b=Rsm4bvGMYjaaIc99ekcm/yDwvSiXCa5iO8nS4o+OpnB8lY4Yhj26Gp1MDAqcyH/TmZ
 cPodZNcHTQOqXUB8VqAgL2m+vCWBI6LN4PXFXFR/4GeimTH7dBrc42fbcHGBbFao+jaR
 nxQwJ/oxuBD+xQrbARKAThzXSSpme9rcydgwScLLT+d1zQcs/EZ7zDKB09831mC1JPN4
 BRO8eukGnQcIrrfVLU7tofA707f613m+rYHIrCc7rqGZwlyhH9TbNaoFD7aQXtnsKw2H
 rIGMhj84pDbElk8HRmGZ5uBpM8zx4IDkjNNHKQPDrt0o3gb7ZY7oWbgxYGhUuQewg+k5
 zM8Q==
X-Gm-Message-State: AOAM531JUpD+RAMNyYH3PPZzrgsos5bkrIH1cuc+Hai+9puX0uLoKaEA
 C0hFr8AfudgC7z49+R6hOdGsllZJyQ0=
X-Google-Smtp-Source: ABdhPJweQ2fLHpSG59qNGPeo45kVpwuKLLDae76QKJ3/73ksJ2F3VdQo0rXG32bWWdxvVzGJGgieliFiQ6Y=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a63:c34b:: with SMTP id
 e11mr5777378pgd.25.1600823363879; 
 Tue, 22 Sep 2020 18:09:23 -0700 (PDT)
Date: Wed, 23 Sep 2020 01:01:48 +0000
In-Reply-To: <20200923010151.69506-1-drosen@google.com>
Message-Id: <20200923010151.69506-3-drosen@google.com>
Mime-Version: 1.0
References: <20200923010151.69506-1-drosen@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.201 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kKtiG-003sNj-Du
Subject: [f2fs-dev] [PATCH 2/5] fscrypt: Export fscrypt_d_revalidate
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is in preparation for shifting the responsibility of setting the
dentry_operations to the filesystem, allowing it to maintain its own
operations.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/crypto/fname.c       | 3 ++-
 include/linux/fscrypt.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 011830f84d8d..d45db23ff6c4 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -541,7 +541,7 @@ EXPORT_SYMBOL_GPL(fscrypt_fname_siphash);
  * Validate dentries in encrypted directories to make sure we aren't potentially
  * caching stale dentries after a key has been added.
  */
-static int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
+int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
 {
 	struct dentry *dir;
 	int err;
@@ -580,6 +580,7 @@ static int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
 
 	return valid;
 }
+EXPORT_SYMBOL_GPL(fscrypt_d_revalidate);
 
 const struct dentry_operations fscrypt_d_ops = {
 	.d_revalidate = fscrypt_d_revalidate,
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 991ff8575d0e..265b1e9119dc 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -207,6 +207,7 @@ int fscrypt_fname_disk_to_usr(const struct inode *inode,
 bool fscrypt_match_name(const struct fscrypt_name *fname,
 			const u8 *de_name, u32 de_name_len);
 u64 fscrypt_fname_siphash(const struct inode *dir, const struct qstr *name);
+extern int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags);
 
 /* bio.c */
 void fscrypt_decrypt_bio(struct bio *bio);
-- 
2.28.0.681.g6f77f65b4e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

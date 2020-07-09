Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C3E21A811
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jul 2020 21:48:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e0uFkhkHz6qbqNdpzhp4jHC7hRcmbTcRYwowoCmtUME=; b=YFia2eEzE38xGihZWwC010fza
	ewmyZ8oiELK2fpdH47lsTbOCCvTUHlzqofq+7jdiyMU6p487fGzcRet7dluYboqEHvpaXXhTJVuql
	p3ZaFmdMSC4ygE2hXn0zQOoo7b6QCA3TUocYfSj/rfJNZdUCXxZyWtzL7SF/TPBw9bqCg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtcWi-0007AG-Ry; Thu, 09 Jul 2020 19:48:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3dHQHXwYKAHkpXqvXqdlldib.Zlj@flex--satyat.bounces.google.com>)
 id 1jtcWg-00079z-Vk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 19:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8aV8dCnXtWjQg88XS3xPlXLAc+zOek3bqtseJMfDQ8w=; b=l8sgW3H7S/dlZfhwtguJ9glCS
 4/6RKL4NndwwJU7FjLqfwpXHM7ta92EGNUNcL9MyR3jit1cxnbtyFfQBXJVuDadgIJtsOKS5mtUPn
 EPGBvMsQ27LKzD1MkKSRjA+mm832d22AvWK4JiS8uvVZTGqwk8WsE4fyAWe3aaQTpwV7k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8aV8dCnXtWjQg88XS3xPlXLAc+zOek3bqtseJMfDQ8w=; b=duXcI/+0H1Nxh6+LpnwdPAXQLy
 HI1rScLifgJZT0Edyv0DxyYe32ORqm4bwZTEFuKa6T9s30C/wQzVZKVEbEmSS7WDi82O+x6eW6NHz
 zMLtGjBGO0O33WCnG4tFdlHXpDP6YZlb+ydiHPP3D2PY5u+uxDH8TfQ6xlla5FeCKsbQ=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtcWf-00CUBs-Tq
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 19:48:10 +0000
Received: by mail-yb1-f202.google.com with SMTP id s7so4121447ybg.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 09 Jul 2020 12:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=8aV8dCnXtWjQg88XS3xPlXLAc+zOek3bqtseJMfDQ8w=;
 b=n/RhV/jx+TfIUyZEOgxV3/59HC7DmDgP2fFHs9KJ6uT8Y/c9BmryDZ6OS48cFc2fqs
 TiR7FFxJ/P7YhcosGFO3tylYEdj+BoEQmRBg8FEQMEky9Rm7jtA+5D0rcALnSVHwXnfK
 nBDNqzuk3M3zwBj8YcFMlB0fUuQEI44285Bw8Uli43Zzasc8aEe8NzunSZGzlBeidW4X
 NocTmLAWIDEIUWqIvRzXdCKx/WROIfOofognfNWydIrK2Ct5JqacT5pfx7r7bw4OgLki
 X2JyldU8RVZfG4NyWJ1tkoQXa1aq8I7zauOqoi5d9wG5qRRu3YK/sO6rc5yYIJFmtmCv
 48lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=8aV8dCnXtWjQg88XS3xPlXLAc+zOek3bqtseJMfDQ8w=;
 b=rX553ryH17kyeYwISVWVGhLe1MipOS0HbM+oIvJ32BHfHRxleXkHlwJRLxkbWTpvMq
 crjTKTmq7smKw0eykVLCv5FS9MOxyi9t45xtqEOZ6od8ItsHC76d0FOaM0epRspXAEqb
 kCVyhlLnVPhXEMvh4BSk71zKPKG3p8jFtnQ1FdOnXOvJe/cHZ70+Dpi8Ax99liWNcTgS
 iQ3RCEW4tCedWFvhhgQe3AJGfWEgZffei63qlbFQFCQUeJJ90ometp6HkniwTy4x0jUH
 g8epv/KCskSIUmWSK2ln/rplX2yTAWr8OKdveX2mwTDt0JKtoiNxAexD2p7qHKydXKjY
 +h8Q==
X-Gm-Message-State: AOAM533CZx8e/i8Zytfq4OUS/xka4AgedIacD9VjFEiPkDuqUipTyweJ
 CE+QSiHBjDJ49ltlsguHIVqexsjDcV4=
X-Google-Smtp-Source: ABdhPJzr4fyHtEPxxGa/1oyxhYhm2fG5/oqmJ5MeTeSHxI205PX0i6Oqf4DnZTvfIEvI68X3kJYfz/lkbU0=
X-Received: by 2002:a5b:2cd:: with SMTP id h13mr57148875ybp.319.1594324084188; 
 Thu, 09 Jul 2020 12:48:04 -0700 (PDT)
Date: Thu,  9 Jul 2020 19:47:51 +0000
In-Reply-To: <20200709194751.2579207-1-satyat@google.com>
Message-Id: <20200709194751.2579207-6-satyat@google.com>
Mime-Version: 1.0
References: <20200709194751.2579207-1-satyat@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtcWf-00CUBs-Tq
Subject: [f2fs-dev] [PATCH 5/5] f2fs: support direct I/O with fscrypt using
 blk-crypto
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
Cc: Satya Tangirala <satyat@google.com>, Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Wire up f2fs with fscrypt direct I/O support.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/f2fs/f2fs.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b35a50f4953c..6d662a37b445 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4082,7 +4082,9 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	int rw = iov_iter_rw(iter);
 
-	if (f2fs_post_read_required(inode))
+	if (!fscrypt_dio_supported(iocb, iter))
+		return true;
+	if (fsverity_active(inode))
 		return true;
 	if (f2fs_is_multi_device(sbi))
 		return true;
-- 
2.27.0.383.g050319c2ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

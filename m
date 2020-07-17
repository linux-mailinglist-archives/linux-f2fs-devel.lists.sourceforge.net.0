Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD462230B1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jul 2020 03:46:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A7stB+XvJQD9AyrEk//33puP/mjMPyYAUzuyXimKBu8=; b=LiNydI5MWdnIbxWE/JBWocvG0
	Kya07KiiTQfMAIlYx43lEqN/qBUNBNK+PSGmJOc/4MZE1GVPQcuawJtRzLGUWSbISJhu+VNq4YoR3
	um8txy542/3ms6RSnlLGek7clqKOzpKDXkgFCdvxWQW8/yzFz5DMoI1ZAJKqeQxosq3z0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jwFRr-0002yi-IO; Fri, 17 Jul 2020 01:46:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <30gIRXwYKABsJ1KP1K7FF7C5.3FD@flex--satyat.bounces.google.com>)
 id 1jwFRp-0002ya-RJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 01:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M2BARCIgcttWxNELPw4zNOFpxD9+a8coXLhy2/p7EJA=; b=TEmCSSewQzcyIbAjq1uwZ5mq9
 UOMPQZcCsQNdcLazETGgvqxPbrhVdsxW0m5Ti2ftNHOBC+y0vDhn4OXHRHVpVj4O5K9xUkvzpmd4A
 VntmoptX5sgGNCw+9I5hxceGNfmBg1XF5YMOQeoqgDHy+hken5ViVDXdnt7+xy8+oR7WI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M2BARCIgcttWxNELPw4zNOFpxD9+a8coXLhy2/p7EJA=; b=fq646cLb5b8GdprYnB+ZUMuEDf
 fFC1U6gZDAa7t4+sFge7w3nNzFjJp3QU9m3d9P/KZnBML86frSMwQgpoa2tlbZ4UHAyEjkypHyQ2H
 wHyhJFRlSVZL52+org2jJKhpqKd7VcQkgVYfdNaTUA7ofqp98duVF30tJ3iZAhO4oI0Q=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jwFRo-00BM36-3y
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 01:46:01 +0000
Received: by mail-yb1-f202.google.com with SMTP id i203so9535052yba.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Jul 2020 18:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=M2BARCIgcttWxNELPw4zNOFpxD9+a8coXLhy2/p7EJA=;
 b=IuienX4mga40GmSRRKzTF+joRBlWaewlilX9kK4DbxKVxKtc0HgNzNmwzCZ1zOSkZS
 /sl4RwiktZzyDIGk22y0rBU4/6to0p2Mb+0sHuOgVc59Of+mmEYUSL/X8GIx7S9N2g7k
 AAsNYq+yOp1P9y/M3dpmzdp+iTmYeg60KNpHeU9Q4DinrRedG6NGSsYmC3G3+ZszcxWF
 iiLyYi1e8fZMhBIQmpfrA1eMen9sCtNU9W9nDP6q6QwGvJa13W8tY3dxZyWvEvjE0cyb
 7vhn6iWIVWyfKhLFtLO/KNWOxq8m9tNiM/Xk00LgFuq+iUFipff48yn3YZCVEhX9KuBH
 cXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=M2BARCIgcttWxNELPw4zNOFpxD9+a8coXLhy2/p7EJA=;
 b=JwNBGCLbjbJKg5rQJ8JbMKCLRqQ4/VwMwbnHgTgkVI/uT4a5UcgYW5+7nmapKKi6fT
 eW3tr1YLJQzd3uT0hKIG8vBXAGoiT7fWmWm4A2G8MV8mAU/tjoZCeAAzuFYS/ax7AfSg
 OYTVbMs43sKuz/7JjEmcemAm1GXYZ/kNXJbFTgtjgzu3Iug6TrTx4XeatLeNHAwe1rho
 Ad+GGBW3ZnKBJPpiuq4yDkb5jJHHJkfgQWgTwhNBEI5tB6sxKYiHGb768gYFYrX7t+TL
 C7kgJ9DCIGTFcxXEzQ1GBmJ38gm1ttY19Ha2wbQGM2aYUDZ62yXWJGflkyfptJCvY//V
 JZaw==
X-Gm-Message-State: AOAM533OaJvzli5zPSvo9aSUzddhICWIN80iDtAez9sGNI50zQRYtA3r
 iPICT4cSFuQrcXwmiGkCfECpXbSO+/E=
X-Google-Smtp-Source: ABdhPJxSclWXD3pWyzJ/EO11UCYSucRKXFbMR9YelueZjjlG1f9W2/r7ez0qwF6s0pIusA0evwMmb2iIxEk=
X-Received: by 2002:a25:3789:: with SMTP id
 e131mr10722971yba.417.1594950354393; 
 Thu, 16 Jul 2020 18:45:54 -0700 (PDT)
Date: Fri, 17 Jul 2020 01:45:39 +0000
In-Reply-To: <20200717014540.71515-1-satyat@google.com>
Message-Id: <20200717014540.71515-7-satyat@google.com>
Mime-Version: 1.0
References: <20200717014540.71515-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -6.2 (------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -1.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwFRo-00BM36-3y
Subject: [f2fs-dev] [PATCH v3 6/7] fscrypt: document inline encryption
 support
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
Cc: linux-xfs@vger.kernel.org, Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Update the fscrypt documentation file for inline encryption support.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 Documentation/filesystems/fscrypt.rst | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index f5d8b0303ddf..f3d87a1a0a7f 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -1204,6 +1204,18 @@ buffer.  Some filesystems, such as UBIFS, already use temporary
 buffers regardless of encryption.  Other filesystems, such as ext4 and
 F2FS, have to allocate bounce pages specially for encryption.
 
+Fscrypt is also able to use inline encryption hardware instead of the
+kernel crypto API for en/decryption of file contents.  When possible, and
+if directed to do so (by specifying the 'inlinecrypt' mount option for
+an ext4/F2FS filesystem), it adds encryption contexts to bios and
+uses blk-crypto to perform the en/decryption instead of making use
+of the above read/write path changes.  Of course, even if directed to make
+use of inline encryption, fscrypt will only be able to do so if either
+hardware inline encryption support is available for the selected encryption
+algorithm or CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK is selected.  If neither
+is the case, fscrypt will fall back to using the above mentioned read/write
+path changes for en/decryption.
+
 Filename hashing and encoding
 -----------------------------
 
@@ -1250,7 +1262,9 @@ Tests
 
 To test fscrypt, use xfstests, which is Linux's de facto standard
 filesystem test suite.  First, run all the tests in the "encrypt"
-group on the relevant filesystem(s).  For example, to test ext4 and
+group on the relevant filesystem(s).  One can also run the tests
+with the 'inlinecrypt' mount option to test the implementation for
+inline encryption support.  For example, to test ext4 and
 f2fs encryption using `kvm-xfstests
 <https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-quickstart.md>`_::
 
-- 
2.28.0.rc0.105.gf9edc3c819-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

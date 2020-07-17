Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE3322308E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jul 2020 03:43:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A7stB+XvJQD9AyrEk//33puP/mjMPyYAUzuyXimKBu8=; b=cwnfOqPCU3kU2gfnw1DTURvvP
	WspYCbkOYU/2eehX7sg/MoqgKL1kbCKNcb1tmmVZbJ3zb1bPOv0ez2gWoHklqq2jh6IYRTlcKT2Vl
	A155kFs/XWhi0BEXy4ecx/tCnKotVQEVbOmiNqF4dFRungD12YPwXilrfV3/pr4pV3plw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jwFOu-0001aD-AT; Fri, 17 Jul 2020 01:43:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3aAARXwYKAKsdLejLeRZZRWP.NZX@flex--satyat.bounces.google.com>)
 id 1jwFOr-0001Zz-5l
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 01:42:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M2BARCIgcttWxNELPw4zNOFpxD9+a8coXLhy2/p7EJA=; b=XrYOcRDHqAhqwjf7lzK1pPo/H
 QhaM+DJHEe22P//QlykRg6Cctf7rqigRRel/bJ92i8HmqI/T38yraenU7c6+98C+kM6L4PDsZbhZA
 42908DgW3nUGzLgj+Evez1Y1FtFkQF3w2lTiFq3AYQUOs8MKp4fDmjZm8vSfFPf7hs4i4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M2BARCIgcttWxNELPw4zNOFpxD9+a8coXLhy2/p7EJA=; b=HgxwQiQht5aIl2d77d1WsYaKua
 vKjvcQieI5Q2FI5UB0b44W0XJuxx5+85JhWvy3fzHudRMUkPjI9RTIH63zhNEMPatDRa5QuchD6M/
 HzBibZyyR2ZWX8J1AbmEBIUbN99QY02JnaWqP9kWHLAWXSs6mDbpqdyvDjW6sALvirC4=;
Received: from mail-pf1-f202.google.com ([209.85.210.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jwFOn-00BLtL-IA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 01:42:57 +0000
Received: by mail-pf1-f202.google.com with SMTP id v25so5800655pfm.15
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Jul 2020 18:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=M2BARCIgcttWxNELPw4zNOFpxD9+a8coXLhy2/p7EJA=;
 b=ScOd4eVdydlkWQWlLKjntUWKsksUG68MvUJTiQKD/1j4ez9IPtZHneB7t7Ah8qMNyc
 MHTRFtyHLSVQuzXvDGfcq1tmzfAdCtLSmZIu8QiLrxTH5oPYRpc6Xm8acH/i/frdbEfg
 qAGhkmd5lTbDuYireEzW2VFzMdyc3o3Ix94XFQPXLGMjKcpyqYukSAR/2bsRkAy9pBhB
 04thfYfEh36yMRz9fE7EiL6Rb5v/6cBI7oGtqnFqKH9w4ZHgI7/tLWdLQ9a6EuFnbIRP
 YWzo3NcnvBJXf0IanbogryzR0zhzkrtHOFHVCRcHUwUgvU/7rQQ2KBsuYyow/vQSkZkO
 l60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=M2BARCIgcttWxNELPw4zNOFpxD9+a8coXLhy2/p7EJA=;
 b=spUARswAFEwamq0jxQKhnBIyhtNB/coP0//g7ae/VTNDCj5JZIUuedYb0MdIC4iAlP
 0mTh0IHdqmpkSh2dTr8gXaK0WcSK/nc4cgLngmWF/FRsg0YXE8MCuWhQwPoZLOnmXEVU
 JpL6ylRyBBn4kh1lIVw3NYwbH3YFUDDbOSZXbLWFFnr5HgpVRqOdNy56zhp6CGZvtKoi
 Uz+7dbdyuZn/jbwtr5DJxqA8u4qjtKyt1nh/t2OoqukwRqIx19oJ2JdYhhNiv1asO/nb
 fquPiGlfS8N2aDH2bgEBA678v9p8Uh7zSGFI/WR2EfPXuqa3jZ0YQ6VwLX8/j95keITC
 WKmQ==
X-Gm-Message-State: AOAM530Lnd1mKG2zpkIZOVVmGfsorVoHI70Br1gPhqmcAZOz8DN9ixWf
 cW9Ai6DEsfz7YUu2S3fdYFaR4Eoi8YQ=
X-Google-Smtp-Source: ABdhPJwgAFskhvgfu4vtFSTvQKdAqkDng2ZY6RLfUv2eaMhfxGJSBKlELwg44/Lye+vEDWsHb/qZyTbtD8k=
X-Received: by 2002:a17:902:7008:: with SMTP id
 y8mr5639281plk.85.1594949736186; 
 Thu, 16 Jul 2020 18:35:36 -0700 (PDT)
Date: Fri, 17 Jul 2020 01:35:17 +0000
In-Reply-To: <20200717013518.59219-1-satyat@google.com>
Message-Id: <20200717013518.59219-7-satyat@google.com>
Mime-Version: 1.0
References: <20200717013518.59219-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.202 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -1.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwFOn-00BLtL-IA
Subject: [f2fs-dev] [PATCH v2 6/7] fscrypt: document inline encryption
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

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC8A2B6772
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 15:33:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IewiVz4W0jf/DW/Mlq0qPXJDnhw8qGEqsXSJWmAxkk8=; b=DcV0Q9DLfFr+D3r+itpIh/CQ+
	Zcm7rlO6SMitXIjWNaFehS4qCPbm92fNcR9Z8paI0h4dbK8jT0fi5bQ3ww5zfpINJC43lxEW17yJ4
	RBRzIhYWJJea0nVpkAxfZr1xnxZiU4E6Hamcq2LT47IkhZxpcAypicXYz8jKMqFcvwbY4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kf22f-0001ID-3n; Tue, 17 Nov 2020 14:33:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3LdmzXwYKALIkSlqSlYggYdW.Uge@flex--satyat.bounces.google.com>)
 id 1kf22d-0001Hp-9f
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 14:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yJkkPo7d0J6NtmBv7rzIbrBkhqskC5NsYDTAoyAGSwU=; b=EHsUAFgBBDavzHCzwPfJfrKaV
 N1W9YP03Ygdk4u4bAZ7o9PxaFVjoy/iroJxikeCbrTNFbQ/raWzU8S88Az2FspTQwccPSP1SsPc/O
 RUrIaF2k6oG8H5bZCa/Nsqk3PKsBsO5pjqAqB/uh/od2UG5s1mGXSHsV7KWCZsCIUrhLE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yJkkPo7d0J6NtmBv7rzIbrBkhqskC5NsYDTAoyAGSwU=; b=LvP5OYmXt5A5HQZNlBwLOuOV+U
 kOOyqip6llU13uyPAhrS4fBeahfAUVoVqL+7aMqqd/6n5Yy7iwvSbtJVI8LlQcAXNVaxeugeUXjFx
 iHbPbCnlnbSU73wWLkXNwblE7czojpxOAFOdb8s87j/5Mvs81am2r/C9q+Vlp+DiXPC8=;
Received: from mail-pf1-f202.google.com ([209.85.210.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kf22U-000oGA-0X
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 14:33:07 +0000
Received: by mail-pf1-f202.google.com with SMTP id b11so9803366pfi.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Nov 2020 06:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=yJkkPo7d0J6NtmBv7rzIbrBkhqskC5NsYDTAoyAGSwU=;
 b=CRCbMwpu14Qny/Fey+w65l3KTXcgMu/wKgUqWyt7la+sSuhY3Qh3bSLfvbmNmy2ohN
 d6CLetvPjrxg9HdcLQrwcUJI/t7E3dhAItIG3xDBSGqno0iPXS+Up8TqksLE2sx9De7b
 RnDWU7ZU+TwovEWzFLtOxWOaWhir5AxQO2FAkbTw00c9UXWqh58duX34o1osKQfPEqVH
 kKqjD9fQyxlm+X97TMmYjnC8FTr0DpcoshYQpZMqrkZkd8QOZGD/NcSiuteoNG9hyOLX
 0VnfOnPnKTkbYUbPzPkiA75vd3hEs8SLeW/KWNERv36yx+7UQx03bI8wWQFRjgua6eps
 yiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=yJkkPo7d0J6NtmBv7rzIbrBkhqskC5NsYDTAoyAGSwU=;
 b=Nk4GDUgZh7Pmsm/b6XPhTKEErq9DBNLBWtRo/mdLEBfqqNybgFWtuewcRZY7DAgn12
 uqQcaUTIjE0vZ17uWsV6FiPWJCz1cGfLyBDGZc50Nq5dQQLWKk2tT16V2xB9D48x5Fb/
 92OtgFlOfdpFGapxEN/BleioTAgWyZKxqgL+XBoKAMM7OsWMh3CScdzo+cWUJdp2tp+2
 zvAJ14Wt5FJTmB5Ax2ROdeD7RKsC0fIcrgFjl/zStK4AeYhV9WQVx4ac2zWA/SJyQ5Gx
 FZSs92wM0VCfjA9Ji/kHeNpNY3itKPJysDycEboNYpitoeGFb6qx8dJTM0FXGyC+KbSy
 lE/w==
X-Gm-Message-State: AOAM533jY2PepSAmPt5GfxfnK6VSYmssv00KmLdAQCvx0JL8Yr0Q6A4V
 NyELudyQIWc3wJgaFb0TMwJg6Ylylqo=
X-Google-Smtp-Source: ABdhPJxEG4c+F9yJyuTls+kfuLbDaGW8pmeOfu1t4VEHHtaVEi94dVbJaunxNyEQ37dnM4o0k+oO8Td4NSk=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a05:6214:386:: with SMTP id
 l6mr21357187qvy.49.1605622061201; Tue, 17 Nov 2020 06:07:41 -0800 (PST)
Date: Tue, 17 Nov 2020 14:07:08 +0000
In-Reply-To: <20201117140708.1068688-1-satyat@google.com>
Message-Id: <20201117140708.1068688-9-satyat@google.com>
Mime-Version: 1.0
References: <20201117140708.1068688-1-satyat@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.202 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kf22U-000oGA-0X
Subject: [f2fs-dev] [PATCH v7 8/8] fscrypt: update documentation for direct
 I/O support
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

Update fscrypt documentation to reflect the addition of direct I/O support
and document the necessary conditions for direct I/O on encrypted files.

Signed-off-by: Satya Tangirala <satyat@google.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/filesystems/fscrypt.rst | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 44b67ebd6e40..757b8aa2af9b 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -1047,8 +1047,10 @@ astute users may notice some differences in behavior:
   may be used to overwrite the source files but isn't guaranteed to be
   effective on all filesystems and storage devices.
 
-- Direct I/O is not supported on encrypted files.  Attempts to use
-  direct I/O on such files will fall back to buffered I/O.
+- Direct I/O is supported on encrypted files only under some
+  circumstances (see `Direct I/O support`_ for details). When these
+  circumstances are not met, attempts to use direct I/O on encrypted
+  files will fall back to buffered I/O.
 
 - The fallocate operations FALLOC_FL_COLLAPSE_RANGE and
   FALLOC_FL_INSERT_RANGE are not supported on encrypted files and will
@@ -1121,6 +1123,21 @@ It is not currently possible to backup and restore encrypted files
 without the encryption key.  This would require special APIs which
 have not yet been implemented.
 
+Direct I/O support
+==================
+
+Direct I/O on encrypted files is supported through blk-crypto. In
+particular, this means the kernel must have CONFIG_BLK_INLINE_ENCRYPTION
+enabled, the filesystem must have had the 'inlinecrypt' mount option
+specified, and either hardware inline encryption must be present, or
+CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK must have been enabled. Further,
+the length of any I/O must be aligned to the filesystem block size
+(*not* necessarily the same as the block device's block size). If any of
+these conditions isn't met, attempts to do direct I/O on an encrypted file
+will fall back to buffered I/O. However, there aren't any additional
+requirements on user buffer alignment (apart from those already present
+when using direct I/O on unencrypted files).
+
 Encryption policy enforcement
 =============================
 
-- 
2.29.2.299.gdc1121823c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

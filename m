Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 529CB22CE1D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 20:45:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tQyZzusiKKwlOFM2ONIramPZkU9ziEs/vpMPcQI+yrM=; b=M7N1qpnTRkyefajc42vPfbow7
	9x287Q6QmItxha1RSiHMsEqdVLaZ+OViZn3KBJfYuovOz0ZdPsROMC7TW4zv1ID5cZLt+wiYVgK5m
	YHtQyekGR1T/rMd+AOH4C6m/czbcLnrGOKSiRu10KRCQcajRa7eY+nqNR9sewtyWuoT2U=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jz2hK-0004Dg-48; Fri, 24 Jul 2020 18:45:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3PSwbXwYKAAIucv0cviqqing.eqo@flex--satyat.bounces.google.com>)
 id 1jz2hI-0004DN-7D
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 18:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xyIxbqTzEFkSiRwtwQaLWA16wfxvhvC5m78qlSH1ff0=; b=iTf/i4UP51jmfGvLdtAymFqJ/
 L3V1g/fxNfQj/CQlpurshrSg2xgvX5trKIlTEO/NGIh4UYyTkG1ICaU80A06tnzEGqcKRyxDc+agt
 wuPVsH457FC8HFhxYn1Sfh9sDXD3KveEovqNnQ0n9fsGzEizktEzpbBDC+OHt1Rhj+jO4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xyIxbqTzEFkSiRwtwQaLWA16wfxvhvC5m78qlSH1ff0=; b=CJMY5VO+2K46jZygx59Cy1OWL9
 MnaMVQB89yjaOZD7ff9QmA0UccK08RZCLud8kBJvY9ikbemnyznuwxwP7fPSLlhEaRxx5ed+ntQuP
 xfFmTVDATmZQ0L3ILxM/OwmvWaVfOsSHfcGuIlJabEksvUuNq0hSLb3Ldcvdohj9xHE8=;
Received: from mail-pg1-f202.google.com ([209.85.215.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jz2hH-007qjP-2O
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 18:45:32 +0000
Received: by mail-pg1-f202.google.com with SMTP id 72so6991532pgb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Jul 2020 11:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=xyIxbqTzEFkSiRwtwQaLWA16wfxvhvC5m78qlSH1ff0=;
 b=mBULbubnOs99wcWvCkuB8DaDJihSO0xMIW84PX5bW6WTDj309RqVaJPHsyAy2kaKCY
 sOD/egWqVHLZ7OUz7656r6qh6CE0O+9+ekoTB8ggySlZKOVBPFRyQhOpz3iP8O3KzA66
 TlNycAcYS2Bt5YOOhe3NHBNfRzmIluIfVqVEZaOTBNsFH2DN2tFUJgfwzvHk+Cfu4ktE
 Ux2qbNoUcHcJSGpYoyJrtPpZVCLD/G+F6TaLMtwwue8ZozjlRyZ5Pqd2SCUqaAjZRuwa
 2twdFk1AzPx/nwa4i8eqkv4wxZlZ4QpFLnVvKFEWArFlrDNn6OdFdOF+0n5c6jitoG4w
 V/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xyIxbqTzEFkSiRwtwQaLWA16wfxvhvC5m78qlSH1ff0=;
 b=qZsh3dbfk0ukW50zpltSQLCrn2PXN3pPrIu43IW7M9Lg9oBIHNoOCorz1RmqzApTpy
 3DfHyp1Kh92dd+Z6tC3ZDPBhWRB3kn18Se/ogmZXNbvGM6z+fkH084O0w79kAgR3KOSB
 i4rtJoUx7P8Ud+nj0HhRCrGzdmnUUGbSQ+OzvgpAR6hLAuQNY+LDL4DP9i9A5HQF3vrS
 vgWwpjZeKRLGzMqlk3IkUR4ujUAOknAUHX/hNtk8U4T+237R38u647Di6tV3OScKOqdt
 EeCsHfEb1S3fKyJqfXV0FbVDq8XSc2oZIGUu62tYAUs6rMW1USwWx8TU6PS4b2v1lt+e
 mpSw==
X-Gm-Message-State: AOAM531thWsFdojppkxM4DN2w/oVnv+iptW0F4+r7gKP2XDGF9RNMG9o
 yn64ra16m15EzQkLuBEfmUYX5qoDF+w=
X-Google-Smtp-Source: ABdhPJzkqIhgfmuH4Tw2HNitGStx6+I2VoJ2h2ZcDf2nCz9kSOHpDDkKAQY+0hH0A++BUEd5FyALMx/aU4Y=
X-Received: by 2002:a17:90a:1fcb:: with SMTP id
 z11mr1970016pjz.1.1595616317802; 
 Fri, 24 Jul 2020 11:45:17 -0700 (PDT)
Date: Fri, 24 Jul 2020 18:45:01 +0000
In-Reply-To: <20200724184501.1651378-1-satyat@google.com>
Message-Id: <20200724184501.1651378-8-satyat@google.com>
Mime-Version: 1.0
References: <20200724184501.1651378-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.202 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jz2hH-007qjP-2O
Subject: [f2fs-dev] [PATCH v6 7/7] fscrypt: update documentation for direct
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
Cc: linux-xfs@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Eric Biggers <ebiggers@google.com>, Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Update fscrypt documentation to reflect the addition of direct I/O support
and document the necessary conditions for direct I/O on encrypted files.

Signed-off-by: Satya Tangirala <satyat@google.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/filesystems/fscrypt.rst | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 423c5a0daf45..b9bbd6c612ff 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -1049,8 +1049,10 @@ astute users may notice some differences in behavior:
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
@@ -1123,6 +1125,20 @@ It is not currently possible to backup and restore encrypted files
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
+any I/O must be aligned to the filesystem block size (*not* necessarily
+the same as the block device's block size) - in particular, any userspace
+buffer into which data is read/written from must also be aligned to the
+filesystem block size. If any of these conditions isn't met, attempts to do
+direct I/O on an encrypted file will fall back to buffered I/O.
+
 Encryption policy enforcement
 =============================
 
-- 
2.28.0.rc0.142.g3c755180ce-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

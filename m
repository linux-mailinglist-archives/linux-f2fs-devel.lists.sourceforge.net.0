Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C10D522C4CB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 14:12:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ymgeRXvbwifiHEasgVrxg+gF2daaVKNdyBq1pOPkREc=; b=TAeL9Kab7kFdokAW8Uirmzmvw
	lBf8uGEFfDw/ASml4rBp343emP9JtJCdmeZ51sNLhF/AQnqSQ6uUNrYAf5FtCHt7TwXwNF9lF0gE7
	c53/CV42q5J784GtleG5CSjHVCmbtsKDw3IqBHT8Ob+Pju2RnjOxFTWQGGWYmwrqaZDws=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jywYh-0002Av-G2; Fri, 24 Jul 2020 12:12:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3EdAaXwYKABwK2LQ2L8GG8D6.4GE@flex--satyat.bounces.google.com>)
 id 1jywYb-0002Ad-1T
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 12:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j09FJFOs7ox27oQ/jw0Hg/h+WWOfzzYjATzxUrwtjag=; b=kNhHxz6lzHZqjvB5pzt2/LDjO
 XkkK2ijJn3xWYfNQ3eQyVXuvbzIZLvQVHoM/BFub+4MNZx+Pm6wRpP5OI8dT3KQy9OpLkbeEpsrDF
 gQkAmRg0tJ/wkQxlmsIrB8b7So6SU5vm8acIJm8qk7f193lfo8lPLFENkO9pT5dwdGOBk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j09FJFOs7ox27oQ/jw0Hg/h+WWOfzzYjATzxUrwtjag=; b=DIqQl2KHYMK32vnMbvQRUcGrgT
 ofe5/77Vym92auqpWF8DXmLRJG1E/HnMVb3mvzcufM94ONnmHsoFCvIomLG2Q1WwZHBC7RHS4x5MA
 rD7IrNNhwZF5wO48ENxEQinht/SGpdJ7AWFK4C0e1AG9iL388fqgX9B0hpQJ5XsZi4sY=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jywYZ-007VbV-5K
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 12:12:08 +0000
Received: by mail-yb1-f202.google.com with SMTP id a14so1591338ybm.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Jul 2020 05:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=j09FJFOs7ox27oQ/jw0Hg/h+WWOfzzYjATzxUrwtjag=;
 b=uinx4umNBzjZNhDldRFu/4q/KRDj/aDyTI/UPTsQCLp9QNIT/Pkx3JVsXg/gNYy18X
 8fzYbL2l+0BjejTs82TRocYlvCmHfn64VAHgBtAoxl223aUkRG3nBLgaaC3G9xOT+Ee1
 rnavYw4RFQWWpr4kEAgcyApl0DBMmQqQ425gWWhdRZjgy/8fQlCPdngERjFBN7JGM4dr
 U8tyJmjfakSMtKlyzL3/ej5FMsNjZGA0nrRghc67idy4m8GhAjIfh7Nj6B8JlxuCnCUI
 kVLkYfz/3ijWwgCZz1ul3FHiFmKsgTc48xkeKY1rm28DffqkcvD9qA1RRrydNx89Ft+E
 K0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=j09FJFOs7ox27oQ/jw0Hg/h+WWOfzzYjATzxUrwtjag=;
 b=L07gqMfX/Z4YYBqV+k+PGmNsV/kYWsMb1attLQTPY6gKEutWKRib06qy4XY89U/rNm
 y4S/NjVmJDy1hWIkiujrA7kNZA/DcQ8FoChLf9iGk64Y22qUh6aqbNVOHrYEDTrTAUa6
 BmszmPYTwX0qC265HsvoQQ6IrlgE/oG6AcxsR0yCgW0p5q7KFSzjA4K2ht3rZ/ucenAt
 HLsVrpIBm54ghzNtrLHrIoHwitokSQ1kk5ijX9B/C18FeL82pWXdIGcEry2FWilfII6U
 nUqZDXBBm9J19fr3qPHxJigCqJEXLWV4xxKaF88lV1a6XOU1a32Q2G6GXagu0teePK/Q
 Nh7A==
X-Gm-Message-State: AOAM533Sy3q3dV16OyDqEqFOnwcHprFTRdRnWjchtQtNDTca63syz9Rv
 QcX0RNFtJBosSgtlWzAqvhzJopIBxro=
X-Google-Smtp-Source: ABdhPJx/kR9OGGrb08Cms1pOt8vKHYWUtxe5tDqnionkhbA71lMBxyPqAWtadG1S0CUcqUHbUujo0btmzCE=
X-Received: by 2002:a25:385:: with SMTP id 127mr14857247ybd.141.1595592721412; 
 Fri, 24 Jul 2020 05:12:01 -0700 (PDT)
Date: Fri, 24 Jul 2020 12:11:43 +0000
In-Reply-To: <20200724121143.1589121-1-satyat@google.com>
Message-Id: <20200724121143.1589121-8-satyat@google.com>
Mime-Version: 1.0
References: <20200724121143.1589121-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.4 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jywYZ-007VbV-5K
Subject: [f2fs-dev] [PATCH v5 7/7] fscrypt: update documentation for direct
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
index ec81598477fc..5367c03b17bb 100644
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

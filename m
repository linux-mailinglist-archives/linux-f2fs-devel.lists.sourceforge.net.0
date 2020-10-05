Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37090283185
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Oct 2020 10:08:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=37gTr7LxbQdey7ZManBo+c3b3P/BI2piyVs2KzwwKKE=; b=im9F1PyoydeqgY06fVcNGRTOp5
	Lfyb3XcRIVDefhlogpkzqyQDJMoxvra3V7UID3elpSmwqABtSjKfNDVpvtQb1AjDGs+TTTqorpk3b
	7cfovuUwQIcYH3DTU+Q4G4OY3J9/sl9DH9B2v5nGxxeWpa1skqPnfslu2RYTZj5NZPA8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kPLXf-0000y4-5j; Mon, 05 Oct 2020 08:08:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <37cx6XwYKAHQkSlqSlYggYdW.Uge@flex--satyat.bounces.google.com>)
 id 1kPLXd-0000xL-Ou
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Oct 2020 08:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bLEC7Itfwt/vTBCBtwVmtMMOr1PQX84du7+WuinK0VQ=; b=NKmKpiNmnOLzSOzB7rfCUHz9tt
 HJzn5ysaDo3/MxFXi159w9N9OMKnv7AkKNE8FqLv5Z2v8x1lyJ79wx69XUwvEqUGvlm5PdSBCIUM0
 c9kCqQZTKoyqwJxq+uyobLm5QS1K0qlSL67J3vugq9jZeuAVT2jvn+VcB7Lz28ATW2ls=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bLEC7Itfwt/vTBCBtwVmtMMOr1PQX84du7+WuinK0VQ=; b=U
 OwpWp8WXIP3NCEDnGeEZc1ERGaELPALXLKFXi9Rk8of1JxO02uCiEVNaRnUGqcDIziLz4e19XQON7
 Fgmuitcvq96gPIbjNoL2+iN+8YxKbUB4irTvdEbLE+ooJxvB48ahUuD8xicbBWIVGQM37wslJghNr
 Sf7AnVloWzamKCHw=;
Received: from mail-oo1-f73.google.com ([209.85.161.73])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kPLXU-0034oo-IT
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Oct 2020 08:08:17 +0000
Received: by mail-oo1-f73.google.com with SMTP id p6so4824424ooo.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 05 Oct 2020 01:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=bLEC7Itfwt/vTBCBtwVmtMMOr1PQX84du7+WuinK0VQ=;
 b=HV6ym01K6y8BOz1GIxrCnw53fIUAS3awJUA7m9Z3ZlkOp5tuQKJ11SG2ntvCAnJUrm
 A/LRe4di/5HTVp1kuFcw6lod0tqBwi9AKovXncUB7nRs13Iyv+O7hU9XYUXW5nAEd588
 wC0O5FjvB0VbzoCZ/1zL3M+BKnbxKHEEcG6UIyQYU/OR66xiczJXtUw+ey2lvFeiHMjG
 OoEqBgy6iTVVju+xW9bb7gbqWn2KOxs0Ju7tkzwornb7aQXpHavJw5nB9Fi1FQfCX7IQ
 6bLtHS+ZfjPZUimtDeddRxX+PerODtxNYWvz5iPRZiez2yUVGTf31iy/ReL/jqQievKx
 ++cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=bLEC7Itfwt/vTBCBtwVmtMMOr1PQX84du7+WuinK0VQ=;
 b=fHBBNvNB09zRvc4DRZ2oifKrsuBRtaBj36MAkjosNh8yF1naEkevtmjpAxvsyGhams
 PdhCu7SrXUvOrkq+VfBPo3nMJWQm9EAzXdPpOowP9LsmCbudZIne28D/8OaxGglhzaqG
 ifUqkTpsNttJdYusxpshkhW5XKrYIH7B+FGBatBbd8pFoVbkB7TLn/sI8ymCr/OlhspK
 06x9ydo7CG7T+/0fyb+pla2aNuzu/9fWsu+9mvM9Oj6B+VWrjfCZT922kARH3Y7SQfWI
 DdEKo3KA3f32F552qN+yiU07eyaMSGnMNOXPr5n84XmWAQL+JNRuINSjf/JjleRWL7vl
 Ck9w==
X-Gm-Message-State: AOAM532RlU5tQaYBM8ef5jkGYZs/ruAtFboW6+Nn40knki/W8/c8MZ5V
 YBdsCJ8IfMv/MUSPATSK7xd/8t8hnZ0=
X-Google-Smtp-Source: ABdhPJzJGbGYLMsgB9X9c+qhb2fFNPXy1LQlJv8XkQxZGAvle6p4UqaXXWl6X4IRPgmB12jFV/RqtEYP/l0=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a17:90b:608:: with SMTP id
 gb8mr2322362pjb.6.1601883373853; Mon, 05 Oct 2020 00:36:13 -0700 (PDT)
Date: Mon,  5 Oct 2020 07:36:03 +0000
Message-Id: <20201005073606.1949772-1-satyat@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.73 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.161.73 listed in list.dnswl.org]
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
X-Headers-End: 1kPLXU-0034oo-IT
Subject: [f2fs-dev] [PATCH 0/3] add support for metadata encryption to F2FS
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
Cc: linux-fscrypt@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch series adds support for metadata encryption to F2FS using
blk-crypto.

Patch 1 replaces fscrypt_get_devices (which took an array of request_queues
and filled it up) with fscrypt_get_device, which takes a index of the
desired device and returns the device at that index (so the index passed
to fscrypt_get_device must be between 0 and (fscrypt_get_num_devices() - 1)
inclusive). This allows callers to avoid having to allocate an array to
pass to fscrypt_get_devices() when they only need to iterate through
each element in the array (and have no use for the array itself).

Patch 2 introduces some functions to fscrypt that help filesystems perform
metadata encryption. Any filesystem that wants to use metadata encryption
can call fscrypt_setup_metadata_encryption() with the super_block of the
filesystem, the encryption algorithm and the descriptor of the encryption
key. The descriptor is looked up in the logon keyring of the current
session with "fscrypt:" as the prefix of the descriptor.

The patch also introduces fscrypt_metadata_crypt_bio() which an FS should
call on a bio that the FS wants metadata crypted. The function will add
an encryption context with the metadata encryption key set up by the call
to the above mentioned fscrypt_setup_metadata_encryption().

The patch also introduces fscrypt_metadata_crypt_prepare_all_devices().
Filesystems that use multiple devices should call this function once all
the underlying devices have been determined. An FS might only be able to
determine all the underlying devices after some initial processing that
might already require metadata en/decryption, which is why this function
is separate from fscrypt_setup_metadata_encryption().

Patch 3 wires up F2FS with the functions introduced in Patch 2. F2FS
will encrypt every block (that's not being encrypted by some other
encryption key, e.g. a per-file key) with the metadata encryption key
except the superblock (and the redundant copy of the superblock). The DUN
of a block is the offset of the block from the start of the F2FS
filesystem.

Please refer to the commit message for why the superblock was excluded from
en/decryption, and other limitations. The superblock and its copy are
stored in plaintext on disk. The encryption algorithm used for metadata
encryption is stored within the superblock itself. Changes to the userspace
tools (that are required to test out metadata encryption with F2FS) are
also being sent out - I'll post a link as a reply to this mail once it's
out.

Satya Tangirala (3):
  fscrypt, f2fs: replace fscrypt_get_devices with fscrypt_get_device
  fscrypt: Add metadata encryption support
  f2fs: Add metadata encryption support

 Documentation/filesystems/f2fs.rst |  12 ++
 fs/crypto/Kconfig                  |   6 +
 fs/crypto/Makefile                 |   1 +
 fs/crypto/fscrypt_private.h        |  19 +++
 fs/crypto/inline_crypt.c           |  37 +----
 fs/crypto/metadata_crypt.c         | 220 +++++++++++++++++++++++++++++
 fs/f2fs/data.c                     |  24 ++--
 fs/f2fs/f2fs.h                     |   2 +
 fs/f2fs/super.c                    |  83 +++++++++--
 include/linux/f2fs_fs.h            |   3 +-
 include/linux/fs.h                 |   3 +
 include/linux/fscrypt.h            |  51 ++++++-
 12 files changed, 410 insertions(+), 51 deletions(-)
 create mode 100644 fs/crypto/metadata_crypt.c

-- 
2.28.0.806.g8561365e88-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

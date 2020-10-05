Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1BB283270
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Oct 2020 10:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l7z5+Gkd/lFuhadzyKv9K65uw8MFYRxUhwFAbySTADQ=; b=h1WlQFzoNmYAipji0/JTy9BEQ1
	+1FSsozx9M7tMjNrW0fWfYZfD1E/8l7DPiykKcEY8ZSjcUrAFVB67rouQIejD4mFf5KVxeds13RlB
	mp+fWbuVR3k8WXBWpVYAJ/NNkmZUkEbwmr5vcsskyKZh+ZprNj8hT5AxHm5e/H/fjv14=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kPMA2-00008u-8t; Mon, 05 Oct 2020 08:47:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3Ms56XwYKALstbuzbuhpphmf.dpn@flex--satyat.bounces.google.com>)
 id 1kPM9z-00006U-0B
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Oct 2020 08:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cGuAlaeZa+fmThCbpZs6t/+dBJ0JbAyRdYvCYkXQIzo=; b=ZXOau5lwREW7byW0BDNqzzuCwl
 Vp+JbXa7VfmUOz99B7QPPwNxJjZhR9HeZaL4ieFizLrKYuem0ASXXX/D0mu+Jes2e5FKUiSzphvya
 8yZYjMqEQGwY5BF1nNgtaCJ4VFS4tS7H9dN9ZQ8dA9QoeAa/zDDSHDhCKtf3u6CIsJjc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cGuAlaeZa+fmThCbpZs6t/+dBJ0JbAyRdYvCYkXQIzo=; b=a
 839GVwnKbLueGAplbWyOhAwDM+8Lz3bhYzIkS1FLtea7daKVavi61suYz6fsxViqzYidR3vN6dbTc
 zaqWj0/H68kZ9V6eYwpB2D0wjf7FPEchObHlJUK3lr6o2Xog6JIXRE1/1OUyh3H7++mDzsXKCvkDN
 /bp8TMfnb8eQ65zE=;
Received: from mail-pf1-f202.google.com ([209.85.210.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kPM9t-00H57Z-Mk
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Oct 2020 08:47:54 +0000
Received: by mail-pf1-f202.google.com with SMTP id 192so1176392pfb.21
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 05 Oct 2020 01:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=cGuAlaeZa+fmThCbpZs6t/+dBJ0JbAyRdYvCYkXQIzo=;
 b=EP1SkITH6nDQZDWUU1Uc+q768nllvBnXoM0IIfWmlFqo3T0ux+TM7Mf2z1UAwoqFxj
 PaeTydbB3wNHeOtz9oXhetYgUlc766ol57BbEf33wkb5Cf5V+aUl7gGlOmKMAFAH2OeO
 2TIOPF2+WcgQmQiyror2IePJNc212sveSA+nwOE7VhGBBNC0CANv6GVUeL/lHXixhIsJ
 i53323nttLX+w3GBsyexL60Ii9jpzCCC6uPxxLViqO7MKFSvipW7cR9kgux5yVQms1dQ
 CWx23OCWHXyEK5zUvTdFHoTW2v65PPstXw+YkS25qKvhvWZoWVviSExFXkJnIjOQUMmQ
 9TYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=cGuAlaeZa+fmThCbpZs6t/+dBJ0JbAyRdYvCYkXQIzo=;
 b=rCw0bpqvhxHo8uZ+AvPSdzF7JiWh5LQULYe0qPi8nAVZcN2Na+Ui5m+H+ZEwwXg0Kr
 W/E6XhPXoFee/FGHPVYmZB8gxcI/8o9207t4+Y0D/T95gQsoMQz5tpKSmxA9R1Ep6zE5
 NA1bfcZYOmS3396R7ZkvKFBmZXC1iq9gGNWOxtzA3YOolIcElH82lWc8NkyY+LzFwDdC
 gu6ivdxTSaqeO8doapLZS2URQvd3p01OzwqtUEIHj0lQPcE9FN1bmvJQR7yvQg5AMcxD
 9Y1lDjMU/AeLvjOGSHsr3CK7MUSwAWmvepCW3xq9EEBeyo2XXZW7tSyqWS1+XquDjigd
 FTwQ==
X-Gm-Message-State: AOAM531jXu/jNlZ2fYLoo/0kNyPQxB4wIPDtczKJpHTgYlyMm61jeVCh
 uFQAUxBbqjKiDXXXVaXflnUzEvjz+/M=
X-Google-Smtp-Source: ABdhPJy6ycq5SeVkN+WkkgDF0w8+sYBA0b89QHrmuAKlNY/nUoXchIEgX2O5U5eKs0kimydvOqIJQHYl4iA=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a0c:8c4c:: with SMTP id
 o12mr5153494qvb.46.1601883698196; 
 Mon, 05 Oct 2020 00:41:38 -0700 (PDT)
Date: Mon,  5 Oct 2020 07:41:32 +0000
Message-Id: <20201005074133.1958633-1-satyat@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>
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
X-Headers-End: 1kPM9t-00H57Z-Mk
Subject: [f2fs-dev] [PATCH 0/1] userspace support for F2FS metadata
 encryption
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
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The kernel patches for F2FS metadata encryption are at:

https://lore.kernel.org/linux-fscrypt/20201005073606.1949772-4-satyat@google.com/

This patch implements the userspace changes required for metadata
encryption support as implemented in the kernel changes above. All blocks
in the filesystem are encrypted with the user provided metadata encryption
key except for the superblock (and its redundant copy). The DUN for a block
is its offset from the start of the filesystem.

This patch introduces two new options for the userspace tools: '-A' to
specify the encryption algorithm, and '-M' to specify the encryption key.
mkfs.f2fs will store the encryption algorithm used for metadata encryption
in the superblock itself, so '-A' is only applicable to mkfs.f2fs. The rest
of the tools only take the '-M' option, and will obtain the encryption
algorithm from the superblock of the FS.

Limitations: 
Metadata encryption with sparse storage has not been implemented yet in
this patch.

This patch requires the metadata encryption key to be readable from
userspace, and does not ensure that it is zeroed before the program exits
for any reason.

Satya Tangirala (1):
  f2fs-tools: Introduce metadata encryption support

 fsck/main.c                   |  47 ++++++-
 fsck/mount.c                  |  33 ++++-
 include/f2fs_fs.h             |  10 +-
 include/f2fs_metadata_crypt.h |  21 ++++
 lib/Makefile.am               |   4 +-
 lib/f2fs_metadata_crypt.c     | 226 ++++++++++++++++++++++++++++++++++
 lib/libf2fs_io.c              |  87 +++++++++++--
 mkfs/f2fs_format.c            |   5 +-
 mkfs/f2fs_format_main.c       |  33 ++++-
 9 files changed, 446 insertions(+), 20 deletions(-)
 create mode 100644 include/f2fs_metadata_crypt.h
 create mode 100644 lib/f2fs_metadata_crypt.c

-- 
2.28.0.806.g8561365e88-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D45DE21A83D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jul 2020 21:55:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D8ybPV9quDJ8/PYAa3IG5geyUHx5GecNkT5vPan5ZKY=; b=MeirP8FGpmrUZxpdGZFOwLM/tL
	8uywW3xYs/wf1+OE3AX0zMembrR+1R/M2jNHu87L9Ybj+Oicr+0M+1VP641HfrGf7kjd1ZEdLBQ1g
	DZBqWDXOHw4rWGPTIyzPfVzQLCQfr/2MMGa5e2ZUQhQwbVDEmh3vFOUojNKViXqXZMVE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtcdo-0005IS-DG; Thu, 09 Jul 2020 19:55:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3a3QHXwYKAHAgOhmOhUccUZS.Qca@flex--satyat.bounces.google.com>)
 id 1jtcdn-0005IM-55
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 19:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OQlFlzqp7cgxbEDAcFcy1Mp/9MDoNdc1mBQkMnvEjS8=; b=nM+3hbRbRm5PvC1EVJAKt8i/Fd
 tbhE340f92kFt9yL8qGRGTiCBDHKdn6pXhedb3GEu4/GEkDe8IeBlylNz/rA+jmpfASp76uR8+UYq
 fcB49+pmZqQimvF3rhdLQ7M0oQVlMe0o1m+3Tq9Sgd/ciaFkJNeoVvi9pd+Jyfd2xJzE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OQlFlzqp7cgxbEDAcFcy1Mp/9MDoNdc1mBQkMnvEjS8=; b=W
 UG/zpXqGTzqAjz1bg+CuHLZatncjP8+sD9xt5DwaSV9qjwpqbozy9FoNcJxMDSmoq7OaSDeUn44Ke
 Ozgnw+NidJb77BdcBFUqMpATx4kkFp8TQomILEB77oftB9UovbBAI1oml/2PH9VRrypS66rYokCaB
 ha+nNUgu+M0NW18o=;
Received: from mail-oo1-f73.google.com ([209.85.161.73])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtcdj-00FUeU-Gt
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 19:55:31 +0000
Received: by mail-oo1-f73.google.com with SMTP id d143so2220341oob.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 09 Jul 2020 12:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=OQlFlzqp7cgxbEDAcFcy1Mp/9MDoNdc1mBQkMnvEjS8=;
 b=pBZbi74/hZ9MKsVQolBdjXjTOO8KKn/3Z56LfSGw1BYIJbckz8I6p+Grrnj++3VaqI
 Wfd7CJ40NdzKxB9/ChwQTaq+jFFu84vkcBwJdZ3qR5ZYg9tvRya9kcEriBdzZmqHUquz
 ra78LhjLSBN0thXrH9MXImFbLdmrxwobSlfEXgCfjXHziseJKpNM7ZmDmUliCJd07P1g
 NiwyQ1h6y3r/5FidO0wXZagVk1tnMpEVSZz+DzHUTgViL04XFNPAvmlS6EvBM2XHRtvw
 9R+IzEJYFfk/49VWx3x2fGfrhavRhEiQHpOYtFKVBFBysKZcVFW90TqQJa2sJwWmA261
 0ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=OQlFlzqp7cgxbEDAcFcy1Mp/9MDoNdc1mBQkMnvEjS8=;
 b=bCY3uLOD/MwQAqTM+DD8ZFTE96CLfVeyIcysMUsijOfSY1Lj2QHY8yZHMCEvNfqrtj
 4G7KKxol9YKwWTFxTevqKbCi9rXtLoMZc2gw0bIRRx18u5m3Kv8ayJOwMplD/R4wMNW3
 8lFu9SrO+RCIuUUrGzBXdA3La3pRE2h7He7owi1aSx+NGtxO1i+qBCLCNSt1Hz3YNFwm
 FqqZPt9bad1PLwnrJGQ4VnUBKkj3D859/yAazYbla8lC2Dm0gTSzoKnrkhFDL6PVbg5j
 NI4XklrVHHjhHnqb9qSZB0enzeRdBeySlxVXefPIRriFv6hCj3jMZgRDB+gGEdPijo4g
 nsnA==
X-Gm-Message-State: AOAM530HA414ovsjt60uql2ADyv6Uh5klokIoROq1mfr6MiGgcEQ0Glv
 B+zhIqt01sh81s9WgkUF2JTODXsGL7U=
X-Google-Smtp-Source: ABdhPJyPuBGtLJ2QIfaP80rWb4N1NQC5Ht7OHXhJqVfgNx6APnNpuuj6IT4dY+awLOKpAY/PJNhCp6wKhKM=
X-Received: by 2002:a17:90a:1fcb:: with SMTP id z11mr770921pjz.1.1594324075443; 
 Thu, 09 Jul 2020 12:47:55 -0700 (PDT)
Date: Thu,  9 Jul 2020 19:47:46 +0000
Message-Id: <20200709194751.2579207-1-satyat@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
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
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtcdj-00FUeU-Gt
Subject: [f2fs-dev] [PATCH 0/5] add support for direct I/O with fscrypt
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
Cc: Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch series adds support for direct I/O with fscrypt using
blk-crypto. It has been rebased on fscrypt/inline-encryption.

Patch 1 adds two functions to fscrypt that need to be called to determine
if direct I/O is supported for a request.

Patches 2 and 3 wire up direct-io and iomap respectively with the functions
introduced in Patch 1 and set bio crypt contexts on bios when appropriate
by calling into fscrypt.

Patches 4 and 5 allow ext4 and f2fs direct I/O to support fscrypt without
falling back to buffered I/O.

This patch series was tested by running xfstests with test_dummy_encryption
with and without the 'inlinecrypt' mount option, and there were no
meaningful regressions. The only regression was for generic/587 on ext4,
but that test isn't compatible with test_dummy_encryption in the first
place, and the test "incorrectly" passes without the 'inlinecrypt' mount
option - a patch will be sent out to exclude that test when
test_dummy_encryption is turned on with ext4 (like the other quota related
tests that use user visible quota files).

Eric Biggers (5):
  fscrypt: Add functions for direct I/O support
  direct-io: add support for fscrypt using blk-crypto
  iomap: support direct I/O with fscrypt using blk-crypto
  ext4: support direct I/O with fscrypt using blk-crypto
  f2fs: support direct I/O with fscrypt using blk-crypto

 fs/crypto/crypto.c       |  8 +++++
 fs/crypto/inline_crypt.c | 72 ++++++++++++++++++++++++++++++++++++++++
 fs/direct-io.c           | 15 ++++++++-
 fs/ext4/file.c           | 10 +++---
 fs/f2fs/f2fs.h           |  4 ++-
 fs/iomap/direct-io.c     |  8 +++++
 include/linux/fscrypt.h  | 19 +++++++++++
 7 files changed, 130 insertions(+), 6 deletions(-)

-- 
2.27.0.383.g050319c2ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

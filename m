Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D013C67B10
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Nov 2025 07:22:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jqhS6MDl1VA2vBInNNXUbuZfk0USkR++YfocMW2E0X8=; b=mLAPGQx/zf7BoaNTl9nH99gaAk
	WWDn+f6w0jyM+vV9Koq5oierVFQUu9HfImG0bJ0l0dK9/s3gGJehvL/DJ5twPIS2URBHPDsmyfz6p
	N+aNHlX7mL6RI7PTs4MP2IONbTdbKOh0BMWelWN+RYQWa9Qz1k/mY2W8yF8x4daiOF1w=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vLF6d-0003sa-Ls;
	Tue, 18 Nov 2025 06:22:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+0812c32a4ab075f64334+8122+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vLF6a-0003sT-6G for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xRGDQlHnczKIUXO+TmIW+WyJeT9hPKks9Od5qE6nNxM=; b=g6BY5rBTpvqy0Nnq3XeQnHkKGp
 iDbzyqt/m0Vczx6PE/DwdVjFhHgJBTeSeyZpcgdyEI6Jagb+tzL1X5ptz2jRE7+hGtMg4RHtzlceF
 AWXn++fxZmfa7A0d9uwG8UcMHMV+OIKvLzrFYyxQBlPgIlaPOIuXrdGDNjOiMw1cKO3Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xRGDQlHnczKIUXO+TmIW+WyJeT9hPKks9Od5qE6nNxM=; b=K
 Yl3QydX2RtgtAChlGi/MZfcnJPw5OuLkTMq4/JhlzEa6Hx2WMGgFyJc8c0g4taNSEDUqhuWf4510D
 BFLHGhhgmEfiLhqNffGTEV7kwiESKngb0EcGydJc7WmQuJyHoJlyViN+C1OsCix2DJxDt5tPc8fR6
 N1hwWY3T0KH7YWzM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vLF6Z-0007DY-It for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=xRGDQlHnczKIUXO+TmIW+WyJeT9hPKks9Od5qE6nNxM=; b=UjwADqvLrMmeBzU+K4k2KvS/Ly
 ttrbhZY7relSVo65q7B1SN9FBiT/DlRf3fGwzH8FMn3hGklt/shngR0PbsV1SGOAXEdu5Rdx69FhJ
 i9d2/L25TSw0CvTtLwtXn+XYEelSXTzh+QNxQrzEPrcYNdzL02Hcp6x664E6yowicHVgzmlejmFKs
 JWi5Mr3hDB3BVkTBGY3Yvr+3wJrBt5Azng9lwyX1TUwFu0eTlfk1XP38i0GmkpgX4x7ZdF9F3/bdm
 whE4HSuj3Wdr/H1FwyZmMGUhHXDB+kc+p+PtYceKKYVHj9qeu8GrbTHKV4hShktEfGf0pKPCQ2V0H
 KAaliWSA==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vLF6N-0000000HUNw-2BiG; Tue, 18 Nov 2025 06:22:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Tue, 18 Nov 2025 07:21:43 +0100
Message-ID: <20251118062159.2358085-1-hch@lst.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, this series cleans up various fscrypt APIs to pass
 logical offsets in and lengths in bytes, and on-disk sectors as 512-byte
 sector units, like most of the VFS and block code. Note that this is based
 on top of fscrypt/for-current and not fscrypt/for-next to pick up "fscrypt:
 fix left shift underflow when inode->i_blkbits > PAGE_SHIFT". There also
 is a minor conflict in linu [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: infradead.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vLF6Z-0007DY-It
Subject: [f2fs-dev] fscrypt API cleanups
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
Cc: Christian Brauner <brauner@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi all,

this series cleans up various fscrypt APIs to pass logical offsets in
and lengths in bytes, and on-disk sectors as 512-byte sector units,
like most of the VFS and block code.

Note that this is based on top of fscrypt/for-current and not
fscrypt/for-next to pick up "fscrypt: fix left shift underflow when
inode->i_blkbits > PAGE_SHIFT".  There also is a minor conflict in
linux-next with the iomap tree tue to that tree changing and adjacent
line to one changes in this patch.

Eric only asked for the first two patches to be sent out, but I more of
my stack as I think it should be useful.  Feel free to apply as many
as you think are suitable.

Diffstat:
 fs/crypto/bio.c             |  108 +++++++++++++++++++++++++-------------------
 fs/crypto/fscrypt_private.h |    3 -
 fs/crypto/inline_crypt.c    |   34 ++++++-------
 fs/crypto/keysetup.c        |    2 
 fs/ext4/inode.c             |    5 +-
 fs/ext4/readpage.c          |    7 +-
 fs/f2fs/data.c              |    7 ++
 fs/f2fs/file.c              |    4 +
 fs/iomap/direct-io.c        |    6 --
 include/linux/fscrypt.h     |   19 +++----
 10 files changed, 105 insertions(+), 90 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

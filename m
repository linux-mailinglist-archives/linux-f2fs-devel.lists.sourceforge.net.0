Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C5C55B805
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Jun 2022 08:52:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o5ibL-0003gC-Qh; Mon, 27 Jun 2022 06:52:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1o5ibJ-0003fu-VL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jun 2022 06:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oasBkHswhZhgXNZwV0nqphguX249zaA7d0tEZxXKMqI=; b=VfQBVUoogeA92nqa3DKQqSujRH
 IwkZxSnt1ah/17MHzJpgiVSmTjTtVS8pyA6SuxqiwuiEipK/LuzHGGDwzrK1ZpMVnB52aJ5v7elj/
 0Vr+EV7qSha7X4WEPGyiCnSXnskZAwTs0v6ViHZnoMSRLkw7KwDHsRTRM2MEXqdnwL1s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oasBkHswhZhgXNZwV0nqphguX249zaA7d0tEZxXKMqI=; b=V
 DppvGtsuXsBidi0SQf8NcwqlqUVOYYO8mo1EGVIT5vcC1K2a7mtoIBpqXRVUXvxU/Hl92r833iK4Z
 9Qm1mUQwduxF02lJNX5CHKbzkdVVLN1HwtKjE+rlPM8u9xfhzh8cVWivSfAH3os9vw0BRhqgrJb9F
 3mHCxUpbqujEqkug=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o5ibH-00FMQc-Rt
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jun 2022 06:52:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7DB53612CB;
 Mon, 27 Jun 2022 06:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17B6C341C8;
 Mon, 27 Jun 2022 06:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656312713;
 bh=EMTvjrRTRYMQ8NvdZxMXcH2NZ3gwtUoi5uAa917YgYU=;
 h=From:To:Cc:Subject:Date:From;
 b=OdEhO/MAo3AFkdbctkb6BCcbEyvLcD4iwBI77ZyUX3ZvdU0F7DllZKYyE8gkP9WQK
 ZGDAJVOJyTuwvF2MbvzhsZgXBQij7rXRYn1v5P6TFggka6ut+B4Zw6Fx5HmirG16y7
 dNR3bAi/c+bMrQDQeCbGzDmA3eW2VCH+5wv9hyNjiI/25AXmxSSznadBvtfeWDqAm5
 GDaD639zJe0rDxwWEEnNvT5Il6LpwGCgDvL1eH8knm3S4IrGL/WbxEc+8BHoVWRR9/
 iz6Yv8bWPUxUtYKcaalGZHO52oCjg34LJIGiAKwQJSECgAohNEvxYHKe5gcS5MJHWY
 +s0S6Cw+PBbzQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 26 Jun 2022 23:50:48 -0700
Message-Id: <20220627065050.274716-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This series changes ext4 and f2fs to stop using PG_error to
 track decryption and verity errors. This is a step towards freeing up PG_error
 for other uses, as discussed at https://lore.kernel.org/linux [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o5ibH-00FMQc-Rt
Subject: [f2fs-dev] [PATCH 0/2] ext4,
 f2fs: stop using PG_error for fscrypt and fsverity
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series changes ext4 and f2fs to stop using PG_error to track
decryption and verity errors.  This is a step towards freeing up
PG_error for other uses, as discussed at
https://lore.kernel.org/linux-fsdevel/Yn10Iz1mJX1Mu1rv@casper.infradead.org

Note: due to the interdependencies with fs/crypto/ and fs/verity/, I
couldn't split this up into separate patches for each filesystem.

Eric Biggers (2):
  fscrypt: stop using PG_error to track error status
  fsverity: stop using PG_error to track error status

 fs/crypto/bio.c         | 16 +++++++----
 fs/ext4/readpage.c      | 16 +++++------
 fs/f2fs/compress.c      | 61 ++++++++++++++++++++---------------------
 fs/f2fs/data.c          | 60 +++++++++++++++++++++-------------------
 fs/verity/verify.c      | 12 ++++----
 include/linux/fscrypt.h |  5 ++--
 6 files changed, 88 insertions(+), 82 deletions(-)


base-commit: 0840a7914caa14315a3191178a9f72c742477860
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEAE228C66
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jul 2020 01:01:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jy1Fy-0002pW-6Y; Tue, 21 Jul 2020 23:01:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jy1Fx-0002pP-Iq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 23:01:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N5H1rzFPBHXgDn8sVhN5HkcRzNy9y5MqL0DORinhJcM=; b=WVq83bM6COembjbqNOT+4US9gp
 dZpGKIOzMhQ70auKsoxdp68WuGU//thUJMtfFOXssWZmrpD8YyDXaW5u1sTUuIGnqAq+K7Id1+ANc
 T01sgTmYd+svidvorio1pAh6T70U/RvHV1HCPnpUcKejOZ1fau8aaVYz6gloKMBz8/eo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=N5H1rzFPBHXgDn8sVhN5HkcRzNy9y5MqL0DORinhJcM=; b=X
 vDO+TcvUbi24rTsyrhOuKU6Oyf9k1mL3YEisWxshRY7IK7vY/+/9rjwy3SNUACglQ7BmsPzJrOtaE
 h4kR+tzp0jR0dQM4oF0wQSRGAFIiA62aWsMt4617A8XG/+KQ2GBFx7Z5+uJJn1fD8CCWkwLKzt63I
 j3QqyxIn7Xauiui8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jy1Fw-00Ciko-8I
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 23:01:05 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9914E20720;
 Tue, 21 Jul 2020 23:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595372458;
 bh=k3zJtj9swL8Em2zr4t0dgLpBU2miGzB6T+4/DOJqYLQ=;
 h=From:To:Cc:Subject:Date:From;
 b=Th1AiTHwrnCJXpn6yM0O2m52c82NWRdDo4e8Gu5vDBZP6ir8te0mn/8JjqHhrhdVf
 aIaZzUV/1HNfA47AFBH80hZIAMlRJmflhQTRo9G6tSyR8+UOFhTUR3olkfGwhTES8x
 ESddhewxSWqEUxj9FMEIvj813sooIehuXr/XKVdU=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 21 Jul 2020 15:59:15 -0700
Message-Id: <20200721225920.114347-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jy1Fw-00Ciko-8I
Subject: [f2fs-dev] [PATCH 0/5] fscrypt, fs-verity: one-time init fixes
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
Cc: linux-fsdevel@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 linux-ext4@vger.kernel.org, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series fixes up some cases in fs/crypto/ and fs/verity/ where
"one-time init" is implemented using READ_ONCE() instead of
smp_load_acquire() but it's not obviously correct.

One case is fixed by using a better approach that removes the need to
initialize anything.  The others are fixed by upgrading READ_ONCE() to
smp_load_acquire().  I've also improved the comments.

This is motivated by the discussions at 
https://lkml.kernel.org/linux-fsdevel/20200713033330.205104-1-ebiggers@kernel.org/T/#u
and
https://lkml.kernel.org/linux-fsdevel/20200717044427.68747-1-ebiggers@kernel.org/T/#u

These fixes are improvements over the status quo, so I'd prefer to apply
them now, without waiting for any potential new generic one-time-init
macros (which based on the latest discussion, won't be flexible enough
to handle most of these cases anyway).

Eric Biggers (5):
  fscrypt: switch fscrypt_do_sha256() to use the SHA-256 library
  fscrypt: use smp_load_acquire() for fscrypt_prepared_key
  fscrypt: use smp_load_acquire() for ->s_master_keys
  fscrypt: use smp_load_acquire() for ->i_crypt_info
  fs-verity: use smp_load_acquire() for ->i_verity_info

 fs/crypto/Kconfig           |  2 +-
 fs/crypto/fname.c           | 41 +++++++++----------------------------
 fs/crypto/fscrypt_private.h | 15 ++++++++------
 fs/crypto/inline_crypt.c    |  6 ++++--
 fs/crypto/keyring.c         | 15 +++++++++++---
 fs/crypto/keysetup.c        | 18 +++++++++++++---
 fs/crypto/policy.c          |  4 ++--
 fs/verity/open.c            | 15 +++++++++++---
 include/linux/fscrypt.h     | 29 +++++++++++++++++++++-----
 include/linux/fsverity.h    |  9 ++++++--
 10 files changed, 96 insertions(+), 58 deletions(-)

-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

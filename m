Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2CF3B6725
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jun 2021 18:57:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lxuZE-0001pj-Mx; Mon, 28 Jun 2021 16:57:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lxuZD-0001pO-Ep
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Jun 2021 16:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ueIJM3YgVL/SZXJKX37sFUKqr+ar8/+GQi8J2MaeKT8=; b=Jyb+sJmHJyNnLOpoXuvSNOm43b
 DFSNSU9JkOHLvVv1nVvW4HtAM/766sWbWVM3tmVfmNQvvcFTCYP+5Qw1Fs97xSwFlzxDBZD6RScf9
 BVX+SQ2r3NUEwh99XHjK0hyZuZDXnVlwaPXKU3mEUDODtWb5PveAtCRdHIF1mDKEDjV4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ueIJM3YgVL/SZXJKX37sFUKqr+ar8/+GQi8J2MaeKT8=; b=g
 O/wzUvCrMUZmFUp7nrpFoZVuvQUKjLYjbNb1EnQowAsYW1rEVR6j2JbGFFKQEDTp/O+9tZVDFP8Es
 rGzIsproOnvqEAwMohsEqG1ZwuLbA1haNOl6AF8uPHmxl4z4eqUvYBEX/jmxnnjR/2KGjjrtsO5Ma
 iejkTbd8r+b3EsVg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lxuZ6-0028Bi-BJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Jun 2021 16:57:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB87B61988;
 Mon, 28 Jun 2021 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624899406;
 bh=JEH9YvkX1tuS2gUabFZ9JaX5r+EudDtnu4dkjX3MpYc=;
 h=Date:From:To:Cc:Subject:From;
 b=vNj8RwCa5/BCXX2jdMugsk8BK+T6K04e/v9FzgdrgzJaJ9GUpOdsfeYfV0SOb63iX
 KL7IPMD4GPZmublCVb4UFA6hyl43mf6EeUErmU0R5DSBZP8BpQQ3r/bi8FSTh4e2gi
 NczpLPJDkY4I7g5pwR5imkna4VDn+nml2cM8AI54Eaw7VJd9H1CzYcZtqiaY8yuuv4
 9YSKJ1bXlhjcDEYskWqkVZVg3TCMvoZ2G7Yk1FXZEZsYG9/wJi1HK81jf3n6hopI8B
 h1HzZaMto30+F+Mb6UVEy/e+wEUaIXQHnMrDpal9oWPMhdeUAJdxfKafRcZMG20Dq6
 zNbaGKfd6Ai1Q==
Date: Mon, 28 Jun 2021 09:56:44 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YNn/TL5lW44yAx3o@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lxuZ6-0028Bi-BJ
Subject: [f2fs-dev] [GIT PULL] fscrypt updates for 5.14
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit c4681547bcce777daf576925a966ffa824edd09d:

  Linux 5.13-rc3 (2021-05-23 11:42:48 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to 2fc2b430f559fdf32d5d1dd5ceaa40e12fb77bdf:

  fscrypt: fix derivation of SipHash keys on big endian CPUs (2021-06-05 00:52:52 -0700)

----------------------------------------------------------------

A couple bug fixes for fs/crypto/:

- Fix handling of major dirhash values that happen to be 0.

- Fix cases where keys were derived differently on big endian systems
  than on little endian systems (affecting some newer features only).

----------------------------------------------------------------
Eric Biggers (2):
      fscrypt: don't ignore minor_hash when hash is 0
      fscrypt: fix derivation of SipHash keys on big endian CPUs

 fs/crypto/fname.c    | 10 +++-------
 fs/crypto/keysetup.c | 40 ++++++++++++++++++++++++++++++++--------
 2 files changed, 35 insertions(+), 15 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2784C206B75
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2020 06:59:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=apb6dSAYL7IPv7lAgDymEAoqBpfGjrH7djvF9jOW5pI=; b=SVls/Iy045k6s3Dw0X8PFwQPnj
	AYca+NOkdfnP9IbfkUnk0UecBZK+tgLbGhGCdSICa3U5esShwyd032ozONG1Ks1G9QUGy1mFuEKtI
	5e3jJYNp/vGHEyTpjwBYfyJUUwsPz2slnbwbQ9XCFnLHkoQ/Ve77bNjzXQno1OzEQcn4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jnxUr-0006an-V2; Wed, 24 Jun 2020 04:58:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3s9fyXgYKACwLZWaMVOWWOTM.KWU@flex--drosen.bounces.google.com>)
 id 1jnxUq-0006af-6x
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 04:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VIhRPUc686EfpzyL1ZkpMu0h/tTzQnqLcgbnZ2tSukA=; b=G2W/MAra/Tye+Gd4SUgnZvS1++
 7EtlX273qnBHt5ATTxqIaNSf5lR258E4JlZ9xIQKnYJXhTfgSoDwA2MLXceXj462jOLiZuU3RdJr4
 SiKoBNXpsW+Uab70hmWYR6Zg61vRJtAmdhuzB8JJON7puJv1VIiY28ch1aEDABber2RE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VIhRPUc686EfpzyL1ZkpMu0h/tTzQnqLcgbnZ2tSukA=; b=d
 HLg5Q8dGcB4oBG4CVyx7OVVLlTdtUl4rlyUOTnSui0p5q3dbqKH1OV0crUMZA5O2JdFHPDM9r7myt
 ftbPtHG1nepszfk0yI+Gow1RE39DumE7I7l6KurHLUS6sTuBDddUC/DYo7ldY8PNu+NzGN401foxh
 4V9puhWcqIYvOYN4=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jnxUo-00G9p1-Vh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 04:58:52 +0000
Received: by mail-yb1-f202.google.com with SMTP id l9so277670ybm.20
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Jun 2020 21:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=VIhRPUc686EfpzyL1ZkpMu0h/tTzQnqLcgbnZ2tSukA=;
 b=ATg4ot7iQfZhD7VJCToYCJEq0+HHgex7Fu5otS5NIVKN8IP1NunyBFhinY6vJQmpWp
 4Ij36w/kSxOzIDs1lg4m4ranBcUkYgjgGqDBqZtXEgUF/A6viuow4yzNYWkxxGRvlpWC
 mmIuA8xMCysfmJgO6z/8XuIDppG81o+uGO/b1g0+chDgAnIrr/7wD3ZVV8Vz040+E4+Z
 OdVyjEqMLwNTcMPpg5aX3GyMmWgYDsyC79JWjtqgCg9JBAfM0b3dFkEJ4zIsj8DZBgV0
 XSQbXGyBLB4NyxkGBW2KMLsu3Za4MN22eTnqS9Z/oFfinJGodSjpc65NAWPD+W0KoXtQ
 L6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=VIhRPUc686EfpzyL1ZkpMu0h/tTzQnqLcgbnZ2tSukA=;
 b=L5UpnaxXL9ighFTel1X22MyXnakiJ76inPF2FR2iFpahoDQwKUSQDchG5XCXFLJUZF
 t55BMMg4TMsC+21I6yu8D+tD+l1tiyNCdVylBxNdxfR2UpuH3nV1XBGtJTadegzOdR66
 gcr/xdlFAc7zWsVfxpMfpoVoOqaX1u3j38lnkfUevRHtaFYtc78fCKmuNij/uKslF1o6
 eL73Rmkk/lzBWANlxjUFz93B7llTvpb8/+u4QhUzJB4eZUkiksVA/svCXsqKPiprWbBW
 IurkhxRRfu4xhN8GEbLlGMiCjq9x2lSha2HzSEU+IP0wbl0KyDb4RUEizSIdbWBY5o/o
 svRg==
X-Gm-Message-State: AOAM532g3M+Aqi7yDDh8V+ua/XBkvkTzBswzyy/X+pu7ZoDuDMbwOXu7
 hrMcD+KLtm5VK7kix/PnaJUeDh2WAXA=
X-Google-Smtp-Source: ABdhPJzqZudoyjfwmOnuXUVebSWSY1PkS5+3B30QL46yfijJWtmCuoeOhxK7BwlRH7FbBAlVw+Pj75yPbZ4=
X-Received: by 2002:a25:b8b:: with SMTP id 133mr42829755ybl.373.1592973235828; 
 Tue, 23 Jun 2020 21:33:55 -0700 (PDT)
Date: Tue, 23 Jun 2020 21:33:37 -0700
Message-Id: <20200624043341.33364-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jnxUo-00G9p1-Vh
Subject: [f2fs-dev] [PATCH v9 0/4] Prepare for upcoming
 Casefolding/Encryption patches
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This lays the ground work for enabling casefolding and encryption at the
same time for ext4 and f2fs. A future set of patches will enable that
functionality. These unify the highly similar dentry_operations that ext4
and f2fs both use for casefolding.

Daniel Rosenberg (4):
  unicode: Add utf8_casefold_hash
  fs: Add standard casefolding support
  f2fs: Use generic casefolding support
  ext4: Use generic casefolding support

 fs/ext4/dir.c           |  64 +------------------------
 fs/ext4/ext4.h          |  12 -----
 fs/ext4/hash.c          |   2 +-
 fs/ext4/namei.c         |  20 ++++----
 fs/ext4/super.c         |  12 ++---
 fs/f2fs/dir.c           |  84 ++++-----------------------------
 fs/f2fs/f2fs.h          |   4 --
 fs/f2fs/super.c         |  10 ++--
 fs/f2fs/sysfs.c         |  10 ++--
 fs/libfs.c              | 101 ++++++++++++++++++++++++++++++++++++++++
 fs/unicode/utf8-core.c  |  23 ++++++++-
 include/linux/f2fs_fs.h |   3 --
 include/linux/fs.h      |  22 +++++++++
 include/linux/unicode.h |   3 ++
 14 files changed, 186 insertions(+), 184 deletions(-)

-- 
2.27.0.111.gc72c7da667-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

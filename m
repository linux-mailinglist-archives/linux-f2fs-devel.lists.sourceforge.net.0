Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B50B2B5901
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 06:04:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gq5AE5uDeMV1eAjc8QgqlwEosuojo0ik8pnW+sml+TM=; b=JZttQgeMTEQAqK2ymyzIeEsfPs
	TiLKB5WixRIWzTbMSwDAetbN14oNqObjecdwyQVlRQVh4lxARbfsBzjZUVoSIzgsEjgd+AOYfVE4B
	p2IEVqqfBlXlanX+vWxsbO2LL8O3C/9hoJQoSk1nUp5+U4bycU3/uPYXbhLcS21lndCQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ketAH-00073x-6n; Tue, 17 Nov 2020 05:04:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3hkuzXwYKAO0SgdhTcVddVaT.Rdb@flex--drosen.bounces.google.com>)
 id 1ketAF-00073c-20
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 05:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yi0JUluZtuNsiNBZqteV14yq9mKWglSiwibM+BbEW8s=; b=fhEehigx3d3U/vIH8yOEC9Sj6s
 A+zfqHwkMkHIJms8ojvYoqMPm3EqS9f+v72w0ymYmxDHLs7s1WaTIFekZhLDz+CTckKDy9bsqPZEO
 iIcrkkC9563v23dUqnmu0Z29VtzG2yjI520AimSznkokqRYKf0QR7wdYPqWLruExai6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yi0JUluZtuNsiNBZqteV14yq9mKWglSiwibM+BbEW8s=; b=G
 EHGqyKE6lnVxknD5eplmSnclxi+qwooL4bXUcjCjDdgPEIVNr3tjrOrkvZc8BWVViV1siJYMaqjcc
 eFbEviOiNYh8l66udnBrJu74W0ZuUdXHYn0l5LhK6pNlAAo7IbFNKb8AmgguWSwQykKnsmd5lFIHN
 7ZegF+dkeugPTkhk=;
Received: from mail-vk1-f202.google.com ([209.85.221.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ketAB-008u3n-Tg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 05:04:23 +0000
Received: by mail-vk1-f202.google.com with SMTP id x65so6999942vke.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Nov 2020 21:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=yi0JUluZtuNsiNBZqteV14yq9mKWglSiwibM+BbEW8s=;
 b=vUa28QYkFc2WUUIbgYO3nv/X2d3Z3MKwmP9a9NdvQ+iXI9eRQSpwcbM1zweGD+PWjQ
 QyO7PKMH7hALyP5kVRRUUEQhNUMyGcGxycU5hh15BIlDdMDVNFeomDPWZtAiNxYcDVgI
 O9N7Q8fQK6FCCYWzN4zAysq4VjpXkGWFoHwSAyIgOdZ3JdTXsHSQxt7A535mEFe6mbCI
 xRcdwurKrJjRS3x/Wy7Owt+nUhBzzoZd59OpZAMSSLJwMwiWNfuJ57bdm6HBz3MYe3jz
 CDHDezcGavS4VIbNKWOomIriqHoANjpxWR1mF8/FtsvNrR1jmsH9N2dG7lDQUsqelH/h
 IREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=yi0JUluZtuNsiNBZqteV14yq9mKWglSiwibM+BbEW8s=;
 b=TR0oLf+kT0u9y8H8bRzoi/B1JsCPRCpXhPO7HsjFcE+hgCJ2MD+EKV34X0EMqOF3ag
 jKlXgBGpn8XGGnilUZsIiMwmmhfN7u7pmpRk+486PXBZirnlPNqM3ZvBTkd0JrAPS2Dh
 e3Mh0GyTk0CbtPOvPNhXa/SzQAvEt35x/jRKPC0wqzINfD6GbX7Q2yVKKhq2Ku64UDe/
 VxD66Q+1uCwls2521TGhzgsU3vZ6WRDEnEvK81Zlwosue+DeIEzWQEJnQr6EZ1u6N64N
 +Jvkjngf71cxN2FJ207lWxmowOjfiVJ1UpzrdIFcUNsHZksluhucFEI44QNkEe2YbpE7
 6LSA==
X-Gm-Message-State: AOAM53292lgceyS16326Kt7IulUcch+moMwt3PB+FfNeWo9VV05dUNtQ
 b3pZMxrcSvGPmsFYjqjexKpjmk6dySE=
X-Google-Smtp-Source: ABdhPJwVaMNu6pc/HpSWjKyc3VedMIrzCM6dHWWO+chOqAq4rf69TQRjG2u+LrpdtRlwfoNUezY7MZGkC5A=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a05:6214:12ed:: with SMTP id
 w13mr18440880qvv.23.1605585798591; Mon, 16 Nov 2020 20:03:18 -0800 (PST)
Date: Tue, 17 Nov 2020 04:03:12 +0000
Message-Id: <20201117040315.28548-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1ketAB-008u3n-Tg
Subject: [f2fs-dev] [PATCH v2 0/3] Add support for Encryption and
 Casefolding in F2FS
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
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

These patches are on top of the torvalds tree.

F2FS currently supports casefolding and encryption, but not at
the same time. These patches aim to rectify that. In a later follow up,
this will be added for Ext4 as well. I've included one ext4 patch from
the previous set since it isn't in the f2fs branch, but is needed for the
fscrypt changes.

The f2fs-tools changes have already been applied.

Since both fscrypt and casefolding require their own dentry operations,
I've moved the responsibility of setting the dentry operations from fscrypt
to the filesystems and provided helper functions that should work for most
cases.

These are a follow-up to the previously sent patch set
"[PATCH v12 0/4] Prepare for upcoming Casefolding/Encryption patches"

v2:
Simplified generic dentry_op function
Passed through errors in f2fs_match_ci_name

Daniel Rosenberg (3):
  libfs: Add generic function for setting dentry_ops
  fscrypt: Have filesystems handle their d_ops
  f2fs: Handle casefolding with Encryption

 fs/crypto/fname.c       |  4 --
 fs/crypto/hooks.c       |  1 -
 fs/ext4/dir.c           |  7 ---
 fs/ext4/ext4.h          |  4 --
 fs/ext4/namei.c         |  1 +
 fs/ext4/super.c         |  5 ---
 fs/f2fs/dir.c           | 96 +++++++++++++++++++++++++++++++----------
 fs/f2fs/f2fs.h          | 11 +++--
 fs/f2fs/hash.c          | 11 ++++-
 fs/f2fs/inline.c        |  4 ++
 fs/f2fs/namei.c         |  1 +
 fs/f2fs/recovery.c      | 12 +++++-
 fs/f2fs/super.c         |  7 ---
 fs/libfs.c              | 60 ++++++++++++++++++++++++++
 fs/ubifs/dir.c          |  1 +
 include/linux/fs.h      |  1 +
 include/linux/fscrypt.h |  5 ++-
 17 files changed, 170 insertions(+), 61 deletions(-)

-- 
2.29.2.299.gdc1121823c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

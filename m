Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C98217D4B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jul 2020 05:06:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jbPPB+oVMKW2/fGIAQZhZlEQKekpRapvspIGjH1TANc=; b=hk4aY4mhdgI/QucgeWtwwzRQuv
	AvYgnCddc6KObeE7tu8LtDnQwJGZL0Nroy9cn+fthGLEyAK+r5q3RWz8ocO4SWeb5nj1Ta+lAPTWn
	x/Ni82oFm9e0cQZutludKuZp2wDEs15scnJCRx1GnckPNlKNrjD+zKPkH+sYz8m86pDw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jt0PV-0003ly-M6; Wed, 08 Jul 2020 03:06:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3FDgFXwYKAJc4IFJ5E7FF7C5.3FD@flex--drosen.bounces.google.com>)
 id 1jt0PT-0003lq-LD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 03:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sxoy6q+HxdTygJctVhkj+Ncax7HD8YrVRDBUHbmI/GA=; b=eb5m+m4MyXGnticXeUkVu1n/C9
 a6jTbf9smav8Y0YKatTfDRPMeO3b+c80vVzK9chZG0iiNQJ/30dRLLlUNYsugN9fybL4E0dJ4LEUk
 wrqTJToTaEdFbwDnjOye84X1WB0MSimBC3CDVbs2o81Keow7wSzjiEBqU6/SKt6Zg6E4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sxoy6q+HxdTygJctVhkj+Ncax7HD8YrVRDBUHbmI/GA=; b=f
 uj9ZHKrpk38c8eCVNQO/NMrtktZkzsguNOlCUlv19UTay547d3mevdfRlOxeztoL7/iIZpY4rysW1
 L1leOkjjGBgVUAbLs726/reau+QBJqpOGrfu3WdhGTGDoqPqKaj5tbnY0S7hREbdbs0aVAgzPV/6U
 /8EPswxqMnQpTH9Q=;
Received: from mail-pg1-f202.google.com ([209.85.215.202])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jt0PR-00Dnna-JT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 03:06:11 +0000
Received: by mail-pg1-f202.google.com with SMTP id o15so34008995pgn.15
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 07 Jul 2020 20:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=sxoy6q+HxdTygJctVhkj+Ncax7HD8YrVRDBUHbmI/GA=;
 b=jvxGSCDzgqCSzD3A5CZ6zoxEY3HwELi8FObL00AmNlxQWLpvrUeBFZBc3B9zB5etbX
 mYEpJX0jRgUUJ4S9ot+BQk61eRDjpYkKZjXS5FkMSOUavjWBlMPiA5+LW/699y0iXpQC
 s8ynNf8lIHMTPkHzVRmSAVfDowYI++DiMfl/exKk9l+l/8eEG3w0s91A1Ycqqyju5MfB
 hrssrkk130gtKV4YYHCQ2dycaO4RT4XQHdC+kpGmlUYHSXN8zNcGMq9fWspZLGH9mYPU
 dePpa1pDLmtFFKbvxkZX6SahRyc7gjEHircUdtQBKPXrVPw+ESEA+mxA7Fqh1xXzohzl
 +nKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=sxoy6q+HxdTygJctVhkj+Ncax7HD8YrVRDBUHbmI/GA=;
 b=Pnnma3SxD0MAr9D3bBlQOabvZGztQHcNYSjwnpBY/CDPs5RXuP26MNuyW4mOxOv7gt
 pKZ4DLhMrH6Lcr0F3pj35kiu9ayGI241FlHC6r2jmMiept++Zhsh5IKKrrPOq6bn7wG0
 zKvTjZx6ZC+DS4+5Zb7kH5V8joIscDJnj+/6dEn921YW2CM4QyU4ryUICyOSPwbniiys
 l4PRL6M8UCbKSG06K/XEGa2cPbuxMc/mgw+0YmQz6BgYlGHOUZQsE6VCLr2ma7DXRwFt
 YQ2rC2lgwgToaCuYgIs63BfoKvHSmN0IXehW+qfPNy3NDQ5c4nTXHWp5QjWrofcUhIwz
 ZpDw==
X-Gm-Message-State: AOAM531EYISrYL1eFNOZeOlDmFEySveOBDdI2KcM1ufjYPaJD9b8yuz5
 7Q39zXtR5Xezffkq1k0r0dcsVepXnLo=
X-Google-Smtp-Source: ABdhPJxHc+FKhRyKZRaUpdsFwS/kCIg/eIMdmz1LxIxSnZIjP9Kv5YSfmEOlULOG9PgVuLCQSbtYJSctP7g=
X-Received: by 2002:a17:90a:1fcb:: with SMTP id
 z11mr1032734pjz.1.1594177556279; 
 Tue, 07 Jul 2020 20:05:56 -0700 (PDT)
Date: Tue,  7 Jul 2020 20:05:48 -0700
Message-Id: <20200708030552.3829094-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.202 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.202 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jt0PR-00Dnna-JT
Subject: [f2fs-dev] [PATCH v11 0/4] Prepare for upcoming
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
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This lays the ground work for enabling casefolding and encryption at the
same time for ext4 and f2fs. A future set of patches will enable that
functionality.

These unify the highly similar dentry_operations that ext4 and f2fs both
use for casefolding. In addition, they improve d_hash by not requiring a
new string allocation.

Daniel Rosenberg (4):
  unicode: Add utf8_casefold_hash
  fs: Add standard casefolding support
  f2fs: Use generic casefolding support
  ext4: Use generic casefolding support

 fs/ext4/dir.c           | 64 +---------------------------
 fs/ext4/ext4.h          | 12 ------
 fs/ext4/hash.c          |  2 +-
 fs/ext4/namei.c         | 20 ++++-----
 fs/ext4/super.c         | 12 +++---
 fs/f2fs/dir.c           | 84 ++++--------------------------------
 fs/f2fs/f2fs.h          |  4 --
 fs/f2fs/super.c         | 10 ++---
 fs/f2fs/sysfs.c         | 10 +++--
 fs/libfs.c              | 94 +++++++++++++++++++++++++++++++++++++++++
 fs/unicode/utf8-core.c  | 23 +++++++++-
 include/linux/f2fs_fs.h |  3 --
 include/linux/fs.h      | 16 +++++++
 include/linux/unicode.h |  3 ++
 14 files changed, 172 insertions(+), 185 deletions(-)

-- 
2.27.0.383.g050319c2ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

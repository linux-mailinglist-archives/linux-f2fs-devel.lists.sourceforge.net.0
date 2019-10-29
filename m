Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9083E9105
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2019 21:44:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPYLW-00058A-11; Tue, 29 Oct 2019 20:44:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iPYLV-000584-Io
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 20:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7dOYlwTNkThCNBR0mYXXIfpN2e6mQHKxm3rZI4qR+lo=; b=dfdJATocyjRxv1zeWMGj8Xbd2O
 s53AlrrOYTX24P5DVNS8kSmmtqSMsxUS1SWYi48S96baJSCVRnefr0yiGJGyMSmTUIssXixyf/tS4
 fkIV8uJOfRiubAs7o80Q8KOYUkzSm0hNSkR8gsYtbEMVjzcSmABIRDQKCXTcZrX/8CX4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7dOYlwTNkThCNBR0mYXXIfpN2e6mQHKxm3rZI4qR+lo=; b=R
 7Il0BsX0Bbr9RmiPqXSBWygJrisVIFGFdDoyEHGoTvkMFsozz3Jf9Mg7b0ti9P1wWH+Z5pv3NDPvd
 xbjAs6zlXQoLu/28VX2XqD37aBPVVmiE9tHsXgksUTGpbAr7bOSaPVhV11Vd0Llv/yHed8WMlHXm0
 qc78/2HE6NP1mFJY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iPYLT-009LgS-2g
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 20:44:05 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1E132087F;
 Tue, 29 Oct 2019 20:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572381835;
 bh=PO9FWnMviEuNb31RBWbFM6qoAGbqLACtBOE0D5G9jSY=;
 h=From:To:Cc:Subject:Date:From;
 b=tXVpNGPBJfZ2HxnE4AwO/rpSHRictz/rj27j8Txw6/U7VlJMoTBH9fL5Cn/eP4RI8
 vfqiLz4derg9gYJzw1E4PMXNQf9Tp3CgrcCbyjjmlqTxM9+zOp6SUzKO+QPaJYrhTd
 32TVj4HxDWc0jneJIVgxG8SvQxHdfjPbW9H5Eg34=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 29 Oct 2019 13:41:37 -0700
Message-Id: <20191029204141.145309-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1iPYLT-009LgS-2g
Subject: [f2fs-dev] [PATCH 0/4] statx: expose the fs-verity bit
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patchset exposes the verity bit (a.k.a. FS_VERITY_FL) via statx().

This is useful because it allows applications to check whether a file is
a verity file without opening it.  Opening a verity file can be
expensive because the fsverity_info is set up on open, which involves
parsing metadata and optionally verifying a cryptographic signature.

This is analogous to how various other bits are exposed through both
FS_IOC_GETFLAGS and statx(), e.g. the encrypt bit.

This patchset applies to v5.4-rc5.

Eric Biggers (4):
  statx: define STATX_ATTR_VERITY
  ext4: support STATX_ATTR_VERITY
  f2fs: support STATX_ATTR_VERITY
  docs: fs-verity: mention statx() support

 Documentation/filesystems/fsverity.rst | 8 ++++++++
 fs/ext4/inode.c                        | 5 ++++-
 fs/f2fs/file.c                         | 5 ++++-
 include/linux/stat.h                   | 3 ++-
 include/uapi/linux/stat.h              | 2 +-
 5 files changed, 19 insertions(+), 4 deletions(-)

-- 
2.24.0.rc1.363.gb1bccd3e3d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

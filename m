Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DD52F8444
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Jan 2021 19:24:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l0TmG-0005FE-4c; Fri, 15 Jan 2021 18:24:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1l0TmD-0005F3-RH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=flhooEZ4m1yHUxiCjhUIm7IJx8vnss0SxBcZ3QRdqaE=; b=Ana5MShGswXwSVo8ozteeEwsz+
 q2O7jyGKlKfIbelJPjdwDmKJ3gjpJ6RdycsUXCdDJ8SbIwh0eNJ8iNT7oT/t9TWWXMCs5Sc1KSv7B
 M9eth4eTOLtPI690o4oip7tdP5JGw3iKB5MZZrbYJqBEiy6ft0cKgUmhbK0GZxKKLFnc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=flhooEZ4m1yHUxiCjhUIm7IJx8vnss0SxBcZ3QRdqaE=; b=U
 JOsk+5WCTGIJV6CcyNrvnDO9OOhk4QpAutSst7WeKK4DHVTxlZZ+tFCgxBD+k6DQNJ4vyHByquL+1
 U4jD1Y5VFJ+qlv5PNHGeAk6yvoebc7Wkdu3B03JFf/8fFsr4GG5PIB25J8UHCdpCy1Ie1hWwJ6mVX
 ZgloeYumju1wovRw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l0Tm5-00GNti-4D
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:24:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 634A82313E;
 Fri, 15 Jan 2021 18:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610735075;
 bh=JvwSrvlAR0FRVMmPnsm7OaEmCpo7wayISAk8qiI4LBU=;
 h=From:To:Cc:Subject:Date:From;
 b=Go8IrCO2QSStDmAWKolAVPcV3yRiWv+KRQST9tcks6dVPOiZXwNOTEE9NjzSxFd5G
 oJUmST3E8YS7T/lp3V+1Q3t6t7yL/dfkFHDV8mGeKAqnfQHR93hqIH8UM7MmL6gk8B
 CV2MiLas4mLbdJc/dPLcApu+L25YMI0La12iCe32RbX/Bd6dEn4fXPsWLuhb9tNIhU
 odYTbx8QYbBhrwe14kZ4+a9wo0LUZexRFOyUPKB5/Juasr5XIAnjQ8Qf5dm0Zo5SXc
 g8dQCZbnUhoDAZvWntn8HbxWPBo6O36o04tnfQYv3/ir5kBx3zlh5++ZbQZbT/KhZ3
 wH4r8FiHGLTTw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 15 Jan 2021 10:24:00 -0800
Message-Id: <20210115182402.35691-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l0Tm5-00GNti-4D
Subject: [f2fs-dev] [fsverity-utils RFC PATCH 0/2] Add dump_metadata
 subcommand
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Victor Hsieh <victorhsieh@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add new subcommand 'fsverity dump_metadata' which wraps the proposed
FS_IOC_READ_VERITY_METADATA ioctl
(https://lkml.kernel.org/linux-fscrypt/20210115181819.34732-1-ebiggers@kernel.org/T/#u).

This subcommand is useful for xfstests and for debugging.

Eric Biggers (2):
  Upgrade to latest fsverity_uapi.h
  programs/fsverity: Add dump_metadata subcommand

 Makefile                     |   1 +
 common/fsverity_uapi.h       |  14 +++
 programs/cmd_dump_metadata.c | 167 +++++++++++++++++++++++++++++++++++
 programs/fsverity.c          |   6 ++
 programs/fsverity.h          |   6 ++
 5 files changed, 194 insertions(+)
 create mode 100644 programs/cmd_dump_metadata.c

-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

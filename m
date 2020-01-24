Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E181147783
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jan 2020 05:16:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iuqOc-0004mK-Sp; Fri, 24 Jan 2020 04:16:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iuqOb-0004mB-4O
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 04:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fgUC/4yLXQ28EPDR9YBF9XRXJ4YzOA8FvXiUDBnDG+A=; b=J+90cD1T4r8OmEyaEgTqLAcG9p
 zsS6zzX/hLn/my5285TZBdhJ0YeUE07Nsy6E756mMoNi6oupz9fUg7KwwvbyjTMo4zoQSEYamUOLZ
 mbyo/6T74JImPBG/ZgbHXpuhnWkp8f1eDQPDo/bDGR1jV8iz3pN5ovjGLgvRDPaA53Zg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fgUC/4yLXQ28EPDR9YBF9XRXJ4YzOA8FvXiUDBnDG+A=; b=H
 skRN9BTs5adghs7l+PK5Lpt/9f4lZQ0qoeblJszSs5K5aa9UqH5iBS3KcNn+dsWbhQ83vPY1ZXudZ
 AT7KhJqP5Sa9liX9Ya4eoeK2RoVqR8P6XMHCaeJL+JQYThjrZ40biQM5CFJLf2kBOY729zNq7S33r
 U33c3sjdj5uvZHnw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iuqOW-003EYX-Mq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 04:16:37 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D921620708;
 Fri, 24 Jan 2020 04:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579839387;
 bh=EuvhQIPwiMkjWMW2ISI1mewp2CJ8ykDJLYX5MlF0CcQ=;
 h=From:To:Cc:Subject:Date:From;
 b=eHP+pS+NYDGAIxKniN2dbZQLhV5h2aQqWDa5h43MbjEDunKHq2LKx0at1fs1MIFlN
 0d8O3rmwM54wrTjSxdwZE5wLfZDrnfnrHDECzeBF4MXFfO8fBUoMmaoVR2xsyw5iwg
 cZivPEaFmaNZp1k470qU0S5EE09fFOcpBvpMGNug=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 23 Jan 2020 20:15:47 -0800
Message-Id: <20200124041549.159983-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.0
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iuqOW-003EYX-Mq
Subject: [f2fs-dev] [PATCH 0/2] f2fs: fixes for f2fs_d_compare() and
 f2fs_d_hash()
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
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series fixes dentry comparisons and hashing on f2fs filesystems
with the encoding feature enabled.

Eric Biggers (2):
  f2fs: fix dcache lookup of !casefolded directories
  f2fs: fix race conditions in ->d_compare() and ->d_hash()

 fs/f2fs/dir.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C2E8C1C06
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 May 2024 03:23:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5Eyy-0003Wu-F4;
	Fri, 10 May 2024 01:23:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1s5Eyx-0003Wo-Qp
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 May 2024 01:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=042UsxbwCdFmNtD8Auyxmc0ZSjvlNmP2flJWzQqXrA4=; b=QzEMM2KnE5g3/li0uqPHx8I1UG
 WDuIqEKy/SEZZVAyIWMrcwx7khp0oqSpR48APa+0L3A3/MCJmbmMvOYsG85XQnLpkRAuYXvt76yeY
 XWRz9WpNeRaRxqTgjOB01VBFxvUb69+fyxD2kooayS0CZv0FflR/9Qp02e9tHEivxn2c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=042UsxbwCdFmNtD8Auyxmc0ZSjvlNmP2flJWzQqXrA4=; b=jvWRoFDxtyuiugtVjPSyBzJVWB
 qQTkYGZlph6zD1JCc+42O6l9SjCAfJ3YitcGbp/woy3gF7QgNidSrTBN2t2cikDPQYAxAWpYhG3ld
 8UI9edBVH9M8LJ1H+H9nwpz1cpPVDtMVWpqWrRxuE/zCWkparMFd1FRzLOu6MUK01Rm4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s5Eyy-0007UN-69 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 May 2024 01:23:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6DE3FCE1C62;
 Fri, 10 May 2024 01:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60614C116B1;
 Fri, 10 May 2024 01:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715304203;
 bh=q/FawnNNYdlyJTnV7E3Oe1PGL6Eb45vWLaHXkmAaNZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pwZv8VsSwrZOOohfrqdjX3bsQIUWtJESwffvWTHyjxpKo9ZV1uf/EjVz225CT9p6+
 h6j8eu2Zemx1r2C7dzpgS/JeDI8nQ4Boid45QlHuaD3gacoqkP5OeB0LXvXXisRXcy
 t/NSSc5XVmqF00wXABtz/et51ITlrvAqcWdiMc3YlNskt5QPObrfnoVzdHs/L5HEGs
 w73jIWSua8+2q/QFXImM1omgQ0rtb/9hMHmJFuE5jpyGJ36+U7ZSAe1vkfTrTzInKZ
 yW8GCwEfsjcyGYDqYZwC+ayNiNccGJdYxU7SmRht/Z10lzmE0HHhuOurIP+0uIo1QV
 13HcrkjxpFIXg==
Date: Fri, 10 May 2024 01:23:22 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Message-ID: <20240510012322.GB1110919@google.com>
References: <20240405121332.689228-1-eugen.hristev@collabora.com>
 <20240405121332.689228-3-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240405121332.689228-3-eugen.hristev@collabora.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 05, 2024 at 03:13:25PM +0300,
 Eugen Hristev wrote:
 > From: Gabriel Krisman Bertazi <krisman@collabora.com> > > Keeping it as
 qstr avoids the unnecessary conversion in f2fs_match > > Signed [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s5Eyy-0007UN-69
Subject: Re: [f2fs-dev] [PATCH v16 2/9] f2fs: Simplify the handling of
 cached insensitive names
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
Cc: krisman@suse.de, brauner@kernel.org, kernel@collabora.com, tytso@mit.edu,
 jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Apr 05, 2024 at 03:13:25PM +0300, Eugen Hristev wrote:
> From: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> Keeping it as qstr avoids the unnecessary conversion in f2fs_match
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> [eugen.hristev@collabora.com: port to 6.8-rc3 and minor changes]
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
>  fs/f2fs/dir.c      | 53 ++++++++++++++++++++++++++--------------------
>  fs/f2fs/f2fs.h     | 16 +++++++++++++-
>  fs/f2fs/recovery.c |  9 +-------
>  3 files changed, 46 insertions(+), 32 deletions(-)

Reviewed-by: Eric Biggers <ebiggers@google.com>

(But please change "cached insensitive" to "case-insensitive")

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

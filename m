Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC3A749282
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jul 2023 02:18:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHChg-0005K7-5b;
	Thu, 06 Jul 2023 00:18:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qHChY-0005Jr-LL
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 00:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iOQE62OYivPDcIWQRBdgTeJN43McprGP3CwTMl0b6mY=; b=Nin6lCW4xun+xF5TaacrXBt3kG
 HCg+I0ma8pn5flbCroVAMmWV4YDmnMr/JobMiBE8LUSvk1TRi/qdQwcFzPLNQiBe4Dqk3f1p9Sv8B
 gdi1p1QpOGnqwB2F2N5Fb11cioHdFEEkBYLmsb7X++H14YsHdao6c26+eofWT2J/b+U8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iOQE62OYivPDcIWQRBdgTeJN43McprGP3CwTMl0b6mY=; b=m2u/jdEBXg8Vt1ws4k/dWbakkm
 73cvG0k3yt1Z3+QOivMiWNhIh0A8yCQ7/VCQkqCn7hW3dz04tJqWdvi9XBUV9zFFl6xXKC3D7e+M8
 5J6UMXFbzYX6BMounAvEFqhIFtZdaawG2TLpiSfmynbaUmM4RXeuno0DwJOepiTVQexc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHChY-0006H9-7N for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 00:18:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AADF461805;
 Thu,  6 Jul 2023 00:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16A93C433B8;
 Thu,  6 Jul 2023 00:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688602695;
 bh=HpMG+tyy/PpsvKEb8NWliRWVb2DUG5Z8rXMZJ3Y3mkc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LikA3OcMzLtL2uR3eKzQF0LeVsSNlJMLK11D/oOQ9aYM0WA8UsDwj10GcOrJC8tjt
 pOtPDyPeQukRBF4JtgJ+YubOhUz7XE54fcrit2sn66Vdd3x7HS1eQYlvPRjNX5zd92
 jbiBLti3sH7MFOCUBJiPHyJ4F+VPb+WyALiwovY5jyWvkCE4p8ezOZqmUEYC5vv9fY
 v4sL7Nm2aJYhzPUkvH3ccCI0wtBJ09fMx9u1UWMg3moBDCd7LRGoHd2Z5SlXNCn/EI
 8zubzYmjfskHw8c7CvYiw2po7nMHPqBCXwQ7gLh1SlEOU9UZq29FGodMiixx1gmjKs
 hUJbESOiaXfLQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 F0210C691EF; Thu,  6 Jul 2023 00:18:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168860269498.29151.2669410551132746914.git-patchwork-notify@kernel.org>
Date: Thu, 06 Jul 2023 00:18:14 +0000
References: <20230601104525.27897-1-jack@suse.cz>
In-Reply-To: <20230601104525.27897-1-jack@suse.cz>
To: Jan Kara <jack@suse.cz>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Christian Brauner <brauner@kernel.org>: On Thu, 1 Jun 2023 12:58:20 +0200
 you wrote: > Hello, > > this patch set fixes a problem with cross directory
 renames originally reported > in [1]. To quickly sum it up some filesystems
 (so far we kno [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHChY-0006H9-7N
Subject: Re: [f2fs-dev] [PATCH v2 0/6] fs: Fix directory corruption when
 moving directories
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
Cc: brauner@kernel.org, tytso@mit.edu, miklos@szeredi.hu, djwong@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 viro@ZenIV.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Christian Brauner <brauner@kernel.org>:

On Thu,  1 Jun 2023 12:58:20 +0200 you wrote:
> Hello,
> 
> this patch set fixes a problem with cross directory renames originally reported
> in [1]. To quickly sum it up some filesystems (so far we know at least about
> ext4, udf, f2fs, ocfs2, likely also reiserfs, gfs2 and others) need to lock the
> directory when it is being renamed into another directory. This is because we
> need to update the parent pointer in the directory in that case and if that
> races with other operation on the directory (in particular a conversion from
> one directory format into another), bad things can happen.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,1/6] ext4: Remove ext4 locking of moved directory
    https://git.kernel.org/jaegeuk/f2fs/c/3658840cd363
  - [f2fs-dev,v2,2/6] Revert "udf: Protect rename against modification of moved directory"
    https://git.kernel.org/jaegeuk/f2fs/c/7517ce5dc4d6
  - [f2fs-dev,v2,3/6] Revert "f2fs: fix potential corruption when moving a directory"
    https://git.kernel.org/jaegeuk/f2fs/c/cde3c9d7e2a3
  - [f2fs-dev,v2,4/6] fs: Establish locking order for unrelated directories
    (no matching commit)
  - [f2fs-dev,v2,5/6] fs: Lock moved directories
    https://git.kernel.org/jaegeuk/f2fs/c/28eceeda130f
  - [f2fs-dev,v2,6/6] fs: Restrict lock_two_nondirectories() to non-directory inodes
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

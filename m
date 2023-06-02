Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E0C72028E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Jun 2023 15:05:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q54TD-00057w-4q;
	Fri, 02 Jun 2023 13:05:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1q54TC-00057p-15
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Jun 2023 13:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ybraphHs/4ufEPomTXSiOoaUsEtFXX7xAzduMTcRhuk=; b=luHHKQboZHOs9Sji2CCRT/8mMf
 wXKtEV6HmsAa+ULkt+fDLfZ05jP0L6MWT8atMGgtUWDpiRS6Nz5FK+OINyo/L8goO00evg0xhDYG6
 /2skg3yidX0ERrF4QHJYirzMld2GmFtfdYivt0p7lbTfeabxLZWCvuZepDNbl/I8mC+M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ybraphHs/4ufEPomTXSiOoaUsEtFXX7xAzduMTcRhuk=; b=g9zQZE2HSKs5YTbhabCpiVM2Gd
 YX+s4nDzss0oYBZORgFWNgL6tvYl1G7rH6r6GWy70sIKI5ZtaHTbj3UW7OG/ZgYH5x4QgRSqWrlSD
 spQqeQ5XKsPTPKXUMH8f5FMeRS18IMcgoyFz1ijm+M/t1aTAjE6SP/W8Pol3YN4Dg3TY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q54TB-009HoY-Ty for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Jun 2023 13:05:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8504264F2F;
 Fri,  2 Jun 2023 13:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF4CC433EF;
 Fri,  2 Jun 2023 13:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685711123;
 bh=FoLf4aQs97gm4dA2dA1/lRECoc6PX0rzzxDCa+caZUI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J3L9J89xcNwCE+rxAScjDifxLtgAxv8t9BoM5Xhk4XvpaFrlVwmwe/nRfAM22L3+X
 XrN9659E4ud6B5SaFKM6eEA2LuH8cFhnPcnWU28M7Pwz86HnIuaXuyxqWAxKCv8kfC
 Xeq7+W9pUNN55z2ojEeSHyE6GN3oAIFfXdN3V87jC+95xoQR+eCpNZvaXluAVOsBzr
 ZzDDWUdy+IvGMweeF+2spO/T4D4XrsifffSa4Xu9WV1+bN/O9l7FruMkkZInjC/KVz
 0jTCmBJkQPl157w41nbfW1ff2cvk6H7qYUNhhhdJyKi1UQRdrc/59kD8RprGQOz9Cw
 uN9C/Y8AVnUHA==
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Date: Fri,  2 Jun 2023 15:05:13 +0200
Message-Id: <20230602-abmelden-zarte-405e2540fde2@brauner>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230601104525.27897-1-jack@suse.cz>
References: <20230601104525.27897-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1940; i=brauner@kernel.org;
 h=from:subject:message-id; bh=gVTr7b6YTyap3no0CaHa00viaTffglxt+9+3v0nau7E=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaRUvvjhf0rqyYLwTIY/DpkV615xcK7muXkvJse+eMpZrwvi
 V+2lO0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACbC7sjwz/bJ/5b02Y3zmw4Wp3u+EM
 6Pv3lqr57+n9RFkR85jy14/IHhr/DUaw/SgpZYTS9MelVieGz77sJc5hllQS1RPcseVgnLsAAA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 01 Jun 2023 12:58:20 +0200, Jan Kara wrote: > this
 patch set fixes a problem with cross directory renames originally reported
 > in [1]. To quickly sum it up some filesystems (so far we know at [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q54TB-009HoY-Ty
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
Cc: Christian Brauner <brauner@kernel.org>, Ted Tso <tytso@mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Al Viro <viro@ZenIV.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 01 Jun 2023 12:58:20 +0200, Jan Kara wrote:
> this patch set fixes a problem with cross directory renames originally reported
> in [1]. To quickly sum it up some filesystems (so far we know at least about
> ext4, udf, f2fs, ocfs2, likely also reiserfs, gfs2 and others) need to lock the
> directory when it is being renamed into another directory. This is because we
> need to update the parent pointer in the directory in that case and if that
> races with other operation on the directory (in particular a conversion from
> one directory format into another), bad things can happen.
> 
> [...]

I've picked this up to get it into -next. I've folded the following fix
for the missing { into [4/6].

---

Applied to the vfs.rename.locking branch of the vfs/vfs.git tree.
Patches in the vfs.rename.locking branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.rename.locking

[1/6] ext4: Remove ext4 locking of moved directory
      https://git.kernel.org/vfs/vfs/c/3658840cd363
[2/6] Revert "udf: Protect rename against modification of moved directory"
      https://git.kernel.org/vfs/vfs/c/7517ce5dc4d6
[3/6] Revert "f2fs: fix potential corruption when moving a directory"
      https://git.kernel.org/vfs/vfs/c/cde3c9d7e2a3
[4/6] fs: Establish locking order for unrelated directories
      https://git.kernel.org/vfs/vfs/c/f23ce7571853
[5/6] fs: Lock moved directories
      https://git.kernel.org/vfs/vfs/c/28eceeda130f
[6/6] fs: Restrict lock_two_nondirectories() to non-directory inodes
      https://git.kernel.org/vfs/vfs/c/afb4adc7c3ef


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

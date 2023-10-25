Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A95CF7D6D31
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Oct 2023 15:32:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qvdzl-0005wY-W2;
	Wed, 25 Oct 2023 13:32:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qvdzk-0005wS-4w
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Oct 2023 13:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JRUs7ossMb1THnG5/0rTF3u6W1idtAgM2dn+c/QTGfk=; b=IRehj6KElIe1GfUuspsFxs4ePi
 4ZFayySx3/SCiHqPLYCGQWY6BpjF+xbInO29XcH6AkHPhj436B1wWe7EmISj1G/1YhpcyadZa9wMu
 M7XUzzufVuIR8MHzpAZX5A6UH/8I7Ec47pt3PZnTqC1yaILN0ReJlHaSaAzEC1/X+I6Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JRUs7ossMb1THnG5/0rTF3u6W1idtAgM2dn+c/QTGfk=; b=OsYrlZ99g9G2iHGw6Gl/TWR5yp
 Ss92o3UPYTxAsiXzqxXhbH/H9iCFo2H/mwDpnA+EWyE1d1MKlg7LC3voW2RZ11F+hE1XaPkjQsuSd
 ZJDKcAu+j5JOgJeRwqKxNMX4ixjttoWkFgVUl9bfpV7I91klrX/PpEdiyQ6yBoJDo1CM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qvdze-008y4m-6T for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Oct 2023 13:32:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AF9E161773;
 Wed, 25 Oct 2023 13:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406DEC433C7;
 Wed, 25 Oct 2023 13:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698240731;
 bh=pB1CVc+a7KCJItdLWoIFwMW3uBM8nk4RJurUO/3u5Fs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hN/d/5XwhcqVsoQFJ91i+2gstiCEF4WvLxgxbwTyTWd3CloGBAbG5v5rafINczjtW
 hgZA6195oGvjn9eVztniZgrgcjJjPU/5sURSPilzNx2OjtNuweoKs9hsvD1zg3x4UA
 Hv5XVGtNmPjdSnlztlYIn1p+jAFGQ7gjcWdcnaJYkitmZudU9BaVxXlkGD6sFyN5+5
 fN7diBBK+lLUyaCbNStNx1EzqaER0bn0Fdd7a/aukhUAQ080RkhuPl5f0MjsyPsD1C
 c2/Y5vGMblmh87fzAMHOHHzm4UKdg8N453f8XhXiVgu7oyfGPiJTMw/1fKHgj0VGA0
 AX8T1/tQ8y86Q==
From: Christian Brauner <brauner@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Date: Wed, 25 Oct 2023 15:32:02 +0200
Message-Id: <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230816050803.15660-1-krisman@suse.de>
References: <20230816050803.15660-1-krisman@suse.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354; i=brauner@kernel.org;
 h=from:subject:message-id; bh=pB1CVc+a7KCJItdLWoIFwMW3uBM8nk4RJurUO/3u5Fs=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaRaSpxNPW+UduvZZPPEvCMuKy+sN0u/Ortx6934rEXZLX9O
 ax4S7ShlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZhIaxgjw9Er1SsOZn765x2vrVyZ9r
 n9Yk9q3T/f50e2l9os1n7L+oKRYfaZysq6TtEDlVduM3M+tZusema35uKis39tEpiXudw9zwQA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 16 Aug 2023 01:07:54 -0400, Gabriel Krisman Bertazi
 wrote: > This is v6 of the negative dentry on case-insensitive directories.
 > Thanks Eric for the review of the last iteration. This version [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qvdze-008y4m-6T
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 16 Aug 2023 01:07:54 -0400, Gabriel Krisman Bertazi wrote:
> This is v6 of the negative dentry on case-insensitive directories.
> Thanks Eric for the review of the last iteration.  This version
> drops the patch to expose the helper to check casefolding directories,
> since it is not necessary in ecryptfs and it might be going away.  It
> also addresses some documentation details, fix a build bot error and
> simplifies the commit messages.  See the changelog in each patch for
> more details.
> 
> [...]

Ok, let's put it into -next so it sees some testing.
So it's too late for v6.7. Seems we forgot about this series.
Sorry about that.

---

Applied to the vfs.casefold branch of the vfs/vfs.git tree.
Patches in the vfs.casefold branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.casefold

[1/9] ecryptfs: Reject casefold directory inodes
      https://git.kernel.org/vfs/vfs/c/8512e7c7e665
[2/9] 9p: Split ->weak_revalidate from ->revalidate
      https://git.kernel.org/vfs/vfs/c/17f4423cb24a
[3/9] fs: Expose name under lookup to d_revalidate hooks
      https://git.kernel.org/vfs/vfs/c/24084e50e579
[4/9] fs: Add DCACHE_CASEFOLDED_NAME flag
      https://git.kernel.org/vfs/vfs/c/2daa2df800f8
[5/9] libfs: Validate negative dentries in case-insensitive directories
      https://git.kernel.org/vfs/vfs/c/8d879ccaf0f7
[6/9] libfs: Chain encryption checks after case-insensitive revalidation
      https://git.kernel.org/vfs/vfs/c/314e925d5a2c
[7/9] libfs: Merge encrypted_ci_dentry_ops and ci_dentry_ops
      https://git.kernel.org/vfs/vfs/c/07f820b77c58
[8/9] ext4: Enable negative dentries on case-insensitive lookup
      https://git.kernel.org/vfs/vfs/c/2562ec77f11e
[9/9] f2fs: Enable negative dentries on case-insensitive lookup
      https://git.kernel.org/vfs/vfs/c/39d2dd36a065


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

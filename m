Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3F99B302F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 13:27:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5OqT-0005DC-Ao;
	Mon, 28 Oct 2024 12:27:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1t5OqR-0005Cx-AF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 12:27:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=phsbjsAXJjxyOoZJOt1lisRfRgL1jDkNT2j1S42R+Gc=; b=e/J0lbBTiwCft9bdMg8/vUW2/C
 72/hlLjeCM/4ZbgPj1w2uiBNTM+75UkELPTRH2s1v6LdQmaj6jGmwfNfZebw3bDgdD4CNY/ZEh3Bz
 sVedLAjAsDMl9s40gZ+6FlARkN/N4efVJwPRcRHHP7OGNmeeV7Mu5lHwvhz9wEpN+zSk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=phsbjsAXJjxyOoZJOt1lisRfRgL1jDkNT2j1S42R+Gc=; b=Q4wRDTy9PvYGIKUgsdOcrEhEx9
 3y+RiLMx2gekO/8rK9Z1N7GqixN/3nTO6+k5Q5wWA/gnw3FDvgaeuTFMkpSwxfn971k26iYuBEeGU
 d84U6UrzJRtp4Oy4fCWpPjNKcP/D/sWJjnpXu2ASK/yq46zUQ1aL5o+D3Dd7R/6uzRBg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5OqQ-0002DI-HK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 12:27:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 24E335C0362;
 Mon, 28 Oct 2024 12:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37D2C4CEC3;
 Mon, 28 Oct 2024 12:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730118452;
 bh=dBjKbQ72OiI43nKphYScHzSn1tB9+kybe2uOdPkKmfk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YOSHXXADjGIBHyQ2Iftg3bbghvOAJhq4EiqJMrhlWca7rTdICjxerGGqjybHz8Qbc
 1qq4wiHrRsAx7igB0qYo6Fqnnd4v2M9lfSoJiAEGsptqUmxJ3sPaIMsxPQFCXqFOFL
 G+8gnI756fFPrU5ye1iVoLnZitTPARuyPmAm5Zr5zW9eEIWd87YAkF5UWbkl8dzTD2
 Uyg1eVjUX/UcLLTT43Tpkx9dTMBwIE6R8L9X9vh1BDbi0Yg/K36rlQ2o1QGqS89eCT
 w666gTjX8lDiJQgsvbQmQAEqb5SeAZ7EXAbq3j/7n7enXbhgYmzw0IOiEXpI0DWbHu
 erUXacxTtG8bQ==
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
Date: Mon, 28 Oct 2024 13:27:12 +0100
Message-ID: <20241028-jazzclub-kulant-81ce918f186d@brauner>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240926140121.203821-1-kernel@pankajraghav.com>
References: <20240926140121.203821-1-kernel@pankajraghav.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1219; i=brauner@kernel.org;
 h=from:subject:message-id; bh=dBjKbQ72OiI43nKphYScHzSn1tB9+kybe2uOdPkKmfk=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaTLN2uu+DzdfEnhecaTkubfhQ409WjqduxOmMF7KdigI
 N+yyLeio5SFQYyLQVZMkcWh3SRcbjlPxWajTA2YOaxMIEMYuDgFYCI68xn+WZ87u07/2LedTZON
 LEs8muedMzWVfFfzOC1n1XFJ7/Ypcgz//bxEjzupHb2h6ccRwHzg3uLVWQlS/A75P0Ptmaw/fzr
 GBwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 26 Sep 2024 16:01:21 +0200, Pankaj Raghav (Samsung)
 wrote: > Most of the callers of wbc_account_cgroup_owner() are converting
 a folio > to page before calling the function. wbc_account_cgroup_ [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5OqQ-0002DI-HK
Subject: Re: [f2fs-dev] [PATCH] fs/writeback: convert
 wbc_account_cgroup_owner to take a folio
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org,
 "Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Zefan Li <lizefan.x@bytedance.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 gost.dev@samsung.com, willy@infradead.org, linux-ext4@vger.kernel.org,
 Pankaj Raghav <p.raghav@samsung.com>, Josef Bacik <josef@toxicpanda.com>,
 Tejun Heo <tj@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, cgroups@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, mcgrof@kernel.org,
 =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 26 Sep 2024 16:01:21 +0200, Pankaj Raghav (Samsung) wrote:
> Most of the callers of wbc_account_cgroup_owner() are converting a folio
> to page before calling the function. wbc_account_cgroup_owner() is
> converting the page back to a folio to call mem_cgroup_css_from_folio().
> 
> Convert wbc_account_cgroup_owner() to take a folio instead of a page,
> and convert all callers to pass a folio directly except f2fs.
> 
> [...]

Applied to the vfs.misc branch of the vfs/vfs.git tree.
Patches in the vfs.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.misc

[1/1] fs/writeback: convert wbc_account_cgroup_owner to take a folio
      https://git.kernel.org/vfs/vfs/c/30dac24e14b5


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

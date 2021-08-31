Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B41093FCB7B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Aug 2021 18:24:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mL6YS-0003KY-91; Tue, 31 Aug 2021 16:24:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <djwong@kernel.org>) id 1mL6YQ-0003KO-Ni
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Aug 2021 16:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y0R/Bd0/GkBWtglrzQz/JuCu0RSYjhWmYKY6JTGSzWc=; b=ScagUae3/PEk3aVSuue5Qd3/B9
 ay+NlDMApww2At8EkQPLbNzRTIftWly2RyzVIiyvfHUaaCDCf/M/Oe5BpCTGd6PPKqlqAyr8QPgq0
 BrX+wQIc0g3ys8o5w/7IZXD5cxs/fVxHNK1FQOjoAMsGBMxVhoogU0vBjbPozDPyS0Ug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=y0R/Bd0/GkBWtglrzQz/JuCu0RSYjhWmYKY6JTGSzWc=; b=m
 B01zhnFAyKCINMh/ptOH94zdCy5Puov7g528DNKNEIB3kChzuncWqs+T4r+rnXAeXMGU+KJpOqY2d
 W/nt6gF04qP1W8Rp8Wkb0I73AUAZzUtLWEz1afoKhzYX2eeKjkMVnTgZM9jfEg02B4E2vurEDmaoA
 rwfSS2XBDqTX/sT8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mL6YQ-009Dwz-7r
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Aug 2021 16:24:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD886610CC;
 Tue, 31 Aug 2021 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630427036;
 bh=3CBp1rvnjRLq+ik6Z1JLX8BGifdRSVjyPCQ/sJLco80=;
 h=Date:From:To:Cc:Subject:From;
 b=GJDt8FZiuX6BwPq8ZneIBQYR7/55jsZG3CALHsYjMPVq62nclr45gyns+NNlAa8Qq
 tnSATmOv1NJ9M+ylEXUMCGciXq5sWAQX3qXP6SO6VsImSo3KAAh/8V3YLRd6efOylv
 TBNZU3nIi9Xk94jVOmVqByqQ8nOiWAVqXgEu3e0t4VnTa6M46N8nzidH7sDzGxlnun
 TTGkZicia1PDQA+cECjev18ns/N1BhkJATV7IlUkK5m/VFQ1W5Rh39+vTzR2WbVxSQ
 7dPlBOIE3YAY6M+R6iG2Jqgv2ToDR8g15q+YgogsjBR2rSEhP4Us6nqGi9yv+2Q0Nn
 NMlL3Y+mRJeMg==
Date: Tue, 31 Aug 2021 09:23:55 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20210831162355.GA9959@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Please pull this single VFS patch that prevents
 userspace from setting project quota ids on files that the VFS considers
 invalid.
 This branch merges cleanly against your upstream branch as of a few minutes
 ago, and does not introduce any fstests regressions for ext4 or xfs. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mL6YQ-009Dwz-7r
Subject: [f2fs-dev] [GIT PULL] vfs: new code for 5.15
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
Cc: Wang Shilong <wshilong@ddn.com>, Wang Shilong <wangshilong1991@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 Ext4 Developers List <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Linus,

Please pull this single VFS patch that prevents userspace from setting
project quota ids on files that the VFS considers invalid.

This branch merges cleanly against your upstream branch as of a few
minutes ago, and does not introduce any fstests regressions for ext4 or
xfs.

--D

The following changes since commit c500bee1c5b2f1d59b1081ac879d73268ab0ff17:

  Linux 5.14-rc4 (2021-08-01 17:04:17 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/vfs-5.15-merge-1

for you to fetch changes up to d03ef4daf33a33da8d7c397102fff8ae87d04a93:

  fs: forbid invalid project ID (2021-08-03 09:48:04 -0700)

----------------------------------------------------------------
New code for 5.15:
 - Strengthen parameter checking for project quota ids.

----------------------------------------------------------------
Wang Shilong (1):
      fs: forbid invalid project ID

 fs/ioctl.c | 8 ++++++++
 1 file changed, 8 insertions(+)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

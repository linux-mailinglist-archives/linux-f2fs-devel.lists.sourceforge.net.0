Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C30F5598E5B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Aug 2022 22:55:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oOmYA-0005gJ-AT;
	Thu, 18 Aug 2022 20:55:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.kehayias@protonmail.com>) id 1oOmY8-0005gC-Kk
 for Linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Aug 2022 20:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Reply-To:Cc:From:To:Date:Sender:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UxPi9xcFUWqL5oPXXwfPUAhrAXEvbYiLVydrzOXiEeM=; b=m2exBJBnDmvqIk7518Iszqg8g2
 r1kguXKTBwrAfLowLGPPNa6GqbNQjrACHAxIiTjRnlntpsZnkUx7UBg2rKxdQW27qHAyIUMPvWSS+
 xWLzytVORO7u3jtmiTZVzunbZ5YiO+SehrxVWu++4LF0eSiGgPcG/ej8ySHT+Z1B4mVY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Reply-To:Cc:From:To:Date:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UxPi9xcFUWqL5oPXXwfPUAhrAXEvbYiLVydrzOXiEeM=; b=L3wLYIOBy/O4x/qp9kxGPp9xCp
 VqByKf+g0e6JeKZfxPxzvK8cLD7/WSryCVcdufmZsbNAdlrNJ1V+bo2XpxxauP3xjZGjTk91dpYhu
 OQBiVYvx75z1yhHarVfETuoSoVMgEguAy3yaKLKAOSqCoSw3xUS9C7PEpf5zsfWOFPBk=;
Received: from mail-40131.protonmail.ch ([185.70.40.131])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oOmY6-008N4q-20 for Linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Aug 2022 20:55:32 +0000
Date: Thu, 18 Aug 2022 20:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1660856123; x=1661115323;
 bh=UxPi9xcFUWqL5oPXXwfPUAhrAXEvbYiLVydrzOXiEeM=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=LTUeuGrgokTCopTAwdxPJzaBtUdPsovFY/kYyo6bWtad56pX7Yc872Fh0lJc65A2f
 0cip4bxeUbMXTpeFI4n9MkgZf5e9t24yUEX6URDUUR29pzj5mw239i+/NFIAx2eN6T
 AAPaQLO8C4R1Ph2tBtDKDrBca+rQWqfoMljBAcApSnOVLPdb3naRbVdigHEvK4xBAW
 G6Bw/c/EAtCrSZWxupEh7FvTUZcV+h8ha9aY+NcsUFiomGp1PXcCR++F1rnApddBky
 e/GGWVcg13Y2fEW5CbY6kcmCY9+o291iP6f57FLwAB+IjkENs4uGVyhiCVQi5QFtuF
 zCzu9YrrzLsNQ==
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <_Fg58ryHmMtqdzH09uAJMFMIXCB58dGTmH7nzXd5HwT_bbxrC0WYg4OO0_N1VS7LYTjeiCzwnNhsvCeLjNV4Eu9tuuHNyWxdxfFig0o5xes=@protonmail.com>
In-Reply-To: <YvaYQI4/ZJgOW6sb@google.com>
References: <z1RSWUWvfCmbB3L_utbn1krfKRIw9T0dlzsLmT2h9615ny3oIgP80mJBL-L58og28AYHPIZdcAOBU9Ok7ao00tJUN9KNFM2K_owrSflLUWk=@protonmail.com>
 <FzLKsvvLk49Fv4JSwZzQkszOSWRKa1nO9bzhwRApQHDtjmz-qYPvdMHOA2KQa1sMod4oFZfYHXE-WSokABljrpT_9UY6pD6NzY5rVGAoGLQ=@protonmail.com>
 <YvaYQI4/ZJgOW6sb@google.com>
Feedback-ID: 7805494:user:proton
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, ------- Original Message ------- On Friday, August 12th, 
 2022 at 2:13 PM, Jaegeuk Kim wrote: > > On 08/12,
 John Kehayias via Linux-f2fs-devel
 wrote: > > > Hello again, > > > > As this is the main disk for a homeserver,
 I was anxious to get it working again. After reading about what seemed lik
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [john.kehayias[at]protonmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1oOmY6-008N4q-20
Subject: Re: [f2fs-dev] How to recover from "Wrong valid_user_blocks"?
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
From: John Kehayias via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: John Kehayias <john.kehayias@protonmail.com>
Cc: "Linux-f2fs-devel@lists.sourceforge.net"
 <Linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

------- Original Message -------
On Friday, August 12th, 2022 at 2:13 PM, Jaegeuk Kim wrote:

> 
> On 08/12, John Kehayias via Linux-f2fs-devel wrote:
> 
> > Hello again,
> > 
> > As this is the main disk for a homeserver, I was anxious to get it working again. After reading about what seemed like the same exact problem here: https://old.reddit.com/r/linuxquestions/comments/whomdc/expanded_f2fs_cant_mount/ I thought using a newer f2fs-tools would help (I think I ended up with latest git commit). As I reported earlier though, resize won't do anything (already resized). So I thought about shrinking, though it might be risky.
> > 
> > First, I tested with a disk image, made with dd and mounted with sudo udisksctl loop-setup -f disk.img. Then I could operate on the loop device with that partition, /dev/loop0p2 in my case. So I tried shrinking, bolstered by the good experiences reported in https://www.mail-archive.com/linux-f2fs-devel@lists.sourceforge.net/msg23214.html Since the size was something like twice the data on it, I didn't worry too much about how much smaller I made it. That was then mountable! So I resized back to the full size, and that still worked. Bonus: working on the disk image was much faster on my SSD than the original memory card.
> > 
> > I made another fresh image for backup and then repeated these steps on the actual disk (memory card): resize.f2fs to shrink slightly (with -t <some sector amount less than max>) and then resize it fully. Everything worked!
> > 
> > I have logs of the resizes and fscks happy to share though I know this has been reported and seems fixed in current versions.
> 
> 
> Ah, so the recent f2fs-tools addressed your problem, right?
> 

Yes, that's correct. I used the latest (git version I believe, not just 1.15) of f2fs-tools to shrink and re-expand the partition which seems to have fixed it up. If I didn't change the size then resize wouldn't do anything, while fsck did not find or correct any problems. I would have though fsck would be able to fix this, at least with the latest version after this bug was first pointed out and fixed in the resizing.

Anyway, happy to have the partition working again with no ill effects I can see.

John


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FD5590BFA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Aug 2022 08:27:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oMO8y-0001Tj-F1;
	Fri, 12 Aug 2022 06:27:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.kehayias@protonmail.com>) id 1oMO8v-0001Tc-P1
 for Linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Aug 2022 06:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Reply-To:From:To:Date:Sender:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sGdgwU2yFfVi5y2yo+cDorxa07Mr9xd7tdJKh+4gkdQ=; b=eMtHkZWYri+M5Kjk/Y2wCeFN+b
 4XV9JEiAAG9kcDO9ka8xfi1tltoWkeuyJKyWvXnxaHdX+fr7bG0iEnWFo8IN4L50RTqvFlHQ6smLw
 N0T7XbdPyZmDW0cKVyuvwThD18Es3Du2/ekK7zTJ0K/OEvWhtZVVzXu4wML+DXdzlSJM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Reply-To:From:To:Date:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sGdgwU2yFfVi5y2yo+cDorxa07Mr9xd7tdJKh+4gkdQ=; b=b8uVU8kWmVpbU7yrKxIfPMBTGa
 QC0P4qWZLJRgp4x8kUU3ZdACEm4EVKuiWKma5sokKLYO4bhgA7mGQRA789ntuzrF2PZtY9jCIG5ua
 PUIzQxkkWKVMtp3uzAb7zuEjYyfVTGcFhJDVNCkwzcoCdfnBraEMsvBWKu/fHU8Iq2cY=;
Received: from mail-40134.protonmail.ch ([185.70.40.134])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oMO8s-00Cph5-2B
 for Linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Aug 2022 06:27:37 +0000
Date: Fri, 12 Aug 2022 06:27:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1660285641; x=1660544841;
 bh=sGdgwU2yFfVi5y2yo+cDorxa07Mr9xd7tdJKh+4gkdQ=;
 h=Date:To:From:Reply-To:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=MuYYXaVmWuHfka6BIDCWcNAMbaGX3p/qJ6dbZ+pk9iEaNdO7wwmlb8voZTETQ6MON
 L8+O3KhKMbM4xQuMw6oFi2LHya6FOsO2DQbuX0pmoyqAdRAPya5B2at+Y82d8cxF25
 SCtgV9Dj1boObDmCjzWhjLlkE3mQO8zaM3LVeHMwg5dmpnllUrMtQO/S70LpuBoP+u
 anzocSyHEUfj3asq889ZUYAjgihP+UMaq1eIAeDXELcZxhrNIxkUvLQod+Of+deaRC
 Ctz9umxAdEsc64MDC2lOyG1h+ATH8bGXKH8pwWuHH+pYnCnfp7skFhRl/ROG5e/rjo
 YhA9geNJPTLAQ==
To: "Linux-f2fs-devel@lists.sourceforge.net"
 <Linux-f2fs-devel@lists.sourceforge.net>
Message-ID: <FzLKsvvLk49Fv4JSwZzQkszOSWRKa1nO9bzhwRApQHDtjmz-qYPvdMHOA2KQa1sMod4oFZfYHXE-WSokABljrpT_9UY6pD6NzY5rVGAoGLQ=@protonmail.com>
In-Reply-To: <z1RSWUWvfCmbB3L_utbn1krfKRIw9T0dlzsLmT2h9615ny3oIgP80mJBL-L58og28AYHPIZdcAOBU9Ok7ao00tJUN9KNFM2K_owrSflLUWk=@protonmail.com>
References: <z1RSWUWvfCmbB3L_utbn1krfKRIw9T0dlzsLmT2h9615ny3oIgP80mJBL-L58og28AYHPIZdcAOBU9Ok7ao00tJUN9KNFM2K_owrSflLUWk=@protonmail.com>
Feedback-ID: 7805494:user:proton
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello again, As this is the main disk for a homeserver, I
 was anxious to get it working again. After reading about what seemed like
 the same exact problem here:
 https://old.reddit.com/r/linuxquestions/comments/who [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [john.kehayias[at]protonmail.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oMO8s-00Cph5-2B
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello again,

As this is the main disk for a homeserver, I was anxious to get it working again. After reading about what seemed like the same exact problem here: https://old.reddit.com/r/linuxquestions/comments/whomdc/expanded_f2fs_cant_mount/ I thought using a newer f2fs-tools would help (I think I ended up with latest git commit). As I reported earlier though, resize won't do anything (already resized). So I thought about shrinking, though it might be risky.

First, I tested with a disk image, made with dd and mounted with sudo udisksctl loop-setup -f disk.img. Then I could operate on the loop device with that partition, /dev/loop0p2 in my case. So I tried shrinking, bolstered by the good experiences reported in https://www.mail-archive.com/linux-f2fs-devel@lists.sourceforge.net/msg23214.html Since the size was something like twice the data on it, I didn't worry too much about how much smaller I made it. That was then mountable! So I resized back to the full size, and that still worked. Bonus: working on the disk image was much faster on my SSD than the original memory card.

I made another fresh image for backup and then repeated these steps on the actual disk (memory card): resize.f2fs to shrink slightly (with -t <some sector amount less than max>) and then resize it fully. Everything worked!

I have logs of the resizes and fscks happy to share though I know this has been reported and seems fixed in current versions.

John


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 905BC8311F7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jan 2024 04:59:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rQJYe-0003Ry-S1;
	Thu, 18 Jan 2024 03:59:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rQJYW-0003Rn-Pg
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Jan 2024 03:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wzYzZY5aGUHHQo+qMSJ4kZMt+Mmbb64PcUEweaZRlKI=; b=JE5dinQulFcj5ll3E/CEnmWFAQ
 Ovjrb7mKZ5ykZ0Kwnzop+j61S6cCUMREoMznWvsvv5KM0da8Nxj8pspN1Q6dAFKM3TQcJTKluyPPr
 ZqhapdAMI5MD5J9y1ssPbq81pprSTsl8w2mTVOGompCtdnaHDHSpuYLs2k1CReCnnHEo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wzYzZY5aGUHHQo+qMSJ4kZMt+Mmbb64PcUEweaZRlKI=; b=I3GFi7fExWkP3ZEGLLWl3tZaSM
 Tm1XkWacl14Be0lpGF8Dpnk1XeU2i1+xL7EKN7//6YPJHGbhvxU6gKDbCbzWLq26gRkRNjDBcuFnj
 evv/lsPDM2+AG7QFaZh38qJmkDvTLqbGZ4lcMR5tEYLoA0SyZy7eN5qroIz8OYn3aDXA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rQJYU-0002Ul-RC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Jan 2024 03:59:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0C128CE1C67;
 Thu, 18 Jan 2024 03:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79D1C433F1;
 Thu, 18 Jan 2024 03:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705550324;
 bh=OSo5PfdHNrhDXM3jaf4Kia103Tf7d+2XdB2eMho5tnk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WPV2WCPgVhKu1PyVjnU/7GII0F1EJE3futnmXCd213USbwVAinXpyKP0hVEdE8gmE
 uSTSuikkGIqpZAR6KqEk13ok+ccKTXX+3kt3IQ+l2aabkIdnjSD9k1LXCvjaz1gHG0
 WsgeRkpLze4GQP2mQPF+UqtioPVFTUjtCPRu3iTocMMuMTs0HpMkFF23bX2SRF8ACd
 6R/awD2fKU+NknNmcIm+ylLvndXnWvlIgH1FczqrHwNvsWRT6ZjxTKL1pj0jYzT7mQ
 NOMdApkmLRJDIhwEqMrim7wyx3UiP85E39jbIZLnXX2zqearAEOSOPotoIBCCPHji0
 jsOy93iXDhxfA==
Date: Wed, 17 Jan 2024 19:58:42 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: syzbot <syzbot+a5e651ca75fa0260acd5@syzkaller.appspotmail.com>
Message-ID: <20240118035842.GC1103@sol.localdomain>
References: <000000000000aac725060ed0b15c@google.com>
 <0000000000009fff64060ee0c1b7@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0000000000009fff64060ee0c1b7@google.com>
X-Spam-Score: -1.8 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Jan 13, 2024 at 08:59:04PM -0800, syzbot wrote: >
 syzbot has bisected this issue to: > > commit
 275dca4630c165edea9abe27113766bc1173f878
 > Author: Eric Biggers <ebiggers@google.com> > Date: We [...] 
 Content analysis details:   (-1.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rQJYU-0002Ul-RC
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-use-after-free Read in
 destroy_device_list
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
Cc: syzkaller-bugs@googlegroups.com, eadavis@qq.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Jan 13, 2024 at 08:59:04PM -0800, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit 275dca4630c165edea9abe27113766bc1173f878
> Author: Eric Biggers <ebiggers@google.com>
> Date:   Wed Dec 27 17:14:28 2023 +0000
> 
>     f2fs: move release of block devices to after kill_block_super()
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10639913e80000
> start commit:   052d534373b7 Merge tag 'exfat-for-6.8-rc1' of git://git.ke..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=12639913e80000
> console output: https://syzkaller.appspot.com/x/log.txt?x=14639913e80000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=878a2a4af11180a7
> dashboard link: https://syzkaller.appspot.com/bug?extid=a5e651ca75fa0260acd5
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=167b0f47e80000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11255313e80000
> 
> Reported-by: syzbot+a5e651ca75fa0260acd5@syzkaller.appspotmail.com
> Fixes: 275dca4630c1 ("f2fs: move release of block devices to after kill_block_super()")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 

#syz fix: f2fs: fix double free of f2fs_sb_info


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

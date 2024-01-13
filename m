Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E06CC82C878
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jan 2024 01:51:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOSEf-0007tE-Iq;
	Sat, 13 Jan 2024 00:50:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rOSEe-0007t4-NS
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 00:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PCAn1cjXHJF7gObWtqNNk85X7WNht+1OAqCZV/5Krz8=; b=f2GvM7mwt4DDyNJRgJSoOGfU/3
 q5uzjEqAAmiD4Q4eKxO/pADHtTi1bOSNKkdTP7Vfx7TD04BoFytgDIE5LQxS7HcyigXK6oN6KkZ2v
 CC+ROcSwNtv9vCxhYFPsoF37Nf4kXPT47QTGzKYKl33pbQfCMpnzSF+ka3Cr+erwpyqo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PCAn1cjXHJF7gObWtqNNk85X7WNht+1OAqCZV/5Krz8=; b=Ub2nL7TVaAFgRRngpbwOZs8S07
 r0D+nyBUsvNHsfvXBjRuf3Lzut5H0PXg1q1OF2cW0GFTEA9BT0myfQhUOj0OocuQGx3QnC3uCqhT8
 AyYr6a7fXP7eVOasEy6QymyfApoNq94IxtWzPyu+bwWo2bU/azul7XERqLeiLLG+eiCk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rOSEd-0005pw-Bw for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 00:50:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6DB8BCE23D6;
 Sat, 13 Jan 2024 00:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EACFC433F1;
 Sat, 13 Jan 2024 00:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705107033;
 bh=pfdjHlc34Ggp8MtnAo8+a9gm20lTD0y1NPMB984TS5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AEOC2OeIgJWORoNggX2s3ubvbGWWUSILtQ10fdulphVoZokeuz3ef5roZFFJGoq+K
 GsPp/iiyBiQCPF4p3qAotSu9Pi4cbJO1OWN03+m4S+ZUp3N04iYjTOdOP1DhARHuwv
 PdC7zxWukUThkA0sMlgjSOnytQ5sygutC2IC0bDpE/B6V9vxF+sd6BVBMRxKH9mwak
 AofUjx/i1nw4/wDjpZB6IPC00vQH4mDn7uGljXYfR3Uc38Syy2YS74xybcM83ypBie
 SGue5mayN1JVetKMleJMnC2kDih9CDc8wvG+jiykOl5K0btdD4EF44X2SSqCbYDL+l
 12Uzv8nv76hwQ==
Date: Fri, 12 Jan 2024 16:50:31 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: syzbot <syzbot+8f477ac014ff5b32d81f@syzkaller.appspotmail.com>
Message-ID: <20240113005031.GA1147@sol.localdomain>
References: <0000000000006cb174060ec34502@google.com>
 <000000000000ec3dd2060ec8e941@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000000000000ec3dd2060ec8e941@google.com>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 12, 2024 at 04:32:21PM -0800, syzbot wrote: >
 loop0: detected capacity change from 0 to 63271 > F2FS-fs (loop0): Mismatch
 start address, segment0(512) cp_blkaddr(605) > F2FS-fs (loop0): Ca [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rOSEd-0005pw-Bw
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-use-after-free Read in
 kill_f2fs_super
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 12, 2024 at 04:32:21PM -0800, syzbot wrote:
> loop0: detected capacity change from 0 to 63271
> F2FS-fs (loop0): Mismatch start address, segment0(512) cp_blkaddr(605)
> F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
> F2FS-fs (loop0): invalid crc value
> F2FS-fs (loop0): SIT is corrupted node# 0 vs 1
> F2FS-fs (loop0): Failed to initialize F2FS segment manager (-117)
> ==================================================================
> BUG: KASAN: slab-use-after-free in destroy_device_list fs/f2fs/super.c:1606 [inline]
> BUG: KASAN: slab-use-after-free in kill_f2fs_super+0x618/0x690 fs/f2fs/super.c:4932
> Read of size 4 at addr ffff888023bdd77c by task syz-executor275/5046

Sorry, this is my fault.  I'll fix this.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

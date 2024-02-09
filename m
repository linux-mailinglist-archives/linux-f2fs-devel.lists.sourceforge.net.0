Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF62384EEA5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Feb 2024 02:43:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rYFvW-0002lW-US;
	Fri, 09 Feb 2024 01:43:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rYFvW-0002lQ-H3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Feb 2024 01:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H8FbRayIOf8zjBDyaePdILJEPNjnK6w/z5AnO2/Ufrk=; b=bAmeS6MV2Z0WHxGv57POc1AMNH
 xT6BOXUzl7mHXiFLMiPyqTFM9VVdSJV73/WJsa6hhzuavLR4CMoREHJSPKZAdR7PR/Jyv9ApTgFBN
 XhN6Azt6Xm/P6wmDco4rcnZCCkVo7jdg4cZNxISXgpd3VEpHHBoZtETf1XmXzwsJPbzY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H8FbRayIOf8zjBDyaePdILJEPNjnK6w/z5AnO2/Ufrk=; b=eZH4AiRT/9KsrBTiLcv+1BOhqb
 VbM0x7WN0j/mKvyFNgyhpzmxLdw9kDtt2zNNa94iFXSCneS9SLYCXkv+OeGDyBYGh34lTbPpyVo9i
 Wjkkenpf6sV/ywwHhDBRvdMqkRcj0tMPrYvRg2eWJpm2s1nQ2AiyUaULMGN+Amq6nlmA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rYFvT-0005eE-UL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Feb 2024 01:43:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D179CCE1ED5;
 Fri,  9 Feb 2024 01:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF16FC433C7;
 Fri,  9 Feb 2024 01:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707443004;
 bh=+Scx3UIv24JIkpDEkG9RgRFZouxyNm778JhYqy4VoiU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bAoMP/K/I3VxVfD2GXsxK1hFI/4VvgHfHiQsLd3XLhXggHMXPswk8VgvrbI3ajtbS
 dGSSKnO6XpFCWTQJ0cyaTQYkRyZUu064I/mZ+XP9rdlR1Lnnmgu3oPnlZlPoRI0mxt
 ErbaK05dHqmJblJw7HK7JueUVuQstwQ9cm+18Bfv9OuL49ibEWhgrvI0RJqxdBklu1
 s4DMAW+tg74R3wkuoNWHipOEKA5vEevUrLmjVIxsdnWEnS/oHatwccrEZZWjCZVB6H
 hho0gCSxlvI1zRsPA0jTys4wBikv3sPv+6+YKWTw230NyDXZ2RF2nPOt8XPDq5SCvD
 PM2zZT8xFKftQ==
Date: Thu, 8 Feb 2024 17:43:22 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Salvatore Bonaccorso <carnil@debian.org>
Message-ID: <ZcWDOjKEnPDxZ0Or@google.com>
References: <170736382774.1975.1861975122613668970.reportbug@tsuga.picorealm.net>
 <ZcU3VCrt9VOpuFUq@eldamar.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZcU3VCrt9VOpuFUq@eldamar.lan>
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, Let me check this soon. Thanks, 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rYFvT-0005eE-UL
Subject: Re: [f2fs-dev] [regression 6.1.y] f2fs: invalid zstd compress
 level: 6
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
Cc: regressions@lists.linux.dev, 1063422@bugs.debian.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Dhya <dhya@picorealm.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

Let me check this soon.

Thanks,

On 02/08, Salvatore Bonaccorso wrote:
> Hi Jaegeuk Kim, Chao Yu,
> 
> In Debian the following regression was reported after a Dhya updated
> to 6.1.76:
> 
> On Wed, Feb 07, 2024 at 10:43:47PM -0500, Dhya wrote:
> > Package: src:linux
> > Version: 6.1.76-1
> > Severity: critical
> > Justification: breaks the whole system
> > 
> > Dear Maintainer,
> > 
> > After upgrade to linux-image-6.1.0-18-amd64 6.1.76-1 F2FS filesystem
> > fails to mount rw.  Message in the boot journal:
> > 
> >   kernel: F2FS-fs (nvme0n1p6): invalid zstd compress level: 6
> > 
> > There was recently an f2fs patch to the 6.1 kernel tree which might be
> > related: https://www.spinics.net/lists/stable-commits/msg329957.html
> > 
> > Was able to recover the system by doing:
> > 
> > sudo mount -o remount,rw,relatime,lazytime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,checkpoint_merge,fsync_mode=posix,compress_algorithm=lz4,compress_log_size=2,compress_mode=fs,atgc,discard_unit=block,memory=normal /dev/nvme0n1p6 /
> > 
> > under the running bad 6.1.0-18-amd64 kernel, then editing
> > /etc/default/grub:
> > 
> >   GRUB_DEFAULT="Advanced options for Debian GNU/Linux>Debian GNU/Linux, with Linux 6.1.0-17-amd64"
> > 
> > and running 'update-grub' and rebooting to boot the 6.1.0-17-amd64
> > kernel.
> 
> The issue is easily reproducible by:
> 
> # dd if=/dev/zero of=test.img count=100 bs=1M
> # mkfs.f2fs -f -O compression,extra_attr ./test.img
> # mount -t f2fs -o compress_algorithm=zstd:6,compress_chksum,atgc,gc_merge,lazytime ./test.img /mnt
> 
> resulting in
> 
> [   60.789982] F2FS-fs (loop0): invalid zstd compress level: 6
> 
> A bugzilla report has been submitted in
> https://bugzilla.kernel.org/show_bug.cgi?id=218471
> 
> #regzbot introduced: v6.1.69..v6.1.76
> #regzbot link: https://bugs.debian.org/1063422
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=218471
> 
> Regards,
> Salvatore


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

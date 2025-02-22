Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FACA40B0F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Feb 2025 19:48:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tluY8-0004JY-Da;
	Sat, 22 Feb 2025 18:48:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <carnil@debian.org>) id 1tluY6-0004JQ-Ep
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Feb 2025 18:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kDg2gzN5JMUmlsNpjxJZmBcUq82C0QlUVNhYmZPoLmE=; b=ZWbC9lIR5wiivXcNIgxu4cjBSA
 AXyR74ojP9/iBR3+JmkCvaJ0/CzjbHE41FoqBP5rqQRREHT+0UV0HwG5LQseXxmqWqYPNYDdaUr47
 J0NY0jiLUXNfnaPWBk6nUottmR4TQHLJy/OyVFiSfRK3dM99/cctD3UasKHJ60vU2Tws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kDg2gzN5JMUmlsNpjxJZmBcUq82C0QlUVNhYmZPoLmE=; b=J0HL9iOeX6f+hU0HQAbWtN72Z6
 LxLkMUN11RIm5TCuSO9IEupmXjWuFsAhZuBBcOFa3RVvvk0Oxc1eOZsE+HfaoR3499mLW+ZMlwBpi
 RVOu/M32XaO4XLAyej9oYloL3u4eFi1a3tlmkYgSmnANi4n5R6ngfNAt2mwq/50aj0nQ=;
Received: from stravinsky.debian.org ([82.195.75.108])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tluY6-0005LL-3t for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Feb 2025 18:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org; 
 s=smtpauto.stravinsky;
 h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kDg2gzN5JMUmlsNpjxJZmBcUq82C0QlUVNhYmZPoLmE=; b=m+wp+iep1wqcd3RORLu/tg14Vj
 HS2nECic8X2YF/bk/W5kEoG4C+j5+6VmKMackRY2XO9ncMse6uRsUo3s+3yx1yB5wNzLqRrNWZYor
 MvF7COUib/3VyXSKv2FgqAtkF8QRQH43HfZXTdH0SihWWMjqb2lewfdI/Pyq0GXaege7LJIUtc59j
 6c2UaVROVmcwa7wZ+tB4rErBS9VyMcAhT5vtlXYI8InASUBvR1vYOKUr8hjRVaB0LjhAkwlpdz6im
 LWKWEgximd8NflkL/0jqd1744il9TKaFoWIIUvnoGsWg9JlRPx2t8WbE0yQXAQ9MLWv3ioqs7O3U+
 iGpMiUrA==;
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <carnil@debian.org>)
 id 1tluCs-00GSAL-S0; Sat, 22 Feb 2025 18:26:31 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
 id 1E6E7BE2EE7; Sat, 22 Feb 2025 19:26:30 +0100 (CET)
Date: Sat, 22 Feb 2025 19:26:30 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Message-ID: <Z7oW1khuNTx-jIw-@eldamar.lan>
References: <b022c507-9bfe-b080-4247-2cb5b76a181d@arcor.de>
 <584c3164-0ebc-4402-bc84-6fcb8fc9aa80@arcor.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <584c3164-0ebc-4402-bc84-6fcb8fc9aa80@arcor.de>
X-Debian-User: carnil
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, hi Chao We got the following report in Debian
 (cf. https://bugs.debian.org/1021927) and quoted in the following: On Sat,
 Feb 22, 2025 at 02:44:07PM +0100, Heinz Repp wrote: > Since kernel 5.19.x
 this bug is present in all newer kernels, up to 6.12.12. > On every boot,
 it prints: > > > Info: Fix the reported corr [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [82.195.75.108 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [82.195.75.108 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [82.195.75.108 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tluY6-0005LL-3t
Subject: Re: [f2fs-dev] Bug#1021927: Bug is still present in current kernels
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
Cc: Heinz Repp <heinz.repp@arcor.de>, 1021927@bugs.debian.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk, hi Chao

We got the following report in Debian (cf.
https://bugs.debian.org/1021927) and quoted in the following:

On Sat, Feb 22, 2025 at 02:44:07PM +0100, Heinz Repp wrote:
> Since kernel 5.19.x this bug is present in all newer kernels, up to 6.12.12.
> On every boot, it prints:
> 
> > Info: Fix the reported corruption.
> > Info: [/dev/sdb4] SanDisk SDSSDHTI
> > Info: MKFS Version
> >   "Linux version 4.3.0-1-amd64 (debian-kernel@lists.debian.org) (gcc version 5.3.1 20160101 (Debian 5.3.1-5) ) #1 SMP Debian 4.3.3-5 (2016-01-04)"
> > Info: FSCK Version
> >   from "Linux version 4.3.0-1-amd64 (debian-kernel@lists.debian.org) (gcc version 5.3.1 20160121 (Debian 5.3.1-7) ) #1 SMP Debian 4.3.5-1 (2016-02-06)"
> >     to "Linux version 6.12.12-amd64 (debian-kernel@lists.debian.org) (x86_64-linux-gnu-gcc 14 (Debian 14.2.0-16) 14.2.0, GNU ld (GNU Binutils for Debian) 2.43.90.20250127) #1 SMP PREEMPT_DYNAMIC Debian 6.12.12-
> > 1 (2025-02-02)"
> > Info: superblock features = 0 :
> > Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> > Info: Segments per section = 1
> > Info: Sections per zone = 1
> > Info: Total FS sectors = 233906176 (114212 MB)
> > Info: CKPT version = 4b0b40
> > Info: checkpoint state = 42 :   crc orphan_inodes sudden-power-off
> > Info: No error was reported
> > [   10,619367]
> 
> First, there is a reported corruption. But then, it says "No error was
> reported". That's a little bit crazy. This came up with kernel 5.19, without
> changing f2fs, but maybe this bug lives in f2fs?
> 
> Greetings
> 
> Heinz Repp

Does this ring some bells to you?

Regards,
Salvatore


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

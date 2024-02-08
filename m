Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E63C84E98D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Feb 2024 21:20:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rYAsJ-0004rJ-Jj;
	Thu, 08 Feb 2024 20:20:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <carnil@debian.org>) id 1rYAsH-0004rD-KY
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Feb 2024 20:19:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wu6GEbBipFa7DUcQHgPx5bUPL1eORflnOdQP6J6GMg4=; b=I/xkR5XPaeg17/MqRLhMalNibe
 5dCG3zzK+jtXYEp2JOckpLDnvO6U5uzrUPHZKLVDullNEaVfGjmxJIp6tqJlWoVn7QqG6IyeHW8iv
 cPdpxHcNe+JRG0R4zRbWeIG7mA9BwzEg1UM423JojViSphfraR4ZJHLQ1yCSxvtFsUpU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wu6GEbBipFa7DUcQHgPx5bUPL1eORflnOdQP6J6GMg4=; b=bM0LW0E7IUIu3tRXwXLa32HcEr
 r9ScBLsFlGgnvDTk3Trl6fqQTNa+UIfqe60RSCZsZ9sCTe0BU77XBzDjkmc2q0ziDcRun7tHm3ccG
 ynMQpdRAs5OB/4pXrEJlm2GlY8Q9f9i7zkmmY7314QZDStTxQSO+7mAEp+LhaKanTFD0=;
Received: from stravinsky.debian.org ([82.195.75.108])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rYAsG-0006zc-4W for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Feb 2024 20:19:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org; 
 s=smtpauto.stravinsky;
 h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wu6GEbBipFa7DUcQHgPx5bUPL1eORflnOdQP6J6GMg4=; b=d/wxYcqxezRwk3oH0dGbh/hO2D
 rb8pj4e8ja3ALbkbJ0Bc3wgt2O935lC4S0FMlxGTALODWyTTxhOozi+GsKqhgLl+/FxEl7Rh9Ktym
 6CS0Yj7nqZQNdAL6VLSeQpM+gn7vNNT9PO4YoPmkHdDSNoSI7FmtK8VpU9XoRpz20B7b0eN486Gw5
 yZQms++TtzxFNlWJKJCKRZO9ALebp0bkFXWrrlbR1U2vfJQBos6DVioYHZ+vn14PE9Nd8SgkqieiS
 Gfzl66uKn78MwwzlgyLwdAauK9zW7pYd1vieqIe1JuwxhLohL9HS/P+5l3wVoNOrJYKwbrcEyg+nH
 zNcsVAhA==;
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <carnil@debian.org>)
 id 1rYArs-00EMbv-RP; Thu, 08 Feb 2024 20:19:33 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
 id 0FFEDBE2EE8; Thu,  8 Feb 2024 21:19:32 +0100 (CET)
Date: Thu, 8 Feb 2024 21:19:32 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Dhya <dhya@picorealm.net>, 1063422@bugs.debian.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Message-ID: <ZcU3VCrt9VOpuFUq@eldamar.lan>
References: <170736382774.1975.1861975122613668970.reportbug@tsuga.picorealm.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <170736382774.1975.1861975122613668970.reportbug@tsuga.picorealm.net>
X-Debian-User: carnil
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk Kim, Chao Yu, In Debian the following regression
 was reported after a Dhya updated to 6.1.76: On Wed, Feb 07, 2024 at 10:43:47PM
 -0500,
 Dhya wrote: > Package: src:linux > Version: 6.1.76-1 > Severity: critical
 > Justification: breaks the whole system > > Dear Maintainer, > > After upgrade
 to l [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [82.195.75.108 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rYAsG-0006zc-4W
Subject: [f2fs-dev] [regression 6.1.y] f2fs: invalid zstd compress level: 6
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
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk Kim, Chao Yu,

In Debian the following regression was reported after a Dhya updated
to 6.1.76:

On Wed, Feb 07, 2024 at 10:43:47PM -0500, Dhya wrote:
> Package: src:linux
> Version: 6.1.76-1
> Severity: critical
> Justification: breaks the whole system
> 
> Dear Maintainer,
> 
> After upgrade to linux-image-6.1.0-18-amd64 6.1.76-1 F2FS filesystem
> fails to mount rw.  Message in the boot journal:
> 
>   kernel: F2FS-fs (nvme0n1p6): invalid zstd compress level: 6
> 
> There was recently an f2fs patch to the 6.1 kernel tree which might be
> related: https://www.spinics.net/lists/stable-commits/msg329957.html
> 
> Was able to recover the system by doing:
> 
> sudo mount -o remount,rw,relatime,lazytime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,checkpoint_merge,fsync_mode=posix,compress_algorithm=lz4,compress_log_size=2,compress_mode=fs,atgc,discard_unit=block,memory=normal /dev/nvme0n1p6 /
> 
> under the running bad 6.1.0-18-amd64 kernel, then editing
> /etc/default/grub:
> 
>   GRUB_DEFAULT="Advanced options for Debian GNU/Linux>Debian GNU/Linux, with Linux 6.1.0-17-amd64"
> 
> and running 'update-grub' and rebooting to boot the 6.1.0-17-amd64
> kernel.

The issue is easily reproducible by:

# dd if=/dev/zero of=test.img count=100 bs=1M
# mkfs.f2fs -f -O compression,extra_attr ./test.img
# mount -t f2fs -o compress_algorithm=zstd:6,compress_chksum,atgc,gc_merge,lazytime ./test.img /mnt

resulting in

[   60.789982] F2FS-fs (loop0): invalid zstd compress level: 6

A bugzilla report has been submitted in
https://bugzilla.kernel.org/show_bug.cgi?id=218471

#regzbot introduced: v6.1.69..v6.1.76
#regzbot link: https://bugs.debian.org/1063422
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=218471

Regards,
Salvatore


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

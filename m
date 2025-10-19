Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6CEBEDEDC
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Oct 2025 08:09:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSs77IjIgGhPiVPZhYRH2Jk5rmw+09ucAHYXrEs9J/A=; b=dqbR9FXbBAaZqepKRAMwrCdZGc
	gRi8drHrWUOCM32lp3rZtK8Is5ShNpe36ywAS6NjRMPmqlAaoMqWPx+WJkVgR/AWTe0KY9M0kc6tW
	Re4c3Stbx7m01q2UQltjtsVqCcemJJmpxcvl4XumZNatL+aPPEmwHj5VrF4j8jygpBa8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vAMbh-0002R4-EB;
	Sun, 19 Oct 2025 06:09:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <safinaskar@gmail.com>) id 1vAMbT-0002Ql-NY
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Oct 2025 06:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GYC/hQuGeMEF947/LuK3VJRiyEjbNIGm04998G60uow=; b=U7FoXsaGOfu81Ij4fb9QZtzH25
 Ba7kIEUSGa66OAnQZjHaAD+PLYHg15FZBOTu6Y0NP4E+MRa8endBGKKOq7X9vg0zKcBr7P0N16uRz
 PU3D2UvYs+B4eMgKYGGCRbeg2hNmQ3abqCeO8XjmS/F3mTUy4FKr6DpuVM0hV43zexyA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GYC/hQuGeMEF947/LuK3VJRiyEjbNIGm04998G60uow=; b=M6I08/lhasdBSlDhRpF4LvFMUX
 hYaWyH4+UVshujCZSLWFPcbWjG5GOZIzGkNml9RbgKiQZEoL0CUyXhm1O+ugmMhzvkeYfaMF77L1B
 D7ibSjZKgTi/Jg93qi9nM5YFlv4IE6OHO++GFZFNGq40KZZcUrQNnGUiJxec/J+U7ZGo=;
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vAMbT-0006nq-6J for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Oct 2025 06:09:15 +0000
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47100eae3e5so31296355e9.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 18 Oct 2025 23:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760854143; x=1761458943; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GYC/hQuGeMEF947/LuK3VJRiyEjbNIGm04998G60uow=;
 b=GywnSKRZ/1v7D7zJ5HGHMTRHDjCct10t/4SVnA+yv39FukayIN8AKvcgTF+b2DWlQZ
 LuXqDSB2Ap5sVFxV4ntrudKknN0JPovCU2+jCDXYezcZPGkFKxR9HC9YiHAL/9r7n8Vx
 vmauzcKmaYdg8n/x7sFL1cm6wd2JF/Fp0ZC1DTnlKrGxoZARRl6hy1/wol+rbEM2S2dg
 sYxu8w4mtNSELiTn4dvSxZLJTNDg5VdrV808AI/PkaAYe3mXE4DMb6Y06grAKDKWTzpt
 PMNra8aOFnlwDNaN2tsG1FJPsinx/BfBjkKPINZOWaplTWNQNE5sdgQEX4D8di/WPycD
 p+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760854143; x=1761458943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GYC/hQuGeMEF947/LuK3VJRiyEjbNIGm04998G60uow=;
 b=WJ6qPNrlW2np2WUmb63XNYeHdMkMsQyvWnuJQyzdfP4pJFmLnrbMelfOGgWKL6dWNO
 bpcP9IOKFyWTO23RCXsrzwuLXvu9o8/PSJgAWDbW47Qyx/BU4QCaGkC/UkVfgTg9JNnN
 ZLZXiMJwind88eEbJvGauXajTK2fxf1m+rD2AK3LLaAOGLJnJStdpwaOnpTGfVeR/jnT
 AaGObymfCBSw9iJrCX/dgqYwOSvEFDAeFpAKr40JdEa94Dmin/xJEvy4joLg6tqmE/dF
 5ULkMH4VjBu3/FzTTjuAWe29b8XIlMieyopsMbo6s57FVMfQtIR8oELjeUuuTt8NPTkM
 kaSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoihyqTzS1XTBDvN0YEXuPSngdJ/3o1EEv9BjLSPO6qzBI4fkMGWWIek8PSLo1wVuc8F3sNFg8TPSJRXQpM57K@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwR9CK28F97VrgaVgwcyfXaioJPKkkatsOTZv/xrW92+5KepUBN
 NpLZcwph0xLYWV7M3KfGN/RkT9am09XQ48F5D+BSw+QW036SL23Mw6hI
X-Gm-Gg: ASbGnct9kObN8ulMWxoe2egfocb4HDp/5s3LMFWgwSDC+E5TN37v6Xjl4sG90FVBSk8
 H34b0o1JAqCjsGzRHE0OwQjXJGfA/j4vcgTl+2BE7BMRcZm7+TjUEXd7A8HI7YuL2lRaBRZLSyF
 ToWDzaXLakaf0LNS6rX0oScNRzNTpBWFMvhfZDikPoc5nvTuY9YC59rd63AJG2mn7Btex/9cRYm
 AYXWxVSYnPsAaV6+FYzDwj8Ni2rjUNWjF+WGTilReGSBo27pYeYifhecAyH7MuUlWOkUeZajEST
 pcleVK9U9Xgi+FdpoZjaFkyY/mVGTVyQfsCofm3CIIBnVIpH7GH/A7Zl1LI0WXARPzfA0u/XmjU
 r97ue8pWvEwzS/tgSeMuZe5gG6qUz7ybr44ZofrBUeDxnkaCiN0JVk9VJFzhMNFd2auM39/XvLn
 0H
X-Google-Smtp-Source: AGHT+IEZ5upR5rvq2pYeoFEK0g1VqqLoHFsnsUnK8lryUbaHf4IrN1h8fWBgNccm4eIUhXw2FJ5z5w==
X-Received: by 2002:a05:600c:820f:b0:471:176d:bf8a with SMTP id
 5b1f17b1804b1-4711791cd3dmr68834905e9.35.1760854143309; 
 Sat, 18 Oct 2025 23:09:03 -0700 (PDT)
Received: from localhost ([212.73.77.104]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4710cdb9d4dsm83976805e9.5.2025.10.18.23.09.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Oct 2025 23:09:02 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: ebiggers@kernel.org
Date: Sun, 19 Oct 2025 09:08:45 +0300
Message-ID: <20251019060845.553414-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20241202010844.144356-16-ebiggers@kernel.org>
References: <20241202010844.144356-16-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eric Biggers : > Now that the lower level __crc32c_le()
 library
 function is optimized for This patch (i. e. 38a9a5121c3b ("lib/crc32: make
 crc32c() go directly to lib")) solves actual bug I found in practice. So,
 please, backport it to stable kernels. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [safinaskar(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.47 listed in wl.mailspike.net]
X-Headers-End: 1vAMbT-0006nq-6J
Subject: Re: [f2fs-dev] [PATCH v4 15/19] lib/crc32: make crc32c() go
 directly to lib
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mips@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 loongarch@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, ardb@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org>:
> Now that the lower level __crc32c_le() library function is optimized for

This patch (i. e. 38a9a5121c3b ("lib/crc32: make crc32c() go directly to lib"))
solves actual bug I found in practice. So, please, backport it
to stable kernels.

I did bisect.

It is possible to apply this patch on top of v6.12.48 without conflicts.

The bug actually prevents me for using my system (more details below).

Here is steps to reproduce bug I noticed.

Build kernel so:

$ cat /tmp/mini
CONFIG_64BIT=y
CONFIG_PRINTK=y
CONFIG_SERIAL_8250=y
CONFIG_TTY=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_RD_GZIP=y
CONFIG_BINFMT_ELF=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_PROC_FS=y
CONFIG_SYSFS=y
CONFIG_DEVTMPFS=y
CONFIG_MODULES=y
CONFIG_BTRFS_FS=m
CONFIG_MODULE_COMPRESS=y
CONFIG_MODULE_COMPRESS_XZ=y
CONFIG_MODULE_COMPRESS_ALL=y
CONFIG_MODULE_DECOMPRESS=y
CONFIG_PRINTK_TIME=y
$ make allnoconfig KCONFIG_ALLCONFIG=/tmp/mini
$ make

Then create initramfs, which contains statically built busybox
(I used busybox v1.37.0 (Debian 1:1.37.0-6+b3)) and modules we just created.

Then run Qemu using command line similar to this:

qemu-system-x86_64 -kernel arch/x86/boot/bzImage -initrd i.gz -append 'console=ttyS0 panic=1 rdinit=/bin/busybox sh' -m 256 -no-reboot -enable-kvm -serial stdio -display none

Then in busybox shell type this:

# mkdir /proc
# busybox mount -t proc proc /proc
# modprobe btrfs

On buggy kernels I get this output:

# modprobe btrfs
[   19.614228] raid6: skipped pq benchmark and selected sse2x4
[   19.614638] raid6: using intx1 recovery algorithm
[   19.616569] xor: measuring software checksum speed
[   19.616937]    prefetch64-sse  : 42616 MB/sec
[   19.617270]    generic_sse     : 41320 MB/sec
[   19.617531] xor: using function: prefetch64-sse (42616 MB/sec)
[   19.619731] Invalid ELF header magic: != ELF
modprobe: can't load module libcrc32c (kernel/lib/libcrc32c.ko.xz): unknown symbol in module, or unknown parameter

The bug is reproducible on all kernels from v6.12 until this commit.
And it is not reproducible on all kernels, which contain this commit.
I found this using bisect.

This bug actually breaks my workflow. I have btrfs as root filesystem.
Initramfs, generated by Debian, doesn't suit my needs. So I'm going
to create my own initramfs from scratch. (Note that I use Debian Trixie,
which has v6.12.48 kernel.) During testing this initramfs in Qemu
I noticed that command "modprobe btrfs" fails with error given above.
(I not yet tried to test this initramfs on real hardware.)

So, this bug actually breaks my workflow.

So, please backport this patch (i. e. 38a9a5121c3b ("lib/crc32: make crc32c() go directly to lib"))
to stable kernels.

I tested that this patch can be applied without conflicts on top of v6.12.48,
and this patch indeed fixes the bug for v6.12.48.

If you want, I can give more info.

It is possible that this is in fact bug in busybox, not in Linux.
But still I think that backporting this patch is good idea.

This busybox thread my be related:
https://lists.busybox.net/pipermail/busybox/2023-May/090309.html

-- 
Askar Safin


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

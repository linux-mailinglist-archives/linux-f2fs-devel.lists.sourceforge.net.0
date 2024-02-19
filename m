Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB53E85AC83
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Feb 2024 20:54:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rc9ip-0000e5-Tt;
	Mon, 19 Feb 2024 19:54:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <salvatore.bonaccorso@gmail.com>) id 1rc9io-0000dz-Eo
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 19:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YPYlqKudaClcKbNFamdeE7+QrC6+8XojTMUekGJ9pw4=; b=FgTHqZJne5++pLiVwLTnnqFIg9
 4KWyTWo91xsbfwV7t26bPbiSKfi3lyRNEMZP9UOukhJja7QNC4/SnllXRMI7SCJQul2CM1XDNbE2u
 ViSmXi69aHQMgNCGkurMuxE2Teedf0BHlP1CVXNJB/wY5IS2+4t+9EtmhGO++YLcuYqg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YPYlqKudaClcKbNFamdeE7+QrC6+8XojTMUekGJ9pw4=; b=kU8/CVDoDOEk4s0h/cmPw3lrY+
 /EfCeG39j1ODXgjBvo5wS1ZH713kjUfzvwLtqNU2VKP3cl71YI1iio7bk+U+N+gTlPgjQwrnt1Jwv
 7LGOC3dmwkf4hKlfkJfYlFHO+bkLj4sq5UeRiBHSxX7yxb2hQiKTBpdzb66Sy3KtTNJQ=;
Received: from mail-ed1-f45.google.com ([209.85.208.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rc9il-0005uM-Ry for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 19:54:38 +0000
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-561587ce966so9570507a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Feb 2024 11:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708372466; x=1708977266; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=YPYlqKudaClcKbNFamdeE7+QrC6+8XojTMUekGJ9pw4=;
 b=Cv4VAXppgHazob8GHnNNPqScul1ZDq3uEXLAVS8/WtkP+qKipdooIQEera5ZvzW0mt
 +CqF0xxootuoHD+DTM1N6mMEsd5qSxJypn7a3V7J9Kzpc3kGhw34Kh+c209X4w5+7j9C
 ZrILiSF7rQnAVRdsJQtx+Os8VMkWaVJsBp7Hm8cb8vkqMmoBjIIHDLI6z2q5sfg37qwm
 zL8uWF44kj7EUeAtUWktoroskdb0vhIqmWK0WNVRELnhUZIAqvQHqVwRopnkxIy1moLK
 FSpNlVXRdAxVU1xssJw6YfDG6Di9cnSL+fwTe5ogpbYZomQdSWPbj20Q93ojzq4CkDfl
 O5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708372466; x=1708977266;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YPYlqKudaClcKbNFamdeE7+QrC6+8XojTMUekGJ9pw4=;
 b=knLR6lcuNC7mXEtvJusbGUie9taxe5rL037uTeeM2L5A831vAhYtzDQeuPidyLU9nY
 fQytL9owSvOMKu23nOm2kdXD+LGzojQZllYhXO/N88App9A23G9AWrTSNHsgKSrqehEo
 gZmISbRYGQMe8LATnnt6If4ZDRlHLXJDwgdnnrcnRr/M7IvZ/l6K1/Fvs7Kv98HYR0ni
 U5dJcKdRstjyB8lZ9xG72rSQgsvVYRIRI9r4RPp92OPVF19Cz3pb02nK9X4ASCVYmPf0
 /I0kH4T7ZdAERgE22UcKQQt0X8Lq97v1IsTluKRhGi6sFmmNyo1Kw+SXDxtRAaGEbpGp
 YTVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzIxv2tIflYTS4HOSFdciVR6GrqrcxnI4R+h+nqC+9PsHo4xt2E9vkZCLMHbFrYc0xIdHMyR34Vl5ZVJ//9D4yFH4Ierga+XRG7tC/cLWSKyFa2nhVbA==
X-Gm-Message-State: AOJu0Ywg+pDAkqPo0sTMDtsFlB/U4+EVj4t230TqHq/e0Ax7r1LDaRHe
 3+jXU+J/8aEXer1mPGVSxJ8DBSmP8zthcbUK8tAFM8yhxvM0+fKN
X-Google-Smtp-Source: AGHT+IGy17EHv3w5kRGCvBk4IxezGA5nNXlG3sjHaPpclSP5gUQDDuET4mul61ghYdEBQQf2Q15JQQ==
X-Received: by 2002:a05:6402:5207:b0:564:4211:faa3 with SMTP id
 s7-20020a056402520700b005644211faa3mr5547391edd.1.1708372465382; 
 Mon, 19 Feb 2024 11:54:25 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch.
 [82.192.242.114]) by smtp.gmail.com with ESMTPSA id
 fi17-20020a056402551100b005612025465asm2964948edb.74.2024.02.19.11.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 11:54:24 -0800 (PST)
Received: by eldamar.lan (Postfix, from userid 1000)
 id EF00EBE2EE8; Mon, 19 Feb 2024 20:54:23 +0100 (CET)
Date: Mon, 19 Feb 2024 20:54:23 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZdOx73kckFXADcol@eldamar.lan>
References: <170736382774.1975.1861975122613668970.reportbug@tsuga.picorealm.net>
 <ZcU3VCrt9VOpuFUq@eldamar.lan>
 <6d14ea70-ac1c-46f2-af1d-ba34ea0165aa@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d14ea70-ac1c-46f2-af1d-ba34ea0165aa@kernel.org>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Mon, Feb 19, 2024 at 10:35:13AM +0800, Chao Yu wrote:
 > On 2024/2/9 4:19, Salvatore Bonaccorso wrote: > > Hi Jaegeuk Kim, Chao
 Yu, > > > > In Debian the following regression was reported after a Dh [...]
 Content analysis details:   (0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.45 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.45 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [salvatore.bonaccorso[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rc9il-0005uM-Ry
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
 linux-f2fs-devel@lists.sourceforge.net, Dhya <dhya@picorealm.net>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On Mon, Feb 19, 2024 at 10:35:13AM +0800, Chao Yu wrote:
> On 2024/2/9 4:19, Salvatore Bonaccorso wrote:
> > Hi Jaegeuk Kim, Chao Yu,
> > 
> > In Debian the following regression was reported after a Dhya updated
> > to 6.1.76:
> > 
> > On Wed, Feb 07, 2024 at 10:43:47PM -0500, Dhya wrote:
> > > Package: src:linux
> > > Version: 6.1.76-1
> > > Severity: critical
> > > Justification: breaks the whole system
> > > 
> > > Dear Maintainer,
> > > 
> > > After upgrade to linux-image-6.1.0-18-amd64 6.1.76-1 F2FS filesystem
> > > fails to mount rw.  Message in the boot journal:
> > > 
> > >    kernel: F2FS-fs (nvme0n1p6): invalid zstd compress level: 6
> > > 
> > > There was recently an f2fs patch to the 6.1 kernel tree which might be
> > > related: https://www.spinics.net/lists/stable-commits/msg329957.html
> > > 
> > > Was able to recover the system by doing:
> > > 
> > > sudo mount -o remount,rw,relatime,lazytime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,checkpoint_merge,fsync_mode=posix,compress_algorithm=lz4,compress_log_size=2,compress_mode=fs,atgc,discard_unit=block,memory=normal /dev/nvme0n1p6 /
> > > 
> > > under the running bad 6.1.0-18-amd64 kernel, then editing
> > > /etc/default/grub:
> > > 
> > >    GRUB_DEFAULT="Advanced options for Debian GNU/Linux>Debian GNU/Linux, with Linux 6.1.0-17-amd64"
> > > 
> > > and running 'update-grub' and rebooting to boot the 6.1.0-17-amd64
> > > kernel.
> > 
> > The issue is easily reproducible by:
> > 
> > # dd if=/dev/zero of=test.img count=100 bs=1M
> > # mkfs.f2fs -f -O compression,extra_attr ./test.img
> > # mount -t f2fs -o compress_algorithm=zstd:6,compress_chksum,atgc,gc_merge,lazytime ./test.img /mnt
> > 
> > resulting in
> > 
> > [   60.789982] F2FS-fs (loop0): invalid zstd compress level: 6
> 
> Hi Salvatore,
> 
> Can you please try below fixes:
> 
> [PATCH 6.1] f2fs: add helper to check compression level
> https://lore.kernel.org/linux-f2fs-devel/20240212160530.1017205-1-chao@kernel.org

Confirmed that this fixes the reported issue as it was reported to us
in Debian in https://bugs.debian.org/1063422 . Thanks a lot!
(note just tested with the first commit as it landed in 6.1.78 to
confirm the immediate regression).

#regzbot fixed-by: cf3d57ad6ff8b566deba3544b9ad3384781fb604

Regards,
Salvatore


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

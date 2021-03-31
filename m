Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8C834F64C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Mar 2021 03:42:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lRPrr-000500-Uz; Wed, 31 Mar 2021 01:41:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lRPrq-0004zs-Hi
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Mar 2021 01:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L8n/4VUQWUJV9mlWkoYEQtZDlHeNpagA4+aAv8cqMpE=; b=WGzqJsVYBqbzNnUEiLd1yiHtbf
 PnK2gFcD5aXdsbuaBB+8MCABkLA3QR4GMOZPPsN69nUSmQIWB8iHxt9Un8iOsOZnqHYBgDal+G0Wg
 X74qDY8Jh6cE1MD9VcHY+z8qb+NM399ZwMCEMUkJVfnRJbdYBPlyGFiOSwah0AYjsGFE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L8n/4VUQWUJV9mlWkoYEQtZDlHeNpagA4+aAv8cqMpE=; b=VYC5SfH9vRQ4L02lGF0GVojtBs
 a3ufIC5+DGzb94JtDfkuUC9JclmzShF7dfYKDQ1bKmwcN0/lQfNEL9KzhdrU9XnL6o8FHXTqVnx3+
 mF7DGpwCs0VjUoGhKmYsCfJ2UB8aT0RKP5C1lhuz5L37K2Pv/Wmiek3R4ZMcdCjoZQPM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lRPrl-0008HS-Pz
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Mar 2021 01:41:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4411A61990;
 Wed, 31 Mar 2021 01:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617154908;
 bh=1iV7Un/LyXW7x1IqRqmyRILuAsTcNZQ7cBPPjEp8LTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fjBQmk78My24+94/O2s7QtVs3OgobmGfkJPN9EC2isKu7tut0ickGnb6z/s6yy/pf
 BA9sQkC594JOw7CQ713+isbA0/oIty1/B25Nzel1SfgdrjCIfjbeX7IZwgc6n1uVgR
 kuK0E2WCJXD85NRH5VmVWIcE6cfI95uZmRJCKcX1ZbuhDc24r9/rJcXyyOFtOalpsf
 ANZhGGxwzGEqWLKCmnXItEvHn/wutxKqqwt4nJ89U+vCW6cAv0dCHqzCKVYrKxrlX6
 kyWF4kOsTm/zNPn6OKkQJUdVYqPg5/9rgJgR0Lonlb+CMOIqE3z5uGZoSocXKmSF7G
 ydJ+HFCUyREVA==
Date: Tue, 30 Mar 2021 18:41:46 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: beroal <me@beroal.in.ua>
Message-ID: <YGPTWqUtHqEyRLMv@google.com>
References: <739ae455-07b4-7dc4-1789-5b162ed25ede@beroal.in.ua>
 <bc3759b9-c606-5e77-40f0-c590bbc53bfb@beroal.in.ua>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc3759b9-c606-5e77-40f0-c590bbc53bfb@beroal.in.ua>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lRPrl-0008HS-Pz
Subject: Re: [f2fs-dev] `mount` reports an error, but `fsck.f2fs` does not
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On 03/27, beroal wrote:
> Ping.
> =

> On 20.03.21 00:46, beroal wrote:
> > Hi. After I extended a partition containing F2FS with a recent version
> > of Gparted, the partition no longer mounts. `mount` reports an error,
> > but `fsck.f2fs` does not see any problem (well, except for `Invalid CP
> > CRC offset: 0`) and does not fix the file system.
> > =

> > ```
> > losetup /dev/loop0 arch-os.img
> > mount -t f2fs -o ro /dev/loop0 /root/mnt/temp
> > ```
> > =

> > ```
> > [ 6890.647749] F2FS-fs (loop0): Wrong valid_user_blocks: 16040048,
> > user_block_count: 10016768
> > [ 6890.647808] F2FS-fs (loop0): Failed to get valid F2FS checkpoint
> > ```
> > =

> > ```
> > losetup -d /dev/loop0
> > fsck.f2fs arch-os.img

May I ask run this?

# fsck.f2fs -d 3 arch-os.img?

Thanks,

> > ```
> > =

> > ```
> > Info: Segments per section =3D 1
> > Info: Sections per zone =3D 1
> > Info: sector size =3D 512
> > Info: total sectors =3D 162916352 (79549 MB)
> > Info: MKFS version
> > =A0 "Linux version 4.4.1-2-ARCH (builduser@foutrelis) (gcc version 5.3.0
> > (GCC) ) #1 SMP PREEMPT Wed Feb 3 13:12:33 UTC 2016"
> > Info: FSCK version
> > =A0 from "Linux version 5.7.12-arch1-1 (linux@archlinux) (gcc version
> > 10.1.0 (GCC), GNU ld (GNU Binutils) 2.34.0) #1 SMP PREEMPT Fri, 31 Jul
> > 2020 17:38:22 +0000"
> > =A0=A0=A0 to "Linux version 5.11.7-arch1-1 (linux@archlinux) (gcc (GCC)
> > 10.2.0, GNU ld (GNU Binutils) 2.36.1) #1 SMP PREEMPT Wed, 17 Mar 2021
> > 16:59:58 +0000"
> > Info: superblock features =3D 0 :
> > Info: superblock encrypt level =3D 0, salt =3D
> > 00000000000000000000000000000000
> > Info: total FS sectors =3D 162916352 (79549 MB)
> > =A0=A0=A0 Invalid CP CRC offset: 0
> > Info: CKPT version =3D a14d4c
> > Info: Checked valid nat_bits in checkpoint
> > Info: checkpoint state =3D 81 :=A0 nat_bits unmount
> > =

> > [FSCK] Unreachable nat entries=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [Ok..] [0x0]
> > [FSCK] SIT valid block bitmap checking=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 [Ok..]
> > [FSCK] Hard link checking for regular file=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 [Ok..] [0x719]
> > [FSCK] valid_block_count matching with CP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 [Ok..] [0xf4c070]
> > [FSCK] valid_node_count matching with CP (de lookup)=A0 [Ok..] [0xe242a]
> > [FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0xe242a]
> > [FSCK] valid_inode_count matched with CP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 [Ok..] [0xe0470]
> > [FSCK] free segment_count matched with CP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 [Ok..] [0x1d6b]
> > [FSCK] next block offset is free=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 [Ok..]
> > [FSCK] fixing SIT types
> > [FSCK] other corrupted bugs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [Ok..]
> > =

> > Done: 14.100000 secs
> > ```
> > =

> > Can I fix this file system and how?
> > =

> > f2fs-tools 1.14.0
> > =

> > =

> > =

> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> =

> =

> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

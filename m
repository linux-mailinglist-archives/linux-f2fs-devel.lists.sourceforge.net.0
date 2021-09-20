Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA1B412967
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Sep 2021 01:27:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mSSh0-0001Ai-G7; Mon, 20 Sep 2021 23:27:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mSSgp-00019V-5c
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Sep 2021 23:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fJbU3rePmK+OvtLWuHZ4CK12jXsQT+S8WUkclt7TlGU=; b=IKfxDO2smferqR8yGYPLD+Ayej
 K7dFMsTpvmTpPAF+5jsuMuJOdtxf8mCGFrO1CxaVieb4zcVGbL5BPVIkwAb3dp6OdYpyAbAMOsGUI
 KLeoBr9lG9wV2B0KW12baR0Ax2uGVU5auxd1DekQ9epBQqkPn57mdDV6bRfTUS0m1TY8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fJbU3rePmK+OvtLWuHZ4CK12jXsQT+S8WUkclt7TlGU=; b=VRDYMklNjlNZsxwNNNiY2TdLiL
 p5MmacMJjW+BgmjF1hONPLSqLU4FlYA2mudiqLLQJSGSs3EZYycf9eIv8Di5kVdFQmSZj0jpVo00L
 YKwlrq+2f8mn0/qy6h38GL5d5S+o1+98/FpGXjIx6zsziqKfwMTki+5gekoLNDMFF2T8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mSSgj-00HMOs-Lm
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Sep 2021 23:27:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DC0360F21;
 Mon, 20 Sep 2021 23:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632180419;
 bh=c4cTfh+FWw4vVwDz0ekszLmgYUUAyt+38R1QY6RdJcA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BNp895SHZV8xV/h1kBOFqwbqF4AWrRwl1tHk/KYD4AukXYcErsgkn66lontCrynAW
 WFTwB5og3ZmtH+Hl5tgHH0l3XKWhjg9k/s4TGwbcAq17l5f/pEp328q9LbczBIxWF4
 2CcmNat9oMS3coJ+aFIBybrS7TmxEuXDTn0DFUZKAYHzZxfNsTvJhvNE60DQIi/XzR
 OX3paSJbN4JsXyzQbv6qhTh2PFkTgg8/cvAvSUbAaUAEd+1nSnMAXbg6mIsbXw/PSl
 PdVcoXbQ2BtPVrJHE3Db/OsyHI8IqtCq5FprW2ZMsPYamrEjcLiCXI7nfz26hit/DN
 8wYVIoLMh58nw==
Date: Mon, 20 Sep 2021 16:26:57 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Message-ID: <YUkYwQidnXGB9LLk@google.com>
References: <20210910225618.501839-1-jaegeuk@kernel.org>
 <20210915054532.alaps3utwwei4efo@shindev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210915054532.alaps3utwwei4efo@shindev>
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/15, Shinichiro Kawasaki wrote: > On Sep 10,
 2021 / 15:56, 
 Jaegeuk Kim wrote: > > This patch fixes the below stale magic info. > > >
 > $ mkfs.btrfs -f test.img > > btrfs-progs v5.10.1 > > See htt [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mSSgj-00HMOs-Lm
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: wipe other FS magics given -f
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/15, Shinichiro Kawasaki wrote:
> On Sep 10, 2021 / 15:56, Jaegeuk Kim wrote:
> > This patch fixes the below stale magic info.
> > 
> > $ mkfs.btrfs -f test.img
> > btrfs-progs v5.10.1
> > See http://btrfs.wiki.kernel.org for more information.
> > 
> > Label:              (null)
> > UUID:               941d2db7-3ece-4090-8b22-c4ea548b5dae
> > Node size:          16384
> > Sector size:        4096
> > Filesystem size:    1.00GiB
> > Block group profiles:
> >   Data:             single            8.00MiB
> >   Metadata:         DUP              51.19MiB
> >   System:           DUP               8.00MiB
> > SSD detected:       no
> > Incompat features:  extref, skinny-metadata
> > Runtime features:
> > Checksum:           crc32c
> > Number of devices:  1
> > Devices:
> >    ID        SIZE  PATH
> >     1     1.00GiB  test.img
> > 
> > $ hexdump -s 0x10000 -n 128 -C test.img
> > 00010000  81 29 94 0a 00 00 00 00  00 00 00 00 00 00 00 00  |.)..............|
> > 00010010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > 00010020  94 1d 2d b7 3e ce 40 90  8b 22 c4 ea 54 8b 5d ae  |..-.>.@.."..T.].|
> > 00010030  00 00 01 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
> > 00010040  5f 42 48 52 66 53 5f 4d  05 00 00 00 00 00 00 00  |_BHRfS_M........|
> > 00010050  00 40 d2 01 00 00 00 00  00 40 50 01 00 00 00 00  |.@.......@P.....|
> > 00010060  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > 00010070  00 00 00 40 00 00 00 00  00 00 02 00 00 00 00 00  |...@............|
> > 00010080
> > 
> > $ mkfs.f2fs -t 0 -f test.img
> > 
> > 	F2FS-tools: mkfs.f2fs Ver: 1.14.0 (2020-12-28)
> > 
> > Info: Disable heap-based policy
> > Info: Debug level = 0
> > Info: Trim is disabled
> > Info: Segments per section = 1
> > Info: Sections per zone = 1
> > Info: sector size = 512
> > Info: total sectors = 2097152 (1024 MB)
> > Info: zone aligned segment0 blkaddr: 512
> > Info: format version with
> >   "Linux version 5.10.46-4rodete1-amd64 (glinux-team@google.com) (gcc-10 (Debian 10.2.1-6+build2) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.46-4rodete1 (2021-08-20)"
> > Info: Overprovision ratio = 6.360%
> > Info: Overprovision segments = 68 (GC reserved = 39)
> > Info: format successful
> > 
> > $hexdump -s 0x10000 -n 128 -C test.img
> > 00010000  c2 8a c8 26 00 00 00 00  00 00 00 00 00 00 00 00  |...&............|
> > 00010010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > 00010020  92 ab 3f c6 b7 82 49 5e  93 23 e8 c9 e9 45 7d ac  |..?...I^.#...E}.|
> > 00010030  00 00 01 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
> > 00010040  5f 42 48 52 66 53 5f 4d  05 00 00 00 00 00 00 00  |_BHRfS_M........|
> > 00010050  00 40 d2 01 00 00 00 00  00 40 50 01 00 00 00 00  |.@.......@P.....|
> > 00010060  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > 00010070  00 00 00 40 00 00 00 00  00 00 02 00 00 00 00 00  |...@............|
> > 00010080
> > 
> > --- After this patch ---
> > $ mkfs.f2fs -t 0 -f test.img
> > 
> > 	F2FS-tools: mkfs.f2fs Ver: 1.14.0 (2020-12-28)
> > 
> > Info: Disable heap-based policy
> > Info: Debug level = 0
> > Info: Trim is disabled
> > 	test.img appears to contain an existing filesystem (btrfs).
> > Info: Segments per section = 1
> > Info: Sections per zone = 1
> > Info: sector size = 512
> > Info: total sectors = 2097152 (1024 MB)
> > Info: zone aligned segment0 blkaddr: 512
> > Info: format version with
> >   "Linux version 5.10.46-4rodete1-amd64 (glinux-team@google.com) (gcc-10 (Debian 10.2.1-6+build2) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.46-4rodete1 (2021-08-20)"
> > Info: Overprovision ratio = 6.360%
> > Info: Overprovision segments = 68 (GC reserved = 39)
> > Info: format successful
> > 
> > $ hexdump -s 0x10000 -n 128 -C test.img
> > 00010000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > *
> > 00010080
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fsck/main.c             |  2 +-
> >  include/f2fs_fs.h       |  1 +
> >  lib/libf2fs.c           |  6 ++++++
> >  mkfs/f2fs_format_main.c | 26 ++++++++++++++++++++++----
> >  4 files changed, 30 insertions(+), 5 deletions(-)
> > 
> > diff --git a/fsck/main.c b/fsck/main.c
> > index eda399cf0679..e4cfdf443867 100644
> > --- a/fsck/main.c
> > +++ b/fsck/main.c
> > @@ -1120,7 +1120,7 @@ int main(int argc, char **argv)
> >  	}
> >  
> >  	/* Get device */
> > -	if (f2fs_get_device_info() < 0) {
> > +	if (f2fs_get_device_info() < 0 || f2fs_get_f2fs_info() < 0) {
> >  		ret = -1;
> >  		if (c.func == FSCK)
> >  			ret = FSCK_OPERATIONAL_ERROR;
> > diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> > index 2a9c1169456c..69260a6fccd9 100644
> > --- a/include/f2fs_fs.h
> > +++ b/include/f2fs_fs.h
> > @@ -1341,6 +1341,7 @@ extern int f2fs_devs_are_umounted(void);
> >  extern int f2fs_dev_is_writable(void);
> >  extern int f2fs_dev_is_umounted(char *);
> >  extern int f2fs_get_device_info(void);
> > +extern int f2fs_get_f2fs_info(void);
> >  extern unsigned int calc_extra_isize(void);
> >  extern int get_device_info(int);
> >  extern int f2fs_init_sparse_file(void);
> > diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> > index b27785dec757..420dfdae56da 100644
> > --- a/lib/libf2fs.c
> > +++ b/lib/libf2fs.c
> > @@ -1183,6 +1183,12 @@ int f2fs_get_device_info(void)
> >  	for (i = 0; i < c.ndevs; i++)
> >  		if (get_device_info(i))
> >  			return -1;
> > +	return 0;
> > +}
> > +
> > +int f2fs_get_f2fs_info(void)
> > +{
> > +	int i;
> >  
> >  	if (c.wanted_total_sectors < c.total_sectors) {
> >  		MSG(0, "Info: total device sectors = %"PRIu64" (in %u bytes)\n",
> > diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
> > index 031244d5d67a..de93f1b5b778 100644
> > --- a/mkfs/f2fs_format_main.c
> > +++ b/mkfs/f2fs_format_main.c
> > @@ -396,18 +396,36 @@ int main(int argc, char *argv[])
> >  
> >  	c.func = MKFS;
> >  
> > -	if (!force_overwrite && f2fs_check_overwrite()) {
> > -		MSG(0, "\tUse the -f option to force overwrite.\n");
> > +	if (f2fs_get_device_info() < 0)
> >  		return -1;
> 
> Jaegeuk, thanks for the patch. Today, I had a chance to try out the dev branch
> with this patch, and observed mkfs.f2fs for block devices failed with the
> messages as follows:
> 
> $ sudo mkfs.f2fs -f /dev/sdc
> 
>         F2FS-tools: mkfs.f2fs Ver: 1.14.0 (2021-09-10)
> 
> Info: Disable heap-based policy
> Info: Debug level = 0
> Info: Trim is enabled
> Info: [/dev/sdc] Disk Model: SanDisk SDSSDH32
>         /dev/sdc appears to contain an existing filesystem (f2fs).
>         Error: In use by the system!
> 
> I think f2fs_get_device_info() call above opens the block device with O_EXCL.
> And the following f2fs_devs_are_umounted() opens the device again with O_EXCL.
> The second open results in E_BUSY and the error message. I tried to move
> the f2fs_devs_are_umounted() call before the f2fs_get_device_info() call, then
> the error disappeared. So, I suggest to move the f2fs_devs_are_umounted() call.

Thank you. Could you please take a look at v2?

> 
> > +
> > +	if (f2fs_check_overwrite()) {
> > +		char *zero_buf = NULL;
> > +		int i;
> > +
> > +		if (!force_overwrite) {
> > +			MSG(0, "\tUse the -f option to force overwrite.\n");
> > +			goto err_format;
> > +		}
> > +		zero_buf = calloc(F2FS_BLKSIZE, 1);
> > +		if (!zero_buf) {
> > +			MSG(0, "\tFaile to allocate zero buffer.\n");
> 
> I guess you meant "Failed" in place of "Faile".
> 
> > +			goto err_format;
> > +		}
> > +		/* wipe out other FS magics mostly first 4MB space */
> > +		for (i = 0; i < 1024; i++)
> > +			dev_fill_block(zero_buf, i);
> > +		free(zero_buf);
> > +		f2fs_fsync_device();
> >  	}
> >  
> >  	if (f2fs_devs_are_umounted() < 0) {
> >  		if (errno != EBUSY)
> >  			MSG(0, "\tError: Not available on mounted device!\n");
> > -		return -1;
> > +		goto err_format;
> >  	}
> >  
> > -	if (f2fs_get_device_info() < 0)
> > +	if (f2fs_get_f2fs_info() < 0)
> >  		goto err_format;
> >  
> >  	/*
> > -- 
> > 2.33.0.309.g3052b89438-goog
> > 
> > 
> > 
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 
> -- 
> Best Regards,
> Shin'ichiro Kawasaki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

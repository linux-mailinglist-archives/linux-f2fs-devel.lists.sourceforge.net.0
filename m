Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8CE50BF14
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 19:53:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhxTT-0005g2-Qu; Fri, 22 Apr 2022 17:53:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nhxTS-0005fw-HQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Apr 2022 17:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DBDxWn9cq4mRCJrbIn1LiKKvu//YkCVwqJ+pS6TwtZ0=; b=PQDjrpcz6xOfQKR+zUhigQPjdt
 yeZkUw5CGXWJu34lNccIIAYy9wgsulDvZBWOxTUMMMncYhFcRj4tvsLOFiKy94e/8swqPcFCTozuB
 oYqqsnhqi/iNNqY4BQ4zQIsWgcypwtEPgUOyI7hiPu+tDMKgmIqXbfXSAERXlbF5Osps=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DBDxWn9cq4mRCJrbIn1LiKKvu//YkCVwqJ+pS6TwtZ0=; b=eE62DJkFUro9qI5rnTkTwnrTFM
 ksHPEMkW77Fay8sSErYXUdHjTAXn45bORwTDDeysYqGh45ccFda+f5m8roxnDNlC5e3W7Xr0fa7HI
 5AM/WMCsr5mbnDbUgL6ja+8jvGQRgcQkZfvArN3EgjLIVv9AzuEx7YEQRjJGnhqlWFjQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nhxTP-0007Qp-Da
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Apr 2022 17:53:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E42E1B831B9;
 Fri, 22 Apr 2022 17:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1B2C385A4;
 Fri, 22 Apr 2022 17:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650650011;
 bh=gkp6DNyw2iHYqYUFBECtTfXkL7Au8rcuyhUw8+hZ+zc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JxDRF+mkF5po/ooXps/4TpeIlkQj4QSy+qlv/d2bS7Ff7Ql4INXVrCXeanHTNdw4N
 lUCIUeQfwEkQr1ztjBTzZjLe6A7GdHcktvesfHk5u6wmw7ZCMA3sdXBzA+k4C57dsm
 k3h7rXA7GhAIu4qtvhn+rJu2RFCnfL/qIx96Ve6hXMVhX631PYGXRKZJ3yi3SfIl73
 6sSLaEc6UaJTdl0CPZ7oPhiE12eukIuQ22nJBCGUVgYxpjuzY6JOfiYhOQmVsbznEq
 eZZj9BnN3FuxyGGyO2MDwcWkfOr0IH05fvktLob1KKXjTVGYXqJOzSt/3TitSd2VEQ
 qDbYEyaNnOmAg==
Date: Fri, 22 Apr 2022 10:53:29 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Bart Van Assche <bvanassche@acm.org>
Message-ID: <YmLrmeSPGPYmXtwi@google.com>
References: <20220421221836.3935616-1-bvanassche@acm.org>
 <20220421221836.3935616-8-bvanassche@acm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220421221836.3935616-8-bvanassche@acm.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Fixed a missing resolution from [PATCH 06/31]. In
 include/f2fs_fs.h, 
 71 #ifdef ANDROID_WINDOWS_HOST 72 #undef HAVE_LINUX_TYPES_H 73 #endif 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nhxTP-0007Qp-Da
Subject: Re: [f2fs-dev] [PATCH 07/31] Change the ANDROID_WINDOWS_HOST macro
 into _WIN32
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fixed a missing resolution from [PATCH 06/31].

In include/f2fs_fs.h,

71 #ifdef ANDROID_WINDOWS_HOST
72 #undef HAVE_LINUX_TYPES_H
73 #endif

On 04/21, Bart Van Assche wrote:
> This makes it easier to build f2fs-tools for Windows.
> 
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  lib/libf2fs.c            | 10 +++++-----
>  lib/libf2fs_io.c         |  6 +++---
>  lib/libf2fs_zoned.c      |  2 +-
>  mkfs/f2fs_format.c       |  2 +-
>  mkfs/f2fs_format_main.c  |  2 +-
>  mkfs/f2fs_format_utils.c |  4 ++--
>  6 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index b0a892772de1..c7102528f2f4 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -22,7 +22,7 @@
>  #endif
>  #include <time.h>
>  #include <sys/stat.h>
> -#ifndef ANDROID_WINDOWS_HOST
> +#ifndef _WIN32
>  #include <sys/mount.h>
>  #include <sys/ioctl.h>
>  #endif
> @@ -49,7 +49,7 @@
>  #define MODELINQUIRY	0x12,0x00,0x00,0x00,0x4A,0x00
>  #endif
>  
> -#ifndef ANDROID_WINDOWS_HOST /* O_BINARY is windows-specific flag */
> +#ifndef _WIN32 /* O_BINARY is windows-specific flag */
>  #define O_BINARY 0
>  #else
>  /* On Windows, wchar_t is 8 bit sized and it causes compilation errors. */
> @@ -606,7 +606,7 @@ int write_inode(struct f2fs_node *inode, u64 blkaddr)
>   */
>  char *get_rootdev()
>  {
> -#if defined(ANDROID_WINDOWS_HOST) || defined(WITH_ANDROID)
> +#if defined(_WIN32) || defined(WITH_ANDROID)
>  	return NULL;
>  #else
>  	struct stat sb;
> @@ -740,7 +740,7 @@ static int is_mounted(const char *mpt, const char *device)
>  
>  int f2fs_dev_is_umounted(char *path)
>  {
> -#ifdef ANDROID_WINDOWS_HOST
> +#ifdef _WIN32
>  	return 0;
>  #else
>  	struct stat *st_buf;
> @@ -872,7 +872,7 @@ void get_kernel_uname_version(__u8 *version)
>  #define BLKSSZGET	DKIOCGETBLOCKCOUNT
>  #endif /* APPLE_DARWIN */
>  
> -#ifndef ANDROID_WINDOWS_HOST
> +#ifndef _WIN32
>  static int open_check_fs(char *path, int flag)
>  {
>  	if (c.func != DUMP && (c.func != FSCK || c.fix_on || c.auto_fix))
> diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
> index b985e6f37a0a..bf6dfe240bb7 100644
> --- a/lib/libf2fs_io.c
> +++ b/lib/libf2fs_io.c
> @@ -23,7 +23,7 @@
>  #include <mntent.h>
>  #endif
>  #include <time.h>
> -#ifndef ANDROID_WINDOWS_HOST
> +#ifndef _WIN32
>  #include <sys/stat.h>
>  #include <sys/mount.h>
>  #include <sys/ioctl.h>
> @@ -634,7 +634,7 @@ int dev_reada_block(__u64 blk_addr)
>  
>  int f2fs_fsync_device(void)
>  {
> -#ifndef ANDROID_WINDOWS_HOST
> +#ifndef _WIN32
>  	int i;
>  
>  	for (i = 0; i < c.ndevs; i++) {
> @@ -783,7 +783,7 @@ int f2fs_finalize_device(void)
>  	 * in the block device page cache.
>  	 */
>  	for (i = 0; i < c.ndevs; i++) {
> -#ifndef ANDROID_WINDOWS_HOST
> +#ifndef _WIN32
>  		ret = fsync(c.devices[i].fd);
>  		if (ret < 0) {
>  			MSG(0, "\tError: Could not conduct fsync!!!\n");
> diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
> index c408a4991fa1..cb954feabe61 100644
> --- a/lib/libf2fs_zoned.c
> +++ b/lib/libf2fs_zoned.c
> @@ -22,7 +22,7 @@
>  #ifdef HAVE_LINUX_LIMITS_H
>  #include <linux/limits.h>
>  #endif
> -#ifndef ANDROID_WINDOWS_HOST
> +#ifndef _WIN32
>  #include <sys/ioctl.h>
>  #endif
>  #include <libgen.h>
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> index 8bd33ac003c5..332abf60d0d9 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -13,7 +13,7 @@
>  #include <fcntl.h>
>  #include <string.h>
>  #include <unistd.h>
> -#ifndef ANDROID_WINDOWS_HOST
> +#ifndef _WIN32
>  #include <sys/stat.h>
>  #include <sys/mount.h>
>  #endif
> diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
> index d05d4e2cb4e5..ecc942b61d63 100644
> --- a/mkfs/f2fs_format_main.c
> +++ b/mkfs/f2fs_format_main.c
> @@ -15,7 +15,7 @@
>  #include <stdbool.h>
>  #include <unistd.h>
>  #include <sys/stat.h>
> -#ifndef ANDROID_WINDOWS_HOST
> +#ifndef _WIN32
>  #include <sys/mount.h>
>  #endif
>  #include <time.h>
> diff --git a/mkfs/f2fs_format_utils.c b/mkfs/f2fs_format_utils.c
> index e84311ae1287..53101d1bd790 100644
> --- a/mkfs/f2fs_format_utils.c
> +++ b/mkfs/f2fs_format_utils.c
> @@ -26,7 +26,7 @@
>  #include <unistd.h>
>  #include <stdlib.h>
>  #include <stdbool.h>
> -#ifndef ANDROID_WINDOWS_HOST
> +#ifndef _WIN32
>  #include <sys/ioctl.h>
>  #endif
>  #include <sys/stat.h>
> @@ -48,7 +48,7 @@
>  
>  static int trim_device(int i)
>  {
> -#ifndef ANDROID_WINDOWS_HOST
> +#ifndef _WIN32
>  	unsigned long long range[2];
>  	struct stat *stat_buf;
>  	struct device_info *dev = c.devices + i;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

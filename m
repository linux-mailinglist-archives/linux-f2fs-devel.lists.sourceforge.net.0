Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B3950C011
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 21:02:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhyXT-0005lg-Hd; Fri, 22 Apr 2022 19:01:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nhyXS-0005lX-7j
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Apr 2022 19:01:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JZtlK1nE0LFt7463lBkNudZh9ZdMmFlvoD/pbrcxnkU=; b=DC2wxZloEuCmb0HQVcUhA0DzcY
 6WS8jd+jB4evdzFgNrfEIWXXgkzEF1WOtA4tCFx8TS1ss5g9+GObGfaSYJSrbCflnKd52JOh7C9jv
 rcwrD35S+hefq6oPKKvq/nb6foTGSHI3JNepG1cPsQTCveTgr+kGy0uNG7lN+HoI/mWU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JZtlK1nE0LFt7463lBkNudZh9ZdMmFlvoD/pbrcxnkU=; b=KYRR63Wbnf8krlx5yNxRFNTNif
 BpE1daP/6j5BF+fEpfZKCliNWIhbjnwxr8ZNoQuVuqaoTvl8SFPPIlwIFgmDK1NcQnv6saGPx3/+j
 9dnc660EDjlZ1Yf6PHehgaPcQYGDTAtz+J7t4NQ2ylN61nIX/ysQD2wcRnsObBpB4nxE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nhyXP-006mir-4G
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Apr 2022 19:01:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1FF4EB82B2E;
 Fri, 22 Apr 2022 19:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A1DC385A0;
 Fri, 22 Apr 2022 19:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650654097;
 bh=RYwagqXMDmBWcrsCtqTH+9rAvkwzl9QPJQ0sJd56rv0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UioaLGPnUPlDL9mVdpmazyS7pqVp9U3GHQiOSewZXxBhhNmihUVIBUQI7bX8lQT+R
 LwAqhP5zRpRvI7IuoXLrXGta202bNp68CJR4KEGk68qRPAPNwonxvRv40hjzsFjazp
 JdUfInvRkUOusv/5jVCALQvx0mgY4PL8HRecfCOJDMy0g2wL1w3rsmLlbOLPH2z4XS
 N3qN8/YEqaf6pGlibm8NHtVTNrChyKpC0tNr+K/FzBn7TBKNeYeRvxpKOoz1khhLpR
 PDSLXlRyhDVSsoLRhB/RqeA/gZSMf7hscdycsAWt2SYn63zWWbSsds2Tf9fWEPqQMP
 mzIar6CI87rPg==
Date: Fri, 22 Apr 2022 12:01:36 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Bart Van Assche <bvanassche@acm.org>
Message-ID: <YmL7kJO/b5F1cYV/@google.com>
References: <20220421221836.3935616-1-bvanassche@acm.org>
 <20220421221836.3935616-19-bvanassche@acm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220421221836.3935616-19-bvanassche@acm.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/21,
 Bart Van Assche wrote: > The <sparse/sparse.h> header
 is available in Android but not in the > Android NDK. Hence this patch that
 only includes the sparse header file > if it is available. Need this in
 android_config.h
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nhyXP-006mir-4G
Subject: Re: [f2fs-dev] [PATCH 18/31] configure.ac: Detect the
 sparse/sparse.h header
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

On 04/21, Bart Van Assche wrote:
> The <sparse/sparse.h> header is available in Android but not in the
> Android NDK. Hence this patch that only includes the sparse header file
> if it is available.

Need this in android_config.h

+#define HAVE_SPARSE_SPARSE_H 1

> 
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  configure.ac            |  1 +
>  lib/libf2fs_io.c        | 10 +++++-----
>  mkfs/f2fs_format_main.c |  2 +-
>  3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/configure.ac b/configure.ac
> index 06aaed9a57d9..317030dad44f 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -109,6 +109,7 @@ AC_CHECK_HEADERS(m4_flatten([
>  	pthread_time.h
>  	scsi/sg.h
>  	selinux/selinux.h
> +	sparse/sparse.h
>  	stdlib.h
>  	string.h
>  	sys/acl.h
> diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
> index bf6dfe240bb7..287199314190 100644
> --- a/lib/libf2fs_io.c
> +++ b/lib/libf2fs_io.c
> @@ -39,7 +39,7 @@
>  
>  struct f2fs_configuration c;
>  
> -#ifdef WITH_ANDROID
> +#ifdef HAVE_SPARSE_SPARSE_H
>  #include <sparse/sparse.h>
>  struct sparse_file *f2fs_sparse_file;
>  static char **blocks;
> @@ -398,7 +398,7 @@ int dev_read_version(void *buf, __u64 offset, size_t len)
>  	return 0;
>  }
>  
> -#ifdef WITH_ANDROID
> +#ifdef HAVE_SPARSE_SPARSE_H
>  static int sparse_read_blk(__u64 block, int count, void *buf)
>  {
>  	int i;
> @@ -649,7 +649,7 @@ int f2fs_fsync_device(void)
>  
>  int f2fs_init_sparse_file(void)
>  {
> -#ifdef WITH_ANDROID
> +#ifdef HAVE_SPARSE_SPARSE_H
>  	if (c.func == MKFS) {
>  		f2fs_sparse_file = sparse_file_new(F2FS_BLKSIZE, c.device_size);
>  		if (!f2fs_sparse_file)
> @@ -691,7 +691,7 @@ int f2fs_init_sparse_file(void)
>  
>  void f2fs_release_sparse_resource(void)
>  {
> -#ifdef WITH_ANDROID
> +#ifdef HAVE_SPARSE_SPARSE_H
>  	int j;
>  
>  	if (c.sparse_mode) {
> @@ -716,7 +716,7 @@ int f2fs_finalize_device(void)
>  	int i;
>  	int ret = 0;
>  
> -#ifdef WITH_ANDROID
> +#ifdef HAVE_SPARSE_SPARSE_H
>  	if (c.sparse_mode) {
>  		int64_t chunk_start = (blocks[0] == NULL) ? -1 : 0;
>  		uint64_t j;
> diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
> index 88b267492245..4d4fad9ad86d 100644
> --- a/mkfs/f2fs_format_main.c
> +++ b/mkfs/f2fs_format_main.c
> @@ -37,7 +37,7 @@
>  #ifdef HAVE_SYS_UTSNAME_H
>  #include <sys/utsname.h>
>  #endif
> -#ifdef WITH_ANDROID
> +#ifdef HAVE_SPARSE_SPARSE_H
>  #include <sparse/sparse.h>
>  extern struct sparse_file *f2fs_sparse_file;
>  #endif


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

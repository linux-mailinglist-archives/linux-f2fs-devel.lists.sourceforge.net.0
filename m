Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6320B278F6B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Sep 2020 19:14:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLrJ6-0005Ns-I2; Fri, 25 Sep 2020 17:14:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kLrJ5-0005Nl-U2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 17:14:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pvYwloV+LaGsPgeqoI4UJbW02+3XFXMeT/fnnKZPHxc=; b=VFNuNxrqBkNpHm76zKtNVnWGMm
 aMHCyvLjtliNjltZtPAnogNFkcZ7i1+IEBZpKEA53y/1ozT3DH1KPXa4LJnSRjq3JDrErQ7x+9E10
 Og/gX/05LWqLuiR3VDOesYsk0mUkWiLPIE1aJPTHTsEFUrAHvAFZaXOZjUwKqHvnbcvQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pvYwloV+LaGsPgeqoI4UJbW02+3XFXMeT/fnnKZPHxc=; b=PfAaSYBYZn7kCqFrULws0/Fwyi
 Mw/bs3Bs+i40gFc2B5qK/i9NUd2+RjVnNFJ2nHEUDc0J8bEtSALz+5GIDwPkft/r4B0hvfymvzHOl
 h68avrtkGJzZRTDpmWT/cWIWvHcSEPfDY1z8itlGbb39TAjSLGsBQnx0rJ7DlcY2in0w=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kLrIx-0085hU-Vx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 17:14:51 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EA1120936;
 Fri, 25 Sep 2020 17:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601054078;
 bh=7c+/aUouCIhoN252DDnGiTWe7TCcYqeUOpv/kSATLnY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pSPeDBr/ecinZYSW7vpLj0gvkqUSIwBNrJfA6D5cocctOSaQJjZyEB/SnvMKIBK4I
 KliHOxRuNSYe38uf9DFlJB1WISvWQsOuoed2WmFWztHS/IfWy0TNySvJ4KEeO75IuS
 rBTp4EZEJ1PoynYjx97qnevzUuIfetiQBwR7ew8s=
Date: Fri, 25 Sep 2020 10:14:36 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20200925171436.GC3315208@gmail.com>
References: <20200925151926.2658-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925151926.2658-1-chao@kernel.org>
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kLrIx-0085hU-Vx
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix uninit-value in f2fs_lookup
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Sep 25, 2020 at 11:19:26PM +0800, Chao Yu wrote:
> From: Chao Yu <yuchao0@huawei.com>
> 
> As syzbot reported:
> 
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x21c/0x280 lib/dump_stack.c:118
>  kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:122
>  __msan_warning+0x58/0xa0 mm/kmsan/kmsan_instr.c:219
>  f2fs_lookup+0xe05/0x1a80 fs/f2fs/namei.c:503
>  lookup_open fs/namei.c:3082 [inline]
>  open_last_lookups fs/namei.c:3177 [inline]
>  path_openat+0x2729/0x6a90 fs/namei.c:3365
>  do_filp_open+0x2b8/0x710 fs/namei.c:3395
>  do_sys_openat2+0xa88/0x1140 fs/open.c:1168
>  do_sys_open fs/open.c:1184 [inline]
>  __do_compat_sys_openat fs/open.c:1242 [inline]
>  __se_compat_sys_openat+0x2a4/0x310 fs/open.c:1240
>  __ia32_compat_sys_openat+0x56/0x70 fs/open.c:1240
>  do_syscall_32_irqs_on arch/x86/entry/common.c:80 [inline]
>  __do_fast_syscall_32+0x129/0x180 arch/x86/entry/common.c:139
>  do_fast_syscall_32+0x6a/0xc0 arch/x86/entry/common.c:162
>  do_SYSENTER_32+0x73/0x90 arch/x86/entry/common.c:205
>  entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
> 
> In f2fs_lookup(), @res_page could be used before being initialized,
> because in __f2fs_find_entry(), once F2FS_I(dir)->i_current_depth was
> been fuzzed to zero, then @res_page will never be initialized, causing
> this kmsan warning, relocating @res_page initialization place to fix
> this bug.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/dir.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 703cf8e21fc0..83630341ffa3 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -357,16 +357,15 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
>  	unsigned int max_depth;
>  	unsigned int level;
>  
> +	*res_page = NULL;
> +
>  	if (f2fs_has_inline_dentry(dir)) {
> -		*res_page = NULL;
>  		de = f2fs_find_in_inline_dir(dir, fname, res_page);
>  		goto out;
>  	}
>  
> -	if (npages == 0) {
> -		*res_page = NULL;
> +	if (npages == 0)
>  		goto out;
> -	}
>  
>  	max_depth = F2FS_I(dir)->i_current_depth;
>  	if (unlikely(max_depth > MAX_DIR_HASH_DEPTH)) {

Can't the assignment to *res_page below be removed too?

        for (level = 0; level < max_depth; level++) {
                *res_page = NULL;
                de = find_in_level(dir, level, fname, res_page);
                if (de || IS_ERR(*res_page))
                        break;
        }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

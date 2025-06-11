Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02697AD4F9F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jun 2025 11:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8esRQVnWRvBJk2Sbg2Pia2Uyv9JnXK7AizOpvrpTVS4=; b=ibfOl1smi/Gru88OIRCd6byyVL
	ZCp8sXx7lgMJVZm19pAjf8aMlpIkcaopqmBkB35oS8DzhlJUj9CZN2bQETOPMuqbfOcFJDz6NDnfF
	WloqidgvEspkS32cN/gLQwCFMqvKW445P0NUA46jGYZY+OqNIwoKIysgOQvuFc0SYgu8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPHfb-0006ER-5I;
	Wed, 11 Jun 2025 09:22:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uPHfY-0006E9-PL
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 09:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iF4oJKOEuy+2xm5ghN3zAf8gof4pNMaNLBIMuc5GbgE=; b=gyu7RkDuV+ck3kjcRzQ84MP/IF
 C5Z1joOd5hZdHqMDABlUdgZehDoaOIWLFIBWsdH6L9oZ1EHxzriyz52CjAYkgmpeJWrBc2bf2Rg17
 Yyp0oX1b8G02KWqTEq6tUTRxSs5poS4lVis9NnmMwMC0ZE2h2wdP4lmGBgK1vGWfpCjY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iF4oJKOEuy+2xm5ghN3zAf8gof4pNMaNLBIMuc5GbgE=; b=cyub7mc8vct7jurpMf49VY1dHm
 9vnxHvphbMGyZZ6DqYJlmM4is0p7HSFgfye068+hV61Cy4wLvLAL9AGwn7yolHTJTJ/1AsuIyFchp
 82dgvlm4R2Pg4FCw/QwHZLTGOIXECt0iR9q3CtQskGBIgU/ESD7bpfPS+30KfQ2TNib0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPHfY-0001f5-84 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 09:22:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 33FAF5C026C;
 Wed, 11 Jun 2025 09:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F48C4CEEF;
 Wed, 11 Jun 2025 09:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749633761;
 bh=oPRMMhF9ZIQJjTjtqBHsow9DRSBNVFKUjDb9Kfjr8gU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=i1fzxCSvXf4F0zeMvw81aoH+ldaTqxkRJyAbsjrDaTgFe00a+jCWWbfRWAM6eR60n
 R2piAEk55I9kVfkkm9ouoa346ScY4HS4rooYr/8P9XoQ8BcgKt2hVuIjtf5ghehxxi
 vAL1BUfv/7h97kD/F6zxToaFQAZkXaGaUV5WQrC08InaNM9j3DRBUNtTuhGV9RWiWf
 00p1qQ+7GXcPZEOSc1foJQrjeKj+pTy6cU1q74dkHIGSCYvxdsehOEInnfuWTXUdrQ
 5Fn3QSfHrHiO7PXjfSPu+RFB68An1fmgeBfWmTcvvGa3z/41uefsf/9roZa0OqAZIh
 y8//saoLz4tGw==
Message-ID: <0d34ad8f-7cf7-4a7a-96b6-d7d6d9e5470c@kernel.org>
Date: Wed, 11 Jun 2025 17:22:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong2021@gmail.com>, jaegeuk@kernel.org
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
 <20250610123743.667183-3-shengyong1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250610123743.667183-3-shengyong1@xiaomi.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/10/25 20:37,
 Sheng Yong wrote: > From: Sheng Yong <shengyong1@xiaomi.com>
 > > In some scenario, such as autotest, it is not expected to answer > question
 from fsck or dump. To simply answer no to [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPHfY-0001f5-84
Subject: Re: [f2fs-dev] [RFC PATCH v2 02/32] f2fs-tools: add option N to
 answer no for all questions
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/10/25 20:37, Sheng Yong wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> In some scenario, such as autotest, it is not expected to answer
> question from fsck or dump. To simply answer no to all these questions,
> this patch adds an option `N' to do that.
> 
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> ---
>  fsck/dump.c       |  3 +++
>  fsck/fsck.c       |  2 +-
>  fsck/main.c       | 14 +++++++++++---
>  include/f2fs_fs.h |  1 +
>  4 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/fsck/dump.c b/fsck/dump.c
> index 66d6c791ae09..10df7e593bfe 100644
> --- a/fsck/dump.c
> +++ b/fsck/dump.c
> @@ -681,6 +681,9 @@ static int dump_filesystem(struct f2fs_sb_info *sbi, struct node_info *ni,
>  	if (c.show_file_map)
>  		return dump_inode_blk(sbi, ni->ino, node_blk);
>  
> +	if (c.answer_no)
> +		return 0;
> +
>  	printf("Do you want to dump this %s into %s/? [Y/N] ",
>  			S_ISDIR(imode) ? "folder" : "file",
>  			base_path);
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index 4d05e1b4a21b..14677128dc2d 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -3834,7 +3834,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
>  	}
>  
>  #ifndef WITH_ANDROID
> -	if (nr_unref_nid && !c.ro) {
> +	if (nr_unref_nid && !c.ro && !c.answer_no) {
>  		char ans[255] = {0};
>  		int res;
>  
> diff --git a/fsck/main.c b/fsck/main.c
> index c5d41597934a..b01a22c8cf53 100644
> --- a/fsck/main.c
> +++ b/fsck/main.c
> @@ -86,6 +86,7 @@ void fsck_usage()
>  	MSG(0, "  -t show directory tree\n");
>  	MSG(0, "  -q preserve quota limits\n");
>  	MSG(0, "  -y fix all the time\n");
> +	MSG(0, "  -N answer \"No\" for all questions\n");
>  	MSG(0, "  -V print the version number and exit\n");
>  	MSG(0, "  --dry-run do not really fix corruptions\n");
>  	MSG(0, "  --no-kernel-check skips detecting kernel change\n");
> @@ -114,6 +115,7 @@ void dump_usage()
>  	MSG(0, "  -f do not prompt before dumping\n");
>  	MSG(0, "  -H support write hint\n");
>  	MSG(0, "  -y alias for -f\n");
> +	MSG(0, "  -N answer \"No\" for all questions\n");
>  	MSG(0, "  -o dump inodes to the given path\n");
>  	MSG(0, "  -P preserve mode/owner/group for dumped inode\n");
>  	MSG(0, "  -L Preserves symlinks. Otherwise symlinks are dumped as regular files.\n");

It needs to update manual of fsck.f2fs and dump.f2fs as well?

Thanks,

> @@ -263,7 +265,7 @@ void f2fs_parse_options(int argc, char *argv[])
>  	}
>  
>  	if (!strcmp("fsck.f2fs", prog)) {
> -		const char *option_string = ":aC:c:m:Md:fg:HlO:p:q:StyV";
> +		const char *option_string = ":aC:c:m:Md:fg:HlO:p:q:StyNV";
>  		int opt = 0, val;
>  		char *token;
>  		struct option long_opt[] = {
> @@ -396,6 +398,9 @@ void f2fs_parse_options(int argc, char *argv[])
>  				c.force = 1;
>  				MSG(0, "Info: Force to fix corruption\n");
>  				break;
> +			case 'N':
> +				c.answer_no = true;
> +				break;
>  			case 'q':
>  				c.preserve_limits = atoi(optarg);
>  				MSG(0, "Info: Preserve quota limits = %d\n",
> @@ -449,7 +454,7 @@ void f2fs_parse_options(int argc, char *argv[])
>  		}
>  	} else if (!strcmp("dump.f2fs", prog)) {
>  #ifdef WITH_DUMP
> -		const char *option_string = "d:fi:I:n:LMo:Prs:Sa:b:Vy";
> +		const char *option_string = "d:fi:I:n:LMo:Prs:Sa:b:VyN";
>  		static struct dump_option dump_opt = {
>  			.nid = 0,	/* default root ino */
>  			.start_nat = -1,
> @@ -527,6 +532,9 @@ void f2fs_parse_options(int argc, char *argv[])
>  			case 'f':
>  				c.force = 1;
>  				break;
> +			case 'N':
> +				c.answer_no = true;
> +				break;
>  			case 'r':
>  				dump_opt.use_root_nid = 1;
>  				break;
> @@ -1369,7 +1377,7 @@ fsck_again:
>  
>  	f2fs_do_umount(sbi);
>  
> -	if (c.func == FSCK && c.bug_on) {
> +	if (c.func == FSCK && c.bug_on && !c.answer_no) {
>  		if (!c.ro && c.fix_on == 0 && c.auto_fix == 0 && !c.dry_run) {
>  			char ans[255] = {0};
>  retry:
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index f7268d1e90ff..5cd4ad666c06 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -1593,6 +1593,7 @@ struct f2fs_configuration {
>  	int whint;
>  	int aliased_devices;
>  	uint32_t aliased_segments;
> +	bool answer_no;
>  
>  	/* mkfs parameters */
>  	int fake_seed;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

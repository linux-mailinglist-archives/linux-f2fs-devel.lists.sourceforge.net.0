Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDC391ED72
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jul 2024 05:24:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sOU7a-0005ih-Hf;
	Tue, 02 Jul 2024 03:23:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sOU7Y-0005iX-KD
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 03:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r8vgsUWecaNENmB/CNLnwSmkzPdGm1G42Hjwwu4YWkY=; b=FvdbX3on+Zro/mKbzaQVitSczL
 F4zy+Xo+QmsxGjy8xrC4x52Sk+QxOA3/bw469atDnNDt1HOa5xOFfvo6ncuOuTt9gLPV5+/crZSMb
 PEZkw6CzfimK4jCgkiK31rY8q/RaYyO5EjOjt81riKnyTJWSIuWGdAJX+5cVTYa0A9j0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r8vgsUWecaNENmB/CNLnwSmkzPdGm1G42Hjwwu4YWkY=; b=k+FM7wTPVLiZvr4AXtVhy8n7zs
 RPO7D/haByPEQ84aqDM2TW/wFg5Plk8WzQ/aei98u7VB+x3uIdbTUKLZNeVzajfZB4GPtBYANBchP
 sYYOS8Z+zt0CJKR22ZRHyXgTme+UCSBxqe6wsDRYHFUsgW5KklmrIN3Z5qhIU6iFvbTE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sOU7X-0001Hz-Tl for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 03:23:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C9D4D61988;
 Tue,  2 Jul 2024 03:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B942C116B1;
 Tue,  2 Jul 2024 03:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719890624;
 bh=I1pc7/S4nABO/NCsqMCrxKGTwwPP6jHXGSO1uUq6GRE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Zg6aSEPoUKsVZ/4WNTmWoxR9otFVuFWTPGcErEHhhcRqm6gcpHhMJuoZZThgiaZPj
 tknjWaz77tzKWy9OUk9rYmdFejnJD8Ovvs0FPihal0WY69xWxISVVvC6mfcXploju4
 gso2vO39zvAeKKlCCLpu39mdX96mdOu6Dy8Vqg1tDNnsCMpCpVMM2+XAig+rMcvvi2
 Oeh5RN10bH/NBBU8GRVKTG3dJKiudDLT6mtcqWXMVa9XJd6z3gneqk3j19Ht8xCJ/x
 AeIvDqY1Yd5iQlYBluI+oNwC1MBXJsB0Y1BC/DIaNlZzaLGoSGIm4GE0DFUwLo5+LC
 OGf2iU8a39tDw==
Message-ID: <b4fa09ea-9966-4177-a09d-2a7dc570d1ff@kernel.org>
Date: Tue, 2 Jul 2024 11:23:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20240628013140.2444209-1-shengyong@oppo.com>
 <20240628013140.2444209-4-shengyong@oppo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240628013140.2444209-4-shengyong@oppo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/28 9:31, Sheng Yong wrote: > This patch enables
 injecting super block. > > The meanings of options are: > * sb: means sb is
 injected, its argument chooses which sb pack to be > injected, whe [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sOU7X-0001Hz-Tl
Subject: Re: [f2fs-dev] [RFC PATCH v2 03/10] inject.f2fs: add sb injection
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/6/28 9:31, Sheng Yong wrote:
> This patch enables injecting super block.
> 
> The meanings of options are:
>   * sb: means sb is injected, its argument chooses which sb pack to be
>         injected, where 0 means the current valid sb is choosen
>         automatically.
>   * mb: indicates which member in sb is injected, its argument is the
>         member name.
>   * idx: is used when the mb is an array, its argument is the index of
>          the array.
>   * val: is the new value to be set when the type of mb is a number.
>   * str: is the new value to be set when the type of mb is a string.
> 
> The members could be injected in sb contains:
>   * magic: magic number
>   * s_stop_reason: s_stop_reason array
>   * s_errors: s_errors array
>   * devs.path: path in devs array
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
>   fsck/inject.c | 134 +++++++++++++++++++++++++++++++++++++++++++++++++-
>   fsck/inject.h |   5 ++
>   fsck/main.c   |   5 +-
>   3 files changed, 142 insertions(+), 2 deletions(-)
> 
> diff --git a/fsck/inject.c b/fsck/inject.c
> index f6fd346..21dae42 100644
> --- a/fsck/inject.c
> +++ b/fsck/inject.c
> @@ -18,17 +18,42 @@ void inject_usage(void)
>   	MSG(0, "[options]:\n");
>   	MSG(0, "  -d debug level [default:0]\n");
>   	MSG(0, "  -V print the version number and exit\n");
> +	MSG(0, "  --mb <member name> which member is injected in a struct\n");
> +	MSG(0, "  --val <new value> new value to set\n");
> +	MSG(0, "  --str <new string> new string to set\n");
> +	MSG(0, "  --idx <slot index> which slot is injected in an array\n");
> +	MSG(0, "  --sb <0|1|2> --mb <name> [--idx <index>] --val/str <value/string> inject superblock\n");
>   	MSG(0, "  --dry-run do not really inject\n");
>   
>   	exit(1);
>   }
>   
> +static void inject_sb_usage(void)
> +{
> +	MSG(0, "inject.f2fs --sb <0|1|2> --mb <name> [--idx <index>] --val/str <value/string>\n");
> +	MSG(0, "[sb]:\n");
> +	MSG(0, "  0: auto select the first super block\n");
> +	MSG(0, "  1: select the first super block\n");
> +	MSG(0, "  2: select the second super block\n");
> +	MSG(0, "[mb]:\n");
> +	MSG(0, "  magic: inject magic number\n");
> +	MSG(0, "  s_stop_reason: inject s_stop_reason array selected by --idx <index>\n");
> +	MSG(0, "  s_errors: inject s_errors array selected by --idx <index>\n");
> +	MSG(0, "  devs.path: inject path in devs array selected by --idx <index> specified by --str <string>\n");
> +}
> +
>   int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
>   {
>   	int o = 0;
> -	const char *option_string = "d:V";
> +	const char *pack[] = {"auto", "1", "2"};
> +	const char *option_string = "d:Vh";
>   	struct option long_opt[] = {
>   		{"dry-run", no_argument, 0, 1},
> +		{"mb", required_argument, 0, 2},
> +		{"idx", required_argument, 0, 3},
> +		{"val", required_argument, 0, 4},
> +		{"str", required_argument, 0, 5},
> +		{"sb", required_argument, 0, 6},
>   		{0, 0, 0, 0}
>   	};
>   
> @@ -39,6 +64,33 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
>   			c.dry_run = 1;
>   			MSG(0, "Info: Dry run\n");
>   			break;
> +		case 2:
> +			opt->mb = optarg;
> +			MSG(0, "Info: inject member %s\n", optarg);
> +			break;
> +		case 3:
> +			opt->idx = atoi(optarg);
> +			MSG(0, "Info: inject slot index %d\n", opt->idx);
> +			break;
> +		case 4:
> +			opt->val = strtoll(optarg, NULL, 0);
> +			if (opt->val == ULLONG_MAX || opt->val == LLONG_MIN)
> +				return -ERANGE;
> +			MSG(0, "Info: inject value %lld : 0x%llx\n", opt->val,
> +			    (unsigned long long)opt->val);
> +			break;
> +		case 5:
> +			opt->str = strdup(optarg);
> +			if (!opt->str)
> +				return -ENOMEM;
> +			MSG(0, "Info: inject string %s\n", opt->str);
> +			break;
> +		case 6:
> +			opt->sb = atoi(optarg);
> +			if (opt->sb < 0 || opt->sb > 2)
> +				return -ERANGE;
> +			MSG(0, "Info: inject sb %s\n", pack[opt->sb]);
> +			break;
>   		case 'd':
>   			if (optarg[0] == '-' || !is_digits(optarg))
>   				return EWRONG_OPT;
> @@ -48,7 +100,12 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
>   		case 'V':
>   			show_version("inject.f2fs");
>   			exit(0);
> +		case 'h':
>   		default:
> +			if (opt->sb >= 0) {
> +				inject_sb_usage();
> +				exit(0);
> +			}
>   			return EUNKNOWN_OPT;
>   		}
>   	}
> @@ -56,9 +113,84 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
>   	return 0;
>   }
>   
> +static int inject_sb(struct f2fs_sb_info *sbi, struct inject_option *opt)
> +{
> +	struct f2fs_super_block *sb;
> +	char *buf;
> +	int ret;
> +
> +	buf = calloc(1, F2FS_BLKSIZE);
> +	ASSERT(buf != NULL);
> +
> +	if (opt->sb == 0)
> +		opt->sb = 1;
> +
> +	ret = dev_read_block(buf, opt->sb == 1 ? SB0_ADDR : SB1_ADDR);
> +	ASSERT(ret >= 0);
> +
> +	sb = (struct f2fs_super_block *)(buf + F2FS_SUPER_OFFSET);
> +
> +	if (!strcmp(opt->mb, "magic")) {
> +		MSG(0, "Info: inject magic of sb %d: 0x%x -> 0x%x\n",
> +		    opt->sb, get_sb(magic), (u32)opt->val);
> +		set_sb(magic, (u32)opt->val);
> +	} else if (!strcmp(opt->mb, "s_stop_reason")) {
> +		if (opt->idx >= MAX_STOP_REASON) {
> +			ERR_MSG("invalid index %u of sb->s_stop_reason[]\n",
> +				opt->idx);
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		MSG(0, "Info: inject s_stop_reason[%d] of sb %d: %d -> %d\n",
> +		    opt->idx, opt->sb, sb->s_stop_reason[opt->idx],
> +		    (u8)opt->val);
> +		sb->s_stop_reason[opt->idx] = (u8)opt->val;
> +	} else if (!strcmp(opt->mb, "s_errors")) {
> +		if (opt->idx >= MAX_F2FS_ERRORS) {
> +			ERR_MSG("invalid index %u of sb->s_errors[]\n",
> +				opt->idx);
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		MSG(0, "Info: inject s_errors[%d] of sb %d: %x -> %x\n",
> +		    opt->idx, opt->sb, sb->s_errors[opt->idx], (u8)opt->val);
> +		sb->s_errors[opt->idx] = (u8)opt->val;
> +	} else if (!strcmp(opt->mb, "devs.path")) {
> +		if (opt->idx >= MAX_DEVICES) {
> +			ERR_MSG("invalid index %u of sb->devs[]\n", opt->idx);
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		if (strlen(opt->str) >= MAX_PATH_LEN) {
> +			ERR_MSG("invalid length of option str\n");
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		MSG(0, "Info: inject devs[%d].path of sb %d: %s -> %s\n",
> +		    opt->idx, opt->sb, (char *)sb->devs[opt->idx].path, opt->str);
> +		strcpy((char *)sb->devs[opt->idx].path, opt->str);
> +	} else {
> +		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
> +		return -EINVAL;

ret = -EINVAL; ?

Thanks,

> +		goto out;
> +	}
> +
> +	print_raw_sb_info(sb);
> +	update_superblock(sb, SB_MASK((u32)opt->sb - 1));
> +
> +out:
> +	free(buf);
> +	free(opt->str);
> +	return ret;
> +}
> +
>   int do_inject(struct f2fs_sb_info *sbi)
>   {
> +	struct inject_option *opt = (struct inject_option *)c.private;
>   	int ret = -EINVAL;
>   
> +	if (opt->sb >= 0)
> +		ret = inject_sb(sbi, opt);
> +
>   	return ret;
>   }
> diff --git a/fsck/inject.h b/fsck/inject.h
> index 62543c1..c7d0e33 100644
> --- a/fsck/inject.h
> +++ b/fsck/inject.h
> @@ -20,6 +20,11 @@
>   #include "fsck.h"
>   
>   struct inject_option {
> +	const char *mb;		/* member name */
> +	unsigned int idx;	/* slot index */
> +	long long val;		/* new value */
> +	char *str;		/* new string */
> +	int sb;			/* which sb */
>   };
>   
>   void inject_usage(void);
> diff --git a/fsck/main.c b/fsck/main.c
> index f093ca7..d6a7a47 100644
> --- a/fsck/main.c
> +++ b/fsck/main.c
> @@ -817,7 +817,10 @@ void f2fs_parse_options(int argc, char *argv[])
>   #endif /* WITH_LABEL */
>   	} else if (!strcmp("inject.f2fs", prog)) {
>   #ifdef WITH_INJECT
> -		static struct inject_option inject_opt;
> +		static struct inject_option inject_opt = {
> +			.sb = -1,
> +			.idx = -1,
> +		};
>   
>   		err = inject_parse_options(argc, argv, &inject_opt);
>   		if (err < 0) {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

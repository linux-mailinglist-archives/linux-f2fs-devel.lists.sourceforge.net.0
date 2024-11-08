Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E2C9C1699
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2024 07:51:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t9IqA-0007cQ-Fq;
	Fri, 08 Nov 2024 06:51:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t9Iq9-0007cK-HS
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Nov 2024 06:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Td8YlSQ3Oo0I57+fVHn5ngyZIZOGFjtG2eXgWiopjQ4=; b=dXoQOYxy1AVBPJ/8hCHBNuxXd9
 zfQHkViKFlqmCuvqBGlCI6Bz7nHjXna+IFwyMniJ51qs75ICM+F+ga9CxPV1n7rLERwFKDyGvMxgA
 eN7gQsSmOmB5xSNCMPAvqaOU+iA8p6LXnQnuju/cFFjUa/iiFiyj5Y+bOvhi5VxByMfs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Td8YlSQ3Oo0I57+fVHn5ngyZIZOGFjtG2eXgWiopjQ4=; b=IHFbKb5vP+mkOuTk2ErUafV5tM
 QX2KM+XvfY5ksqJtGs29AX8AHL1zhYwsEOmqnxRrISGeMphuByNSWqdbVN6FLsSo5bD3vcV6hNyY2
 mhNZxqqZTfY+fhtszC0M2IuCln7pRFb4+PTy1E5mO2e/86c8gluVbl6feviT5r98HZK4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t9Iq7-0000As-U1 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Nov 2024 06:51:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 69AF7A44EDF;
 Fri,  8 Nov 2024 06:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2DFC4CECE;
 Fri,  8 Nov 2024 06:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731048681;
 bh=7YRvk82Zb1XnIZfPFhEywZa/WBXdtL380GrbFl/JZY8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=PBAeJ313apHG1eNqJeXNtaFTgH8zh4HdrZQocgPBjCHzU7Q9rAP1QpMinRngh58ix
 k7edsDQMooFxZC9fi9cw3FHKyzcYXMFMhNhruTPC+FzWq98qevuedjXhsrIfU/ZN9b
 W0KtaPc8LMbxSL74odvieJlQkuCVJsrCKxh7bfAK3XSQNs1QngPBVXlotWkyr2M7Du
 8IFB3qE3UhxHlbDVh8NXoDKLRbT78+sRrwbCN/d7maIDxwsj0N5SaVIr9h6x+0B0Kf
 HzLuveA90RmUaB4PUD6oJApIl/98Lemf+DgisyO4MxGTXVhx1G1psUTX+MccsmL+Zi
 iCIHe9WqRYAfQ==
Message-ID: <f8cac38e-37ab-4d55-a733-d5f501684caf@kernel.org>
Date: Fri, 8 Nov 2024 14:51:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20241029120956.4186731-1-shengyong@oppo.com>
 <20241029120956.4186731-8-shengyong@oppo.com>
Content-Language: en-US
In-Reply-To: <20241029120956.4186731-8-shengyong@oppo.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/29 20:09, Sheng Yong wrote: > This patch adds a
 new member `filename' in inject_dentry to inject > dentry filename. The dentry
 is specified by nid option. > > Note that `.' and `..' dentrie [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t9Iq7-0000As-U1
Subject: Re: [f2fs-dev] [RFC PATCH 07/24] inject.f2fs: add member `filename'
 in inject_dentry
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/29 20:09, Sheng Yong wrote:
> This patch adds a new member `filename' in inject_dentry to inject
> dentry filename. The dentry is specified by nid option.
> 
> Note that `.' and `..' dentries are special, because they are not in the
> parent directory of nid. So this patch also adds a new option `--dots'
> to inject these two dentries.
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
>   fsck/inject.c     | 94 ++++++++++++++++++++++++++++++++++++++++-------
>   fsck/inject.h     |  1 +
>   man/inject.f2fs.8 | 13 ++++++-
>   3 files changed, 93 insertions(+), 15 deletions(-)
> 
> diff --git a/fsck/inject.c b/fsck/inject.c
> index 4a811b3a3302..bc8f09a67c1a 100644
> --- a/fsck/inject.c
> +++ b/fsck/inject.c
> @@ -104,7 +104,7 @@ void inject_usage(void)
>   	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
>   	MSG(0, "  --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
>   	MSG(0, "  --node --mb <name> --nid <nid> [--idx <index>] --val <value> inject node\n");
> -	MSG(0, "  --dent --mb <name> --nid <ino> [--idx <index>] --val <value> inject ino's dentry\n");
> +	MSG(0, "  --dent --mb <name> --nid <ino> [--dots <1|2>] --val/str <value/string> inject ino's dentry\n");
>   	MSG(0, "  --dry-run do not really inject\n");
>   
>   	exit(1);
> @@ -211,12 +211,16 @@ static void inject_node_usage(void)
>   
>   static void inject_dent_usage(void)
>   {
> -	MSG(0, "inject.f2fs --dent --mb <name> --nid <nid> [--idx <index>] --val <value> inject dentry\n");
> +	MSG(0, "inject.f2fs --dent --mb <name> --nid <nid> [--dots <1|2>] --val/str <value/string> inject dentry\n");
> +	MSG(0, "[dots]:\n");
> +	MSG(0, "  1: inject \".\" in directory which is specified by nid\n");
> +	MSG(0, "  2: inject \"..\" in directory which is specified by nid\n");
>   	MSG(0, "[mb]:\n");
>   	MSG(0, "  d_bitmap: inject dentry block d_bitmap of nid\n");
>   	MSG(0, "  d_hash: inject dentry hash\n");
>   	MSG(0, "  d_ino: inject dentry ino\n");
>   	MSG(0, "  d_ftype: inject dentry ftype\n");
> +	MSG(0, "  filename: inject dentry filename, its hash and len are updated implicitly\n");
>   }
>   
>   int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
> @@ -240,6 +244,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
>   		{"ssa", no_argument, 0, 12},
>   		{"node", no_argument, 0, 13},
>   		{"dent", no_argument, 0, 14},
> +		{"dots", required_argument, 0, 15},
>   		{0, 0, 0, 0}
>   	};
>   
> @@ -336,6 +341,14 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
>   			opt->dent = true;
>   			MSG(0, "Info: inject dentry\n");
>   			break;
> +		case 15:
> +			opt->dots = atoi(optarg);
> +			if (opt->dots != TYPE_DOT &&
> +			    opt->dots != TYPE_DOTDOT)
> +				return -ERANGE;
> +			MSG(0, "Info: inject %s dentry\n",
> +			    opt->dots == TYPE_DOT ? "dot" : "dotdot");
> +			break;
>   		case 'd':
>   			if (optarg[0] == '-' || !is_digits(optarg))
>   				return EWRONG_OPT;
> @@ -368,6 +381,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
>   			} else if (opt->dent) {
>   				inject_dent_usage();
>   				exit(0);
> +			} else {
> +				MSG(0, "\tError: Wrong option -%c (%d) %s\n",
> +					o, o, optarg);
>   			}
>   			return EUNKNOWN_OPT;
>   		}
> @@ -1056,12 +1072,12 @@ static int find_dir_entry(struct f2fs_dentry_ptr *d, nid_t ino)
>   		}
>   
>   		de = &d->dentry[slot];
> -		if (le32_to_cpu(de->ino) == ino && de->hash_code != 0)
> -			return slot;
>   		if (de->name_len == 0) {
>   			slot++;
>   			continue;
>   		}
> +		if (le32_to_cpu(de->ino) == ino)
> +			return slot;
>   		slot += GET_DENTRY_SLOTS(le16_to_cpu(de->name_len));
>   	}
>   
> @@ -1074,14 +1090,15 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
>   	struct f2fs_node *node_blk = NULL;
>   	struct f2fs_inode *inode;
>   	struct f2fs_dentry_ptr d;
> -	void *inline_dentry;
> +	void *buf = NULL, *inline_dentry;
>   	struct f2fs_dentry_block *dent_blk = NULL;
>   	block_t addr = 0;
> -	void *buf = NULL;
>   	struct f2fs_dir_entry *dent = NULL;
>   	struct dnode_of_data dn;
>   	nid_t pino;
> -	int slot = -ENOENT, ret;
> +	int slot = -ENOENT, namelen, namecap, ret;
> +	unsigned int dentry_hash;
> +	char *name;
>   
>   	node_blk = malloc(F2FS_BLKSIZE);
>   	ASSERT(node_blk != NULL);
> @@ -1090,12 +1107,25 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
>   	get_node_info(sbi, opt->nid, &ni);
>   	ret = dev_read_block(node_blk, ni.blk_addr);
>   	ASSERT(ret >= 0);
> -	pino = le32_to_cpu(node_blk->i.i_pino);
>   
> -	/* get parent inode */
> -	get_node_info(sbi, pino, &ni);
> -	ret = dev_read_block(node_blk, ni.blk_addr);
> -	ASSERT(ret >= 0);
> +	if (opt->dots) {
> +		if (!LINUX_S_ISDIR(le16_to_cpu(node_blk->i.i_mode))) {
> +			ERR_MSG("ino %u is not a directory, cannot inject "
> +				"its %s\n", opt->nid,
> +				opt->dots == TYPE_DOT ? "." : "..");
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		/* pino is itself */
> +		pino = opt->nid;
> +	} else {
> +		pino = le32_to_cpu(node_blk->i.i_pino);
> +
> +		/* get parent inode */
> +		get_node_info(sbi, pino, &ni);
> +		ret = dev_read_block(node_blk, ni.blk_addr);
> +		ASSERT(ret >= 0);
> +	}
>   	inode = &node_blk->i;
>   
>   	/* find child dentry */
> @@ -1105,7 +1135,10 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
>   		addr = ni.blk_addr;
>   		buf = node_blk;
>   
> -		slot = find_dir_entry(&d, opt->nid);
> +		if (opt->dots == TYPE_DOTDOT)
> +			slot = find_dir_entry(&d, le32_to_cpu(node_blk->i.i_pino));
> +		else
> +			slot = find_dir_entry(&d, opt->nid);
>   		if (slot >= 0)
>   			dent = &d.dentry[slot];
>   	} else {
> @@ -1141,7 +1174,10 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
>   			ASSERT(ret >= 0);
>   
>   			make_dentry_ptr(&d, node_blk, dent_blk, 1);
> -			slot = find_dir_entry(&d, opt->nid);
> +			if (opt->dots == TYPE_DOTDOT)
> +				slot = find_dir_entry(&d, le32_to_cpu(node_blk->i.i_pino));
> +			else
> +				slot = find_dir_entry(&d, opt->nid);
>   			if (slot >= 0) {
>   				dent = &d.dentry[slot];
>   				buf = dent_blk;
> @@ -1175,6 +1211,36 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
>   		    "%d -> %d\n", opt->nid, dent->file_type,
>   		    (u8)opt->val);
>   		dent->file_type = (u8)opt->val;
> +	} else if (!strcmp(opt->mb, "filename")) {
> +		if (!opt->str) {
> +			ERR_MSG("option str is needed\n");
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		namecap = ALIGN_UP(le16_to_cpu(dent->name_len), F2FS_SLOT_LEN);
> +		namelen = strlen(opt->str);
> +		if (namelen > namecap) {

if (namelen > namecap || namelen > F2FS_NAME_LEN)

or maybe later, we can remove this check to allow injecting
filename w/ longer name length than original one.

Thanks,

> +			ERR_MSG("option str too long\n");
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		name = (char *)d.filename[slot];
> +		MSG(0, "Info: inject dentry filename of nid %u: "
> +		    "%.*s -> %s\n", opt->nid, le16_to_cpu(dent->name_len),
> +		    name, opt->str);
> +		memcpy(name, opt->str, namelen);
> +		MSG(0, "Info: inject dentry namelen of nid %u: "
> +		    "%d -> %d\n", opt->nid, le16_to_cpu(dent->name_len),
> +		    namelen);
> +		dent->name_len = cpu_to_le16(namelen);
> +		dentry_hash = f2fs_dentry_hash(get_encoding(sbi),
> +						IS_CASEFOLDED(inode),
> +						(unsigned char *)name,
> +						namelen);
> +		MSG(0, "Info: inject dentry d_hash of nid %u: "
> +		    "0x%x -> 0x%x\n", opt->nid, le32_to_cpu(dent->hash_code),
> +		    dentry_hash);
> +		dent->hash_code = cpu_to_le32(dentry_hash);
>   	} else {
>   		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
>   		ret = -EINVAL;
> diff --git a/fsck/inject.h b/fsck/inject.h
> index 43c21b56a7eb..706a211bc645 100644
> --- a/fsck/inject.h
> +++ b/fsck/inject.h
> @@ -30,6 +30,7 @@ struct inject_option {
>   	int cp;			/* which cp */
>   	int nat;		/* which nat pack */
>   	int sit;		/* which sit pack */
> +	int dots;		/* . or .. dentry */
>   	bool ssa;
>   	bool node;
>   	bool dent;
> diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
> index 691a40c889a0..3db3f4ecf85e 100644
> --- a/man/inject.f2fs.8
> +++ b/man/inject.f2fs.8
> @@ -211,12 +211,20 @@ inode i_nid array specified by \fIidx\fP.
>   .RE
>   .TP
>   .BI \-\-dent
> -Inject dentry block or dir entry specified \fInid\fP.
> +Inject dentry block or dir entry specified by \fInid\fP.
> +.RS 1.2i
> +.TP
> +.BI \-\-dots " 1 or 2"
> +The option means the "." or ".." directory entry of \fInid\fP is going to be injected.
> +.RE
> +.TP
> +.BI ""
>   The available \fImb\fP of \fIdent\fP are:
>   .RS 1.2i
>   .TP
>   .BI d_bitmap
>   dentry block d_bitmap.
> +dentry block d_bitmap.
>   .TP
>   .BI d_hash
>   dentry hash.
> @@ -226,6 +234,9 @@ dentry ino.
>   .TP
>   .BI d_ftype
>   dentry ftype.
> +.TP
> +.BI filename
> +dentry filename, and corresponding d_hash and namelen are updated implicitly.
>   .RE
>   .TP
>   .BI \-\-dry\-run



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

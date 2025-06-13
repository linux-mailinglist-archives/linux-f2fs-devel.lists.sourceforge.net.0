Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 203A5AD8513
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 09:55:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAd4nLoxPu9xCy4gPa3BwI5dFfTrT5Q2bNxowQ+pNLA=; b=PHct95cqiD/MVPMOnTw/YE5KqR
	Qfdf0AHwBU80xfnWhdn9X3jYtTgMFNnBbZFiVqnWSADhsPSyUvnKJK9NpQCxkETd3G4kK8fPn4BDE
	MJzpXfr5uSwC3/IYnFt7A+WPRxfjppV5emyvR09cFcEzAOKtK/2Ztr0sgDj7PXxg3poc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPzGE-0000jd-NV;
	Fri, 13 Jun 2025 07:55:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uPzGE-0000jU-3I
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 07:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x/hUhDU3aO9DvqXJ6pQFBw52MOyqd9zlEKBvl20yZ7I=; b=K9rzRus+KYwEVlckDs3GYyQvvK
 IrfAcoPfW2r20tKoZbhKUGTSwRe6/Un8qmM6/EvoGFfCxbXHycRx7NL/rbmwfpXH/e8X7VdwGNLc3
 ae1GA2VMC3GV1pEVUIsCj5OMneK+zXp3ipUzaW3OySN+vX2EjJThYOBrCQB3/22gXntE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x/hUhDU3aO9DvqXJ6pQFBw52MOyqd9zlEKBvl20yZ7I=; b=Z3UOECwa7mVGmN9BZj9/vB8sll
 dh9FIkulg/lTgKWmD4Q+82Xk2uNefvU1Sm1o+6qSONiYcJLbxbZ6ibABkygZHWByLS5Lu1zmPF8HB
 MmR26SPx89l5c6zVpnIe2bUr6lPJ0txPZJXvOyijeC8kHYf9WQTIP4sfs9Wt+ScyY0gc=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPzGD-0007wP-9x for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 07:55:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A29E1A4E3BA;
 Fri, 13 Jun 2025 07:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A87C4CEE3;
 Fri, 13 Jun 2025 07:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749801326;
 bh=NaW6zefijZDlnFs6JZr4Kjojp+GtWnVslNQEv3abRYI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=h1O8qsPHP6uXNFsYmLwF+O5f/u9UXLLTSAw89j/wilLfUFD/PVXS4QLxpeXaZlGfn
 +nLstZ5DrtGfJBxhAIthuX4Co0LNxDpgcCZn6mB75klDi7c11YJCR9MEo7dhQyIc0T
 8TqJPOdcj6XlzZ1q+PGztbHcq4Goe0s3C3AePkz2R8MTdzrrahKUoPeEJ+ZXjuJmAH
 Xl17Ex5e+K8H4mrtdsuH4mlbgYyoGPViR1KmabGHoRdDYaBpLTNaRHm84GBKd/hbyY
 JrdM965+U3THSIVm8ZMAMfZQOw/i4YDGywWjAb/H6m+NyrsZlXMjjb3dHVGPdn02FL
 9nRdndJZTgmVg==
Message-ID: <92fa6c87-4780-47eb-986c-1bc19db085f1@kernel.org>
Date: Fri, 13 Jun 2025 15:55:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong2021@gmail.com>, jaegeuk@kernel.org
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
 <20250610123743.667183-14-shengyong1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250610123743.667183-14-shengyong1@xiaomi.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/10 20:37,
 Sheng Yong wrote: > From: Sheng Yong <shengyong1@xiaomi.com>
 > > This patch adds a new member `filename' in inject_dentry to inject >
 dentry filename. The dentry is specified by ni [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPzGD-0007wP-9x
Subject: Re: [f2fs-dev] [RFC PATCH v2 13/32] inject.f2fs: add member
 `filename' in inject_dentry
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/6/10 20:37, Sheng Yong wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> This patch adds a new member `filename' in inject_dentry to inject
> dentry filename. The dentry is specified by nid option.
> 
> Note that '.' and '..' dentries are special, because they are not in the
> parent directory of nid. So this patch also adds a new option `--dots'
> to inject these two dentries.
> 
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> ---
>   fsck/inject.c     | 94 ++++++++++++++++++++++++++++++++++++++++-------
>   fsck/inject.h     |  1 +
>   man/inject.f2fs.8 | 12 +++++-
>   3 files changed, 92 insertions(+), 15 deletions(-)
> 
> diff --git a/fsck/inject.c b/fsck/inject.c
> index 8c2f8c5dc332..5eb913fefad7 100644
> --- a/fsck/inject.c
> +++ b/fsck/inject.c
> @@ -105,7 +105,7 @@ void inject_usage(void)
>   	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
>   	MSG(0, "  --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
>   	MSG(0, "  --node --mb <name> --nid <nid> [--idx <index>] --val <value> inject node\n");
> -	MSG(0, "  --dent --mb <name> --nid <ino> [--idx <index>] --val <value> inject ino's dentry\n");
> +	MSG(0, "  --dent --mb <name> --nid <ino> [--dots <1|2>] --val/str <value/string> inject ino's dentry\n");
>   	MSG(0, "  --dry-run do not really inject\n");
>   
>   	exit(1);
> @@ -212,12 +212,16 @@ static void inject_node_usage(void)
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
> @@ -241,6 +245,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
>   		{"ssa", no_argument, 0, 12},
>   		{"node", no_argument, 0, 13},
>   		{"dent", no_argument, 0, 14},
> +		{"dots", required_argument, 0, 15},
>   		{0, 0, 0, 0}
>   	};
>   
> @@ -339,6 +344,14 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
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
> @@ -371,6 +384,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
>   			} else if (opt->dent) {
>   				inject_dent_usage();
>   				exit(0);
> +			} else {
> +				MSG(0, "\tError: Wrong option -%c (%d) %s\n",
> +				    o, o, optarg);
>   			}
>   			return EUNKNOWN_OPT;
>   		}
> @@ -1146,12 +1162,12 @@ static int find_dir_entry(struct f2fs_dentry_ptr *d, nid_t ino)
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
> @@ -1164,14 +1180,15 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
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
> @@ -1180,12 +1197,25 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
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
> @@ -1195,7 +1225,10 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
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
> @@ -1231,7 +1264,10 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
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
> @@ -1265,6 +1301,36 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
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
> +		if (namelen > namecap || namelen > F2FS_NAME_LEN) {
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

Yong,

Out of curiosity, if we inject filename in target dirent, according new
filename's hash, it may be located in dentry block which belongs to another
bucket, can fsck repair it?

Thanks,

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
> index 72d1c90f7ce4..27b66f59b77d 100644
> --- a/man/inject.f2fs.8
> +++ b/man/inject.f2fs.8
> @@ -214,7 +214,14 @@ inode i_nid array specified by \fIidx\fP.
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
> @@ -229,6 +236,9 @@ dentry ino.
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

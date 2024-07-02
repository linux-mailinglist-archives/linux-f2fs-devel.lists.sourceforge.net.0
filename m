Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6E891EFA7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jul 2024 09:01:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sOXVz-0002F5-MY;
	Tue, 02 Jul 2024 07:01:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sOXVx-0002Ex-SU
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 07:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VMaKZQOOkdbKe6iGId/t9xN959lY7r1hRolcFz88W9Y=; b=NwcPLVrbjCw/LeWPiHpVgr53xA
 aFjzvZ8cLWtoBwNdDM9Bv6NZSGJ64swoYklolzixMcCtR2+jxOZad39atIGBbcxYOLbNiNgDdSBSB
 uwwfdsTrVZi45QjOTVvPOw0aXL8qOYj72+48vY0AYRetU6V3jmEUnvtLrANFQXIDc8l4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VMaKZQOOkdbKe6iGId/t9xN959lY7r1hRolcFz88W9Y=; b=AsKbtBi4kzB45gtWsuYB6SEJOP
 96d+YQK7GNJXxWFhTKob2tA6WNRGJLNGBd0mHDwPXfgCuFeZqbjyW/xFA/qU5lDNnwU/uvON9se1s
 /l+/ePKsJ4+ay+YRggU34LroU85w0tL4H2EawcZgv7wz73+V/cJVz+edCQPwJ78Aa488=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sOXVw-0003kk-Mc for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 07:01:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4B24CCE1C41;
 Tue,  2 Jul 2024 07:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2643C4AF0A;
 Tue,  2 Jul 2024 07:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719903672;
 bh=7+uA7w1KKXjPr90CVlNe8jEMzNUQIIGGIrqNQv7SF/s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KvMscesRuf25Z7x4ucp/ZjdOvbXnrTKVCaLpIAVSnJDzV+5jnaJWVncjcdTT/yHpB
 U/yEgKcwbUh/GkkTfFaaYO68dhukp9ZsBWBf1kQfrtQx2Bs75gbl1I08kSa4wJzvll
 /SS5Bis215NHxK1niKxDS0hP7ffKe8M4c/bOmuEgI4cakMRVBsx9JTsyMmxwxMpZr7
 BVTrj5iqqlbwx9VqWkAAu9eblMJAd7iCVk6mMsYpoWrQJrMt67eFrtA7r169xlN6B1
 fj/yWtahCQKRLu29Z1hBC+uon+e37CiRcg7ATP119Oj6zF9iCs+HqCP/BxJiFCndBP
 pKTwHoDv5LGcw==
Message-ID: <01299dcb-a1b0-4d7c-b538-fd16cdf5d7ca@kernel.org>
Date: Tue, 2 Jul 2024 15:01:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20240628013140.2444209-1-shengyong@oppo.com>
 <20240628013140.2444209-10-shengyong@oppo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240628013140.2444209-10-shengyong@oppo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/28 9:31, Sheng Yong wrote: > This patch enables
 injecting dentry block or dir entry. > print_raw_dentry_info() is added to
 show values of node footer. > > The meanings of options are: > * de [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sOXVw-0003kk-Mc
Subject: Re: [f2fs-dev] [RFC PATCH v2 09/10] inject.f2fs: add dentry
 injection
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
> This patch enables injecting dentry block or dir entry.
> print_raw_dentry_info() is added to show values of node footer.
> 
> The meanings of options are:
>   * dent: means dentry is injected.
> 
> The members could be injected in cp contains:
>   * d_bitmap: dentry block d_bitmap of nid
>   * d_hash: dentry hash
>   * d_ino: dentry ino
>   * d_ftype: dentry ftype
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
>   fsck/inject.c | 179 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   fsck/inject.h |   1 +
>   2 files changed, 180 insertions(+)
> 
> diff --git a/fsck/inject.c b/fsck/inject.c
> index c48728e..bae9afb 100644
> --- a/fsck/inject.c
> +++ b/fsck/inject.c
> @@ -10,6 +10,7 @@
>    */
>   
>   #include <getopt.h>
> +#include "node.h"
>   #include "inject.h"
>   
>   static void print_raw_nat_entry_info(struct f2fs_nat_entry *ne)
> @@ -74,6 +75,17 @@ static void print_node_footer_info(struct node_footer *footer)
>   	DISP_u32(footer, next_blkaddr);
>   }
>   
> +static void print_raw_dentry_info(struct f2fs_dir_entry *dentry)
> +{
> +	if (!c.dbg_lv)
> +		return;
> +
> +	DISP_u32(dentry, hash_code);
> +	DISP_u32(dentry, ino);
> +	DISP_u16(dentry, name_len);
> +	DISP_u8(dentry, file_type);
> +}
> +
>   void inject_usage(void)
>   {
>   	MSG(0, "\nUsage: inject.f2fs [options] device\n");
> @@ -92,6 +104,7 @@ void inject_usage(void)
>   	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
>   	MSG(0, "  --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
>   	MSG(0, "  --node --mb <name> --nid <nid> [--idx <index>] --val <value> inject node\n");
> +	MSG(0, "  --dent --mb <name> --nid <ino> [--idx <index>] --val <value> inject ino's dentry\n");
>   	MSG(0, "  --dry-run do not really inject\n");
>   
>   	exit(1);
> @@ -186,6 +199,16 @@ static void inject_node_usage(void)
>   	MSG(0, "  addr: inject {in}direct node nid/addr array selected by --idx <index>\n");
>   }
>   
> +static void inject_dent_usage(void)
> +{
> +	MSG(0, "inject.f2fs --dent --mb <name> --nid <nid> [--idx <index>] --val <value> inject dentry\n");
> +	MSG(0, "[mb]:\n");
> +	MSG(0, "  d_bitmap: inject dentry block d_bitmap of nid\n");
> +	MSG(0, "  d_hash: inject dentry hash\n");
> +	MSG(0, "  d_ino: inject dentry ino\n");
> +	MSG(0, "  d_ftype: inject dentry ftype\n");
> +}
> +
>   int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
>   {
>   	int o = 0;
> @@ -205,6 +228,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
>   		{"blk", required_argument, 0, 11},
>   		{"ssa", no_argument, 0, 12},
>   		{"node", no_argument, 0, 13},
> +		{"dent", no_argument, 0, 14},
>   		{0, 0, 0, 0}
>   	};
>   
> @@ -280,6 +304,10 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
>   			opt->node = true;
>   			MSG(0, "Info: inject node\n");
>   			break;
> +		case 14:
> +			opt->dent = true;
> +			MSG(0, "Info: inject dentry\n");
> +			break;
>   		case 'd':
>   			if (optarg[0] == '-' || !is_digits(optarg))
>   				return EWRONG_OPT;
> @@ -309,6 +337,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
>   			} else if (opt->node) {
>   				inject_node_usage();
>   				exit(0);
> +			} else if (opt->dent) {
> +				inject_dent_usage();
> +				exit(0);
>   			}
>   			return EUNKNOWN_OPT;
>   		}
> @@ -884,6 +915,152 @@ out:
>   	return ret;
>   }
>   
> +static int find_dir_entry(struct f2fs_dentry_ptr *d, nid_t ino)
> +{
> +	struct f2fs_dir_entry *de;
> +	int slot = 0;
> +
> +	while (slot < d->max) {
> +		if (!test_bit_le(slot, d->bitmap)) {
> +			slot++;
> +			continue;
> +		}
> +
> +		de = &d->dentry[slot];
> +		if (le32_to_cpu(de->ino) == ino && de->hash_code != 0)
> +			return slot;
> +		if (de->name_len == 0) {
> +			slot++;
> +			continue;
> +		}
> +		slot += GET_DENTRY_SLOTS(le16_to_cpu(de->name_len));
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
> +{
> +	struct node_info ni;
> +	struct f2fs_node *node_blk = NULL;
> +	struct f2fs_inode *inode;
> +	struct f2fs_dentry_ptr d;
> +	void *inline_dentry;
> +	struct f2fs_dentry_block *dent_blk = NULL;
> +	block_t addr = 0;
> +	void *buf = NULL;
> +	struct f2fs_dir_entry *dent = NULL;
> +	struct dnode_of_data dn;
> +	nid_t pino;
> +	int slot = -ENOENT, ret;
> +
> +	node_blk = malloc(F2FS_BLKSIZE);
> +	ASSERT(node_blk != NULL);
> +
> +	/* get child inode */
> +	get_node_info(sbi, opt->nid, &ni);
> +	ret = dev_read_block(node_blk, ni.blk_addr);
> +	ASSERT(ret >= 0);
> +	pino = le32_to_cpu(node_blk->i.i_pino);
> +
> +	/* get parent inode */
> +	get_node_info(sbi, pino, &ni);
> +	ret = dev_read_block(node_blk, ni.blk_addr);
> +	ASSERT(ret >= 0);
> +	inode = &node_blk->i;
> +
> +	/* find child dentry */
> +	if (inode->i_inline & F2FS_INLINE_DENTRY) {
> +		inline_dentry = inline_data_addr(node_blk);
> +		make_dentry_ptr(&d, node_blk, inline_dentry, 2);
> +		addr = ni.blk_addr;
> +		buf = node_blk;
> +
> +		slot = find_dir_entry(&d, opt->nid);
> +		if (slot >= 0)
> +			dent = &d.dentry[slot];
> +	} else {
> +		unsigned int level, dirlevel, nbucket;
> +		unsigned long i, end;
> +
> +		level = le32_to_cpu(inode->i_current_depth);
> +		dirlevel = le32_to_cpu(inode->i_dir_level);
> +		nbucket = dir_buckets(level, dirlevel);
> +		end = dir_block_index(level, dirlevel, nbucket) +
> +						bucket_blocks(level);
> +
> +		dent_blk = malloc(F2FS_BLKSIZE);
> +		ASSERT(dent_blk != NULL);
> +
> +		for (i = 0; i < end; i++) {
> +			memset(&dn, 0, sizeof(dn));
> +			set_new_dnode(&dn, node_blk, NULL, pino);
> +			ret = get_dnode_of_data(sbi, &dn, i, LOOKUP_NODE);
> +			if (ret < 0)
> +				break;
> +			addr = dn.data_blkaddr;
> +			if (dn.inode_blk != dn.node_blk)
> +				free(dn.node_blk);
> +			if (addr == NULL_ADDR || addr == NEW_ADDR)

check addr w/ f2fs_is_valid_blkaddr() ? otherwise, we may read dentry block
from invalid blkaddr.

Thanks,

> +				continue;
> +			ret = dev_read_block(dent_blk, addr);
> +			ASSERT(ret >= 0);
> +
> +			make_dentry_ptr(&d, node_blk, dent_blk, 1);
> +			slot = find_dir_entry(&d, opt->nid);
> +			if (slot >= 0) {
> +				dent = &d.dentry[slot];
> +				buf = dent_blk;
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (slot < 0) {
> +		ERR_MSG("dentry of ino %u not found\n", opt->nid);
> +		ret = -ENOENT;
> +		goto out;
> +	}
> +
> +	if (!strcmp(opt->mb, "d_bitmap")) {
> +		MSG(0, "Info: inject dentry bitmap of nid %u: 1 -> 0\n",
> +		    opt->nid);
> +		test_and_clear_bit_le(slot, d.bitmap);
> +	} else if (!strcmp(opt->mb, "d_hash")) {
> +		MSG(0, "Info: inject dentry d_hash of nid %u: "
> +		    "0x%x -> 0x%x\n", opt->nid, le32_to_cpu(dent->hash_code),
> +		    (u32)opt->val);
> +		dent->hash_code = cpu_to_le32((u32)opt->val);
> +	} else if (!strcmp(opt->mb, "d_ino")) {
> +		MSG(0, "Info: inject dentry d_ino of nid %u: "
> +		    "%u -> %u\n", opt->nid, le32_to_cpu(dent->ino),
> +		    (nid_t)opt->val);
> +		dent->ino = cpu_to_le32((nid_t)opt->val);
> +	} else if (!strcmp(opt->mb, "d_ftype")) {
> +		MSG(0, "Info: inject dentry d_type of nid %u: "
> +		    "%d -> %d\n", opt->nid, dent->file_type,
> +		    (u8)opt->val);
> +		dent->file_type = (u8)opt->val;
> +	} else {
> +		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	print_raw_dentry_info(dent);
> +
> +	if (inode->i_inline & F2FS_INLINE_DENTRY)
> +		ret = update_inode(sbi, buf, &addr);
> +	else
> +		ret = update_block(sbi, buf, &addr, NULL);
> +	ASSERT(ret >= 0);
> +
> +out:
> +	free(node_blk);
> +	free(dent_blk);
> +	return ret;
> +}
> +
>   int do_inject(struct f2fs_sb_info *sbi)
>   {
>   	struct inject_option *opt = (struct inject_option *)c.private;
> @@ -901,6 +1078,8 @@ int do_inject(struct f2fs_sb_info *sbi)
>   		ret = inject_ssa(sbi, opt);
>   	else if (opt->node)
>   		ret = inject_node(sbi, opt);
> +	else if (opt->dent)
> +		ret = inject_dentry(sbi, opt);
>   
>   	return ret;
>   }
> diff --git a/fsck/inject.h b/fsck/inject.h
> index 9b14c31..43c21b5 100644
> --- a/fsck/inject.h
> +++ b/fsck/inject.h
> @@ -32,6 +32,7 @@ struct inject_option {
>   	int sit;		/* which sit pack */
>   	bool ssa;
>   	bool node;
> +	bool dent;
>   };
>   
>   void inject_usage(void);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

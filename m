Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7A596AA1D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 23:28:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slb4c-0008K4-70;
	Tue, 03 Sep 2024 21:28:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1slb4Z-0008Jw-Po
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 21:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mp8gEYsxCjyTKJ/Ywxqi86n3c78E62eM0GdQlFAlOME=; b=DxiTfXM00cwFaVYjf2WFkBsmYn
 rMmT0Rx0EbASC7GgG9PIAavUymJMZko7ef4jLI2+HmSopTCf8DvwvOWmF3eZ+YiC6XxKSqYxtkz3z
 tjPO9QMZKmr/et8cHna1oNB01rci8Dt3qF+B/+6ZEIqWmG1AKakyu90gKwUZY4OtjTcs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mp8gEYsxCjyTKJ/Ywxqi86n3c78E62eM0GdQlFAlOME=; b=UFE+5YgLYnDi7BXWWgBrARWlKT
 IaowTSqE3FNgoiVTRh9/Oh0JWusfrt3Kwynuu+oXd7wdz2no5yXybiuEZJPViYdsYtkFRs9/e27yW
 jFrw/8fhYJXRXGLASySK1vrPor+rag5YC5f2cXKO9r54fWg+vCDeaYZ+qunzYPNFYj/g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slb4Y-0003uR-6t for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 21:28:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5C5A95C564F;
 Tue,  3 Sep 2024 21:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BC4C4CEC4;
 Tue,  3 Sep 2024 21:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725398896;
 bh=Xxujy9Jn/rdO65bdpYdsNDOrY/VW8PljClb4fiGz4HU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C6aK+YmvTPIaLm9xy8CjJC5xrvIaKJ6G9jwFCNByFRfdkABIpw5PKnBi/2MS7NQx/
 SidlfhBugbFlI9iGscNzT+amkmz9a4qo63XfYi/I0QxO0oEUHvnVRgTjg8vc9K4/V2
 +gRjwVwUnqERmDSRP698kXEMRgvM61MCNfMfVf6b9AA9PsGbXP9/5O3wlL5ToAjMFP
 +ggMcnu792AzlCiOJc8kyttw/ZCE3rS6VXA8hUCKSA7r/efvOj1g0K4SEGNXZIT+Y1
 7F3z2RnktPyoQxsLxiaChI5qqiWScCHmwKMEAmx2N13GxNjOPSoJ4odMC3gOt090aw
 IrqXov1kGeJ/A==
Date: Tue, 3 Sep 2024 21:28:14 +0000
To: Sheng Yong <shengyong@oppo.com>
Message-ID: <Ztd_bnL803LuQdyU@google.com>
References: <20240704025740.527171-1-shengyong@oppo.com>
 <20240704025740.527171-10-shengyong@oppo.com>
 <8d9ebf65-a1e4-4151-8ecb-92a531a7a938@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d9ebf65-a1e4-4151-8ecb-92a531a7a938@oppo.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/03, Sheng Yong wrote: > Hi, Jaegeuk, > > I noticed that
 this commit is not queued in either dev or master branch. > Do you have any
 comments on this commit :-) Thanks, I missed. Let me queue in the branches.
 :) Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1slb4Y-0003uR-6t
Subject: Re: [f2fs-dev] [RCF PATCH v3 09/10] inject.f2fs: add dentry
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/03, Sheng Yong wrote:
> Hi, Jaegeuk,
> 
> I noticed that this commit is not queued in either dev or master branch.
> Do you have any comments on this commit :-)

Thanks, I missed. Let me queue in the branches. :)

> 
> thanks,
> shengyong
> 
> On 2024/7/4 10:57, Sheng Yong wrote:
> > This patch enables injecting dentry block or dir entry.
> > print_raw_dentry_info() is added to show values of node footer.
> > 
> > The meanings of options are:
> >   * dent: means dentry is injected.
> > 
> > The members could be injected in cp contains:
> >   * d_bitmap: dentry block d_bitmap of nid
> >   * d_hash: dentry hash
> >   * d_ino: dentry ino
> >   * d_ftype: dentry ftype
> > 
> > Signed-off-by: Sheng Yong <shengyong@oppo.com>
> > ---
> >   fsck/inject.c | 184 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >   fsck/inject.h |   1 +
> >   2 files changed, 185 insertions(+)
> > 
> > diff --git a/fsck/inject.c b/fsck/inject.c
> > index 2a21dae..a7d2a2c 100644
> > --- a/fsck/inject.c
> > +++ b/fsck/inject.c
> > @@ -10,6 +10,7 @@
> >    */
> >   #include <getopt.h>
> > +#include "node.h"
> >   #include "inject.h"
> >   static void print_raw_nat_entry_info(struct f2fs_nat_entry *ne)
> > @@ -74,6 +75,17 @@ static void print_node_footer_info(struct node_footer *footer)
> >   	DISP_u32(footer, next_blkaddr);
> >   }
> > +static void print_raw_dentry_info(struct f2fs_dir_entry *dentry)
> > +{
> > +	if (!c.dbg_lv)
> > +		return;
> > +
> > +	DISP_u32(dentry, hash_code);
> > +	DISP_u32(dentry, ino);
> > +	DISP_u16(dentry, name_len);
> > +	DISP_u8(dentry, file_type);
> > +}
> > +
> >   void inject_usage(void)
> >   {
> >   	MSG(0, "\nUsage: inject.f2fs [options] device\n");
> > @@ -92,6 +104,7 @@ void inject_usage(void)
> >   	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
> >   	MSG(0, "  --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
> >   	MSG(0, "  --node --mb <name> --nid <nid> [--idx <index>] --val <value> inject node\n");
> > +	MSG(0, "  --dent --mb <name> --nid <ino> [--idx <index>] --val <value> inject ino's dentry\n");
> >   	MSG(0, "  --dry-run do not really inject\n");
> >   	exit(1);
> > @@ -186,6 +199,16 @@ static void inject_node_usage(void)
> >   	MSG(0, "  addr: inject {in}direct node nid/addr array selected by --idx <index>\n");
> >   }
> > +static void inject_dent_usage(void)
> > +{
> > +	MSG(0, "inject.f2fs --dent --mb <name> --nid <nid> [--idx <index>] --val <value> inject dentry\n");
> > +	MSG(0, "[mb]:\n");
> > +	MSG(0, "  d_bitmap: inject dentry block d_bitmap of nid\n");
> > +	MSG(0, "  d_hash: inject dentry hash\n");
> > +	MSG(0, "  d_ino: inject dentry ino\n");
> > +	MSG(0, "  d_ftype: inject dentry ftype\n");
> > +}
> > +
> >   int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
> >   {
> >   	int o = 0;
> > @@ -206,6 +229,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
> >   		{"blk", required_argument, 0, 11},
> >   		{"ssa", no_argument, 0, 12},
> >   		{"node", no_argument, 0, 13},
> > +		{"dent", no_argument, 0, 14},
> >   		{0, 0, 0, 0}
> >   	};
> > @@ -294,6 +318,10 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
> >   			opt->node = true;
> >   			MSG(0, "Info: inject node\n");
> >   			break;
> > +		case 14:
> > +			opt->dent = true;
> > +			MSG(0, "Info: inject dentry\n");
> > +			break;
> >   		case 'd':
> >   			if (optarg[0] == '-' || !is_digits(optarg))
> >   				return EWRONG_OPT;
> > @@ -323,6 +351,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
> >   			} else if (opt->node) {
> >   				inject_node_usage();
> >   				exit(0);
> > +			} else if (opt->dent) {
> > +				inject_dent_usage();
> > +				exit(0);
> >   			}
> >   			return EUNKNOWN_OPT;
> >   		}
> > @@ -898,6 +929,157 @@ out:
> >   	return ret;
> >   }
> > +static int find_dir_entry(struct f2fs_dentry_ptr *d, nid_t ino)
> > +{
> > +	struct f2fs_dir_entry *de;
> > +	int slot = 0;
> > +
> > +	while (slot < d->max) {
> > +		if (!test_bit_le(slot, d->bitmap)) {
> > +			slot++;
> > +			continue;
> > +		}
> > +
> > +		de = &d->dentry[slot];
> > +		if (le32_to_cpu(de->ino) == ino && de->hash_code != 0)
> > +			return slot;
> > +		if (de->name_len == 0) {
> > +			slot++;
> > +			continue;
> > +		}
> > +		slot += GET_DENTRY_SLOTS(le16_to_cpu(de->name_len));
> > +	}
> > +
> > +	return -ENOENT;
> > +}
> > +
> > +static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
> > +{
> > +	struct node_info ni;
> > +	struct f2fs_node *node_blk = NULL;
> > +	struct f2fs_inode *inode;
> > +	struct f2fs_dentry_ptr d;
> > +	void *inline_dentry;
> > +	struct f2fs_dentry_block *dent_blk = NULL;
> > +	block_t addr = 0;
> > +	void *buf = NULL;
> > +	struct f2fs_dir_entry *dent = NULL;
> > +	struct dnode_of_data dn;
> > +	nid_t pino;
> > +	int slot = -ENOENT, ret;
> > +
> > +	node_blk = malloc(F2FS_BLKSIZE);
> > +	ASSERT(node_blk != NULL);
> > +
> > +	/* get child inode */
> > +	get_node_info(sbi, opt->nid, &ni);
> > +	ret = dev_read_block(node_blk, ni.blk_addr);
> > +	ASSERT(ret >= 0);
> > +	pino = le32_to_cpu(node_blk->i.i_pino);
> > +
> > +	/* get parent inode */
> > +	get_node_info(sbi, pino, &ni);
> > +	ret = dev_read_block(node_blk, ni.blk_addr);
> > +	ASSERT(ret >= 0);
> > +	inode = &node_blk->i;
> > +
> > +	/* find child dentry */
> > +	if (inode->i_inline & F2FS_INLINE_DENTRY) {
> > +		inline_dentry = inline_data_addr(node_blk);
> > +		make_dentry_ptr(&d, node_blk, inline_dentry, 2);
> > +		addr = ni.blk_addr;
> > +		buf = node_blk;
> > +
> > +		slot = find_dir_entry(&d, opt->nid);
> > +		if (slot >= 0)
> > +			dent = &d.dentry[slot];
> > +	} else {
> > +		unsigned int level, dirlevel, nbucket;
> > +		unsigned long i, end;
> > +
> > +		level = le32_to_cpu(inode->i_current_depth);
> > +		dirlevel = le32_to_cpu(inode->i_dir_level);
> > +		nbucket = dir_buckets(level, dirlevel);
> > +		end = dir_block_index(level, dirlevel, nbucket) +
> > +						bucket_blocks(level);
> > +
> > +		dent_blk = malloc(F2FS_BLKSIZE);
> > +		ASSERT(dent_blk != NULL);
> > +
> > +		for (i = 0; i < end; i++) {
> > +			memset(&dn, 0, sizeof(dn));
> > +			set_new_dnode(&dn, node_blk, NULL, pino);
> > +			ret = get_dnode_of_data(sbi, &dn, i, LOOKUP_NODE);
> > +			if (ret < 0)
> > +				break;
> > +			addr = dn.data_blkaddr;
> > +			if (dn.inode_blk != dn.node_blk)
> > +				free(dn.node_blk);
> > +			if (addr == NULL_ADDR || addr == NEW_ADDR)
> > +				continue;
> > +			if (!f2fs_is_valid_blkaddr(sbi, addr, DATA_GENERIC)) {
> > +				MSG(0, "invalid blkaddr 0x%x at offset %lu\n",
> > +				    addr, i);
> > +				continue;
> > +			}
> > +			ret = dev_read_block(dent_blk, addr);
> > +			ASSERT(ret >= 0);
> > +
> > +			make_dentry_ptr(&d, node_blk, dent_blk, 1);
> > +			slot = find_dir_entry(&d, opt->nid);
> > +			if (slot >= 0) {
> > +				dent = &d.dentry[slot];
> > +				buf = dent_blk;
> > +				break;
> > +			}
> > +		}
> > +	}
> > +
> > +	if (slot < 0) {
> > +		ERR_MSG("dentry of ino %u not found\n", opt->nid);
> > +		ret = -ENOENT;
> > +		goto out;
> > +	}
> > +
> > +	if (!strcmp(opt->mb, "d_bitmap")) {
> > +		MSG(0, "Info: inject dentry bitmap of nid %u: 1 -> 0\n",
> > +		    opt->nid);
> > +		test_and_clear_bit_le(slot, d.bitmap);
> > +	} else if (!strcmp(opt->mb, "d_hash")) {
> > +		MSG(0, "Info: inject dentry d_hash of nid %u: "
> > +		    "0x%x -> 0x%x\n", opt->nid, le32_to_cpu(dent->hash_code),
> > +		    (u32)opt->val);
> > +		dent->hash_code = cpu_to_le32((u32)opt->val);
> > +	} else if (!strcmp(opt->mb, "d_ino")) {
> > +		MSG(0, "Info: inject dentry d_ino of nid %u: "
> > +		    "%u -> %u\n", opt->nid, le32_to_cpu(dent->ino),
> > +		    (nid_t)opt->val);
> > +		dent->ino = cpu_to_le32((nid_t)opt->val);
> > +	} else if (!strcmp(opt->mb, "d_ftype")) {
> > +		MSG(0, "Info: inject dentry d_type of nid %u: "
> > +		    "%d -> %d\n", opt->nid, dent->file_type,
> > +		    (u8)opt->val);
> > +		dent->file_type = (u8)opt->val;
> > +	} else {
> > +		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
> > +		ret = -EINVAL;
> > +		goto out;
> > +	}
> > +
> > +	print_raw_dentry_info(dent);
> > +
> > +	if (inode->i_inline & F2FS_INLINE_DENTRY)
> > +		ret = update_inode(sbi, buf, &addr);
> > +	else
> > +		ret = update_block(sbi, buf, &addr, NULL);
> > +	ASSERT(ret >= 0);
> > +
> > +out:
> > +	free(node_blk);
> > +	free(dent_blk);
> > +	return ret;
> > +}
> > +
> >   int do_inject(struct f2fs_sb_info *sbi)
> >   {
> >   	struct inject_option *opt = (struct inject_option *)c.private;
> > @@ -915,6 +1097,8 @@ int do_inject(struct f2fs_sb_info *sbi)
> >   		ret = inject_ssa(sbi, opt);
> >   	else if (opt->node)
> >   		ret = inject_node(sbi, opt);
> > +	else if (opt->dent)
> > +		ret = inject_dentry(sbi, opt);
> >   	return ret;
> >   }
> > diff --git a/fsck/inject.h b/fsck/inject.h
> > index 9b14c31..43c21b5 100644
> > --- a/fsck/inject.h
> > +++ b/fsck/inject.h
> > @@ -32,6 +32,7 @@ struct inject_option {
> >   	int sit;		/* which sit pack */
> >   	bool ssa;
> >   	bool node;
> > +	bool dent;
> >   };
> >   void inject_usage(void);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

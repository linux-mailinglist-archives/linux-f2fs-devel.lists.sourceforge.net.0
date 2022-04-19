Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C5A506200
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 04:11:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngdKO-0000oA-TK; Tue, 19 Apr 2022 02:10:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1ngdKO-0000o0-2U
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 02:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qp8zMakN9Q0SDz/ImtUGoCSGp2YoKxj7E9Zcvc1rkW0=; b=JUIsUkQy1AmvWa/V6JxmiTtys3
 JzPu3P6bi31o2BTjECU8+bFdqLzICoax+B3qpkD5Sq0sVB+on5EAPefHzj5vIrPMbDrGt5lsf42Fn
 W0fO9KcfBLeDipty7b0/BWlf8Z3cvixanCUaq3h6TsWwqIESqSh/dZJkZ7X+BwPPnukc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qp8zMakN9Q0SDz/ImtUGoCSGp2YoKxj7E9Zcvc1rkW0=; b=FGsQta6iGxkUmbp/pymRxAx8Vi
 EcdTBHw9uJRcHf02qy162oRUYI+uzpdmXUbUCP52zlh4qE2Uneg99exGC8ianEaqfFaMA1T+W6f9O
 QWhaLJl/TUbKM0nh1po4/CKgiT/f7LhtTwhcbg8zfb2Fy0WLZ7z/rscfdRKw8bmbLXM0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngdKJ-003UBY-F2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 02:10:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C6003CE1122;
 Tue, 19 Apr 2022 02:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DAC7C385A1;
 Tue, 19 Apr 2022 02:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650334231;
 bh=OuhSwAvwXTQTG32ZCVMgwW9lhg74r8vMq9u4YRtIhyc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Ezj3avhRaxkIx+DE2s2Sk6nnCYcoOTpyClsCb4y+PwTzWwkdVc8DFn8ufEuAs/JUb
 uF7v5oaN0ZnrtrPmJno/hAKlyou4bsrCay6gAuyRAfW0ABDnO61D4FfdIT5LMqgB0V
 rVx7KkA270n2TyLHeAHPivR4U4UZC3mEQflofwiShiL2IGB86F0kgzuH+3YvJc8WPq
 zIUr/ScNus2nHUgvuicbtHQqEmxU4xH4Hbd0qS4oQFS+1WijRYiXGkEgteNzM1EAZW
 JCIBwTaN3FXdVqcFwjBjjyc7s5HWXzBjOYBdubSfWrFp9AHG+VqpQ35UtWoQ3U5ju6
 VDI0bnFXsLqow==
Message-ID: <cddfa7a5-8e8d-6c15-707c-8721ab6c0be8@kernel.org>
Date: Tue, 19 Apr 2022 10:10:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Yufen Yu <yuyufen@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20220418024327.1628327-1-yuyufen@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220418024327.1628327-1-yuyufen@huawei.com>
X-Spam-Score: -9.0 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/4/18 10:43, Yufen Yu via Linux-f2fs-devel wrote: >
 Usage: > dump.f2fs -I [inode nid] /dev/sda > > This feature can be useful
 for some bugs caused by system crash. > We not only need dump curre [...]
 Content analysis details:   (-9.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ngdKJ-003UBY-F2
Subject: Re: [f2fs-dev] [PATCH v2] dump.f2fs: add -I nid to dump inode by
 scan full disk
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/4/18 10:43, Yufen Yu via Linux-f2fs-devel wrote:
> Usage:
> 	dump.f2fs -I [inode nid] /dev/sda
> 
> This feature can be useful for some bugs caused by system crash.
> We not only need dump current valid node page, but alse the history
> data in disk, which can give some clues for status change of the inode.
> 
> Signed-off-by: Yufen Yu <yuyufen@huawei.com>
> ---
>   fsck/dump.c     | 29 +++++++++++++++++++++++++++++
>   fsck/fsck.h     |  1 +
>   fsck/main.c     | 14 +++++++++++++-
>   man/dump.f2fs.8 |  7 +++++++
>   4 files changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/fsck/dump.c b/fsck/dump.c
> index fce86c9..7ff0b28 100644
> --- a/fsck/dump.c
> +++ b/fsck/dump.c
> @@ -539,6 +539,35 @@ static bool is_sit_bitmap_set(struct f2fs_sb_info *sbi, u32 blk_addr)
>   			(const char *)se->cur_valid_map) != 0;
>   }
>   
> +void dump_node_scan_disk(struct f2fs_sb_info *sbi, nid_t nid)
> +{
> +	struct f2fs_node *node_blk;
> +	pgoff_t blkaddr;
> +	int ret;
> +	pgoff_t start_blkaddr = SM_I(sbi)->main_blkaddr;
> +	pgoff_t end_blkaddr = start_blkaddr +
> +		(SM_I(sbi)->main_segments << sbi->log_blocks_per_seg);
> +
> +	node_blk = calloc(BLOCK_SZ, 1);
> +	ASSERT(node_blk);
> +	MSG(0, "Info: scan all nid: %u from block_addr [%lu: %lu]\n",
> +			nid, start_blkaddr, end_blkaddr);
> +
> +	for (blkaddr = start_blkaddr; blkaddr < end_blkaddr; blkaddr++) {

Shouldn't we skip data segment? otherwise it's possible to encounter data
collision in traversed data block.

Thanks,

> +		ret = dev_read_block(node_blk, blkaddr);
> +		ASSERT(ret >= 0);
> +		if (le32_to_cpu(node_blk->footer.ino) != nid ||
> +				le32_to_cpu(node_blk->footer.nid) != nid)
> +			continue;
> +		MSG(0, "Info: nid: %u, blkaddr: %lu\n", nid, blkaddr);
> +		MSG(0, "node_blk.footer.flag [0x%x]\n", le32_to_cpu(node_blk->footer.flag));
> +		MSG(0, "node_blk.footer.cp_ver [%x]\n", (u32)(cpver_of_node(node_blk)));
> +		print_inode_info(sbi, node_blk, 0);
> +	}
> +
> +	free(node_blk);
> +}
> +
>   int dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
>   {
>   	struct node_info ni;
> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index ce5fffe..0c819f0 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -262,6 +262,7 @@ struct dump_option {
>   	int start_ssa;
>   	int end_ssa;
>   	int32_t blk_addr;
> +	nid_t scan_nid;
>   };
>   
>   extern void nat_dump(struct f2fs_sb_info *, nid_t, nid_t);
> diff --git a/fsck/main.c b/fsck/main.c
> index e4cfdf4..c7ad5ad 100644
> --- a/fsck/main.c
> +++ b/fsck/main.c
> @@ -93,6 +93,7 @@ void dump_usage()
>   	MSG(0, "[options]:\n");
>   	MSG(0, "  -d debug level [default:0]\n");
>   	MSG(0, "  -i inode no (hex)\n");
> +	MSG(0, "  -I inode no (hex) scan full disk\n");
>   	MSG(0, "  -n [NAT dump nid from #1~#2 (decimal), for all 0~-1]\n");
>   	MSG(0, "  -M show a block map\n");
>   	MSG(0, "  -s [SIT dump segno from #1~#2 (decimal), for all 0~-1]\n");
> @@ -382,7 +383,7 @@ void f2fs_parse_options(int argc, char *argv[])
>   		}
>   	} else if (!strcmp("dump.f2fs", prog)) {
>   #ifdef WITH_DUMP
> -		const char *option_string = "d:i:n:Ms:Sa:b:V";
> +		const char *option_string = "d:i:I:n:Ms:Sa:b:V";
>   		static struct dump_option dump_opt = {
>   			.nid = 0,	/* default root ino */
>   			.start_nat = -1,
> @@ -392,6 +393,7 @@ void f2fs_parse_options(int argc, char *argv[])
>   			.start_ssa = -1,
>   			.end_ssa = -1,
>   			.blk_addr = -1,
> +			.scan_nid = 0,
>   		};
>   
>   		c.func = DUMP;
> @@ -424,6 +426,14 @@ void f2fs_parse_options(int argc, char *argv[])
>   					ret = sscanf(optarg, "%x",
>   							&dump_opt.nid);
>   				break;
> +			case 'I':
> +				if (strncmp(optarg, "0x", 2))
> +					ret = sscanf(optarg, "%d",
> +							&dump_opt.scan_nid);
> +				else
> +					ret = sscanf(optarg, "%x",
> +							&dump_opt.scan_nid);
> +				break;
>   			case 'n':
>   				ret = sscanf(optarg, "%d~%d",
>   							&dump_opt.start_nat,
> @@ -916,6 +926,8 @@ static void do_dump(struct f2fs_sb_info *sbi)
>   		dump_info_from_blkaddr(sbi, opt->blk_addr);
>   	if (opt->nid)
>   		dump_node(sbi, opt->nid, 0);
> +	if (opt->scan_nid)
> +		dump_node_scan_disk(sbi, opt->scan_nid);
>   
>   	print_cp_state(flag);
>   
> diff --git a/man/dump.f2fs.8 b/man/dump.f2fs.8
> index 1ddb7fc..94bf5f3 100644
> --- a/man/dump.f2fs.8
> +++ b/man/dump.f2fs.8
> @@ -10,6 +10,10 @@ dump.f2fs \- retrieve directory and file entries from an F2FS-formated image
>   .I inode number
>   ]
>   [
> +.B \-I
> +.I inode number
> +]
> +[
>   .B \-n
>   .I NAT range
>   ]
> @@ -52,6 +56,9 @@ is 0 on success and -1 on failure.
>   .BI \-i " inode number"
>   Specify an inode number to dump out.
>   .TP
> +.BI \-I " inode number"
> +Specify an inode number and scan full disk to dump out, include history inode block
> +.TP
>   .BI \-n " NAT range"
>   Specify a range presented by nids to dump NAT entries.
>   .TP


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

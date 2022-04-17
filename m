Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ED05046E5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Apr 2022 09:00:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nfytW-0006ky-Pj; Sun, 17 Apr 2022 07:00:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nfytV-0006kr-5Y
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Apr 2022 07:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jRFKCUrs6HKwYxF72soct6O2lvslM52z+Y8uvwXDuNU=; b=ddBFqjPjUH/ziBB6OrbcBss9Gm
 JrxbRtwfaq4QozTfTAC4z8FInk2Wn3f3QOBF2takAyw+zyJ27paYQh8cqfTe52d4CpNwKZrCDrPzS
 G1tIluE5CcAsTPviIsOOwaGGHKyRpDRitKu0WSiyQm1gXlYAWSrRupB3uCcE6jfLTaWM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jRFKCUrs6HKwYxF72soct6O2lvslM52z+Y8uvwXDuNU=; b=KkseGb4sCxO3K4Shd8fr9h1tAJ
 /Cr5MATceAgwL1ftof57sxv8dpHPpOJxBb+I92g+N8tJkpLKMs/bbl29Vs9HX6wlB0TTiTNj4McFe
 8vu7mfx0Jm/s6k5Dqc9OHw/gsxtxytxwRUppzXR3nVzi2HUMTvNTdvCQhduGXZSfhKB4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nfytP-001ut9-8B
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Apr 2022 07:00:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C798461146;
 Sun, 17 Apr 2022 07:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990AEC385A4;
 Sun, 17 Apr 2022 07:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650178813;
 bh=vmmpyXrmUZ07q2VkS3KEtW+Sy56AySZETo/WZo8iNd4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=DdAZoo/cDDZMLp+492v8dbRFogPYT3eTyvNs6LK+CFlsJKgSCBXpIOB/2Mt9IajNb
 X3XSf9GNTqR8nsDlLGnwd+V3U0sUHZYVuZYASywdXtbJnQBFhTBKiXgFAbWAsMNbeD
 IvLU2a0oRM1vrKg10sIbFXTITwO+EvpfHwXclRhR1P5qWCP99fvisQbLIDGuRfZXUj
 1KJbSINImoOPZFMXgIuwgdA6h73Yps1W28dVP/gjyjI9eSIF1H9pR1opjR0wklOPjx
 vZ/Q4LIRogSTB066d2MR7nQ4MUyWbCzCKjsvc7x0VbrZQqTpePcbaVgE0vUN6SNVgc
 7agKRJp5B03Ug==
Message-ID: <d044ba3f-6fb1-f667-8c34-073ebd5dc33b@kernel.org>
Date: Sun, 17 Apr 2022 15:00:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Yufen Yu <yuyufen@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20220415015923.1627769-1-yuyufen@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220415015923.1627769-1-yuyufen@huawei.com>
X-Spam-Score: -8.4 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/4/15 9:59, Yufen Yu via Linux-f2fs-devel wrote: >
 Usage: > dump.f2fs -I [inode nid] /dev/sda > > This feature can be useful
 for some bugs caused by system crash. > We not only need dump curren [...]
 Content analysis details:   (-8.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nfytP-001ut9-8B
Subject: Re: [f2fs-dev] [PATCH] dump.f2fs: add -I nid to dump inode by scan
 full disk
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

On 2022/4/15 9:59, Yufen Yu via Linux-f2fs-devel wrote:
> Usage:
> 	dump.f2fs -I [inode nid] /dev/sda
> 
> This feature can be useful for some bugs caused by system crash.
> We not only need dump current valid node page, but alse the history
> data in disk, which can give some clues for status change of the inode.
> 
> Signed-off-by: Yufen Yu <yuyufen@huawei.com>
> ---
>   fsck/dump.c | 27 +++++++++++++++++++++++++++
>   fsck/fsck.h |  1 +
>   fsck/main.c | 14 +++++++++++++-
>   3 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/fsck/dump.c b/fsck/dump.c
> index fce86c9..8fab602 100644
> --- a/fsck/dump.c
> +++ b/fsck/dump.c
> @@ -539,6 +539,33 @@ static bool is_sit_bitmap_set(struct f2fs_sb_info *sbi, u32 blk_addr)
>   			(const char *)se->cur_valid_map) != 0;
>   }
>   
> +void dump_node_scan_disk(struct f2fs_sb_info *sbi, nid_t nid)
> +{
> +	struct f2fs_node *node_blk;
> +	pgoff_t blkaddr;
> +	pgoff_t start_blkaddr = SM_I(sbi)->main_blkaddr;
> +	pgoff_t end_blkaddr = start_blkaddr +
> +		SM_I(sbi)->main_segments << sbi->log_blocks_per_seg;
> +
> +	node_blk = calloc(BLOCK_SZ, 1);
> +	ASSERT(node_blk);
> +	MSG(0, "Info: scan all nid: %u from block_addr [%lu: %lu]\n",
> +			nid, start_blkaddr, end_blkaddr);
> +
> +	for (blkaddr = start_blkaddr; blkaddr < end_blkaddr; blkaddr++) {
> +		dev_read_block(node_blk, blkaddr);

ret = dev_read_block(node_blk, blkaddr);
ASSERT(ret >= 0);

> +		if (le32_to_cpu(node_blk->footer.ino) != nid ||
> +				le32_to_cpu(node_blk->footer.nid) != nid)
> +			continue;
> +		MSG(0, "Info: nid: %u, blkaddr: %lu\n", nid, blkaddr);
> +		MSG(0, "node_blk.footer.flag [0x%x]\n", le32_to_cpu(node_blk->footer.flag));
> +		MSG(0, "node_blk.footer.cp_ver [%x]\n", cpver_of_node(node_blk));
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

It needs to update manual of dump.f2fs as well.

Thanks,

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


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

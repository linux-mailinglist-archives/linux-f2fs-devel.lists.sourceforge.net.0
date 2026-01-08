Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C2ED008E3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 02:32:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8VdIDWjQZ5Ray0/GZAadpGqnl+sK7Du8MMCHLXaq0w=; b=bwscNw20n7qUWprsZduYD5PvYe
	4oG+oJs/DfVU3yyg86TkgYHnmoIBACwFYCXDrW3arxP6E473j79/k8wedprtVEvl8juJhq3CJ3AG8
	rRic0AuP9qORLale/zH/RiRyJ0nhhkMBBxfRQeLRXiRFws2JlTXEygRPVeBby+UdjQhc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdesq-00038P-Ke;
	Thu, 08 Jan 2026 01:32:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vdesp-00038J-1K
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 01:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bXTJDKWYnEcJgmfBPnuXWgw6MzmSTX3bY+7MFcgx61I=; b=gTw/hGYoezN0as8cLLhNc+fhO0
 53xp7DS9djBY++6AFBMqYGYJXVs11TTITp5DYUgJ94DbLF1xl2arpNLvLgyBhHBvEGZM2CRLvBV2c
 S04LlOeELZyK8gpEWAhpqam9NpvanY9DdvDZXPkufGw3pGYf1wHgLLNVWP4r02kA1xRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bXTJDKWYnEcJgmfBPnuXWgw6MzmSTX3bY+7MFcgx61I=; b=WBYURgE0Z4A8nlebsnyDvc+GDe
 MQqu/q8UZrXIIVnJqMr6Hq5nUDK9QqZiHm7kq//RxvEKSIPn6fwmkqpCKB+XOZHDlqQALT/Bi9D/j
 S9s1o9cgpIQzO0vrvf9VkK7nblnngSBHU+HRdc+Aw9dymtLg/d9y4USlak2a958MLTJs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdesp-0000vM-9B for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 01:32:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 981B46000A;
 Thu,  8 Jan 2026 01:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9988C4CEF1;
 Thu,  8 Jan 2026 01:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767835924;
 bh=Hdpurmfq54q5Zq2Vn+xGcZEnXGLZQ9GJjCvh9NE92a4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Ib+elMH5YAQlHHi5UKaNcksCP7mv8ucri9/IZUBvwKtgm7yiNvC+gCk9jeaFJj/xk
 bUHM6LC2VSri2/UlZVGhKi8YKP5az9nONDfSmv+SEAGOG/uo29cU4SV0sL/QRAJ3e0
 +GT2JCVuLLzC+yopXvsZoLYrQzSLqny6Fl9ZyG7nP8QWzEG/U1tQq1HuR9y8GKHXHy
 0RZrzS+TvbbDMQLwBQNfSf59RPPctE3nfZc//6DmfYTDgH0kmiv3YObdKvQpNiCibj
 sng5MxYqT9k16Ygy9ggEcrjvKE7EaVT6qSEruCYxRyV2BATVW+qjs2MUOwVrlqSNk5
 q8YbWB4oV1Ing==
Message-ID: <4b79827c-a199-4978-bcdc-76af19190606@kernel.org>
Date: Thu, 8 Jan 2026 09:32:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: liujinbao1 <jinbaoliu365@gmail.com>, jaegeuk@kernel.org
References: <20251231105219.2679546-1-jinbaoliu365@gmail.com>
Content-Language: en-US
In-Reply-To: <20251231105219.2679546-1-jinbaoliu365@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/31/2025 6:52 PM, liujinbao1 wrote: > From: liujinbao1
 <liujinbao1@xiaomi.com> > > During SPO tests, when mounting F2FS, an -EINVAL
 error was returned. > The issue originates from the f2fs_recove [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdesp-0000vM-9B
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: detect and fix NAT entry
 inconsistencies with dent_flag set
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, Sheng Yong <shengyong1@xiaomi.com>,
 liujinbao1 <liujinbao1@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/31/2025 6:52 PM, liujinbao1 wrote:
> From: liujinbao1 <liujinbao1@xiaomi.com>
> 
> During SPO tests, when mounting F2FS, an -EINVAL error was returned.
> The issue originates from the f2fs_recover_inode_page function's
> check, where old_ni.blk_addr != NULL_ADDR under the conditions of
> IS_INODE(folio) && is_dent_dnode(folio).
> Add detection and repair for this scenario in fsck.
> 
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> Signed-off-by: Jinbao Liu <liujinbao1@xiaomi.com>
> ---
>   fsck/mount.c | 24 ++++++++++++++++++++++++
>   fsck/node.h  | 14 ++++++++++++++
>   2 files changed, 38 insertions(+)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index f03fa2d..07b8e6e 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -3881,6 +3881,7 @@ int f2fs_find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
>   
>   	while (1) {
>   		struct fsync_inode_entry *entry;
> +		struct f2fs_nat_entry nat_entry;
>   
>   		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
>   			break;
> @@ -3897,6 +3898,29 @@ int f2fs_find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
>   
>   		entry = get_fsync_inode(head, ino_of_node(node_blk));
>   		if (!entry) {
> +			if (IS_INODE(node_blk) && is_dent_dnode(node_blk)) {
> +				get_nat_entry(sbi, ino_of_node(node_blk), &nat_entry);
> +				if (nat_entry.block_addr != NULL_ADDR) {

is_valid_data_blkaddr(nat_entry.block_addr)?

> +					if (!c.fix_on)
> +						ASSERT_MSG("ino: %u is_dent:%d nat entry blkaddr is %#X\n",
> +							ino_of_node(node_blk), is_dent_dnode(node_blk),
> +							nat_entry.block_addr);

Should call ASSERT_MSG() first to print log and set c.bug_on, then
check c.fix_on?

> +					else if (f2fs_dev_is_writable()) {
> +						int ret = 0;
> +
> +						ASSERT_MSG("Set node_blk %#x fsync flag [%u] -> [0]"
> +							" next_blkaddr [%#x] -> [NULL_ADDR]\n",
> +							blkaddr, is_fsync_dnode(node_blk),
> +							F2FS_NODE_FOOTER(node_blk)->next_blkaddr);

FIX_MSG("Set node_blk...")?

> +						F2FS_NODE_FOOTER(node_blk)->next_blkaddr = NULL_ADDR;
> +						set_fsync_mark(node_blk, 0);

I suspect that DENT_BIT_SHIFT is set incorrectly? So can we just clear DENT_BIT_SHIFT,
and continue to recovery this inode block?

Thanks,

> +						ret = dev_write_block(node_blk, blkaddr,
> +							f2fs_io_type_to_rw_hint(CURSEG_WARM_NODE));
> +						ASSERT(ret >= 0);
> +						goto next;
> +					}
> +				}
> +			}
>   			entry = add_fsync_inode(head, ino_of_node(node_blk));
>   			if (!entry) {
>   				err = -1;
> diff --git a/fsck/node.h b/fsck/node.h
> index 19f1e57..7c16cc8 100644
> --- a/fsck/node.h
> +++ b/fsck/node.h
> @@ -173,6 +173,20 @@ static inline void set_cold_node(struct f2fs_node *rn, bool is_dir)
>   	F2FS_NODE_FOOTER(rn)->flag = cpu_to_le32(flag);
>   }
>   
> +static inline void set_mark(struct f2fs_node *rn, int mark, int type)
> +{
> +	unsigned int flag = le32_to_cpu(F2FS_NODE_FOOTER(rn)->flag);
> +
> +	if (mark)
> +		flag |= (1 << type);
> +	else
> +		flag &= ~(1 << type);
> +	F2FS_NODE_FOOTER(rn)->flag = cpu_to_le32(flag);
> +}
> +
> +#define set_dentry_mark(page, mark)	set_mark(page, mark, DENT_BIT_SHIFT)
> +#define set_fsync_mark(page, mark)	set_mark(page, mark, FSYNC_BIT_SHIFT)
> +
>   #define is_fsync_dnode(node_blk)	is_node(node_blk, FSYNC_BIT_SHIFT)
>   #define is_dent_dnode(node_blk)		is_node(node_blk, DENT_BIT_SHIFT)
>   



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

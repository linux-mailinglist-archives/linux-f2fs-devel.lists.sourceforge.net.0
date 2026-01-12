Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD389D10FC1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 08:53:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2Vgkku94hd+ERoKF/F3kQa88754osGrcDiU9t0AGmU=; b=KGWa0WDpZjcZiRL5HbFLwO27b3
	a9jr8a6JdfJLKV1Zif6IwN4Ul7tYJ9CKRSpNVX4c9Qz6cxcPLxZMRH4ywhu/DYxqFnLPpJEVZYteZ
	kamW2GpLuUmIhE75HanyBA74GJOHU8qwUUPJrZWNadxTttduA8BRIcAeXIfJDdA/Q+Lg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfCkB-0005IW-1C;
	Mon, 12 Jan 2026 07:53:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vfCk8-0005IO-7D
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 07:53:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=shIorUB1tAvGTy6DISQIQcsgNkGtcnwnBpiVRL447mI=; b=i9EoSlY1uz23rHwb+qX/3i2lli
 23twj+gFxEAdXwZEQxsPOC/Etob6zyrL/JcRNTAVL9a1LtXr4n8Kw/a8b8zY6vu7nVHsy5nRXlMnO
 lAc3jvM1Dp7Z5MfN55gTxV5OpCFI6wBYO6vszJY93KhEzLiurVGhAL2xSncztFjGls5g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=shIorUB1tAvGTy6DISQIQcsgNkGtcnwnBpiVRL447mI=; b=UFFMxqQur8sleWuUCsBQuf626Q
 jFrDJ0lTzHQvforCLHoBupzO2zB0vKivXglIKg7gBv2DiDTCQkmmKd34eHU7VR/21rsrzSO8z0odK
 Di1XwRA2Vn/ndA6Dg84OdWL3Lrz1OyfJt30opr61kxh6AvcqNNs4OvvhvJCFU5MnNhzg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfCk7-0003eN-Lm for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 07:53:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 02E1460159;
 Mon, 12 Jan 2026 07:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78E5C116D0;
 Mon, 12 Jan 2026 07:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768204408;
 bh=lw/ASAZHtx8I/KQllpsSupv/M5jMcIbDtQMmmCr3HIM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=YWrLIZoEHo5pPhGRW/KLzIpDn0CzbBXXAGJBZT+j4sa9L67xbkIclEAWo59OpESEb
 kmCHRJ5HJBRHGsa7Ng+q/YnW0vi6BOanC3ett5W0SwiPyfippbc2lET7cyrb/ZN5jf
 h0GP0vszSEOQs5QU7IgKI9RV9TbQcW+5B8QXqcM1RsyfO0QPbmrgcCSPZISCm6hFj/
 2v2wq1i3rvdLgAKJmj363sNwH2HGlgTyZSz4T4/Xn4S6hkKfPTGNRYHN7AneFThjF4
 VwdKb987hAIy+l7TZe2sfbhu6UY8CsqFIqSbmW5s1O1LkIHaMc/Nbo/aSLC71E4yeU
 hBM6ZmuCiuIoA==
Message-ID: <5139492a-945c-408b-9ccf-e88800f1afb4@kernel.org>
Date: Mon, 12 Jan 2026 15:53:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: liujinbao1 <jinbaoliu365@gmail.com>, jaegeuk@kernel.org
References: <20260112061100.702501-1-jinbaoliu365@gmail.com>
Content-Language: en-US
In-Reply-To: <20260112061100.702501-1-jinbaoliu365@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jinbao, On 1/12/2026 2:11 PM,
 liujinbao1 wrote: > From: liujinbao1
 <liujinbao1@xiaomi.com> > > During SPO tests, when mounting F2FS, an -EINVAL
 error was returned. > The issue originates from the f2fs_recover [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfCk7-0003eN-Lm
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs-tools: Check and clear invalid
 dent flag flags during recovery
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

Jinbao,

On 1/12/2026 2:11 PM, liujinbao1 wrote:
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
> v2:
> - Clear the node_blk dent flag, proceed with recovery
> of this and subsequent data.
> ---
> v1:
> - Clear the node_blk fsync flag, set next_blkaddr=NULL,
> skip recovery of this and later data.
> ---
>   fsck/mount.c | 21 ++++++++++++++++++++-
>   fsck/node.h  | 13 +++++++++++++
>   2 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 6f640a0..8254644 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -3878,6 +3878,7 @@ int f2fs_find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
>   
>   	while (1) {
>   		struct fsync_inode_entry *entry;
> +		struct f2fs_nat_entry nat_entry;
>   
>   		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
>   			break;
> @@ -3902,8 +3903,26 @@ int f2fs_find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
>   		}
>   		entry->blkaddr = blkaddr;
>   
> -		if (IS_INODE(node_blk) && is_dent_dnode(node_blk))
> +		if (IS_INODE(node_blk) && is_dent_dnode(node_blk)) {
> +			get_nat_entry(sbi, ino_of_node(node_blk), &nat_entry);
> +			if (is_valid_data_blkaddr(nat_entry.block_addr)) {
> +				ASSERT_MSG("Invalid dent flag: blkaddr = %#x, "
> +					"ino: %u, is_dent:%d, nat entry blkaddr is %#X\n",
> +					blkaddr, ino_of_node(node_blk), is_dent_dnode(node_blk),
> +					nat_entry.block_addr);
> +				if (c.fix_on && f2fs_dev_is_writable()) {
> +					int ret = 0;

int ret;

No need to initialize ret variable.

BTW, can you please use inject.f2fs to simulate such inconsistent image,
and use the image to test this fix? it will be better to include the
testcase and result in commit message. What do you think?

Thanks,

> +
> +					FIX_MSG("Clear dent flag: blkaddr:%#x, ino: %u\n",
> +						blkaddr, ino_of_node(node_blk));
> +					set_dentry_mark(node_blk, 0);
> +					ret = update_inode(sbi, node_blk, blkaddr);
> +					ASSERT(ret >= 0);
> +					goto next;
> +				}
> +			}
>   			entry->last_dentry = blkaddr;
> +		}
>   next:
>   		blkaddr = next_blkaddr_of_node(node_blk);
>   
> diff --git a/fsck/node.h b/fsck/node.h
> index 19f1e57..f3e2c46 100644
> --- a/fsck/node.h
> +++ b/fsck/node.h
> @@ -173,6 +173,19 @@ static inline void set_cold_node(struct f2fs_node *rn, bool is_dir)
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
> +
>   #define is_fsync_dnode(node_blk)	is_node(node_blk, FSYNC_BIT_SHIFT)
>   #define is_dent_dnode(node_blk)		is_node(node_blk, DENT_BIT_SHIFT)
>   



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

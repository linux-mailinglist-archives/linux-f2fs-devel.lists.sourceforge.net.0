Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D5D1FFFAD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2020 03:31:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jm5sa-0004Ml-LV; Fri, 19 Jun 2020 01:31:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jm5sY-0004Md-Sq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 01:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZZzh69KjhGpYzM+NgJ/3zPxEu5Ui9LH1X9wE3avWkJ8=; b=br6CCFbNGYQpBmbGLA3NYWJd11
 faHa4Fb2lPMJKdJ2Q01TZiSwyuP7VTkNAWgiAYZ84lyniIn4+JVYNLD4GY+0Vlf1CLeyJepqXF3xY
 cmpPrxr8FXredAbIxFZPlRrVT3RvNXcJ6JJvtptGg5KQY9OTG3RZyG/UG53k0SylxMlg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZZzh69KjhGpYzM+NgJ/3zPxEu5Ui9LH1X9wE3avWkJ8=; b=TppA923rRrpPSF0e3qNuW4SI2S
 taQJpAT4OliaM0DH0XKeIodhk5BDfx2+oQDEoz4H0jBs+MG2e6sA+D/wa+SHRSrGgvz5dIWZ0+Doh
 mo5xZdF4zgszuGU7PbBrk3KW62DUu0JcAcB1GBMypjAtwF0K2YoBYqoFKJoIFnXCf3FM=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jm5sW-009Mul-3N
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 01:31:38 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 62E488DA3105F60DEED1;
 Fri, 19 Jun 2020 09:31:27 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 19 Jun
 2020 09:31:23 +0800
To: <zhaowuyun@wingtech.com>, <jaegeuk@kernel.org>
References: <1592484487-12072-1-git-send-email-zhaowuyun@wingtech.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4a2d19c4-1ede-0172-fe50-c8464ee341df@huawei.com>
Date: Fri, 19 Jun 2020 09:31:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1592484487-12072-1-git-send-email-zhaowuyun@wingtech.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wingtech.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jm5sW-009Mul-3N
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: set cold flag for non-dir node
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/18 20:48, zhaowuyun@wingtech.com wrote:
> From: Wuyun Zhao <zhaowuyun@wingtech.com>

Thanks for the patch. :)

Please add commit message here.

> 
> Signed-off-by: Wuyun Zhao <zhaowuyun@wingtech.com>
> ---
>  fsck/dir.c  |  1 +
>  fsck/node.c |  1 +
>  fsck/node.h | 11 +++++++++++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/fsck/dir.c b/fsck/dir.c
> index 5f4f75e..dc03c98 100644
> --- a/fsck/dir.c
> +++ b/fsck/dir.c
> @@ -522,6 +522,7 @@ static void init_inode_block(struct f2fs_sb_info *sbi,
>  	node_blk->footer.nid = cpu_to_le32(de->ino);
>  	node_blk->footer.flag = 0;
>  	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
> +	set_cold_node(node_blk, S_ISDIR(mode));
>  
>  	if (S_ISDIR(mode)) {
>  		make_empty_dir(sbi, node_blk);
> diff --git a/fsck/node.c b/fsck/node.c
> index 229a99c..1d291ca 100644
> --- a/fsck/node.c
> +++ b/fsck/node.c
> @@ -79,6 +79,7 @@ block_t new_node_block(struct f2fs_sb_info *sbi,
>  	node_blk->footer.ino = f2fs_inode->footer.ino;
>  	node_blk->footer.flag = cpu_to_le32(ofs << OFFSET_BIT_SHIFT);
>  	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
> +	set_cold_node(node_blk, S_ISDIR(le16_to_cpu(f2fs_inode->i.i_mode)));

How about wrapping these node footer fields assignment into a function? then
we can reuse this in other places.

void set_node_footer(nid, ino, ofs, ver, is_dir)
{
	node_blk->footer.nid = cpu_to_le32(nid);
	node_blk->footer.ino = f2fs_inode->footer.ino;
	node_blk->footer.flag = cpu_to_le32(ofs << OFFSET_BIT_SHIFT);
	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
	set_cold_node(node_blk, S_ISDIR(le16_to_cpu(f2fs_inode->i.i_mode)));
}

>  
>  	type = CURSEG_COLD_NODE;
>  	if (IS_DNODE(node_blk)) {
> diff --git a/fsck/node.h b/fsck/node.h
> index 6bce1fb..99139b1 100644
> --- a/fsck/node.h
> +++ b/fsck/node.h
> @@ -161,6 +161,17 @@ static inline int is_node(struct f2fs_node *node_blk, int type)
>  	return le32_to_cpu(node_blk->footer.flag) & (1 << type);
>  }

Beside this, I think we need to use set_node_footer() in:
- f2fs_write_root_inode
- f2fs_write_qf_inode
- f2fs_write_lpf_inode

as well to fix mkfs bugs.

Thanks,

>  
> +static inline void set_cold_node(struct f2fs_node *rn, bool is_dir)
> +{
> +	unsigned int flag = le32_to_cpu(rn->footer.flag);
> +
> +	if (is_dir)
> +		flag &= ~(0x1 << COLD_BIT_SHIFT);
> +	else
> +		flag |= (0x1 << COLD_BIT_SHIFT);
> +	rn->footer.flag = cpu_to_le32(flag);
> +}
> +
>  #define is_fsync_dnode(node_blk)	is_node(node_blk, FSYNC_BIT_SHIFT)
>  #define is_dent_dnode(node_blk)		is_node(node_blk, DENT_BIT_SHIFT)
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

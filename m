Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE327AD8457
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 09:39:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=croqGLN7qqq4HM/JzartIE3IAiNqtC3gwRrfBej4Q8c=; b=LATaEU58i+yAoWtGO7Cue31EMH
	0kWeKIE2jdQZYVGPt1A26xoWbcZyeiqzjXqHA+xY1hslCmejyRJLQLn5yKLoKj9pAwKa56XeqEa8t
	9dNnpxntrxLIR5tnPIh6gKO4Bu0xivxK/dIjZNSu+9GJLKvSK1NBvrocBSk/7xw5Q1Vo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPz0I-0002Bn-EK;
	Fri, 13 Jun 2025 07:39:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uPz05-0002BQ-6a
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 07:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UpnIBGd7N8ws0ZVKzktB4RCeYxAzbnk0WAtbu3bKlWM=; b=OP1jizF3ZgTJmPCkSSMpByR89C
 3xmEiTxORvT4du5iMD3pVD9z10UZ4YCQEeIUdbj6iP4Gb0O0Hi8rNuDm4Mnb/jKPPWUFVpmqftnPF
 WpH1lQn2DKD98pBkfAsTO/9075Tiddok8u3G903DZ7VOwsIsGYWWQ6tBHJnuvf38wIWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UpnIBGd7N8ws0ZVKzktB4RCeYxAzbnk0WAtbu3bKlWM=; b=VW9EfF2qFwIPfVpv3PW/2a9O/w
 PDh1K7dEqn7nJUXsTi0t3spbm5m4A2CbAFPAFu/ucXVDT2+JisxRFbi0P2EGva6dVAtcLTa6Sckrn
 jNKvPY7Q58qCQ/magmhIV4L+Yxb6pIHy496VGIhM5k1dSo+zbhbXsk4jgBnfVgwtWy1Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPz04-00079G-LI for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 07:38:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A07655C6127;
 Fri, 13 Jun 2025 07:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF08C4CEE3;
 Fri, 13 Jun 2025 07:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749800326;
 bh=rV47fdIw6rjE/QWWPsTVyBQJUclxb7NinwThhpGEuEA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=YTCl0FcVdvnHGJ/wv7XebatA2vJIr1U40y/KJ3iBgE/2b2xBaXSf6bEK5fS9yRcE7
 IjKBVgt0/LoS9zJhRK09HQsHFURDSsHuzNEp2V6lR/QUv5zoFDv5xLltjx3LcemByj
 MUNuch8tqd3wqcg8wQzLArRf8EpeauVsfYciyd+mjSUuL27qTJXaziGYW4X6eedAp1
 upt/zYzQTZeRVzjE/CaqLtcE7YPSxbDBID95fcZGNDY/Bg1vPEVeBtdDAzp35EfXLm
 xYqSqzeVmMAeubMdhmvJYgit2padCm/NJHpWtbWkwPIdi5R1XpqgV7eBAaLZnWyA/+
 LSbEqLq5+YBlw==
Message-ID: <025216b1-f33a-4851-aea3-669890bea056@kernel.org>
Date: Fri, 13 Jun 2025 15:38:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong2021@gmail.com>, jaegeuk@kernel.org
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
 <20250610123743.667183-13-shengyong1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250610123743.667183-13-shengyong1@xiaomi.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/10 20:37,
 Sheng Yong wrote: > From: Sheng Yong <shengyong1@xiaomi.com>
 > > This patch adds new members in inject_node to inject inode: > *
 i_ext.fofs: extent fofs > * i_ext.blk_addr: extent [...] 
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
X-Headers-End: 1uPz04-00079G-LI
Subject: Re: [f2fs-dev] [RFC PATCH v2 12/32] inject.f2fs: add members in
 inject_node
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
> This patch adds new members in inject_node to inject inode:
>   * i_ext.fofs: extent fofs
>   * i_ext.blk_addr: extent blk_addr
>   * i_ext.len: extent len
>   * i_inline_xattr_size: inline xattr size
>   * i_compr_blocks: compression blocks
> 
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> ---
>   fsck/inject.c     | 28 ++++++++++++++++++++++++++++
>   man/inject.f2fs.8 | 17 ++++++++++++++++-
>   2 files changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/fsck/inject.c b/fsck/inject.c
> index 0b5aecbf8061..8c2f8c5dc332 100644
> --- a/fsck/inject.c
> +++ b/fsck/inject.c
> @@ -198,8 +198,13 @@ static void inject_node_usage(void)
>   	MSG(0, "  i_links: inject inode i_links\n");
>   	MSG(0, "  i_size: inject inode i_size\n");
>   	MSG(0, "  i_blocks: inject inode i_blocks\n");
> +	MSG(0, "  i_ext.fofs: inject inode i_ext.fofs\n");
> +	MSG(0, "  i_ext.blk_addr: inject inode i_ext.blk_addr\n");
> +	MSG(0, "  i_ext.len: inject inode i_ext.len\n");
>   	MSG(0, "  i_extra_isize: inject inode i_extra_isize\n");
> +	MSG(0, "  i_inline_xattr_size: inject inode i_inline_xattr_size\n");
>   	MSG(0, "  i_inode_checksum: inject inode i_inode_checksum\n");
> +	MSG(0, "  i_compr_blocks: inject inode i_compr_blocks\n");
>   	MSG(0, "  i_addr: inject inode i_addr array selected by --idx <index>\n");
>   	MSG(0, "  i_nid: inject inode i_nid array selected by --idx <index>\n");
>   	MSG(0, "  addr: inject {in}direct node nid/addr array selected by --idx <index>\n");
> @@ -967,16 +972,39 @@ static int inject_inode(struct f2fs_sb_info *sbi, struct f2fs_node *node,
>   		MSG(0, "Info: inject inode i_blocks of nid %u: %"PRIu64" -> %"PRIu64"\n",
>   		    opt->nid, le64_to_cpu(inode->i_blocks), (u64)opt->val);
>   		inode->i_blocks = cpu_to_le64((u64)opt->val);
> +	} else if (!strcmp(opt->mb, "i_ext.fofs")) {
> +		MSG(0, "Info: inject inode i_ext.fofs of nid %u: %u -> %u\n",
> +		    opt->nid, le32_to_cpu(inode->i_ext.fofs), (u32)opt->val);
> +		inode->i_ext.fofs = cpu_to_le32((u32)opt->val);
> +	} else if (!strcmp(opt->mb, "i_ext.blk_addr")) {
> +		MSG(0, "Info: inject inode i_ext.blk_addr of nid %u: "
> +		    "0x%x -> 0x%x\n", opt->nid,
> +		    le32_to_cpu(inode->i_ext.blk_addr), (u32)opt->val);
> +		inode->i_ext.blk_addr = cpu_to_le32((u32)opt->val);
> +	} else if (!strcmp(opt->mb, "i_ext.len")) {
> +		MSG(0, "Info: inject inode i_ext.len of nid %u: %u -> %u\n",
> +		    opt->nid, le32_to_cpu(inode->i_ext.len), (u32)opt->val);
> +		inode->i_ext.len = cpu_to_le32((u32)opt->val);
>   	} else if (!strcmp(opt->mb, "i_extra_isize")) {
>   		/* do not care if F2FS_EXTRA_ATTR is enabled */
>   		MSG(0, "Info: inject inode i_extra_isize of nid %u: %d -> %d\n",
>   		    opt->nid, le16_to_cpu(inode->i_extra_isize), (u16)opt->val);
>   		inode->i_extra_isize = cpu_to_le16((u16)opt->val);
> +	} else if (!strcmp(opt->mb, "i_inline_xattr_size")) {
> +		MSG(0, "Info: inject inode i_inline_xattr_size of nid %u: "
> +		    "%d -> %d\n", opt->nid,
> +		    le16_to_cpu(inode->i_inline_xattr_size), (u16)opt->val);
> +		inode->i_inline_xattr_size = cpu_to_le16((u16)opt->val);
>   	} else if (!strcmp(opt->mb, "i_inode_checksum")) {
>   		MSG(0, "Info: inject inode i_inode_checksum of nid %u: "
>   		    "0x%x -> 0x%x\n", opt->nid,
>   		    le32_to_cpu(inode->i_inode_checksum), (u32)opt->val);
>   		inode->i_inode_checksum = cpu_to_le32((u32)opt->val);
> +	} else if (!strcmp(opt->mb, "i_compr_blocks")) {
> +		MSG(0, "Info: inject inode i_compr_blocks of nid %u: "
> +		    "%lu -> %lu\n", opt->nid,

%llu -> %llu

> +		    le64_to_cpu(inode->i_compr_blocks), (u64)opt->val);
> +		inode->i_compr_blocks = cpu_to_le64((u64)opt->val);
>   	} else if (!strcmp(opt->mb, "i_addr")) {
>   		/* do not care if it is inline data */
>   		if (opt->idx >= DEF_ADDRS_PER_INODE) {
> diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
> index 5ae556015a79..72d1c90f7ce4 100644
> --- a/man/inject.f2fs.8
> +++ b/man/inject.f2fs.8
> @@ -145,7 +145,7 @@ summary entry ofs_in_node.
>   .RE
>   .TP
>   .BI \-\-node
> -Inject node block specified by \fInid\P.
> +Inject node block specified by \fInid\fP.
>   The available \fImb\fP of \fInode\fP are:
>   .RS 1.2i
>   .TP
> @@ -182,12 +182,27 @@ inode i_size.
>   .BI i_blocks
>   inode i_blocks.
>   .TP
> +.BI i_ext.fofs
> +inode i_ext.fofs.
> +.TP
> +.BI i_ext.blk_addr
> +inode i_ext.blk_addr.
> +.TP
> +.BI i_ext.len
> +inode i_ext.len.
> +.TP
>   .BI i_extra_isize
>   inode i_extra_isize.
>   .TP
> +.BI i_inline_xattr_size
> +inode i_inline_xattr_size.
> +.TP
>   .BI i_inode_checksum
>   inode i_inode_checksum.
>   .TP
> +.BI i_compr_blocks
> +inode i_compr_blocks.
> +.TP
>   .BI i_addr
>   inode i_addr array specified by \fIidx\fP.
>   .TP



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

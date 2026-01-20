Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF59D3BDC4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 04:00:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOv7uzAlCJvnjKjS1PfcSTk8fz+iEkxWqtIYi0BdnZg=; b=ljnUyrU/MSCo6NloRLHR+Krqj7
	NYglFIaCS3NA7g1NIGEXW2iDvAYVL80b7nMSocGI9G2WTNLE0z7KLQBTGRb9ciP4IYmyd0zblizTj
	PXLoA40NV+OfMZwbYosiDjNV8x6nVMUMPFxwit171L4ND6IXFPhD3KPWPSolKtN5O2Ro=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vi1yT-0000hZ-Dl;
	Tue, 20 Jan 2026 03:00:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinbaoliu365@gmail.com>) id 1vi1yR-0000hS-Gs
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 03:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uyj9SFuvt/mvf1ATbSMxddoQHs6XTB8n2y8Ht75tEdQ=; b=MdancDOzu7hpM465s2R6gRjLq5
 60LQCnMOy+YKWHLh3xlLBrSZNTC/FEzAEVnBy4+9x6iRoDIUStEH41SNuxUVAA/0e5NJyISY/LInd
 ezK1d6kGMvLW07bvKNnOJs4UP/kPgjHppEdfpBhcC44RqWMITOIN0nZq118PJh7bSkOo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uyj9SFuvt/mvf1ATbSMxddoQHs6XTB8n2y8Ht75tEdQ=; b=X5cPrTJKrvHra6tR8vkQBZlTvr
 vB7wMNURK1QmOUsnjDjvbutidSEN1k92pceZ62qZQx/ThcFt5HWElKZXpiwf0rVec+BxVnhyjSKgX
 oZtl2oEsXTnRYrLyI2+QVPTLY6uNH+I5pCzyG0Z47ZJae1n7mh6NfNQH6bGu13m+gGcs=;
Received: from mail-pg1-f177.google.com ([209.85.215.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vi1yQ-0002a7-Tt for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 03:00:07 +0000
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-ba599137cf8so1767648a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Jan 2026 19:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768877996; x=1769482796; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uyj9SFuvt/mvf1ATbSMxddoQHs6XTB8n2y8Ht75tEdQ=;
 b=L73vWPoEimsIHKoR/VciLuJBqioUO+WBWUTdHfr1y0Wy0qfvwOxMriAUAeOt42Mp0M
 cH7k/xpW/9K0OWy0sPFyaeGvwrsfwQmP+et9NE0jQNpHhF2cs2lMsVlpGCAK5JDHIR0N
 9v70JRdOzZ2bIX9PkyAENJwU/GOxeKp3v+rQH3hpNrp7SXpQEupdSetGmc0nmeCJBB63
 huqcOmM3UT2O8ez0UKChh7mIcBHlSRO8Zqk9Hqi5Z4ZkWRrTPw7LGVA2gXWc0OTkR3jF
 pQSr3MAIVsIU9N5QPir5jJBSIMyfBSKtDxq4RqBVg/TOYEYHzEDmt8ca5bCRPIPKQwx6
 AOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768877996; x=1769482796;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uyj9SFuvt/mvf1ATbSMxddoQHs6XTB8n2y8Ht75tEdQ=;
 b=Qv8Xjg2RNk51HC6+g6dNwOkcm8/Kjd1m4YyiMA6ADpyAs7x4GifqgyDTfjvE0fPTPR
 n08z+QONx8YAGBatOtMYTmzjAqqjlFSxlP99r9cU7rsN1f1t6jts83xMEfEg0tR532sj
 HBNCbC03tBDDwNTpimgvignOPW7Wo6ysS6PeKN3ea4BNXpOWscjr1eBoJmKZ89CiHH1u
 GsYxNweUlkbvCZwV3HHnhAuYczslOslmPfyN3koijBqTn9uU+WBptwU0E44Hbri9FGUs
 xKTDDFU0+0D3dCOSx6eY0Yu3mSH+eBzhIBdttq75h6PW3V0JGn1rHpkxWr1lsyS3x0jo
 5N5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx/BSi/rtiEz1vCVE5Ngx8Fx5HgV3liaKSwxjg/WOU3OkwPaSJh2G17nF/meotBZlUXrXs7t20vnoyGsyVOMKc@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzCD/MMRzc9sNmFQeiOUfaPH59i3stXDoRR96h7QC4TndzP2d4j
 5jWe2Azf/VWNyz/eFRN5y+8pIMHJxyoxxfTwv5JN4re/OwaHfAprqxqJ
X-Gm-Gg: AY/fxX5KyUHQOJ2+NjiTq9wxG+A7+58g2qtbbBa1LOl7ODAkvFNn/n9tU1oZpb2Wcy9
 KuQqUxfWOdia8P/xRUBvIqjfpjLZdNAvMMG/chnIvgunR4w549i024z8JA9mYwfzmt5jOoQYy+/
 yW/7H8s6x26hRGMmCFCYMbnPWhqtAdpWL5gKvrzo+FMDXfZLbRXAux+uhc3v8KevnQat8obqXkt
 iPYOf/iGNn+487K3gQaFh/Yk//e4TwHxnOhK0My+qJuv6MraFcvwxk6gGIrTnYNOsbSCszTaOcH
 zX1r10eXTE1YG3/arU2d0mZ2VNYNdXjrf/ZmdJPoIi4f55TddswDzLQ+gPs3SCOnlHuDIWBXHKS
 J11h0P+jRDSl1mf1eSpMJ1jGVnrHVm22tf8aTKA7TJeG7ZI2vxJ25WttQJS/cJGyCt5fzELiLXS
 SXXUHaBFnelJOAbvPuTHJwlC1ULmt0v+Ta0YumVE26aYIuVtTY2tmdKX4=
X-Received: by 2002:a05:6a21:6d9f:b0:2b9:6b0b:66be with SMTP id
 adf61e73a8af0-38dff2996bcmr12939206637.14.1768877996055; 
 Mon, 19 Jan 2026 18:59:56 -0800 (PST)
Received: from ?IPV6:2408:8607:1b00:8:8eec:4bff:fe94:a95d?
 ([2408:8607:1b00:8:8eec:4bff:fe94:a95d])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-352678af047sm12888805a91.10.2026.01.19.18.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 18:59:55 -0800 (PST)
Message-ID: <9ad2f6f9-476a-4f6a-ae55-e5b8c024afb3@gmail.com>
Date: Tue, 20 Jan 2026 10:59:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jaegeuk@kernel.org
References: <20260114083705.944024-1-jinbaoliu365@gmail.com>
Content-Language: en-US
From: liujinbao <jinbaoliu365@gmail.com>
In-Reply-To: <20260114083705.944024-1-jinbaoliu365@gmail.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  ping On 2026/1/14 16:37, liujinbao1 wrote: > From: liujinbao1
 > > During SPO tests, when mounting F2FS, an -EINVAL error was returned.
 > The issue originates from the f2fs_recover_inode_page function's > [...]
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [jinbaoliu365(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [jinbaoliu365(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.177 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vi1yQ-0002a7-Tt
Subject: Re: [f2fs-dev] [PATCH v3] fsck.f2fs: Check and clear invalid dent
 flag during recovery
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, Sheng Yong <shengyong1@xiaomi.com>,
 liujinbao1 <liujinbao1@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

ping

On 2026/1/14 16:37, liujinbao1 wrote:
> From: liujinbao1 <liujinbao1@xiaomi.com>
>
> During SPO tests, when mounting F2FS, an -EINVAL error was returned.
> The issue originates from the f2fs_recover_inode_page function's
> check, where old_ni.blk_addr != NULL_ADDR under the conditions of
> IS_INODE(folio) && is_dent_dnode(folio).
> Clear dent flag of the node block to fix this issue.
> Test Step:
> 1.Modify files and induce SPO to generate fsync inode list.
>   blkaddr: 0x15828, ino: 1378, is_inode: 1, is_fsync: 2, is_dent: 0
>
> 2.Use inject.f2fs to set dent flag for a fsync inode.
>   inject.f2fs --cp 0 --mb flag --idx 2 --val 7 /dev/vda
>   Info: inject blkaddr[2] flag of cp 2: 0x3 -> 0x7
>
> 3.Boot verification, System fails to mount during recovery:
>   f2fs_recover_inode_page:ino: 1378, ni.blkaddr: 0x1581a,
>   old_ni.blk_addr != NULL_ADDR
>   F2FS-fs (vda): Cannot recover all fsync data errno=-22
> 4.Run fsck
>   fsck.f2fs -f /dev/vda
>   [ASSERT] (f2fs_find_fsync_inode:3924) --> Invalid dent flag:
>   blkaddr: 0x15828, ino: 1378, is_dent: 4, nat entry blkaddr: 0x1581a
>   [FIX] (f2fs_find_fsync_inode:3931) --> Clear dent flag: blkaddr: 0x15828, ino: 1378
> After this fix, the system boots normally.
>
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> Signed-off-by: Jinbao Liu <liujinbao1@xiaomi.com>
> ---
> v3:
> - Add test steps to verify the effect.
> ---
> v2:
> - Clear the node_blk dent flag, proceed with recovery
> of this and subsequent data.
> ---
> v1:
> - Clear the node_blk fsync flag, set next_blkaddr=NULL,
> skip recovery of this and later data.
> ---
>   fsck/mount.c | 19 ++++++++++++++++++-
>   fsck/node.h  | 13 +++++++++++++
>   2 files changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 6f640a0..3385489 100644
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
> @@ -3902,8 +3903,24 @@ int f2fs_find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
>   		}
>   		entry->blkaddr = blkaddr;
>   
> -		if (IS_INODE(node_blk) && is_dent_dnode(node_blk))
> +		if (IS_INODE(node_blk) && is_dent_dnode(node_blk)) {
> +			get_nat_entry(sbi, ino_of_node(node_blk), &nat_entry);
> +			if (is_valid_data_blkaddr(nat_entry.block_addr)) {
> +				ASSERT_MSG("Invalid dent flag: blkaddr: 0x%x, "
> +					"ino: %u, is_dent: %d, nat entry blkaddr: 0x%x\n",
> +					blkaddr, ino_of_node(node_blk), is_dent_dnode(node_blk),
> +					nat_entry.block_addr);
> +				if (c.fix_on && f2fs_dev_is_writable()) {
> +					FIX_MSG("Clear dent flag: blkaddr: 0x%x, ino: %u\n",
> +						blkaddr, ino_of_node(node_blk));
> +					set_dentry_mark(node_blk, 0);
> +					err = update_inode(sbi, node_blk, &blkaddr);
> +					ASSERT(err >= 0);
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

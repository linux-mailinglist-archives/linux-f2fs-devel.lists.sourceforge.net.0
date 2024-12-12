Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C35D9EE981
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Dec 2024 16:00:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tLkff-0004YJ-NZ;
	Thu, 12 Dec 2024 15:00:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tLkfY-0004XO-Hj
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Dec 2024 15:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YlSUfr5EAJrkio1B/y9EcVPvi1WLg2N4PwB7A/6KKpA=; b=LiqlNLhP5Whxt0M+UnL/ki6Pxy
 yEu/73OVC9P2heUiiGcyYaZWhhVEDTwNQODepb+FePe7e3hdTRm9E9WkqqH1RUQVy89wI7/IAP9g5
 vySLEZaMKNn/CLIZMj0aCqaNW6aOSelD1z5xxU8o6LAFCifLaDde0N2rWY3lzaJuuhig=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YlSUfr5EAJrkio1B/y9EcVPvi1WLg2N4PwB7A/6KKpA=; b=h0hrXUxUkFYX2qgcuZJnFtN3km
 C0ubP3niQkYipDynmtcLxnSHQLbGY8p3sXtB3aqjRtCh6WhS/6mBjLl+cgrWbsZOZ4TLE4fNqwTcI
 h+hcgAOGUgxhrLlDuJaEOr9ddXRMQfU6DtL9dTu9bMvS7drc/OFzIEg25gNFAgkZt/30=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tLkfX-0000GS-SN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Dec 2024 15:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 248C35C6323;
 Thu, 12 Dec 2024 14:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3CCC4CECE;
 Thu, 12 Dec 2024 14:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734015594;
 bh=gj63/lgmCJ83d/T+E2tbXLD8bA62WmiZhc4ojJVHIcQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=FVmUShXCl+1y4S7nYzHEA7dvN5ruEiA4tVA2RhmV9eriGPExbKDK8ATHcJHp9nl9W
 vr+P3+b9yj5wdHJZhcaprWP5CpR9s7g/IaA7jFQP41BSM8z5bBOmk3n26fnQ3Pk0K4
 qKykMIFqcKHdd/btnhJTr5gUX9d/Z+DT3CTe1fwB4gWvDL1BowfFk19lMxH1YW2O7b
 TM2jcB8OyR3CvhvszSHOda1e+gCBD4m9VO6kImg8cIaTbvXyB+dkeTBlnb3VQxjNEK
 zRFH9Hdandj1ag8CR+NgrsSktLBxOnRmd8F9yeQ6c/k6dI9X2nRvJ4KRjscMVLKT9G
 RwuGX7Ex2blAg==
Message-ID: <ec2729cc-2846-49c2-b7ca-4c1efe004cd1@kernel.org>
Date: Thu, 12 Dec 2024 22:59:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Antipov <dmantipov@yandex.ru>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20241204060934.697070-1-dmantipov@yandex.ru>
Content-Language: en-US
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <20241204060934.697070-1-dmantipov@yandex.ru>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/12/4 14:09,
 Dmitry Antipov wrote: > Syzbot has reported
 the following KMSAN splat: > > BUG: KMSAN: uninit-value in
 f2fs_new_node_page+0x1494/0x1630
 > f2fs_new_node_page+0x1494/0x1630 > f2fs_ne [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tLkfX-0000GS-SN
Subject: Re: [f2fs-dev] [PATCH] f2fs: ensure that node info flags are always
 initialized
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
Cc: linux-fsdevel@vger.kernel.org,
 syzbot+5141f6db57a2f7614352@syzkaller.appspotmail.com,
 lvc-project@linuxtesting.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/12/4 14:09, Dmitry Antipov wrote:
> Syzbot has reported the following KMSAN splat:
> 
> BUG: KMSAN: uninit-value in f2fs_new_node_page+0x1494/0x1630
>   f2fs_new_node_page+0x1494/0x1630
>   f2fs_new_inode_page+0xb9/0x100
>   f2fs_init_inode_metadata+0x176/0x1e90
>   f2fs_add_inline_entry+0x723/0xc90
>   f2fs_do_add_link+0x48f/0xa70
>   f2fs_symlink+0x6af/0xfc0
>   vfs_symlink+0x1f1/0x470
>   do_symlinkat+0x471/0xbc0
>   __x64_sys_symlink+0xcf/0x140
>   x64_sys_call+0x2fcc/0x3d90
>   do_syscall_64+0xd9/0x1b0
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Local variable new_ni created at:
>   f2fs_new_node_page+0x9d/0x1630
>   f2fs_new_inode_page+0xb9/0x100
> 
> So adjust 'f2fs_new_node_page()' to ensure that 'flag' field of on-stack
> 'struct node_info' is always zeroed just like if it was allocated within
> 'struct nat_entry' via 'f2fs_kmem_cache_alloc(..., GFP_F2FS_ZERO, ...)'
> in '__alloc_nat_entry()'.
> 
> Reported-by: syzbot+5141f6db57a2f7614352@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=5141f6db57a2f7614352
> Fixes: e05df3b115e7 ("f2fs: add node operations")
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>   fs/f2fs/node.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 0b900a7a48e5..5103cc0d95c4 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1314,7 +1314,7 @@ struct page *f2fs_new_inode_page(struct inode *inode)
>   struct page *f2fs_new_node_page(struct dnode_of_data *dn, unsigned int ofs)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
> -	struct node_info new_ni;
> +	struct node_info new_ni = { .flag = 0 };

We can initialize new_ni.flag in f2fs_get_node_info() to cover
all similar cases?

Thanks,

>   	struct page *page;
>   	int err;
>   



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

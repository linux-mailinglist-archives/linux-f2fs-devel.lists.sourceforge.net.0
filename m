Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56378D7011
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2019 09:22:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iKHA6-0004ny-AJ; Tue, 15 Oct 2019 07:22:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iKHA5-0004nj-1Y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 07:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lLqQWojud1hhDZlPwdTMpqtuSuyLuHNRK5rXScU73Jk=; b=ZNShPzJfOYU4Y3RjN4/fE3p6mT
 z9xo5uMNqOCPdHaWEokP9yfgiPsmX0Os2k6ClBEMnnJ2/PRuEKPcZfyu7iJiYP9nqyWdlPjdefhy0
 hDSloyyXMNohrPILRKErlM9jjkOc73uD1NK8TT/i1a66f6+vE6c7e7rBQEJFiAP5dLxA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lLqQWojud1hhDZlPwdTMpqtuSuyLuHNRK5rXScU73Jk=; b=DA0twIE/80siJyXXKVsmeFWh65
 SGt20mk5U22reTI0wkSJRcyBmiQktDWOvwaeCU6HoOFnwqIr2DSbEl4hYKBPhsBF7RFKyzztpsgzh
 CPpn2Orytur4S+LNqpYct+YA7ALU/5Hu4PpOWOCG7aJOHraLl0zLSao2GOjE7Tir8UDk=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iKHA0-001fcs-RU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 07:22:28 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9F6AA85273C0512E6435;
 Tue, 15 Oct 2019 15:22:17 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 15 Oct
 2019 15:22:14 +0800
To: Randall Huang <huangrandall@google.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
References: <20191009032019.6954-1-huangrandall@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <efddfbc3-bd31-b9fb-48de-decb01d01001@huawei.com>
Date: Tue, 15 Oct 2019 15:22:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191009032019.6954-1-huangrandall@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iKHA0-001fcs-RU
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid memory leakage in
 f2fs_listxattr
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Randall,

On 2019/10/9 11:20, Randall Huang wrote:
> In f2fs_listxattr, there is no boundary check before
> memcpy e_name to buffer.
> If the e_name_len is corrupted,
> unexpected memory contents may be returned to the buffer.
> 
> Signed-off-by: Randall Huang <huangrandall@google.com>
> ---
>  fs/f2fs/xattr.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> index b32c45621679..acc3663970cd 100644
> --- a/fs/f2fs/xattr.c
> +++ b/fs/f2fs/xattr.c
> @@ -538,8 +538,9 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
>  ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
>  {
>  	struct inode *inode = d_inode(dentry);
> +	nid_t xnid = F2FS_I(inode)->i_xattr_nid;
>  	struct f2fs_xattr_entry *entry;
> -	void *base_addr;
> +	void *base_addr, *last_base_addr;
>  	int error = 0;
>  	size_t rest = buffer_size;
>  
> @@ -549,6 +550,8 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
>  	if (error)
>  		return error;
>  
> +	last_base_addr = (void *)base_addr + XATTR_SIZE(xnid, inode);
> +
>  	list_for_each_xattr(entry, base_addr) {
>  		const struct xattr_handler *handler =
>  			f2fs_xattr_handler(entry->e_name_index);
> @@ -559,6 +562,15 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
>  		if (!handler || (handler->list && !handler->list(dentry)))
>  			continue;
>  
> +		if ((void *)(entry) + sizeof(__u32) > last_base_addr ||
> +			(void *)XATTR_NEXT_ENTRY(entry) > last_base_addr) {
> +			f2fs_err(F2FS_I_SB(inode), "inode (%lu) has corrupted xattr",
> +						inode->i_ino);
> +			set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> +			error = -EFSCORRUPTED;
> +			goto cleanup;
> +		}

Could you relocate sanity check to the place before we check handler? As I'm
thinking we should always check validation of current entry before using its
field (entry->index).

Thanks,

> +
>  		prefix = xattr_prefix(handler);
>  		prefix_len = strlen(prefix);
>  		size = prefix_len + entry->e_name_len + 1;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EB4ADE091
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Jun 2025 03:18:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0encz8XUnf+f22Uc3X+kX1bDfjXQYiqndUJPRPZl6o=; b=TRaz4/xbTzQ0l+jFZ6GtWWcbaL
	YSWeY2LIxOBSDY2waGRLFYBeNfd5fbTjQr5WqCbcV1fr3tgFUtkUe1AYgCayNEyjFvl5JWfQjLWXw
	SmOr6DtHKCEdgBqvyMzTyO1OddHOTWsKFNmPMUVRpFRDud49fbpTFNJdg9pkxMwmya3Q=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRhRL-0006zW-F6;
	Wed, 18 Jun 2025 01:18:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uRhRK-0006zN-A3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Jun 2025 01:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oivfvuFpSof7V2JHY5dYM3FHV+vS0yRXVZLn+vhja3w=; b=QuAyJMTwY9aHEhkWvIRURxAHm/
 qlGUqVkPZ7J1SD6tGHf8HhdtuxQTngEYDwosoNBQR9VYVrC0EOSQQc6PSsz563A8tUc95CiTGm8tb
 2ux8lfPmEgobpZLcOmcyx8Sg3s7hl99nBwkOqb4DHgz8d0ArBBAB5qvVkTGkEQ7UvOos=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oivfvuFpSof7V2JHY5dYM3FHV+vS0yRXVZLn+vhja3w=; b=V2BONvBXVQrX2qwsCVyQot0s6x
 eBkv/Dm7lJbQrXaeXHcciZUZQtwQxuj+fxX34Yoa3+Egs/RjPPLq5g7hpVMx/ORetEjerA6CsY5nx
 BrGtiDnBOKqqVWaFzdde/m5LHf9JOa7Uf24eu278oVvV5LrRMT5sMWqgW6jPajIJMv4A=;
Received: from mta22.hihonor.com ([81.70.192.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRhRJ-0006ah-Ek for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Jun 2025 01:18:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=To:From;
 bh=oivfvuFpSof7V2JHY5dYM3FHV+vS0yRXVZLn+vhja3w=;
 b=j7atDkaGg3njDntrYxgZlLvtcnXyfIH1PS4qqLkBNj2Vx1dD0A0IainY9ujrFg/suAZOgQ/2n
 kJByG3Wxm5OUg+x2D0zEKVUCqwgzLRpcTXyZcarG6u/RYApbsT8xdr/5RQfoPvc05mrMHmH4Dvb
 lIzD+V/PkIXR5ZsnkIBqfpQ=
Received: from w012.hihonor.com (unknown [10.68.27.189])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bMQmC55bDzYl8Ws;
 Wed, 18 Jun 2025 09:15:55 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 18 Jun
 2025 09:17:57 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 18 Jun
 2025 09:17:56 +0800
From: wangzijie <wangzijie1@honor.com>
To: <wangzijie1@honor.com>
Date: Wed, 18 Jun 2025 09:17:56 +0800
Message-ID: <20250618011756.2451449-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250617123116.2385828-1-wangzijie1@honor.com>
References: <20250617123116.2385828-1-wangzijie1@honor.com>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w002.hihonor.com (10.68.28.120) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > To prevent scattered pin block generation,
 don't allow non-section
 aligned truncation > to smaller size on pinned file. But for truncation to
 larger size, after > commit 3fdd89b452c2("f2fs: prevent [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [81.70.192.198 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uRhRJ-0006ah-Ek
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: don't allow unaligned truncation to
 smaller size on pinned file
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, feng.han@honor.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> To prevent scattered pin block generation, don't allow non-section aligned truncation
> to smaller size on pinned file. But for truncation to larger size, after
> commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
> we only support overwrite IO to pinned file, so we don't need to consider
> attr->ia_size > i_size case.
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
> v2:
> - add comments and change a proper subject
> ---
>  fs/f2fs/file.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6bd3de64f..09be6e849 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1026,6 +1026,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  {
>  	struct inode *inode = d_inode(dentry);
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	int err;
>  
>  	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
> @@ -1047,6 +1048,17 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  			!IS_ALIGNED(attr->ia_size,
>  			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>  			return -EINVAL;
> +		/*
> +		 * To prevent scattered pin block generation, we don't
> +		 * allow smaller size unaligned truncation for pinned file.
> +		 * We only support overwrite IO to pinned file, so don't
> +		 * care about larger size truncation.
> +		 */
> +		if (f2fs_is_pinned_file(inode) &&
> +			attr->ia_size < i_size_read(inode) &&
> +			!IS_ALIGNED(attr->ia_size,
> +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
> +			return -EINVAL;
>  	}
>  
>  	err = setattr_prepare(idmap, dentry, attr);
> -- 
> 2.25.1

I missed attr->ia_size == i_size case...I will cover that in next version.




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

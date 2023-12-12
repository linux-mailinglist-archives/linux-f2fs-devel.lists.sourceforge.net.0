Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3471880E0ED
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Dec 2023 02:39:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rCrk8-0002U5-0Q;
	Tue, 12 Dec 2023 01:39:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rCrjy-0002Tf-Vv
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Dec 2023 01:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=REmuB76sDGLztG8A2JZ4H5kWO1gjpn+LDRx+sWI+lko=; b=MDLOMyRM8aw4jXSPyGQt//GdwV
 mgkG9x9yMn6BLoUGf1jgMXJgtu1DC7z++KTwkCeitIS++3zx+W0DQEPx8x58cAph99KVjgFLzGE37
 zSwANjyOxNcU96aXAhYn/VG3yRBtBZ41zLrP3Jspse0NiniHAEcMx1EKgYeyTNqBlHMo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=REmuB76sDGLztG8A2JZ4H5kWO1gjpn+LDRx+sWI+lko=; b=UkYiKsXrVg0YvKvw9QTwqwgxiv
 Nk0d+POZqKT6yz29usDpp8VTqYuMdVWec3Z7vhBTLANvhTp8uRG59aiXVn7382Jv9pg3o3FyyJlWB
 I9mDoXe4qfuKfRzws7FtBKJ0N6eLDvXwg6Z0+7EJNcXFzdU1L9nnH1mTHRWhKNr/hoJ4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rCrjy-0003SV-LW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Dec 2023 01:39:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 19ED8B810F1;
 Tue, 12 Dec 2023 01:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47166C433C8;
 Tue, 12 Dec 2023 01:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702345146;
 bh=TeIu+bH7xeWWjKF8B1+cGXjZicTzj7xMKbF2/jnTZ2M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=loDQXDK05uWNQeoH1AEDOy1imWruiJEWZStOtDJukZcRHzpIv/S7837qsuctYeuPP
 +MaVlDRQlGG5WLQJX1HuUP61rFck97nhULJSlHq91KJFG0x1IaN3WahKFFtbCxcF06
 jL6hG5hc8Nvg+C4Tp4uteWYfKtTpieabVw3TYKx+n5oEODrfML2KuVnDQ/4gyq+5dp
 Y9ERMajnwbgdYgtRm2/egQNZETX97gs/zr98kt/sYDOt+cMyGh0u8RSpZiJTF+ohYu
 9Yn2qpLxjpoQYe2xOtd8+PUDA875+V0oWyOXDuLlhmh5hH7/9ITlLW62PktpgitH5R
 Xu3H5aKhkalXg==
Message-ID: <3478e715-3fe2-4686-aa9d-8fa2f4083dac@kernel.org>
Date: Tue, 12 Dec 2023 09:39:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1702025433-5860-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1702025433-5860-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/12/8 16:50, Zhiguo Niu wrote: > Should check return
 value of f2fs_recover_xattr_data in > __f2fs_setxattr rather than doing
 invalid
 retry if error happen. > > Also just do set_page_dirty in f2 [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rCrjy-0003SV-LW
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to check return value of
 f2fs_recover_xattr_data
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
Cc: ke.wang@unisoc.com, niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/12/8 16:50, Zhiguo Niu wrote:
> Should check return value of f2fs_recover_xattr_data in
> __f2fs_setxattr rather than doing invalid retry if error happen.
> 
> Also just do set_page_dirty in f2fs_recover_xattr_data when
> page is changed really.
> 
> Fixes: 50a472bbc79f ("f2fs: do not return EFSCORRUPTED, but try to run online repair")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>   fs/f2fs/node.c  |  6 +++---
>   fs/f2fs/xattr.c | 12 +++++++-----
>   2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index e50a093..93bf724 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2754,11 +2754,11 @@ int f2fs_recover_xattr_data(struct inode *inode, struct page *page)
>   	f2fs_update_inode_page(inode);
>   
>   	/* 3: update and set xattr node page dirty */
> -	if (page)
> +	if (page) {
>   		memcpy(F2FS_NODE(xpage), F2FS_NODE(page),
>   				VALID_XATTR_BLOCK_SIZE);
> -
> -	set_page_dirty(xpage);
> +		set_page_dirty(xpage);
> +	}
>   	f2fs_put_page(xpage, 1);
>   
>   	return 0;
> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> index 47e88b4..de92891 100644
> --- a/fs/f2fs/xattr.c
> +++ b/fs/f2fs/xattr.c
> @@ -660,11 +660,13 @@ static int __f2fs_setxattr(struct inode *inode, int index,
>   	here = __find_xattr(base_addr, last_base_addr, NULL, index, len, name);
>   	if (!here) {
>   		if (!F2FS_I(inode)->i_xattr_nid) {
> -			f2fs_notice(F2FS_I_SB(inode),
> -				"recover xattr in inode (%lu)", inode->i_ino);
> -			f2fs_recover_xattr_data(inode, NULL);
> -			kfree(base_addr);
> -			goto retry;
> +			error = f2fs_recover_xattr_data(inode, NULL);

How about printing here?

f2fs_notice(F2FS_I_SB(inode),
	"recover xattr in inode (%lu), error: %d", inode->i_ino, error);

Thanks,

> +			if (!error) {
> +				f2fs_notice(F2FS_I_SB(inode),
> +					"recover xattr in inode (%lu)", inode->i_ino);
> +				kfree(base_addr);
> +				goto retry;
> +			}
>   		}
>   		f2fs_err(F2FS_I_SB(inode), "set inode (%lu) has corrupted xattr",
>   								inode->i_ino);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

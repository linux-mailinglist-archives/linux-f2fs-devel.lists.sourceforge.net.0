Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B48D45DCD2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Nov 2021 16:03:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mqGHQ-000691-OF; Thu, 25 Nov 2021 15:03:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mqGHN-00068a-CU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Nov 2021 15:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h9X7jOlZ9b8WEsxfWNppos4PwZTEqc+gdg0msetQZjY=; b=QqZiu7b5gmRtO2e9mxhpf220Hd
 w5lw4hDis3wzF2he9D8DDGZQPrqMeXwBhtSOmJ0rnqQIr8eEUFRfXo3neSCmaHqlyXiPya/8Paw1A
 E3L9FSK8bWIsRgY+uTtkJxKXlGR/sodQtn5xyEaEq3kyLconFcnJKiZayXtNn5RpITdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h9X7jOlZ9b8WEsxfWNppos4PwZTEqc+gdg0msetQZjY=; b=QqbcQ7Hq1dFinM9ZSYpqiU3cts
 NFnuoNZD8F6aZ007l8qm6iekx+TxsM/DH6XB8aAoFV+V5MTz9pt744Qr1ScwAMstN16Cl8KQD2UG3
 E47aQNI735Xq3kpUpgchL7B+xDMABtibZYW+4SJwkZT406uNlyjpCcHkpk+ulQNyCBJk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mqGHM-008vcj-Fd
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Nov 2021 15:03:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A1D2E61154;
 Thu, 25 Nov 2021 15:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637852586;
 bh=/QAk/3y5h+cmPaEUVYElurII4Wik41bgkM9BoL7TX9s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jvL2hY9vLyJchQLzwGLXUGxGwR5ZFr8LT85/iOwmfXVXB3yOPriIvBLB6dx5ZceUu
 5r0UtmJmdybAMVxN9MTOIdgNkVuYDyGYSsrf74CTuwHvKRBMEISmf3h7lxqRXtHYq4
 83XFdJMUPdfpqb0P95ujxDeEMD4RhyA6R1si9edl4hRuQaqJMl9Ph3vutCmdnJLLh1
 3EWdcyoqn3A2+RFjWeyH2SKT8pw1KVGY4XdETz17zq80GfuHO/fHbEuTcNZUvZqPTQ
 pAeMQeZ+vxsOf9Vms5UiZOc3sPgRqGPbEgQipoeGZ/zT6NCmEYHE5viWHK08ghaGrA
 eYVsI8wOoxvjQ==
Message-ID: <3ff5ed12-5cb1-a7bf-6344-b6afe15d7a3b@kernel.org>
Date: Thu, 25 Nov 2021 23:03:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org
References: <20211124083929.259433-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211124083929.259433-1-changfengnan@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/11/24 16:39, Fengnan Chang wrote: > Since compress
 inode not a regular file,
 generic_error_remove_page in > f2fs_invalidate_compress_pages
 will always be failed, set compress > inode as a regu [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mqGHM-008vcj-Fd
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix remove page failed in
 invalidate compress pages
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/11/24 16:39, Fengnan Chang wrote:
> Since compress inode not a regular file, generic_error_remove_page in
> f2fs_invalidate_compress_pages will always be failed, set compress
> inode as a regular file to fix it.
> 

Fixes: 6ce19aff0b8c ("f2fs: compress: add compress_inode to cache compressed blocks")

> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/inode.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 0f8b2df3e1e0..7ea76784efcc 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -516,6 +516,7 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>   	} else if (ino == F2FS_COMPRESS_INO(sbi)) {
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   		inode->i_mapping->a_ops = &f2fs_compress_aops;

/* generic_error_remove_page only truncates pages of regular inode */

Otherwise it looks good to me.

Thanks,

> +		inode->i_mode |= S_IFREG;
>   #endif
>   		mapping_set_gfp_mask(inode->i_mapping,
>   			GFP_NOFS | __GFP_HIGHMEM | __GFP_MOVABLE);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

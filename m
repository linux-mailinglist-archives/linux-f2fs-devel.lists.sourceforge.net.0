Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B906391696
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 18 Aug 2019 14:35:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzKOl-00055t-Kx; Sun, 18 Aug 2019 12:35:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hzKOj-00055b-Vv
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 18 Aug 2019 12:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dg38Gd+zjQeBEd9vOShhZRScw+u70EqPGNKrTN7DoG0=; b=nC0dstKKprVWQ4G8S7hlGF9LXO
 8ncBXBKIkGNaOHVM3hdE7yGBAT6hogc2XN5ceYxtviZbiIYPDkLRvO2CU8Nq0F7QaJ11N04yOfIrh
 WYLmTUxrR+JMhPSUeVaqXQJAP+yFmLNJbGwaSYl6Z5jbqVkVNnN6PNgliI934Rje8mps=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dg38Gd+zjQeBEd9vOShhZRScw+u70EqPGNKrTN7DoG0=; b=QPcRWEBxGNSvJ2a2u2SLtHgU2b
 KEBuZQwoGjJfqaAbgbWCork3Z1ZJpgdKwyJO6vQvwpeoXevL5Biq5ek21cL4smnsTTJDPwUUjDDUf
 OSiIZ14kXrUt7SmCrU4f8WGCJVweOWY+K/Sig84vplo8GmHGeJzRzSaxZK1jslFtb/k0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzKOi-007It8-37
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 18 Aug 2019 12:35:01 +0000
Received: from [192.168.0.101] (unknown [180.111.132.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EAA0020673;
 Sun, 18 Aug 2019 12:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566131694;
 bh=En13LL9EuLMF0mgoTgG9ewLwXdJ9VtIvWizl8rd0KwU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=AwslRGiytdssN7ncsgc0VCf6k5iMIpc+aGIGw0zR9PUOu/zFA93FfjNTZJ9q/cy25
 LhsYM2NqMy3mpx1sIXQn2KEHevHpFqKjh5Y42kPa2mg3A+DLozagL8f/eYD2CNwGpd
 YXErwmTWb88SP0BD1C13YJ66OLwD+CVyeJTW7TiM=
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20190817010325.36501-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <723dac7b-2223-cf03-78ac-c417af5a404d@kernel.org>
Date: Sun, 18 Aug 2019 20:34:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190817010325.36501-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hzKOi-007It8-37
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: check only max extra_isize
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

On 2019-8-17 9:03, Jaegeuk Kim wrote:
> If we use later kernel having larger extra_isize, old fsck will delete
> entire old files.

Would it be better to construct the length based on existed features?

Thanks,

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fsck/fsck.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index 1708abe..b4e53db 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -731,7 +731,7 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
>  	if (f2fs_has_extra_isize(&node_blk->i)) {
>  		if (c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR)) {
>  			if (node_blk->i.i_extra_isize >
> -				cpu_to_le16(F2FS_TOTAL_EXTRA_ATTR_SIZE)) {
> +						4 * DEF_ADDRS_PER_INODE) {
>  				FIX_MSG("ino[0x%x] recover i_extra_isize "
>  					"from %u to %u",
>  					nid,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

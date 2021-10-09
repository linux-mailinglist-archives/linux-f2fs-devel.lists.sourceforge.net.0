Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1291F42776A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Oct 2021 06:44:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mZ4Dc-0005qp-3B; Sat, 09 Oct 2021 04:44:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mZ4Da-0005qc-Ey
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Oct 2021 04:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o0fZsrtwYQJjSUkKVJhSstSDjNvgbFPWePz/qoVHLYw=; b=Y/Qm5Xgon/dia1jCPNWttMYklc
 71YZb+0J6B/dJ6U9t9GkWdzsnJc4V/jGid4VKAK4nlF3SZ0cVwXpCbZcmAjs+aUz3wDSyYkCU54Pv
 2s+MmJan0CcQqqKBLgDjcnPWbuQQEH0M9oUuMM9ok1ZtmDO0KwjWDS8dpa2hl1TDA8iE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o0fZsrtwYQJjSUkKVJhSstSDjNvgbFPWePz/qoVHLYw=; b=Y2XfCsCQtcNi3CTFCem59XthSg
 r7ySPNvAwFQQTcuPok4KUZPa12DyVeN7NP8lsLU4L6yBu1Ct7pZTxvktVCiA3hyaA4aFTZUY5hJpR
 SNeysVQVdISs/ZamVW5GKN0V3JKn7Fsoqu1d2OR1B7F9SkgrPO4sPRwtH6gqjK5De16A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mZ4DY-0002Dn-HY
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Oct 2021 04:44:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46C6160FD7;
 Sat,  9 Oct 2021 04:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633754650;
 bh=/DP0YNGWaWd7IkbhoG4Fi8yCcVeNmnaI1/+O1tyTZi8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jwZCIDoBye/Db5VufJzbIarfc+pif9cRf1j2M4Mnrx5InfLvcMXzyQPV3EemCANUJ
 0KKBPdm3oSzw1oKXkn9Njun5N50wmkIr6CleARVZTVIS+uyEj3FQZ7O/cS29QOPhn1
 RaOSDCuLmU2kOq2VpXADX51Qxxwgc01oWDsMxRJZHBQV+fv42eD9n33bvw9x282iWI
 N3670y6IXzlHy1nt/fOwzJPPyBCgL92Cf4x5mOfMFDNjed7jvNQNvpTU3UBNBPqt21
 VuqQBXGs1UfhktCyEMliLaCGb/lGeLl8UDd+NUPqSXop3nDjSTgW4AgvWyNIQCkQyO
 RuLXWMwiGTC1A==
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20211006174910.2964885-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <5743eeca-a6e8-87d4-5799-c622fbada429@kernel.org>
Date: Sat, 9 Oct 2021 12:44:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211006174910.2964885-1-daeho43@gmail.com>
Content-Language: en-US
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/10/7 1:49, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Need to include non-compressed blocks in
 compr_written_block
 to > estimate average compression ratio more accurate [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mZ4DY-0002Dn-HY
Subject: Re: [f2fs-dev] [PATCH] f2fs: include non-compressed blocks in
 compr_written_block
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/10/7 1:49, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Need to include non-compressed blocks in compr_written_block to
> estimate average compression ratio more accurately.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/compress.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index c1bf9ad4c220..9b663eaf4805 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1530,6 +1530,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
>   	if (cluster_may_compress(cc)) {
>   		err = f2fs_compress_pages(cc);
>   		if (err == -EAGAIN) {
> +			add_compr_block_stat(cc->inode, cc->cluster_size);

Shouldn't we relocate this after 'write' label?

One more concern, it looks we've changed what compr_block stat indicated,
literally, the block we account should be compressed..., how about accounting
it by introducing .presist_blocks, used_blocks or occupied_blocks.... thoughts?

Thanks,

>   			goto write;
>   		} else if (err) {
>   			f2fs_put_rpages_wbc(cc, wbc, true, 1);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

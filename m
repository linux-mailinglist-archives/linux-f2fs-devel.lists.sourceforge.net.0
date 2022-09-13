Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8BB5B6615
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Sep 2022 05:19:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXwSo-0002iH-Hq;
	Tue, 13 Sep 2022 03:19:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oXwSn-0002i7-KN
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 03:19:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KRJo4dhFbxzlmjIpI7WA54SNLBRJrwiXqdDTqNvzLHc=; b=BYc15xlMY9S04Am2hUPNGRU8Wa
 Cqibh1w2anu5eksqSeCcZmubj5rz23JAhdieNOtoYL6aqOyAUqr6Ytvs0qZMeXPIndtptOHnJUqEM
 6hLbQq2ffVlwXwRE4OCx2YmTvLgwZu0pPZkRHNERhxEx2cPGcdPdMQErT1xdC0mRYs5Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KRJo4dhFbxzlmjIpI7WA54SNLBRJrwiXqdDTqNvzLHc=; b=ilGrsesAUKer7X5na5zgaYGJA9
 iL1b3JxMvJbortfLFOFaF6TLprkoyXwWJD/WJguN1aXo48L83FqQq+mCPgcsnaMAT4ZMTLlpXXUAx
 edGE+Z1J5iFvx5OJO3pqPLMDsxmsekdqcuQrr3NyrQalDUY0nAVR3ImvdPnliReN3ZZ0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oXwSn-000505-0q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 03:19:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A06AE612EC;
 Tue, 13 Sep 2022 03:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49721C433D7;
 Tue, 13 Sep 2022 03:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663039187;
 bh=pBrId0DjVisigGX3xbiSomiuv8Vq948Y45oVd3j+YJI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uRI3F2MMXL/s0wzdORo1zcKbF8E1NtjbEIxy9pJ0EYB0n3280ZETw2S89Liiy9Rip
 +JNCCmHyzylIxvOpLID7+AMPCqyiUkLHAk4MVpVWBlAD74HDUSi3jy9ihI3QmdLnaQ
 NMnKJDYZNacJv/2XNxQZ7fQ5Cu3thaqL5rqvwsoASK8S79X804sKQqx8ky7caXVt4e
 TxGRwgey2moKULtx8W4Wd72jOXD/AjzO34thVwJiJpDu+IIl11nRUoATnWCg6n4Lue
 kq7mcJGbzttqORud1hKQXHV/P/SWk391cEkOoO3xoOgWiIn/5mPskZqpi7RDOPANS1
 uIYyZSUkvBfTA==
Message-ID: <293a41a4-7c7d-aac8-0bc2-15d47b7bd538@kernel.org>
Date: Tue, 13 Sep 2022 11:19:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, jaegeuk@kernel.org
References: <20220913030529.3944-1-zhangqilong3@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220913030529.3944-1-zhangqilong3@huawei.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/13 11:05,
 Zhang Qilong wrote: > If we do not truncate
 source page cache, user can still > see the previous source data after being
 moved. We fix > it by adding truncating after __exchange_da [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oXwSn-000505-0q
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: adding truncate page cache after
 being moved
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

On 2022/9/13 11:05, Zhang Qilong wrote:
> If we do not truncate source page cache, user can still
> see the previous source data after being moved. We fix
> it by adding truncating after __exchange_data_block.
> 
> Fixes:4dd6f977fc778 ("f2fs: support an ioctl to move a range of data blocks")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>   fs/f2fs/file.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 771f1f7f3690..e3ff648aa496 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2789,6 +2789,10 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
>   	}
>   	f2fs_unlock_op(sbi);
>   
> +	filemap_invalidate_lock(src->i_mapping);

invalidate lock should cover __exchange_data_block()?

> +	truncate_pagecache_range(src, pos_in, pos_in + len - 1);

truncate_pagecache_range() should be called before __exchange_data_block()?

Thanks,

> +	filemap_invalidate_unlock(src->i_mapping);
> +
>   	if (src != dst)
>   		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);
>   out_src:


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

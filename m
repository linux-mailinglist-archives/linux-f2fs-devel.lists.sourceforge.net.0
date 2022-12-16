Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B624C64E9B9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Dec 2022 11:47:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p68FL-0001u0-Ie;
	Fri, 16 Dec 2022 10:47:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p68FI-0001tc-Sp
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 10:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s1JQ/3ZbQJ6baKML9xuRN4uWEsuh4nFVz6wpit+w8dQ=; b=WPjE/BMslaCidvfdQaMazGELGv
 bLSfQ32AedCrH6bJDZWa2XMMGD0LoKvjvyWO3yvs05C18+4JLIPhgYnleUxnB7gIf5zHp7aC7chLZ
 nBfLt3KWU9yMXmfQoytI8S+UvPty8D9SR6f3+q00B/++dg3FH/oGZz5773l7Gge/oYDQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s1JQ/3ZbQJ6baKML9xuRN4uWEsuh4nFVz6wpit+w8dQ=; b=gBvaYal4FAfQX+xYapPVFOtutL
 CEe99//mnVGf13mWdxx2ptAgx7juuZB9oWBM7S3twZtX45nGRoPBvYosYk5gqhnvpg/4pd6ytI2r+
 gWxIBNLQhUdWWyz4KxnLBCJg8muexwIbSKjpsn5EwqoxDO7k7nfyHmKWM40fPs8OEE6w=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p68FF-0002Pg-C0 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 10:47:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 91670B81D56;
 Fri, 16 Dec 2022 10:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424CCC433D2;
 Fri, 16 Dec 2022 10:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671187625;
 bh=GW47qGrPqF8CWC+Youkq+IO1MFrfcW5vndIuiRUvzRM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=E3fPudGa6StFQxmn4+3QO7yhd+6HAUS3uW7xK3ebXggA7JKM0SYZyZ0tO/aub63mc
 2MkG9axMPSSUq9kWW+wL/zF1W9H6SB4a5o8cd3F8BC3XKRBlae5cvSHLRZ8fFYUie3
 XhP+JJprIXerazBZ5Mm1+5EYqyjP9Yf+7VaR+VQjRTr/GXnN4dOJ791FuELQk50JA9
 H9FKpjKMGqgikranAQp/OOUktY/TY3dpyCRCDfKe1qM1s1VI0oJzlmGLZBOOy6dZNG
 4vCkLebDCcPjcSZqFdXHu2mLWzh/AzedWgiHsKpgEtAsJyG5oVAVV9M3VNcol/21st
 5i7+OFdoiEC7Q==
Message-ID: <a2c286e1-470f-ff83-196a-f7ea490096ff@kernel.org>
Date: Fri, 16 Dec 2022 18:47:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <dedae282-2d13-cc12-95b8-98cfd377d98c@kernel.org>
 <20221216034811.4603-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221216034811.4603-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/16 11:48,
 Yangtao Li wrote: >> After moving f2fs_show_injection_info()
 core functionality into time_to_inject(), >> __builtin_return_address(0)
 result changes from return address of caller [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
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
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p68FF-0002Pg-C0
Subject: Re: [f2fs-dev] [PATCH] f2fs: merge f2fs_show_injection_info() into
 time_to_inject()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/12/16 11:48, Yangtao Li wrote:
>> After moving f2fs_show_injection_info() core functionality into time_to_inject(),
>> __builtin_return_address(0) result changes from return address of caller of
>> f2fs_show_injection_info() to return address of time_to_inject().
> 
> I tried the __builtin_return_address(1) parameter just now, and no error
> was reported when compiling, but a null pointer problem will be triggered
> when the kernel is running.
> 
> I thought about it, and the print address didn't seem clear enough.
> Let's just print the line number of the caller?

That will cause a regression when searching last injection call paths after
bug occurs, since there are many similar callers of time_to_inject, but the
caller's call paths are different. So, IMO, it's useful to keep
__builtin_return_address in the log to distinguish the real call path of
fault injection.

> 
> #define time_to_inject(sbi, type) __time_to_inject(sbi, type, __func__, __LINE__)

Any way to pass __builtin_return_address(0) from parameter in __time_to_inject(...)?

Thanks,

> static inline bool __time_to_inject(struct f2fs_sb_info *sbi, int type,
>                                      const char *func_name, unsigned int line)
> {
>      struct f2fs_fault_info *ffi = &F2FS_OPTION(sbi).fault_info;
> 
>      if (!ffi->inject_rate)
>          return false;
> 
>      if (!IS_FAULT_SET(ffi, type))
>          return false;
> 
>      atomic_inc(&ffi->inject_ops);
>      if (atomic_read(&ffi->inject_ops) >= ffi->inject_rate) {
>          atomic_set(&ffi->inject_ops, 0);
>          printk_ratelimited("%sF2FS-fs (%s) : inject %s in [%s] %d\n",
>              KERN_INFO, sbi->sb->s_id, f2fs_fault_name[type],
>              func_name, line);
>          return true;
>      }
>      return false;
> }
> 
> Thx,
> Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C885D7E788B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Nov 2023 05:04:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r1IkU-0005tJ-7M;
	Fri, 10 Nov 2023 04:04:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r1IkS-0005tD-H8
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Nov 2023 04:03:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ik58xI1fnPowcOuaQ23Frqrvjr1dBz8+0hYR2zAYc/A=; b=aTa6+ikl/Fyy11MyxWoXUJwTbG
 OteDG5GVg7vh3tbHVS3K6fBzEo/Wz819hsJ1L9DgaFztmbW9vTde2AycOTrg/PW2LBQ7Cdz+uqsd9
 l6B3JiGHxTI+X6o3rOXtZ9KgFUtAhYZ4Gie2xnHvY/jfPr4XwXO3uH2O3Zy+o4eCbw9E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ik58xI1fnPowcOuaQ23Frqrvjr1dBz8+0hYR2zAYc/A=; b=iH+Ixkf+AQm03HyUE+oVeerlOg
 hOaAbhRck5GNcbmN3NIEdpIgVty9Xr0i+KawnfAM4tnN92+TqNnOWZgr9stu5ay677LxfFl1qN4Db
 BXAoIDp91MEzGlKAbQLsWhk16oXlaKDdiGUb6UMqH6aAdHEBkz4kwjwRiNOuOtwl3qfc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r1IkQ-0006hB-Ph for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Nov 2023 04:03:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 426ABB821BC;
 Fri, 10 Nov 2023 04:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B65C433C8;
 Fri, 10 Nov 2023 04:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699589031;
 bh=syGUrP3BloIeupnxLXDdLIZ77q+qjZigvhuxU/7dc2E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YWnhEt08HS8QshXDR+b0mqQhCgtoI/krQ3IEG4GZGfOv20EZAjNt3hPvcYzlNA9H6
 Kd6oR0O9zIrJMDWsBPs27ynRem64pyVWrYNHnfTJu3V0Z1by/E4/t3Y2nUj7IQ7d2L
 9m3qXgxNzDDOwVWVuoFFfCaVhk/t5kFtYCJuKrSONp8/sO9iUlUnvYQ98udnyXwc1Y
 TcPHwjZdco66scUBarPcVbS4CTc8YhWwdWGS6+1AGO8QhQvbMy0nL2uIF7W1sIZ0YD
 WZAhmlh9hCpOlngn47FgjhevxhYXTmvDDFTlzUxfuelbDLe8DQsU6JkPX6rb3Y1MDz
 Ww7Ci/wi7yNcQ==
Message-ID: <97e0859c-5071-645d-2ca7-e43b361e07b8@kernel.org>
Date: Fri, 10 Nov 2023 12:03:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: zangyangyang1 <zangyangyang1@xiaomi.com>
References: <dc585173-d459-fc2a-b8ec-43a36361eeb2@kernel.org>
 <20231109154742.271947-1-zangyangyang1@xiaomi.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231109154742.271947-1-zangyangyang1@xiaomi.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/11/9 23:47, zangyangyang1 wrote: > This issue comes
 from a static code scanning tool. > When c.sparse_mode is 1, stat_buf will
 not be initialized, > but it will be used next. > If this issue d [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r1IkQ-0006hB-Ph
Subject: Re: [f2fs-dev] [PATCH V2] libf2fs: Fix using uninitialized
 variables error in get_device_info()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/11/9 23:47, zangyangyang1 wrote:
> This issue comes from a static code scanning tool.
> When c.sparse_mode is 1, stat_buf will not be initialized,
> but it will be used next.
> If this issue does not require modification, please ignore this commit.
> 
> Signed-off-by: zangyangyang1 <zangyangyang1@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

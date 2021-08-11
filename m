Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 907003E92EB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 15:45:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDoXd-0001rJ-Ls; Wed, 11 Aug 2021 13:45:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mDoXc-0001r9-Ft
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 13:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sr64JLl36/X73+XCVLVEdCH0eGrLg1a31S+ZCuK7O6Q=; b=Gq32tOXvv14yHXBIhJWcwS9Lbe
 9S58DNoTCWySiXW8+BJfX31AAv9hBg2ioks1J6aKlB44CE69H5GLywu7jBQhcJ9BIFC4Bnr6YoIqv
 fzypDBWy+NYWpM9+Tm4gBCrGyJMaedGQI50UEShOsr4NVN81HBTFwQVbtFLQGGcs864o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sr64JLl36/X73+XCVLVEdCH0eGrLg1a31S+ZCuK7O6Q=; b=QpzWl559p+d61NH+c8nvZWi+S8
 iN1v2V+2ygKwJn4Plgi9H0FAxWtB/vnbmDMSqbKZ4hT66+5P6ir70E2a+9ZJ5Q9sUZX3qR7LpAT2j
 rDLs6v5npwcEqGdYPWFWTdoOzA4/Aex6WrVhem/NkKXRvxJkfUsSiLBLtg/136AjcC4U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDoXb-0007pB-DZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 13:45:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 839D160FA0;
 Wed, 11 Aug 2021 13:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628689496;
 bh=O8JVrrpaXEdBnuTdYmtvCs5et+qsGlYfUIcqodvrCBE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Yz74ZQLD53yvkil+NzYu2wm3YsMgcxktWknb8nC7AEKeFG+yvFgCXFTDUs5rfsBDd
 yqnZsm6sPsP1EozaxLn+8Jt+VHw92MXkVjbH2/DAIbQOg50bL5X+w6q8CJvfy1wkCf
 GcyHHEv+UJhch2vE+bF7sHp7tXcPNGWOi67HfjLYl3u68dAJVZecROITNUuaa0E1V5
 AyfTOt0kpDt3Cnd2lLtVLESeJvmOoBapYUtkGlnQgKsvDZGs55Vm791r7iqHtUDZP9
 HzTHVe//INUnEATMvKlWoYqUU5AS421qKZw/ws8VmQ28owyJt9qZPjMl+Ju/mXwHWB
 5MS3U4BQPRfAA==
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20210811131826.223141-1-frank.li@vivo.com>
 <20210811131826.223141-2-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <fc34fe7c-c7ec-3783-8cbc-de91ab81ee0a@kernel.org>
Date: Wed, 11 Aug 2021 21:44:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210811131826.223141-2-frank.li@vivo.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mDoXb-0007pB-DZ
Subject: Re: [f2fs-dev] [PATCH 2/2] fs: Don't create discard thread when
 device not support realtime discard
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
Cc: linux-kernel@vger.kernel.org, Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/11 21:18, Yangtao Li wrote:
> From: Fengnan Chang <changfengnan@vivo.com>
> 
> Don't create discard thread when device not support realtime discard.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/segment.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 363779a4402d..bc4ac46f3041 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2161,6 +2161,8 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
>   	init_waitqueue_head(&dcc->discard_wait_queue);
>   	SM_I(sbi)->dcc_info = dcc;
>   init_thread:
> +	if (!f2fs_realtime_discard_enable(sbi))

How about below case:
- mount -o nodiscard <dev> <mp>
- mount -o remount,discard <dev> <mp>

Thanks,

> +		return err;
>   	dcc->f2fs_issue_discard = kthread_run(issue_discard_thread, sbi,
>   				"f2fs_discard-%u:%u", MAJOR(dev), MINOR(dev));
>   	if (IS_ERR(dcc->f2fs_issue_discard)) {
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

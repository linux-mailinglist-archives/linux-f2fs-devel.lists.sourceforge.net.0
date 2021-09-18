Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 611534108D8
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Sep 2021 00:34:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mRiv7-0005xK-Hw; Sat, 18 Sep 2021 22:34:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mRiv6-0005xD-Lh
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Sep 2021 22:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FEniJ8WfdrcjwQQScuW1bbgYqfCMnnX8hTnxnalymz0=; b=iLPI05N/75fnpT2wu8+lXlvQLF
 6rvYXuqYC21jkv0HuypJZzHIuLoJyhGwJbXOaQ4ahunnupWXYT3ZGPirJCjiESjRWzsG6JeMeI9E9
 qTJv/mBK1Ma4wcFhbfp9u2ersuoCCv+1gyEiBSrnSxrEZ3aXxmPftkMMUW7xYxxmDoBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FEniJ8WfdrcjwQQScuW1bbgYqfCMnnX8hTnxnalymz0=; b=G2t1NzFB8Nea6GdfTUaaMhc8ie
 UjTUmdrrRx3sy0zOp6p0/5J0oBpIXMwGbfhxHNQUwrpHuTNjd723RmO1KvU2m53X/C2ku9m0lLLoo
 TebtX6AgiPlxj1Vz49iwhelL2ysdzbuNvXLF5eBDpxWIeaCtDMkzLZj2SzlX8w7cFkeA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mRiv3-0006wj-OI
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Sep 2021 22:34:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8EE30610A4;
 Sat, 18 Sep 2021 22:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632004479;
 bh=ZH75DAAdwjrKMRMHVmGXvimYUZRbWcaEAxZX30exIFg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FFRtqijOqRgIjN3VQgk1KxZoXdd32i9SluGA7RLVwCxGt2JR5XeEv/dN9EhP14zvW
 boT4JkbGJ7XoE87tBYcFe723zS1ZbdY07182WWNseYxOmTIjFuy80HsBvw+etfktBh
 PO8V4sXIqKiO8/n12OxyqvIBjzfETXNqwmQWnYDEE8O/vwWw2ktpr2a+UU8pp0P0O/
 tl/xG71fDiQSPo75Gglit30i42gdBe4DRLRpvIh9dhTXTPIqIeqD+S6tQHLCE9Uelt
 iUnOSWsLoVKIrG5GYxCdhd2/Ndljm88QlBnwkRWNug7Lkc+uRQTXz9gYF9QqV7QACU
 Gi6vWWQoTcWEQ==
To: Weichao Guo <guoweichao@oppo.com>, jaegeuk@kernel.org
References: <1631969196-341-1-git-send-email-guoweichao@oppo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <d52c8848-f2d0-c5a4-17f1-8e88285856e3@kernel.org>
Date: Sun, 19 Sep 2021 06:34:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1631969196-341-1-git-send-email-guoweichao@oppo.com>
Content-Language: en-US
X-Spam-Score: -8.1 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/9/18 20:46, Weichao Guo wrote: > Inconsistent node
 block will cause a file fail to open or read, > which could make the user
 process crashes or stucks. Let's mark > SBI_NEED_FSCK flag to trigg [...]
 Content analysis details:   (-8.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mRiv3-0006wj-OI
Subject: Re: [f2fs-dev] [PATCH] f2fs: set SBI_NEED_FSCK flag when
 inconsistent node block found
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
Cc: omega@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/9/18 20:46, Weichao Guo wrote:
> Inconsistent node block will cause a file fail to open or read,
> which could make the user process crashes or stucks. Let's mark
> SBI_NEED_FSCK flag to trigger a fix at next fsck time. After
> unlinking the corrupted file, the user process could regenerate
> a new one and work correctly.
> 
> Signed-off-by: Weichao Guo <guoweichao@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

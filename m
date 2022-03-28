Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BF24E8CAF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Mar 2022 05:48:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nYgNB-00014X-Ho; Mon, 28 Mar 2022 03:48:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nYgNA-00014R-O6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Mar 2022 03:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CQiJBMf9ADNNk0ZBvPJ0Z++qV9TKoj/NWDvCblulKxk=; b=JfsvKDwBGLuYmoN+RimvOYjHlM
 3wN9VoKhKV4nezrHEi8wEqSyj518pZk/RBbVHUDXVYvcqvApp9LAR9vKYOEvqSV6MuPGbpUy87sIB
 95PLMkz822YwY31zUjemOONCfZVg2krA8DW5Cpagff0Qve1z1bMXMkPwnHiqSfkRAS3g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CQiJBMf9ADNNk0ZBvPJ0Z++qV9TKoj/NWDvCblulKxk=; b=c0FT9wnu0pb02LOuLa/KZ7KvVf
 T3e0/wKQ8h7WhtkrgWOYHGMR2yt6Xs1sAsW3E3C70sdcclGY4vN96gnkWO9iksK1KlNbNzJsJKe76
 +oQShbTEvADchVnkd5QpWR55MYzqwM+lu9sDBt1U0EgVzO7jJhXYq1KOb/0Snce1yV0c=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nYgN8-00EGeI-Lj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Mar 2022 03:48:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5D6A3B80DAC;
 Mon, 28 Mar 2022 03:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6061AC004DD;
 Mon, 28 Mar 2022 03:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648439323;
 bh=ncL8VxubfzfZ7b1grespf5LSNaqvF/YurFbhYD9Cg8E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Yivf2euGEalJtibgIbINrF87hT0GmxnKTV7+fzxsgicwknY0Dd4wi1VksXcPVXBQP
 So8hiKhTtMIV63b1eX0Inz4XF7Xw3lslBIsuVAQ2Uv4Zepz+BUGNcQ1WUbB/LntPkz
 WbmePHhV4bzfRcLi+y3W3dOmqVqatrZ4WRsjyNtOOy8TsY/cGnvsSB0nALQdV0mApE
 km6aTNlg93CwrqATqetcQsoh7NXP4Jn834Ttkx7byCiuts9h/FlUembHmgkh3IB9F2
 kl/Yv4AfwpIusZ+f86l3Lam+EdoHBiUCagftqkBISfdajyvFXkZ8hyh80WvcGS1Aa+
 Rg649hMFMfFLQ==
Message-ID: <16c081ae-fc87-c9d5-0bac-3482f68c58d5@kernel.org>
Date: Mon, 28 Mar 2022 11:48:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Sun Ke <sunke32@huawei.com>, fstests@vger.kernel.org, guan@eryu.me
References: <20220323083724.55902-1-sunke32@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220323083724.55902-1-sunke32@huawei.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/23 16:37, Sun Ke via Linux-f2fs-devel wrote: > The
 test fail on f2fs: > xattr names and values after second fsync log replay:
 > # file: SCRATCH_MNT/foobar > +user.attr1="val1" > user.attr3=" [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nYgN8-00EGeI-Lj
Subject: Re: [f2fs-dev] [PATCH v3] generic/066: attr1 is still there after
 log replay on f2fs
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
Cc: jaegeuk@kernel.org, david@fromorbit.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/3/23 16:37, Sun Ke via Linux-f2fs-devel wrote:
> The test fail on f2fs:
>       xattr names and values after second fsync log replay:
>       # file: SCRATCH_MNT/foobar
>      +user.attr1="val1"
>       user.attr3="val3"
> 
> attr1 is still there after log replay. f2fs doesn't support fs-op level
> transaction functionality. so it have no way to persist all metadata
> updates in one transaction.  We can use "fastboot" mountoption for this
> case, so during last fsync on qwerty, f2fs can trigger a checkpoint
> which will persist all metadata updates before fsync().
> 
> Suggested-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Sun Ke <sunke32@huawei.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E193268664E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Feb 2023 13:57:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNCgQ-0007jx-7N;
	Wed, 01 Feb 2023 12:57:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pNCgN-0007jZ-V4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Feb 2023 12:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3f0SPeR3KETZKx1Bpw9bXWQvTOKNstlbK4/yavmjmqo=; b=HnaTUVQYp4xJeoQzAkrpwg7CI8
 yk43Rzufoh+oMP8XfwRSltNO6K8jNeAnWXWXKfDnviAd56Ie2fAETf7z2+2c29yNvb9NfjWe9FNyg
 RjI0wdgRk6Km3O01S7GpAwQ/0ENGr10mS6hWf8i17NGmiezI2PwA+0HB5MaLaXzurd8Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3f0SPeR3KETZKx1Bpw9bXWQvTOKNstlbK4/yavmjmqo=; b=epQBB9GGQ7N7K9/nXzFTB5tLvW
 d65/zYrKo3ejXQszCRm5cCXso7vKbfVcL/zT9DMyZeuStobFViqhZ6041bLbrrmKLAAwjZhj0bOZt
 WF6cdKW8pe0TTePz28oLSxEWUzgMc8xxSho4MyxePPsP8hxd1KBtdPsjmeymr00UhKvU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNCgM-007I5J-K6 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Feb 2023 12:57:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0FAD1B8201D;
 Wed,  1 Feb 2023 12:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA15CC433EF;
 Wed,  1 Feb 2023 12:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675256257;
 bh=8dtRUXoHN3LUlKfLhDcM61zlUbHfbbjOfI95C6JYLAQ=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=ClPgW21A6heaqpnKL9sHaOtJyXrz4nRxyJGWAswMJH4Pkh0PHJR9aHJ1Wfpu+HfVi
 YX5GsyUMi07pvqxP4D6tidoBz01e4C5d1eb0DD0Wm5sJkqjabGEc1gnpERxIWpbHFc
 czGQH8MIjGF/xwIS8G/I9VcLGAkpjHUlzm4dwjXDRVzU0NFMQYskxw2GQwrkhNx7RJ
 3conp0KsLw0K1SDcEoc97wukWESVfsXDvrav2JH9XiDFAvuT6lxOA9i9ozv5zj9sPJ
 7aBWmyrtXQuHmrTi+1Ir8z7uWeuGJZENfpqVDCvw1jxLiVypVVp+meyClsa9rjsLX9
 TbKOmuyVK5xYQ==
Message-ID: <938a8e61-4e47-1acc-938c-c90d213d2c86@kernel.org>
Date: Wed, 1 Feb 2023 20:57:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: qixiaoyu <qxy65535@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230113125859.15651-1-qixiaoyu1@xiaomi.com>
 <20230116030850.20260-1-qixiaoyu1@xiaomi.com>
 <7c12ebaa-4d3d-e475-dfb2-7b459cd26e64@kernel.org>
 <Y9ZWDVV3HJ431Fis@mi-HP-ProDesk-680-G4-MT>
 <Y9pZqOMBipT2NZk0@mi-HP-ProDesk-680-G4-MT>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y9pZqOMBipT2NZk0@mi-HP-ProDesk-680-G4-MT>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/1 20:23, qixiaoyu wrote: >>> >>> How about updating
 as below to avoid lossing accuracy if new is less than 100? >>> >>> return
 div_u64(new * (100 - LAST_AGE_WEIGHT), 100) + >>> div_u64(old * [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pNCgM-007I5J-K6
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs: fix wrong calculation of block
 age
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
Cc: xiongping1@xiaomi.com, qixiaoyu1@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/2/1 20:23, qixiaoyu wrote:
>>>
>>> How about updating as below to avoid lossing accuracy if new is less than 100?
>>>
>>> return div_u64(new * (100 - LAST_AGE_WEIGHT), 100) +
>>> 		div_u64(old * LAST_AGE_WEIGHT, 100);
>>>
>>> Thanks,
>>>
>>
>> We want to avoid overflow by doing the division first. To keep the accuracy, how

Alright,

>> about updating as below:
>>
>> 	res = div_u64_rem(new, 100, &rem_new) * (100 - LAST_AGE_WEIGHT)
>> 		+ div_u64_rem(old, 100, &rem_old) * LAST_AGE_WEIGHT;
>> 	res += rem_new * (100 - LAST_AGE_WEIGHT) / 100 + rem_old * LAST_AGE_WEIGHT / 100;
>> 	return res;

if (rem_new)
	res += rem_new * (100 - LAST_AGE_WEIGHT) / 100;
if (rem_old)
	res += rem_old * LAST_AGE_WEIGHT / 100;

Otherwise, it looks fine to me. :)

Thanks,

>>
>> Thanks,
>>
> 
> Friendly ping
> 
>>>>    }
>>>>    /* This returns a new age and allocated blocks in ei */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

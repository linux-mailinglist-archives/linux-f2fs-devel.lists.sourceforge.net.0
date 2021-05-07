Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A803F3760AF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 May 2021 08:53:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1leuM6-00082W-C9; Fri, 07 May 2021 06:52:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1leuM3-00082H-Uw
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 May 2021 06:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uom50jfRon/dG69xPd422hTuZqyolkvUpc6Az29YWPY=; b=epvKN/+plxg3g+v4M02HOVHP9N
 ufYdjigccxr25JbHqu9vC6utuzPzZl6zQtpRCBv/LiTHJMQe+SbpFVEiHlp0xmQdgl2dO6b2i2K3U
 WJeJKeh9vtD/7bltLUjbaBibkFAbQjvHvfxwQBqNkA8QDkgZ2pB1Spr1ll5R8dcG0sEE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uom50jfRon/dG69xPd422hTuZqyolkvUpc6Az29YWPY=; b=kgh8Jl3pbLp6keyp+tasLzHosB
 /rQHpWKXQ6kS5nC1Ov2IPD6XBvILr+hjTH7mEId7yGlii93u7BHYPz4vIxb86XQvlJoCN9CQeNvJm
 bq9JyAkzEK0uu4ZoXOJkCGBiaSOfGGQfn4jUcvM0Qfvpn5qjSeNG7NTO49uRJ0rKfDXY=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1leuLu-008obd-TD
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 May 2021 06:52:57 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fc1Jb73WTzqSx6;
 Fri,  7 May 2021 14:49:19 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 7 May 2021
 14:52:31 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20210425011053.44436-1-yuchao0@huawei.com>
 <YJTfNeYeDT65GslB@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <92386fc3-4c23-f2da-28be-f2285343cce8@huawei.com>
Date: Fri, 7 May 2021 14:52:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YJTfNeYeDT65GslB@sol.localdomain>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1leuLu-008obd-TD
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: reduce expensive checkpoint trigger
 frequency
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/5/7 14:33, Eric Biggers wrote:
> On Sun, Apr 25, 2021 at 09:10:53AM +0800, Chao Yu wrote:
>> +	if (!error && S_ISDIR(inode->i_mode) && f2fs_encrypted_file(inode) &&
>> +			f2fs_is_checkpointed_node(sbi, inode->i_ino))
>> +		f2fs_add_ino_entry(sbi, inode->i_ino, ENC_DIR_INO);
> 
> This will never be true, since S_ISDIR() and f2fs_encrypted_file() are logically
> contradictory (as f2fs_encrypted_file() only returns true when S_ISREG()).
> 
> How did you test this change?

I should add RFC tag in this v2 as v1, since I haven't test both
with specified case because this idea should be discussed first.

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

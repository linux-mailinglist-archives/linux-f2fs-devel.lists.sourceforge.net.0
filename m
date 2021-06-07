Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A330B39E9F0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jun 2021 01:11:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqOOW-0002TW-AE; Mon, 07 Jun 2021 23:10:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lqOOU-0002TO-D0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 23:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JNlTavdwOWGTJjWMv8/BD/ZUCdcsqVlSeXg5Mrk9/I4=; b=NFJCSg2+ly3wnBWmp/TaPU8AbY
 4eKR0370zrw2/kwLX0TdhTbC7vQWkQ0TAFsyJ9QTvjQAgM22EgvBc8K/nQY1v+mvoN2RupZrZmAZD
 OUDOC+tCCX0pOEoIc1ZpU2XAVEFNFsjSH6Djh5PNCdGpbNmfFe5/b85z9GhiR1X6gHSU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JNlTavdwOWGTJjWMv8/BD/ZUCdcsqVlSeXg5Mrk9/I4=; b=kZ2wToPHl2nJfM39jN3aNbaLxk
 IoS0Aqn36tOwfTW2EHV5m+3pEeH0djhnVPLlItEzpc7LlZYHcwHJCSHrifjYLF/rGAC0l2G7X064l
 0mFpJtd99rqbVlOs96qjIcCmtkjdReiO7I6H/hLAzsvJ9BoWbNOKdRiUV3NNiqpU4F5o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lqOON-00Gg6a-0l
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 23:10:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F28F60C3E;
 Mon,  7 Jun 2021 23:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623107441;
 bh=1bSIRoG6js0fx1U5kfE5STZ/NsYbzt82zJBBdS6OFhM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=de0+u51454Z6wPkYZD8MISzlMio99uJFS/mWy6PC6iNYkV0xZhWp+mzjLaMK/YVZm
 /zup9gPSsWdc/0SrSPJr8RlffYcY5sjWl8Y8sfU3VFTwut/GpRG77pz7E05rb3vmSh
 cnYmYgUIWaZKzdfsGMfKf3b2vdAgjPTrfJOvFp4O7W+kulXhS7qwo7E5uks43bELPd
 87SUOrzj6E2jXrfN0sOx7ZrwGQg3qHdCUL48PWIUlT6OfdtIYEq5ksoexInDBkifTb
 sa91QsEU0ik92DXLY+oMZKD8Zs2R8EfH25LfqyVycV2BPIloU90dslrYatXbrccVWs
 H3ql6mZPyn7cQ==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210525205138.2512855-1-jaegeuk@kernel.org>
 <17318ac1-19e7-dfed-35f8-65a8e325fc61@kernel.org>
 <YL5Oth8oKnV7h8Pm@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <53531f1e-7232-df4d-3a43-43db0e8581f1@kernel.org>
Date: Tue, 8 Jun 2021 07:10:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YL5Oth8oKnV7h8Pm@google.com>
Content-Language: en-US
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lqOON-00Gg6a-0l
Subject: Re: [f2fs-dev] [PATCH] sload.f2fs: use F2FS_COMPRESS_RELEASED
 instead of IMMUTABLE bit
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

On 2021/6/8 0:52, Jaegeuk Kim wrote:
> On 06/06, Chao Yu wrote:
>> On 2021/5/26 4:51, Jaegeuk Kim wrote:
>>> Let's use F2FS_COMPRESS_RELEASED to disallow writes only.
>>>
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>
>> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Too late, as I published it in master.

Oops, sorry for the delay.

So does the patch "f2fs-tools: support small RO partition"?

Thanks,

> 
>>
>> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

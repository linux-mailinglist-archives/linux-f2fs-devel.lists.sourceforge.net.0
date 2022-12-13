Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DED64AD54
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Dec 2022 02:46:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4uNi-000206-3j;
	Tue, 13 Dec 2022 01:46:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p4uNh-000200-3P
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 01:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VdlYKClYg0wJEaflRx6HXXOWyCZS+RcahXunHnfze/c=; b=N7RZZsnKowmHwJgA1FX0TchEVT
 bRSImhnjrgqkKkRYLIuUKbM2yBhUNNbFJuHBVynalxcgc4P8RS79HS/UvcOMOlb7z6wmwXurgc7NH
 Wd+UmYv6epJZ8y9xq3i39s+Y7REhy1w+56KBa1PgYtQichcZa2yRc/7vEDCDsX5fveTE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VdlYKClYg0wJEaflRx6HXXOWyCZS+RcahXunHnfze/c=; b=OW7OPqlvnkAhJuDUWZMKPpFYTt
 nJnMZ/3KnQoQLZMOIfn5Bp02p9yLD73w5FXZsuWj2hnm5+CmAB3rzaZl4LkNw8XhzLoqHHX3CBj2h
 TaOE6WHkceU87ZAl5FGDluYlrbP939O/+UMsgqLM9B2oGLu1hGN2XGe/NIC0XHnhwBPc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4uNg-00FIb3-F6 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 01:46:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12B20612EE;
 Tue, 13 Dec 2022 01:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C08C433EF;
 Tue, 13 Dec 2022 01:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670896006;
 bh=b492jcWSHExPhifU02diqtfeCSUJqNIU0MHaeSHNsgs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tCWz3ghvT7KvybgeJgSPd5ymmNqE2Q2l7U6FpjpqZqjYFxSrln54n805iVzdfQ/Q9
 NYsCvwvrXJNGunFUaXHbwUAKRMsxJ5KK0e4Bj4oMbuWTzIBaMuyo77Ujlcchi1ASjw
 /AvBW6vZhmt3K59u1fmGaEPE31GulLwOSE31u2Zo5RWs69LKBVwZh5Jxn3aU3oRBz9
 TOz3cPPOSNTyGIno2TWpxINHSyEju9zL2u2+f7RWlhMIbU34VRI9JA9Y9WYxv+sDdK
 DUKpk67UhORQK41+dTa4s8ud5p43UpUOaiBszuslozDhGttUUIy/0Dl53eMRWusTCW
 oFscnuwbkruAg==
Message-ID: <ddf243c9-f557-7f11-1964-8d2324f84092@kernel.org>
Date: Tue, 13 Dec 2022 09:46:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20221205145603.70779-1-frank.li@vivo.com>
 <38ab73c5-4865-188f-9554-6bcaec7cc78b@kernel.org>
 <Y5eyPe7Yqz2xpluU@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y5eyPe7Yqz2xpluU@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/13 6:59, Jaegeuk Kim wrote: > On 12/11, Chao Yu
 wrote: >> On 2022/12/5 22:56, Yangtao Li wrote: >>> Just like other data
 we count uses the number of bytes as the basic unit, >>> but discard [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4uNg-00FIb3-F6
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix iostat parameter for discard
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/12/13 6:59, Jaegeuk Kim wrote:
> On 12/11, Chao Yu wrote:
>> On 2022/12/5 22:56, Yangtao Li wrote:
>>> Just like other data we count uses the number of bytes as the basic unit,
>>> but discard uses the number of cmds as the statistical unit. In fact the
>>> discard command contains the number of blocks, so let's change to the
>>> number of bytes as the base unit.
>>>
>>> Fixes: b0af6d491a6b ("f2fs: add app/fs io stat")
>>>
>>> Signed-off-by: Yangtao Li <frank.li@vivo.com>
>>> ---
>>>    fs/f2fs/segment.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>> index 9486ca49ecb1..bc262e17b279 100644
>>> --- a/fs/f2fs/segment.c
>>> +++ b/fs/f2fs/segment.c
>>> @@ -1181,7 +1181,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>>>    		atomic_inc(&dcc->issued_discard);
>>> -		f2fs_update_iostat(sbi, NULL, FS_DISCARD, 1);
>>> +		f2fs_update_iostat(sbi, NULL, FS_DISCARD, len * F2FS_BLKSIZE);
>>
>> In order to avoid breaking its usage of application, how about keeping
>> FS_DISCARD as it is, and add FS_DISCARD_IO to account discard bytes?
> 
> I picked this to match the f2fs_update_iostat() definition. Do we know
> how many applications will be affected? I don't have any at a glance in
> Android tho.

I guess there is some private scripts in OEM rely on this, and I don't
see any non-Android users using this.

> 
> void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
>                          enum iostat_type type, unsigned long long io_bytes)

What do you think of extending this function to support io_counts?

void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
			enum iostat_type type, unsigned long long io_bytes,
			unsigned long long io_counts)

Thanks,

> 
> 
>>
>> Thanks,
>>
>>>    		lstart += len;
>>>    		start += len;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

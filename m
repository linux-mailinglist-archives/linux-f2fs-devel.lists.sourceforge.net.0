Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C20D11790
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 10:24:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJmHs2AvmRKC9r/iihZTjOqJSYYOdf9wTFE6iUobKbU=; b=D+08qaeHxO7l5VsgEhtmkw9GHr
	LeMiYjWIcGAQzxwJxngdhhIgkR6GlqawAKWfcLGgPihYN222LpDaTrp5bg7gWI5ho+CMLLOaeim7B
	9NwFbP/GoESx3l9KSRG+FzlZZB2c+F1Fs1tPKphDDLYw/h44FbQEJy8l4Kgetl07uoX8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfE9l-0002cJ-Rb;
	Mon, 12 Jan 2026 09:24:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vfE9k-0002cD-8r
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 09:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iFQ36reYkD/4OzfiFSoPNj2nKAEEuW7/yGAnKqreg8g=; b=mY0mCr2ZZHtqMbdRIeDuqyTVmu
 7pyEBHRajXeHNu6vd28TgEBHGDP2ttb0dakM7mGRMAKUCS1UszoGdZI+pFc7glG1O3CFQv1XfXidS
 x+3MlXWrw/ShfkpQMSGjNhmuc0b67b/U2RDAB3Jdh3QFZBlPxdCUVDcTIchEhJKFNwDc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iFQ36reYkD/4OzfiFSoPNj2nKAEEuW7/yGAnKqreg8g=; b=CjAX3xxGrs815kfeCCfkRUGcQR
 A/bE8iLIV9SS3blh5RbkJFbEfgXaFS4yUcSUmvk9+c0HqrBse/aguFOAsudc9rw+o6JoyyvdMmO3K
 +fwpn4jMQaUdExs2FyKrO4jen9L01hjmjzo6XP454L1Z7zHNcbBrBeETiXwLhEOixsPg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfE9k-0000Za-MN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 09:24:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 49A2F418EC;
 Mon, 12 Jan 2026 09:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A2DC116D0;
 Mon, 12 Jan 2026 09:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768209847;
 bh=5LJExeGODMsSIpIYpTEkFA1z1A6Ijpae+jp4pVQ2bD4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=g+THGGg8HS3NecvEKmFObwb8U28bvBGlDZGMqneEFNzb9Yo66iDPyM6oo+cnXSPb2
 zjPpXuABz+8j7onvx9nnJCH2aH+4Xji0nC+Rl4xHOv3ZNdUvIsV0g/OF+VbnCESpB5
 zJ1h+QJdk2/UDNMICp8xv2iZdfv5z6A7qbQAss58bd9uw3PWeUOqon1LEJb6RG7FLv
 tN45I8EWucb7PotIBmE8zThq9lQxzAj6kk79IdDpb3GVzHWv0H/wdG/JV9wuTEF6Qx
 pwKrvoKDl3jV2xs5JtcdBs84bCzwtJN+PgS3xF1D+1O7GSysBYWksIlFhRNktnMoTI
 gBY2kZRoyFEOQ==
Message-ID: <5158ff31-bd7b-4071-b2b1-12cb75c858dd@kernel.org>
Date: Mon, 12 Jan 2026 17:24:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nanzhe Zhao <nzzhao@126.com>
References: <20260111100941.119765-1-nzzhao@126.com>
 <20260111100941.119765-2-nzzhao@126.com>
 <0aca7d1f-b323-4e14-b33c-8e2f0b9e63ea@kernel.org>
 <13c7c3ce.71fa.19bb1687da1.Coremail.nzzhao@126.com>
Content-Language: en-US
In-Reply-To: <13c7c3ce.71fa.19bb1687da1.Coremail.nzzhao@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/12/2026 4:52 PM, Nanzhe Zhao wrote: > > At 2026-01-12
 09:02:48, "Chao Yu" <chao@kernel.org> wrote: >>> @@ -2545, 6 +2548,
 11 @@ static
 int f2fs_read_data_large_folio(struct inode *inode, >>> } >>> [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfE9k-0000Za-MN
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: add 'folio_in_bio' to handle
 readahead folios with no BIO submission
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/12/2026 4:52 PM, Nanzhe Zhao wrote:
> 
> At 2026-01-12 09:02:48, "Chao Yu" <chao@kernel.org> wrote:
>>> @@ -2545,6 +2548,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>>>    	}
>>>    	trace_f2fs_read_folio(folio, DATA);
>>>    	if (rac) {
>>> +		if (!folio_in_bio) {
>>> +			if (!ret)
>>
>> ret should never be true here?
>>
>> Thanks,
> Yes.Need I send a v3 patch to remove the redundant check?

Yes, I think so.

Thanks,

> 
> Thanks,
> Nanzhe Zhao



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

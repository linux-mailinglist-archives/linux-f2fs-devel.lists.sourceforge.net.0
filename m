Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A72ADC77D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 12:05:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5vHwLMGKHYON2i7iMvtid5YOK987ECh+YIk59wkfSc=; b=i8ZqbonXhzdUc+EXG9k9T5AriI
	Q6YefWz/3/aOY87S2sF6st1+AdhaMdh16MTu6fcWHcv3v4nfwDADUALOmqxhhxN2YVZ0N6JP3tBie
	i7VVMuK91oV0NRVMh9vy/3VZK/YaFteRQUADdHwqutpyci3AuRnyJjECsjYHwWfyRIJo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRTCL-0004QL-Jh;
	Tue, 17 Jun 2025 10:05:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uRTCI-0004Pw-ER
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 10:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UGSEGvuiA9UAPwj2rWxp+/CXQNg0Mdxcwm/O10+dlIc=; b=cejdF2oupJ3ZtWoHeHHmWQzqy8
 ByYoJAFN/vvbsY2DhEssTxTR8MLR3FWX62hWvQnrfwaOnqJ9jTsKgzWeScs40+BObwquw3bggBJxr
 vmg6k3acyLaMII6eWkRBMXrOs54Ycip64sd+oT/HtrljC1FiC3aPaapa+3PNcNrmArR4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UGSEGvuiA9UAPwj2rWxp+/CXQNg0Mdxcwm/O10+dlIc=; b=PongfuhtEoQ9UyO93I02o8IxXr
 zhgnhHFQCjFNk9QSPJ2zyZcZXU06tnNIY0xsYOTkUd17Hq9mILCRrs+s1WbDKD5+PReOHorUzADIU
 wVlEMiFD9HOMBJeu9XGCcML7By+GAUM/Tabiwi73Kbb7nZP+G6OKENlJIdJNNXpHhVj0=;
Received: from mta22.honor.com ([81.70.192.198] helo=mta22.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRTCH-0003Al-Mo for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 10:05:42 +0000
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=To:From;
 bh=UGSEGvuiA9UAPwj2rWxp+/CXQNg0Mdxcwm/O10+dlIc=;
 b=V9mQXDRgFt8vRoCmggPITtVQdh2gnb+73QRPVKiqm/ytG8bfcagjpbJxqdqt4ynpgSgU3E82y
 gQmhlVzW0Rs3sIt40LuzAjsh/IWNb0CV5kAUmmjbfzBlDRrevr/IY01uJTOZcDb38iCuuwq8crQ
 4SQEt5IjlkuaKMZLYoGf1h0=
Received: from w001.hihonor.com (unknown [10.68.25.235])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bM2WL2pYMzYkxhb;
 Tue, 17 Jun 2025 18:03:26 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 17 Jun
 2025 18:05:27 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 17 Jun
 2025 18:05:27 +0800
From: wangzijie <wangzijie1@honor.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Tue, 17 Jun 2025 18:05:27 +0800
Message-ID: <20250617100527.2373435-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e6a2233f-5f32-4e1a-87b3-4ecb935e3997@kernel.org>
References: <e6a2233f-5f32-4e1a-87b3-4ecb935e3997@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w010.hihonor.com (10.68.28.113) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 6/17/25 15:36, wangzijie wrote: >>> On 6/17/25 11:57,
 wangzijie wrote: >>>> To prevent non-section-aligned size pinned file
 generated
 from truncation, >>>> add check condition in setattr. >>>> >>> [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uRTCH-0003Al-Mo
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: avoid non-section-aligned size
 pinned file generation
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
Cc: jaegeuk@kernel.org, wangzijie1@honor.com, linux-kernel@vger.kernel.org,
 feng.han@honor.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>On 6/17/25 15:36, wangzijie wrote:
>>> On 6/17/25 11:57, wangzijie wrote:
>>>> To prevent non-section-aligned size pinned file generated from truncation,
>>>> add check condition in setattr.
>>>>
>>>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>>>> ---
>>>>  fs/f2fs/file.c | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>> index 6bd3de64f..72f7d1b4a 100644
>>>> --- a/fs/f2fs/file.c
>>>> +++ b/fs/f2fs/file.c
>>>> @@ -1026,6 +1026,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>>>  {
>>>>  	struct inode *inode = d_inode(dentry);
>>>>  	struct f2fs_inode_info *fi = F2FS_I(inode);
>>>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>>>  	int err;
>>>>  
>>>>  	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
>>>> @@ -1047,6 +1048,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>>>  			!IS_ALIGNED(attr->ia_size,
>>>>  			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>>>>  			return -EINVAL;
>>>> +		if (f2fs_is_pinned_file(inode) &&
>>>> +			attr->ia_size < i_size_read(inode) &&
>>>
>>> Do we need to consider attr->ia_size > i_size case?
>>>
>>> Thanks,
>> 
>> Hi, Chao
>> After commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned
>> files"), when we want to write data to pinned file, we need to use pin+fallocate, 
>> and we did CAP_BLKS_PER_SEC roundup align when fallocate pinned file:
>> 
>> block_t sec_len = roundup(map.m_len, sec_blks);
>> 
>> Even if we truncate the file to a larger size(maybe larger than sec_len, section
>> align or not), and write data to offset beyond sec_len, the write will fail(commit
>> 3fdd89b452c2 prevent it). The scattered pin block cannot be generated by this way,
>> so I did not consider attr->ia_size > i_size case.
>> Do you have some suggestions?
>
>Ah, correct, so what about adding comments here to describe why we don't
>need consider attr->ia_size > i_size case?

OK, I will add comments in next version.

>> 
>>>> +			!IS_ALIGNED(attr->ia_size,
>>>> +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
>>>> +			return -EINVAL;
>>>>  	}
>>>>  
>>>>  	err = setattr_prepare(idmap, dentry, attr);
>> 
>> 
>> 





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

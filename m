Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6944DAEEC3F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Jul 2025 03:53:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXSzES/Fao1z5o8ou3SGkGCU/JZZrdG8/H01a/t2fJ0=; b=hNgj5QibXZ9q3/Ge3qpnvyslZ9
	830eywxPs5Emy+wGyqRUnBzPxraW288tv3AT3ZT7llIaimA0Y721jJugomyetf+he8uLkcUN+ZLgz
	rb8MZcj0e3UfeivrSgkO429lkhal5wzTDtq1Yh3xgpgaW1E7PHrbV+liJpZfFiBeRwn0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWQBc-0007WL-VJ;
	Tue, 01 Jul 2025 01:53:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uWQBc-0007WF-9z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 01:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CzLVF+OdJ4rPOyfgWhzZMsL6Rpd9UR6mT9Ip2y6JX/0=; b=jcH1VmMyppJLbCudpqejzerWJa
 EW00a5itGUlSn8k6O0rTYMCCq3zsd2lwj291ypXG/8MTJWgFzFzSlCOihvILmdP8S+QgaAGJkd6Tr
 Ud8MkF+CvnErQt4uhbdn078MW9ivRaezD/KVA5FVBYUd7FMAWvNjNBRsoTb6mU357eaw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CzLVF+OdJ4rPOyfgWhzZMsL6Rpd9UR6mT9Ip2y6JX/0=; b=NU0+YOCPvIeTprDH8MgHH5t0ou
 nEKT0400ubINNir419UCT5vzoJqEpwZvdtX3HpUbps7wapUn9aLsfhMT93xoxRKModkGLedilBy83
 GteiRJQL+Inm6oiXBoilAbardBiuU5KwaKvwdqxl6EZ3+GBGbNcMgS/4RKAVBqjQNBOw=;
Received: from mta22.honor.com ([81.70.192.198] helo=mta22.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWQBb-0005Lz-J9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 01:53:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=To:From;
 bh=CzLVF+OdJ4rPOyfgWhzZMsL6Rpd9UR6mT9Ip2y6JX/0=;
 b=UGHnmP+CpE+C+0MvQjaC3u6HEzXVfoq5805ntOM0lcsAx14xyTvSAu1VkU+/At//9zPVMgHze
 oA1fxhRFuZ2nxD8yFhOrnLF4QBSHYYwwBXvWNYfwj5Rv6bDKTCxme3Mn0WZyD2AhxOVkGvTSMXo
 TSYrzO9Ck3cwGvd+h/V5vz0=
Received: from w001.hihonor.com (unknown [10.68.25.235])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bWQwr5pKqzYm8BD;
 Tue,  1 Jul 2025 09:51:08 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 1 Jul
 2025 09:53:15 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 1 Jul
 2025 09:53:15 +0800
From: wangzijie <wangzijie1@honor.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Tue, 1 Jul 2025 09:53:14 +0800
Message-ID: <20250701015314.3992659-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aGK85SAE9kDcVAMe@google.com>
References: <aGK85SAE9kDcVAMe@google.com>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w010.hihonor.com (10.68.28.113) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: >I think we can clean up more like this? >
 >https://lore.kernel.org/linux-f2fs-devel/20250630160839.1142073-1-jaegeuk@kernel.org/T/#u
 Hi Kim, Yes, I think we can apply the patch you showed and v4 of this patch.
 Thank you. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uWQBb-0005Lz-J9
Subject: Re: [f2fs-dev] [PATCH v5 2/2] f2fs: don't allow unaligned
 truncation to smaller/equal size on pinned file
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

>I think we can clean up more like this?
>
>https://lore.kernel.org/linux-f2fs-devel/20250630160839.1142073-1-jaegeuk@kernel.org/T/#u

Hi Kim,
Yes, I think we can apply the patch you showed and v4 of this patch. Thank you.
 
https://lore.kernel.org/linux-f2fs-devel/20250624035938.3176350-1-wangzijie1@honor.com/
https://lore.kernel.org/linux-f2fs-devel/20250624035938.3176350-2-wangzijie1@honor.com/

>On 06/30, wangzijie wrote:
>> To prevent scattered pin block generation, don't allow non-section aligned truncation
>> to smaller or equal size on pinned file. But for truncation to larger size, after
>> commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
>> we only support overwrite IO to pinned file, so we don't need to consider
>> attr->ia_size > i_size case.
>> In addition, xfstests #494 assumes truncation on active swapfile(pinned) will return
>> ETXTBSY by setattr_prepare() -> inode_newsize_ok(), so we relocate this check after
>> setattr_prepare().
>> 
>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>> ---
>> v5:
>> - fix xfstests #494 fail
>> ---
>>  fs/f2fs/file.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>> 
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 78368b793..d4feea44b 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -1070,6 +1070,23 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>  	if (err)
>>  		return err;
>>  
>> +	/*
>> +	 * To prevent scattered pin block generation, we don't allow
>> +	 * smaller/equal size unaligned truncation for pinned file.
>> +	 * We only support overwrite IO to pinned file, so don't
>> +	 * care about larger size truncation.
>> +	 * We need to check this after setattr_prepare() because xfstests
>> +	 * #494 assumes truncation on active swapfile(pinned) will
>> +	 * return ETXTBSY by setattr_prepare() -> inode_newsize_ok().
>> +	 */
>> +	if (attr->ia_valid & ATTR_SIZE) {
>> +		if (f2fs_is_pinned_file(inode) &&
>> +			attr->ia_size <= i_size_read(inode) &&
>> +			!IS_ALIGNED(attr->ia_size,
>> +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
>> +			return -EINVAL;
>> +	}
>> +
>>  	err = fscrypt_prepare_setattr(dentry, attr);
>>  	if (err)
>>  		return err;
>> -- 
>> 2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 863EE828F7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2019 03:01:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hunqW-0007C5-CS; Tue, 06 Aug 2019 01:01:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hunqV-0007By-5F
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 01:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K8jLiycGaRyfW7YxBqHdSoa9mb4YMg1WU77eQ8eh6Co=; b=KRak3nwyXpkQVayP0V14eKond7
 XAlnc5zyMkr5L1ApRsu9oGOsgrcTI7dRWwRqUvILdj4Edz7Ep72irt2oXgc33ZbiRq+yofE5fINlw
 BqA4X1a5p9dM/J4CeejP7kvDIyRP8sRHfJM3Z2001JhpTsMgklNFLlaLcwHW7CSd7RwM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K8jLiycGaRyfW7YxBqHdSoa9mb4YMg1WU77eQ8eh6Co=; b=brhk/nSeWtrwkqfOnADpXPZjmz
 c/wwJxfm3G9Oyb5K7h8rtZiN3lQ+vQUhtyVsnShu33MKUDIAe6JYCZU8g+hyJW2IAS4ytfmfU7sJl
 nKSPK3FBsqDLy+rLaSFCZbG2Ofz2fPe1n5ygthXF3Vt6Hn/Fdc5UGE46ockK7UTNdXiU=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hunqR-00CK63-A0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 01:00:59 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A4B06991F57FA1B84805;
 Tue,  6 Aug 2019 09:00:48 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 6 Aug 2019
 09:00:44 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190729150351.12223-1-chao@kernel.org>
 <20190730231850.GA7097@jaegeuk-macbookpro.roam.corp.google.com>
 <c7232d80-a4d8-88ae-2eca-01290dd0e56a@huawei.com>
 <20190801042215.GC84433@jaegeuk-macbookpro.roam.corp.google.com>
 <345c55ea-01c2-a9d1-4367-716dbd08ae9d@huawei.com>
 <20190801223509.GB27597@jaegeuk-macbookpro.roam.corp.google.com>
 <8e906ddb-81d8-b63e-0c19-1ee9fc7f5cbf@huawei.com>
 <20190806003522.GA98101@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e48514d5-0f3f-8dd7-06ab-b7faf71101ba@huawei.com>
Date: Tue, 6 Aug 2019 09:01:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190806003522.GA98101@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hunqR-00CK63-A0
Subject: Re: [f2fs-dev] [PATCH v3 RESEND] f2fs: introduce
 sb.required_features to store incompatible features
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/8/6 8:35, Jaegeuk Kim wrote:
> On 08/02, Chao Yu wrote:
>> On 2019/8/2 6:35, Jaegeuk Kim wrote:
>>> On 08/01, Chao Yu wrote:
>>>> On 2019/8/1 12:22, Jaegeuk Kim wrote:
>>>>> On 07/31, Chao Yu wrote:
>>>>>> On 2019/7/31 7:18, Jaegeuk Kim wrote:
>>>>>>> On 07/29, Chao Yu wrote:
>>>>>>>> From: Chao Yu <yuchao0@huawei.com>
>>>>>>>>
>>>>>>>> Later after this patch was merged, all new incompatible feature's
>>>>>>>> bit should be added into sb.required_features field, and define new
>>>>>>>> feature function with F2FS_INCOMPAT_FEATURE_FUNCS() macro.
>>>>>>>>
>>>>>>>> Then during mount, we will do sanity check with enabled features in
>>>>>>>> image, if there are features in sb.required_features that kernel can
>>>>>>>> not recognize, just fail the mount.
>>>>>>>>
>>>>>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>>>>>>> ---
>>>>>>>> v3:
>>>>>>>> - change commit title.
>>>>>>>> - fix wrong macro name.
>>>>>>>>  fs/f2fs/f2fs.h          | 15 +++++++++++++++
>>>>>>>>  fs/f2fs/super.c         | 10 ++++++++++
>>>>>>>>  include/linux/f2fs_fs.h |  3 ++-
>>>>>>>>  3 files changed, 27 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>>>>>>> index a6eb828af57f..b8e17d4ddb8d 100644
>>>>>>>> --- a/fs/f2fs/f2fs.h
>>>>>>>> +++ b/fs/f2fs/f2fs.h
>>>>>>>> @@ -163,6 +163,15 @@ struct f2fs_mount_info {
>>>>>>>>  #define F2FS_CLEAR_FEATURE(sbi, mask)					\
>>>>>>>>  	(sbi->raw_super->feature &= ~cpu_to_le32(mask))
>>>>>>>>  
>>>>>>>> +#define F2FS_INCOMPAT_FEATURES		0
>>>>>>>> +
>>>>>>>> +#define F2FS_HAS_INCOMPAT_FEATURE(sbi, mask)				\
>>>>>>>> +	((sbi->raw_super->required_features & cpu_to_le32(mask)) != 0)
>>>>>>>> +#define F2FS_SET_INCOMPAT_FEATURE(sbi, mask)				\
>>>>>>>> +	(sbi->raw_super->required_features |= cpu_to_le32(mask))
>>>>>>>> +#define F2FS_CLEAR_INCOMPAT_FEATURE(sbi, mask)				\
>>>>>>>> +	(sbi->raw_super->required_features &= ~cpu_to_le32(mask))
>>>>>>>> +
>>>>>>>>  /*
>>>>>>>>   * Default values for user and/or group using reserved blocks
>>>>>>>>   */
>>>>>>>> @@ -3585,6 +3594,12 @@ F2FS_FEATURE_FUNCS(lost_found, LOST_FOUND);
>>>>>>>>  F2FS_FEATURE_FUNCS(sb_chksum, SB_CHKSUM);
>>>>>>>>  F2FS_FEATURE_FUNCS(casefold, CASEFOLD);
>>>>>>>>  
>>>>>>>> +#define F2FS_INCOMPAT_FEATURE_FUNCS(name, flagname) \
>>>>>>>> +static inline int f2fs_sb_has_##name(struct f2fs_sb_info *sbi) \
>>>>>>>> +{ \
>>>>>>>> +	return F2FS_HAS_INCOMPAT_FEATURE(sbi, F2FS_FEATURE_##flagname); \
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>  #ifdef CONFIG_BLK_DEV_ZONED
>>>>>>>>  static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
>>>>>>>>  				    block_t blkaddr)
>>>>>>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>>>>>>> index 5540fee0fe3f..3701dcce90e6 100644
>>>>>>>> --- a/fs/f2fs/super.c
>>>>>>>> +++ b/fs/f2fs/super.c
>>>>>>>> @@ -2513,6 +2513,16 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
>>>>>>>>  		return -EINVAL;
>>>>>>>>  	}
>>>>>>>>  
>>>>>>>> +	/* check whether current kernel supports all features on image */
>>>>>>>> +	if (le32_to_cpu(raw_super->required_features) &
>>>>>>>
>>>>>>> ...
>>>>>>> #define F2FS_FEATURE_VERITY	0x0400	/* reserved */
>>>>>>> ...
>>>>>>> #define F2FS_FEATURE_CASEFOLD	0x1000
>>>>>>> #define F2FS_FEATURE_SUPPORT	0x1BFF
>>>>>>>
>>>>>>> 	if (le32_to_cpu(raw_super->required_features) & ~F2FS_FEATURE_SUPPORT) {
>>>>>>> 		...
>>>>>>> 		return -EINVAL;
>>>>>>> 	}
>>>>>>
>>>>>> Um, I thought .required_features are used to store new feature flags from 0x0.
>>>>>>
>>>>>> All 'F2FS_FEATURE_SUPPORT' bits should be stored in sb.feature instead of
>>>>>> sb.required_features, I'm confused...
>>>>>
>>>>> I'm thinking,
>>>>>
>>>>> f2fs-tools     sb->required_features     f2fs    F2FS_FEATURE_SUPPORT
>>>>> v0             0                         v0      no_check -> ok
>>>>> v1             0x1BFF                    v0      no_check -> ok
>>>>> v0             0                         v1      0x1BFF -> ok
>>>>> v1             0x1BFF                    v1      0x1BFF -> ok
>>>>> v2             0x3BFF                    v1      0x1BFF -> fail
>>>>> v1             0x1BFF                    v2      0x3BFF -> ok
>>>>> v2             0x3BFF                    v2      0x3BFF -> ok
>>>>
>>>> I see, it's a bit waste for 0x1FFF low bits in sb->required_features. Why not
>>>> leaving 0x0FFF in sb->feature w/o sanity check. And make all new incompatible
>>>> features (including casefold) adding into sb->required_features.
>>>
>>> I don't think we can define like this, and we still have 32bits feature filed.
>>> This would give another confusion to understand. VERITY is reserved only now.
>>>
>>> #define F2FS_FEATURE_CASEFOLD		0x0001
>>
>> Oops, so you want to make .required_features being almost a mirror of .feature,
>> and do sanity check on it... I can see now. :P
>>
>> If so, why not just use .feature:
> 
> Sometimes, we don't need to set the flag, but not required at some point.
> (e.g., verify)

Sorry, I'm not sure whether I have understood your point... :(

IIUC of your point, we have defined F2FS_FEATURE_SUPPORT (0x0BFF) which excludes
F2FS_FEATURE_VERITY (0x0400) feature bit, then once verity feature merged in
kernel, we can add it into F2FS_FEATURE_SUPPORT, any problem we may face here?

Thanks

> 
>>
>> kernel	tool
>> v5.2 .. 1.12
>> #define	F2FS_FEATURE_SUPPORT		0x0BFF
>>
>> v5.3 .. 1.13
>> #define F2FS_FEATURE_CASEFOLD		0x1000
>> #define	F2FS_FEATURE_SUPPORT		0x1BFF
>>
>> v5.4 .. 1.14
>> #define F2FS_FEATURE_CASEFOLD		0x1000
>> #define F2FS_FEATURE_COMPRESS		0x2000
>> #define	F2FS_FEATURE_SUPPORT		0x3BFF
>>
>> f2fs-tools	sb->feature		f2fs	F2FS_FEATURE_SUPPORT
>>
>> [enable all features in tools]
>> v1.12		0x0BFF			v5.2	no_check -> ok
>> v1.12		0x0BFF			v5.3	0x1BFF -> ok
>> v1.12		0x0BFF			v5.4	0x3BFF -> ok
>>
>> v1.13		0x1BFF			v5.2	that's issue we need to fix
>> v1.13		0x1BFF			v5.3	0x1BFF -> ok
>> v1.13		0x1BFF			v5.4	0x3BFF -> ok
>>
>> v1.14		0x3BFF			v5.2	that's issue we need to fix
>> v1.14		0x3BFF			v5.3	0x1BFF -> fail
>> v1.14		0x3BFF			v5.4	0x3BFF -> ok
>>
>> Or am I missing something?
>>
>> Thanks,
>>
>>>
>>>>
>>>> Then that would be:
>>>>
>>>> kernel	tool
>>>> v5.2 .. 1.12
>>>> #define	F2FS_FEATURE_SUPPORT		0x0000
>>>>
>>>> v5.3 .. 1.13
>>>> #define F2FS_FEATURE_CASEFOLD		0x0001
>>>> #define	F2FS_FEATURE_SUPPORT		0x0001
>>>>
>>>> v5.4 .. 1.14
>>>> #define F2FS_FEATURE_CASEFOLD		0x0001
>>>> #define F2FS_FEATURE_COMPRESS		0x0002
>>>> #define	F2FS_FEATURE_SUPPORT		0x0003
>>>>
>>>> f2fs-tools	sb->required_features	f2fs	F2FS_FEATURE_SUPPORT
>>>>
>>>> v1.12		0x0000			v5.2	no_check -> ok
>>>> v1.12		0x0000			v5.3	0x0001 -> ok
>>>> v1.12		0x0000			v5.4	0x0003 -> ok
>>>>
>>>> v1.13		0x0001			v5.2	that's issue we need to fix
>>>> v1.13		0x0001			v5.3	0x0001 -> ok
>>>> v1.13		0x0001			v5.4	0x0003 -> ok
>>>>
>>>> v1.14		0x0003			v5.2	that's issue we need to fix
>>>> v1.14		0x0003			v5.3	0x0001 -> fail
>>>> v1.14		0x0003			v5.4	0x0003 -> ok
>>>>
>>>> And all compatible features can be added into sb->feature[_VERITY, ....].
>>>>
>>>> Would that okay to you?
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> +			~F2FS_INCOMPAT_FEATURES) {
>>>>>>>> +		f2fs_info(sbi, "Unsupported feature: %x: supported: %x",
>>>>>>>> +			  le32_to_cpu(raw_super->required_features) ^
>>>>>>>> +			  F2FS_INCOMPAT_FEATURES,
>>>>>>>> +			  F2FS_INCOMPAT_FEATURES);
>>>>>>>> +		return -EINVAL;
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>>  	/* Check checksum_offset and crc in superblock */
>>>>>>>>  	if (__F2FS_HAS_FEATURE(raw_super, F2FS_FEATURE_SB_CHKSUM)) {
>>>>>>>>  		crc_offset = le32_to_cpu(raw_super->checksum_offset);
>>>>>>>> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
>>>>>>>> index a2b36b2e286f..4141be3f219c 100644
>>>>>>>> --- a/include/linux/f2fs_fs.h
>>>>>>>> +++ b/include/linux/f2fs_fs.h
>>>>>>>> @@ -117,7 +117,8 @@ struct f2fs_super_block {
>>>>>>>>  	__u8 hot_ext_count;		/* # of hot file extension */
>>>>>>>>  	__le16	s_encoding;		/* Filename charset encoding */
>>>>>>>>  	__le16	s_encoding_flags;	/* Filename charset encoding flags */
>>>>>>>> -	__u8 reserved[306];		/* valid reserved region */
>>>>>>>> +	__le32 required_features;       /* incompatible features to old kernel */
>>>>>>>> +	__u8 reserved[302];		/* valid reserved region */
>>>>>>>>  	__le32 crc;			/* checksum of superblock */
>>>>>>>>  } __packed;
>>>>>>>>  
>>>>>>>> -- 
>>>>>>>> 2.22.0
>>>>>>> .
>>>>>>>
>>>>> .
>>>>>
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

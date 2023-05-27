Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0362B7130CC
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 May 2023 02:05:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q2hRC-0005z2-Qd;
	Sat, 27 May 2023 00:05:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q2hRB-0005yv-28
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 May 2023 00:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=REKflrLIlaWLYcjjM1JQdFboJo0J11obtbPkm8ptq1o=; b=NykPW3caNl/uj4WozQHClZjzEm
 NXj3SvoqmdGi1vecKvrEhId3va4ZMLYC15YgTm+NOAPby27zncPKk39eYKg2VzKdQ3HndpUuMoRYg
 94pVKhN/JOne5H5x0MxFMGWpx9kPSCcB1c/d8EPgtu9fIn/qSCuwuprN3D/9gO7fDRt0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=REKflrLIlaWLYcjjM1JQdFboJo0J11obtbPkm8ptq1o=; b=WX6+9VOjRnt74XSbbuKEcHoQHH
 pkx3Z8chmS7Nr3Mn4vdnhxixfnRio3AM6LBE9APmAUlD3DkhpnS2EvfpOAZSEWIwtaa5eeofXeW9y
 cNqRg2uZ91Ulyhnqd87u+hqSLUO/hNF7h3z9WFdbOXxY4+fPFpg3McIMZ3/+P8Pcqpto=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q2hRB-003iX8-5y for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 May 2023 00:05:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B2A6D63D50
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 May 2023 00:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873F1C433D2;
 Sat, 27 May 2023 00:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685145931;
 bh=OtxeRoeV8ysrB1DutqMltSvGzrP7VFJI3zDDRi2+7Zk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dvdKSxWKJYUwKGEJsV+8PQKRAGea8jMtRYsCZ/aBZ+ZE7Unmrek1NGNX7ggEb5pLm
 6WiRI90gxd5WcfT7A6dPt2hlmWP5Nx863HsDfof46VGN6Vj0VI3QdTa2uB4pDKrADk
 Kyj8PEefTOSZclUQjb5OUuU/Q4GymYNL4WW2slnkwERnTbA3DwXY6RbnvDhXsNX5HM
 Sf4Ycce1mphi5fCQIfP6hpT0F9k1s8564ZDEh1Qzp0dWmt/3vl58ZAhQwWzMdvrW9b
 42GTbgUm5alAViL6p333V7E6Mp6oUI1graghAUFW30e0D21F52kiERWBsH7E6Y0yhq
 xlqZTVADsOwMQ==
Message-ID: <0a8de47e-d097-2517-a94e-bf258fd0c18b@kernel.org>
Date: Sat, 27 May 2023 08:05:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230526061129.2999437-1-chao@kernel.org>
 <20230526061129.2999437-2-chao@kernel.org> <ZHDdYjFRwWDcELJw@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZHDdYjFRwWDcELJw@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/27 0:25, Jaegeuk Kim wrote: > On 05/26, Chao Yu
 wrote: >> Signed-off-by: Chao Yu <chao@kernel.org> >> --- >> fsck/mount.c
 | 56 +++++++++++++ >> include/f2fs [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2hRB-003iX8-5y
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs-tools: reuse feature_table in
 print_sb_state()
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

On 2023/5/27 0:25, Jaegeuk Kim wrote:
> On 05/26, Chao Yu wrote:
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fsck/mount.c      | 56 +++++++++++++----------------------------------
>>   include/f2fs_fs.h | 42 +++++++++++++++++++++--------------
>>   2 files changed, 41 insertions(+), 57 deletions(-)
>>
>> diff --git a/fsck/mount.c b/fsck/mount.c
>> index 70e8b46..60ad493 100644
>> --- a/fsck/mount.c
>> +++ b/fsck/mount.c
>> @@ -599,54 +599,28 @@ void print_cp_state(u32 flag)
>>   	MSG(0, "\n");
>>   }
>>   
>> +extern struct feature feature_table[];
>>   void print_sb_state(struct f2fs_super_block *sb)
>>   {
>>   	unsigned int f = get_sb(feature);
>> +	char *name;
>>   	int i;
>>   
>>   	MSG(0, "Info: superblock features = %x : ", f);
>> -	if (f & F2FS_FEATURE_ENCRYPT) {
>> -		MSG(0, "%s", " encrypt");
>> -	}
>> -	if (f & F2FS_FEATURE_VERITY) {
>> -		MSG(0, "%s", " verity");
>> -	}
>> -	if (f & F2FS_FEATURE_BLKZONED) {
>> -		MSG(0, "%s", " blkzoned");
>> -	}
>> -	if (f & F2FS_FEATURE_EXTRA_ATTR) {
>> -		MSG(0, "%s", " extra_attr");
>> -	}
>> -	if (f & F2FS_FEATURE_PRJQUOTA) {
>> -		MSG(0, "%s", " project_quota");
>> -	}
>> -	if (f & F2FS_FEATURE_INODE_CHKSUM) {
>> -		MSG(0, "%s", " inode_checksum");
>> -	}
>> -	if (f & F2FS_FEATURE_FLEXIBLE_INLINE_XATTR) {
>> -		MSG(0, "%s", " flexible_inline_xattr");
>> -	}
>> -	if (f & F2FS_FEATURE_QUOTA_INO) {
>> -		MSG(0, "%s", " quota_ino");
>> -	}
>> -	if (f & F2FS_FEATURE_INODE_CRTIME) {
>> -		MSG(0, "%s", " inode_crtime");
>> -	}
>> -	if (f & F2FS_FEATURE_LOST_FOUND) {
>> -		MSG(0, "%s", " lost_found");
>> -	}
>> -	if (f & F2FS_FEATURE_SB_CHKSUM) {
>> -		MSG(0, "%s", " sb_checksum");
>> -	}
>> -	if (f & F2FS_FEATURE_CASEFOLD) {
>> -		MSG(0, "%s", " casefold");
>> -	}
>> -	if (f & F2FS_FEATURE_COMPRESSION) {
>> -		MSG(0, "%s", " compression");
>> -	}
>> -	if (f & F2FS_FEATURE_RO) {
>> -		MSG(0, "%s", " ro");
>> +
>> +	for (i = 0; i < 32; i++) {
> 
> Need to add a definition for 32?

Agree and fixed.

Thanks,

> 
>> +		unsigned int bit = 1 << i;
>> +
>> +		if (!(f & bit))
>> +			continue;
>> +
>> +		name = feature_name(feature_table, bit);
>> +		if (!name)
>> +			continue;
>> +
>> +		MSG(0, " %s", name);
>>   	}
>> +
>>   	MSG(0, "\n");
>>   	MSG(0, "Info: superblock encrypt level = %d, salt = ",
>>   					sb->encryption_level);
>> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
>> index 9d35b42..a97c974 100644
>> --- a/include/f2fs_fs.h
>> +++ b/include/f2fs_fs.h
>> @@ -1811,35 +1811,45 @@ static inline void f2fs_init_inode(struct f2fs_super_block *sb,
>>   
>>   struct feature {
>>   	char *name;
>> -	u32  mask;
>> +	u32 mask;
>> +	u32 settable;
>>   };
>>   
>>   #define INIT_FEATURE_TABLE						\
>>   struct feature feature_table[] = {					\
>> -	{ "encrypt",			F2FS_FEATURE_ENCRYPT },		\
>> -	{ "extra_attr",			F2FS_FEATURE_EXTRA_ATTR },	\
>> -	{ "project_quota",		F2FS_FEATURE_PRJQUOTA },	\
>> -	{ "inode_checksum",		F2FS_FEATURE_INODE_CHKSUM },	\
>> -	{ "flexible_inline_xattr",	F2FS_FEATURE_FLEXIBLE_INLINE_XATTR },\
>> -	{ "quota",			F2FS_FEATURE_QUOTA_INO },	\
>> -	{ "inode_crtime",		F2FS_FEATURE_INODE_CRTIME },	\
>> -	{ "lost_found",			F2FS_FEATURE_LOST_FOUND },	\
>> -	{ "verity",			F2FS_FEATURE_VERITY },	/* reserved */ \
>> -	{ "sb_checksum",		F2FS_FEATURE_SB_CHKSUM },	\
>> -	{ "casefold",			F2FS_FEATURE_CASEFOLD },	\
>> -	{ "compression",		F2FS_FEATURE_COMPRESSION },	\
>> -	{ "ro",				F2FS_FEATURE_RO},		\
>> -	{ NULL,				0x0},				\
>> +	{ "encrypt",			F2FS_FEATURE_ENCRYPT,		1}, \
>> +	{ "blkzoned",			F2FS_FEATURE_BLKZONED,		0}, \
>> +	{ "extra_attr",			F2FS_FEATURE_EXTRA_ATTR,	1}, \
>> +	{ "project_quota",		F2FS_FEATURE_PRJQUOTA,		1}, \
>> +	{ "inode_checksum",		F2FS_FEATURE_INODE_CHKSUM,	1}, \
>> +	{ "flexible_inline_xattr",	F2FS_FEATURE_FLEXIBLE_INLINE_XATTR,1}, \
>> +	{ "quota",			F2FS_FEATURE_QUOTA_INO,		1}, \
>> +	{ "inode_crtime",		F2FS_FEATURE_INODE_CRTIME,	1}, \
>> +	{ "lost_found",			F2FS_FEATURE_LOST_FOUND,	1}, \
>> +	{ "verity",			F2FS_FEATURE_VERITY,		1}, \
>> +	{ "sb_checksum",		F2FS_FEATURE_SB_CHKSUM,		1}, \
>> +	{ "casefold",			F2FS_FEATURE_CASEFOLD,		1}, \
>> +	{ "compression",		F2FS_FEATURE_COMPRESSION,	1}, \
>> +	{ "ro",				F2FS_FEATURE_RO,		1}, \
>> +	{ NULL,				0x0,				0}, \
>>   };
>>   
>>   static inline u32 feature_map(struct feature *table, char *feature)
>>   {
>>   	struct feature *p;
>> -	for (p = table; p->name && strcmp(p->name, feature); p++)
>> +	for (p = table; p->name && p->settable && strcmp(p->name, feature); p++)
>>   		;
>>   	return p->mask;
>>   }
>>   
>> +static inline char *feature_name(struct feature *table, u32 mask)
>> +{
>> +	struct feature *p;
>> +	for (p = table; p->name && p->mask != mask; p++)
>> +		;
>> +	return p->name;
>> +}
>> +
>>   static inline int set_feature_bits(struct feature *table, char *features)
>>   {
>>   	u32 mask = feature_map(table, features);
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

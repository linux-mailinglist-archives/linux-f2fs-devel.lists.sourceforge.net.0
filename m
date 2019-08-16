Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E478F862
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2019 03:20:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hyQv8-0007rf-JK; Fri, 16 Aug 2019 01:20:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hyQv7-0007rT-1s
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 01:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kT0Kq6K2p0+Jjx05CWKtiq5z1gmoMaHr4jKS32E6si4=; b=iCGJMVlBhn5OrZBpsbK1nf1G4Q
 +FpWOZLkDHSAAJGBYZusSsINtbQLO1ZfG/XB91Lx2CyHdLsAeZnyeEsMm0QIl0lUKANTY4wHcbfBA
 DIGdSK2aa3zZh1Y3+aZJK//h4Y0yzwxUg/+5UR94rQzE3suyLydsQVa9X3VtT34DeaP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kT0Kq6K2p0+Jjx05CWKtiq5z1gmoMaHr4jKS32E6si4=; b=HRlzHoW8Ipe2BIP2CK/uj8Ux5t
 rU7YXpEJcRvGk2QXOydqAZkZRkWX+iCFKd9rqHsecqnvsOu7K+wjW70L9Ki3pSViP7bfiixGysISX
 Ebw27fZDwx5jR+SKnUS81SIas6UA0euoNTkKlTdql1MCacSEU/KywvQuaKx6Hda93HZk=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hyQuz-005MJ1-6v
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 01:20:44 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A9C19166B6DF9E923170;
 Fri, 16 Aug 2019 09:20:29 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 16 Aug
 2019 09:20:25 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190812114527.34613-1-yuchao0@huawei.com>
 <20190812114527.34613-2-yuchao0@huawei.com>
 <20190816010636.GB66488@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <b5146728-e771-1c79-a8d3-bdc5f2ac67fa@huawei.com>
Date: Fri, 16 Aug 2019 09:20:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190816010636.GB66488@jaegeuk-macbookpro.roam.corp.google.com>
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
X-Headers-End: 1hyQuz-005MJ1-6v
Subject: Re: [f2fs-dev] [PATCH 2/4] fsck.f2fs: fix to check c.fix_on before
 repair
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/8/16 9:06, Jaegeuk Kim wrote:
> On 08/12, Chao Yu wrote:
>> We should always set c.bug_on whenever found a bug, then fix them
>> if c.fix_on is on, otherwise, some bugs won't be shown unless we
>> enable debug log.
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fsck/fsck.c | 137 +++++++++++++++++++++++++++++++---------------------
>>  1 file changed, 83 insertions(+), 54 deletions(-)
>>
>> diff --git a/fsck/fsck.c b/fsck/fsck.c
>> index 7eb599d..91ddd49 100644
>> --- a/fsck/fsck.c
>> +++ b/fsck/fsck.c
>> @@ -712,12 +712,13 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
>>  	fsck_reada_node_block(sbi, le32_to_cpu(node_blk->i.i_xattr_nid));
>>  
>>  	if (fsck_chk_xattr_blk(sbi, nid,
>> -			le32_to_cpu(node_blk->i.i_xattr_nid), blk_cnt) &&
>> -			c.fix_on) {
>> -		node_blk->i.i_xattr_nid = 0;
>> -		need_fix = 1;
>> -		FIX_MSG("Remove xattr block: 0x%x, x_nid = 0x%x",
>> -				nid, le32_to_cpu(node_blk->i.i_xattr_nid));
>> +			le32_to_cpu(node_blk->i.i_xattr_nid), blk_cnt)) {
>> +		if (c.fix_on) {
>> +			node_blk->i.i_xattr_nid = 0;
>> +			need_fix = 1;
>> +			FIX_MSG("Remove xattr block: 0x%x, x_nid = 0x%x",
>> +					nid, le32_to_cpu(node_blk->i.i_xattr_nid));
>> +		}
> 
> Why do we need this change?

Actually, it's not necessary, but just cleanup to keep the same style. :P

Thanks,

> 
>>  	}
>>  
>>  	if (ftype == F2FS_FT_CHRDEV || ftype == F2FS_FT_BLKDEV ||
>> @@ -730,24 +731,32 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
>>  
>>  	if (f2fs_has_extra_isize(&node_blk->i)) {
>>  		if (c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR)) {
>> -			if (node_blk->i.i_extra_isize >
>> -				cpu_to_le16(F2FS_TOTAL_EXTRA_ATTR_SIZE)) {
>> -				FIX_MSG("ino[0x%x] recover i_extra_isize "
>> -					"from %u to %u",
>> -					nid,
>> -					le16_to_cpu(node_blk->i.i_extra_isize),
>> -					calc_extra_isize());
>> -				node_blk->i.i_extra_isize =
>> -					cpu_to_le16(calc_extra_isize());
>> -				need_fix = 1;
>> +			unsigned int isize =
>> +				le16_to_cpu(node_blk->i.i_extra_isize);
>> +
>> +			if (isize > F2FS_TOTAL_EXTRA_ATTR_SIZE) {
>> +				ASSERT_MSG("[0x%x] wrong i_extra_isize=0x%x",
>> +						nid, isize);
>> +				if (c.fix_on) {
>> +					FIX_MSG("ino[0x%x] recover i_extra_isize "
>> +						"from %u to %u",
>> +						nid, isize,
>> +						calc_extra_isize());
>> +					node_blk->i.i_extra_isize =
>> +						cpu_to_le16(calc_extra_isize());
>> +					need_fix = 1;
>> +				}
>>  			}
>>  		} else {
>> -			FIX_MSG("ino[0x%x] remove F2FS_EXTRA_ATTR "
>> -				"flag in i_inline:%u",
>> -				nid, node_blk->i.i_inline);
>> -			/* we don't support tuning F2FS_FEATURE_EXTRA_ATTR now */
>> -			node_blk->i.i_inline &= ~F2FS_EXTRA_ATTR;
>> -			need_fix = 1;
>> +			ASSERT_MSG("[0x%x] wrong extra_attr flag", nid);
>> +			if (c.fix_on) {
>> +				FIX_MSG("ino[0x%x] remove F2FS_EXTRA_ATTR "
>> +					"flag in i_inline:%u",
>> +					nid, node_blk->i.i_inline);
>> +				/* we don't support tuning F2FS_FEATURE_EXTRA_ATTR now */
>> +				node_blk->i.i_inline &= ~F2FS_EXTRA_ATTR;
>> +				need_fix = 1;
>> +			}
>>  		}
>>  
>>  		if ((c.feature &
>> @@ -758,13 +767,17 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
>>  
>>  			if (!inline_size ||
>>  					inline_size > MAX_INLINE_XATTR_SIZE) {
>> -				FIX_MSG("ino[0x%x] recover inline xattr size "
>> -					"from %u to %u",
>> -					nid, inline_size,
>> -					DEFAULT_INLINE_XATTR_ADDRS);
>> -				node_blk->i.i_inline_xattr_size =
>> -					cpu_to_le16(DEFAULT_INLINE_XATTR_ADDRS);
>> -				need_fix = 1;
>> +				ASSERT_MSG("[0x%x] wrong inline_xattr_size:%u",
>> +						nid, inline_size);
>> +				if (c.fix_on) {
>> +					FIX_MSG("ino[0x%x] recover inline xattr size "
>> +						"from %u to %u",
>> +						nid, inline_size,
>> +						DEFAULT_INLINE_XATTR_ADDRS);
>> +					node_blk->i.i_inline_xattr_size =
>> +						cpu_to_le16(DEFAULT_INLINE_XATTR_ADDRS);
>> +					need_fix = 1;
>> +				}
>>  			}
>>  		}
>>  	}
>> @@ -772,20 +785,28 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
>>  
>>  	if ((node_blk->i.i_inline & F2FS_INLINE_DATA)) {
>>  		unsigned int inline_size = MAX_INLINE_DATA(node_blk);
>> +		block_t blkaddr = le32_to_cpu(node_blk->i.i_addr[ofs]);
>>  
>> -		if (le32_to_cpu(node_blk->i.i_addr[ofs]) != 0) {
>> -			/* should fix this bug all the time */
>> -			FIX_MSG("inline_data has wrong 0'th block = %x",
>> -					le32_to_cpu(node_blk->i.i_addr[ofs]));
>> -			node_blk->i.i_addr[ofs] = 0;
>> -			node_blk->i.i_blocks = cpu_to_le64(*blk_cnt);
>> -			need_fix = 1;
>> +		if (blkaddr != 0) {
>> +			ASSERT_MSG("[0x%x] wrong inline reserve blkaddr:%u",
>> +					nid, blkaddr);
>> +			if (c.fix_on) {
>> +				FIX_MSG("inline_data has wrong 0'th block = %x",
>> +								blkaddr);
>> +				node_blk->i.i_addr[ofs] = 0;
>> +				node_blk->i.i_blocks = cpu_to_le64(*blk_cnt);
>> +				need_fix = 1;
>> +			}
>>  		}
>>  		if (!i_size || i_size > inline_size) {
>> -			node_blk->i.i_size = cpu_to_le64(inline_size);
>> -			FIX_MSG("inline_data has wrong i_size %lu",
>> -						(unsigned long)i_size);
>> -			need_fix = 1;
>> +			ASSERT_MSG("[0x%x] wrong inline size:%lu",
>> +					nid, (unsigned long)i_size);
>> +			if (c.fix_on) {
>> +				node_blk->i.i_size = cpu_to_le64(inline_size);
>> +				FIX_MSG("inline_data has wrong i_size %lu",
>> +							(unsigned long)i_size);
>> +				need_fix = 1;
>> +			}
>>  		}
>>  		if (!(node_blk->i.i_inline & F2FS_DATA_EXIST)) {
>>  			char buf[MAX_INLINE_DATA(node_blk)];
>> @@ -793,9 +814,12 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
>>  
>>  			if (memcmp(buf, inline_data_addr(node_blk),
>>  						MAX_INLINE_DATA(node_blk))) {
>> -				FIX_MSG("inline_data has DATA_EXIST");
>> -				node_blk->i.i_inline |= F2FS_DATA_EXIST;
>> -				need_fix = 1;
>> +				ASSERT_MSG("[0x%x] junk inline data", nid);
>> +				if (c.fix_on) {
>> +					FIX_MSG("inline_data has DATA_EXIST");
>> +					node_blk->i.i_inline |= F2FS_DATA_EXIST;
>> +					need_fix = 1;
>> +				}
>>  			}
>>  		}
>>  		DBG(3, "ino[0x%x] has inline data!\n", nid);
>> @@ -804,20 +828,25 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
>>  	}
>>  
>>  	if ((node_blk->i.i_inline & F2FS_INLINE_DENTRY)) {
>> +		block_t blkaddr = le32_to_cpu(node_blk->i.i_addr[ofs]);
>> +
>>  		DBG(3, "ino[0x%x] has inline dentry!\n", nid);
>> -		if (le32_to_cpu(node_blk->i.i_addr[ofs]) != 0) {
>> -			/* should fix this bug all the time */
>> -			FIX_MSG("inline_dentry has wrong 0'th block = %x",
>> -					le32_to_cpu(node_blk->i.i_addr[ofs]));
>> -			node_blk->i.i_addr[ofs] = 0;
>> -			node_blk->i.i_blocks = cpu_to_le64(*blk_cnt);
>> -			need_fix = 1;
>> +		if (blkaddr != 0) {
>> +			ASSERT_MSG("[0x%x] wrong inline reserve blkaddr:%u",
>> +								nid, blkaddr);
>> +			if (c.fix_on) {
>> +				FIX_MSG("inline_dentry has wrong 0'th block = %x",
>> +								blkaddr);
>> +				node_blk->i.i_addr[ofs] = 0;
>> +				node_blk->i.i_blocks = cpu_to_le64(*blk_cnt);
>> +				need_fix = 1;
>> +			}
>>  		}
>>  
>>  		ret = fsck_chk_inline_dentries(sbi, node_blk, &child);
>>  		if (ret < 0) {
>> -			/* should fix this bug all the time */
>> -			need_fix = 1;
>> +			if (c.fix_on)
>> +				need_fix = 1;
>>  		}
>>  		child.state |= FSCK_INLINE_INODE;
>>  		goto check;
>> @@ -999,7 +1028,7 @@ skip_blkcnt_fix:
>>  	free(en);
>>  
>>  	if (ftype == F2FS_FT_SYMLINK && i_blocks && i_size == 0) {
>> -		DBG(1, "ino: 0x%x i_blocks: %lu with zero i_size",
>> +		ASSERT_MSG("ino: 0x%x i_blocks: %lu with zero i_size\n",
>>  						nid, (unsigned long)i_blocks);
>>  		if (c.fix_on) {
>>  			u64 i_size = i_blocks * F2FS_BLKSIZE;
>> @@ -1012,7 +1041,7 @@ skip_blkcnt_fix:
>>  	}
>>  
>>  	if (ftype == F2FS_FT_ORPHAN && i_links) {
>> -		MSG(0, "ino: 0x%x is orphan inode, but has i_links: %u",
>> +		ASSERT_MSG("ino: 0x%x is orphan inode, but has i_links: %u",
>>  				nid, i_links);
>>  		if (c.fix_on) {
>>  			node_blk->i.i_links = 0;
>> -- 
>> 2.18.0.rc1
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

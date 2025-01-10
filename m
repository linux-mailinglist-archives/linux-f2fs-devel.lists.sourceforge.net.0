Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA08A085E0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jan 2025 04:23:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tW5ck-0006Iz-4O;
	Fri, 10 Jan 2025 03:23:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tW5ci-0006Ir-6Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jan 2025 03:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CewUs58z0P0Bq/dBfvEEc5UIHSWegAthEVr21ND/2jo=; b=KU+huAnnHmdzgkX806ON+rDflH
 N3UBLQM6HZZz6kWzoLDrTX9u7ABbp4dCVwjuStiIAZwsAU5p2xx+xGVnv8hV0tTdgZjAS/oImzeCr
 4KGDh0HrreKSDUgD11wYXtWtUE9Eh5Cpy1t6eUCaEBXqEeI90irax2a8gJi3+pzRU7ms=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CewUs58z0P0Bq/dBfvEEc5UIHSWegAthEVr21ND/2jo=; b=O9t0jE1VyEJUsy+ED+nquXLpfe
 fPiHX8sXutNRNQ+8Oh7zW+ro05SkCpwQGYaZFXUA63n9v3IGKt8HGe3GvrO6cK7Um5jmzr4H2FVpg
 O9rbhejiVu/GrZLoJzsbUd3FHSeKDVn6HBa/+XvXGnUWo9FQvT1nY6UaLnIs1p/fhwLg=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tW5cg-00070n-VY for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jan 2025 03:23:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AC66FA40B20;
 Fri, 10 Jan 2025 03:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E3BC4CED6;
 Fri, 10 Jan 2025 03:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736479420;
 bh=ty1fi+5GmvFKL6KsW7SplfmhFDDAXyU/AsI6NOgaN/4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=I2VAUFTDMReq3rxcdY7f3Te5QlxRL6j4CqHPjdMMVMX5elpkZz6kKF9Oiyv5UMUYW
 uJx9eKLbFQoYyU/0sh/XPQZ+pfb/2p1m2E2Y3Mxtp6YwL+AtDs9X9IIIqESNnMaRwF
 zVRhijda4+Yl1jXD2cLK9XdY8uSgERN1FBMk4USO+mj7vHOsMq2Ghq4uHogtiR7we1
 AJhYF2wKs3dx2Zb9ZsL8uWn97ZYIcqYbNhCShmXWvD5bZ39zU4Cx28gqGrZV0wD9AC
 T56JQCJHYsvknwPtBN5YnUNeXfdvEPH45jedrEhlYl7Bj41Sri7wlxPztwGjIE9eSn
 2uvACx4kpR/Yg==
Message-ID: <f282ccdd-2dad-4128-b27a-dd6038622aec@kernel.org>
Date: Fri, 10 Jan 2025 11:23:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20241216134600.8308-1-chao@kernel.org>
 <Z32ARgIkX_Iazx41@google.com>
Content-Language: en-US
In-Reply-To: <Z32ARgIkX_Iazx41@google.com>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/8/25 03:28, Jaegeuk Kim wrote: > On 12/16,
 Chao Yu wrote:
 >> syzbot reported an out-of-range access issue as below: >> >> UBSAN:
 array-index-out-of-bounds
 in fs/f2fs/f2fs.h:3292:19 >> index 18446 [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tW5cg-00070n-VY
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check correctly on
 i_inline_xattr_size
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
Cc: syzbot+69f5379a1717a0b982a1@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/8/25 03:28, Jaegeuk Kim wrote:
> On 12/16, Chao Yu wrote:
>> syzbot reported an out-of-range access issue as below:
>>
>> UBSAN: array-index-out-of-bounds in fs/f2fs/f2fs.h:3292:19
>> index 18446744073709550491 is out of range for type '__le32[923]' (aka 'unsigned int[923]')
>> CPU: 0 UID: 0 PID: 5338 Comm: syz.0.0 Not tainted 6.12.0-syzkaller-10689-g7af08b57bcb9 #0
>> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
>> Call Trace:
>>   <TASK>
>>   __dump_stack lib/dump_stack.c:94 [inline]
>>   dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
>>   ubsan_epilogue lib/ubsan.c:231 [inline]
>>   __ubsan_handle_out_of_bounds+0x121/0x150 lib/ubsan.c:429
>>   read_inline_xattr+0x273/0x280
>>   lookup_all_xattrs fs/f2fs/xattr.c:341 [inline]
>>   f2fs_getxattr+0x57b/0x13b0 fs/f2fs/xattr.c:533
>>   vfs_getxattr_alloc+0x472/0x5c0 fs/xattr.c:393
>>   ima_read_xattr+0x38/0x60 security/integrity/ima/ima_appraise.c:229
>>   process_measurement+0x117a/0x1fb0 security/integrity/ima/ima_main.c:353
>>   ima_file_check+0xd9/0x120 security/integrity/ima/ima_main.c:572
>>   security_file_post_open+0xb9/0x280 security/security.c:3121
>>   do_open fs/namei.c:3830 [inline]
>>   path_openat+0x2ccd/0x3590 fs/namei.c:3987
>>   do_file_open_root+0x3a7/0x720 fs/namei.c:4039
>>   file_open_root+0x247/0x2a0 fs/open.c:1382
>>   do_handle_open+0x85b/0x9d0 fs/fhandle.c:414
>>   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>>   do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
>>
>> index: 18446744073709550491 (decimal, unsigned long long)
>> = 0xfffffffffffffb9b (hexadecimal) = -1125 (decimal, long long)
>> UBSAN detects that inline_xattr_addr() tries to access .i_addr[-1125].
>>
>> w/ below testcase, it can reproduce this bug easily:
>> - mkfs.f2fs -f -O extra_attr,flexible_inline_xattr /dev/sdb
>> - mount -o inline_xattr_size=512 /dev/sdb /mnt/f2fs
>> - touch /mnt/f2fs/file
>> - umount /mnt/f2fs
>> - inject.f2fs --node --mb i_inline --nid 4 --val 0x1 /dev/sdb
>> - inject.f2fs --node --mb i_inline_xattr_size --nid 4 --val 2048 /dev/sdb
>> - mount /dev/sdb /mnt/f2fs
>> - getfattr /mnt/f2fs/file
>>
>> The root cause is if metadata of filesystem and inode were fuzzed as below:
>> - extra_attr feature is enabled
>> - flexible_inline_xattr feature is enabled
>> - ri.i_inline_xattr_size = 2048
>> - F2FS_EXTRA_ATTR bit in ri.i_inline was not set
>>
>> sanity_check_inode() will skip doing sanity check on fi->i_inline_xattr_size,
>> result in using invalid inline_xattr_size later incorrectly, fix it.
>>
>> Meanwhile, let's fix to check lower boundary for .i_inline_xattr_size w/
>> MIN_INLINE_XATTR_SIZE like we did in parse_options().
>>
>> Fixes: 6afc662e68b5 ("f2fs: support flexible inline xattr size")
>> Reported-by: syzbot+69f5379a1717a0b982a1@syzkaller.appspotmail.com
>> Closes: https://lore.kernel.org/linux-f2fs-devel/674f4e7d.050a0220.17bd51.004f.GAE@google.com
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/inode.c | 19 ++++++++++---------
>>   1 file changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>> index 282fd320bdb3..29ccc64faae9 100644
>> --- a/fs/f2fs/inode.c
>> +++ b/fs/f2fs/inode.c
>> @@ -302,15 +302,6 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>>   				  F2FS_TOTAL_EXTRA_ATTR_SIZE);
>>   			return false;
>>   		}
>> -		if (f2fs_sb_has_flexible_inline_xattr(sbi) &&
>> -			f2fs_has_inline_xattr(inode) &&
>> -			(!fi->i_inline_xattr_size ||
>> -			fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
>> -			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, max: %lu",
>> -				  __func__, inode->i_ino, fi->i_inline_xattr_size,
>> -				  MAX_INLINE_XATTR_SIZE);
>> -			return false;
>> -		}
>>   		if (f2fs_sb_has_compression(sbi) &&
>>   			fi->i_flags & F2FS_COMPR_FL &&
>>   			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
>> @@ -320,6 +311,16 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>>   		}
>>   	}
>>   
>> +	if (f2fs_sb_has_flexible_inline_xattr(sbi) &&
>> +		f2fs_has_inline_xattr(inode) &&
>> +		(fi->i_inline_xattr_size < MIN_INLINE_XATTR_SIZE ||
>> +		fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
>> +		f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, min: %u, max: %lu",
> 												--> %lu?

Thanks for fixing.

I'd like to fix this in v2, meanwhile including more information from Qasdev's
patch.

Thanks,

>> +			  __func__, inode->i_ino, fi->i_inline_xattr_size,
>> +			  MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);
>> +		return false;
>> +	}
>> +
>>   	if (!f2fs_sb_has_extra_attr(sbi)) {
>>   		if (f2fs_sb_has_project_quota(sbi)) {
>>   			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
>> -- 
>> 2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

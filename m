Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA5451B61C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 May 2022 04:50:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nmRZ5-0006Ev-9f; Thu, 05 May 2022 02:50:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nmRYk-0006Ds-LQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 May 2022 02:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FPbX/E/zPR3DgBoBc5twjrOG0Lffv9CRsLpkkf+9x2M=; b=f6pNHgH3UpFwLszpwjpYwFenuZ
 eznhyB93b/XCWGMtg5+yFz7rnJhEWsKC2epLFCBVCimE7DrLZN6N6b6RywNh6vlMrLN5Zu2MMGekp
 IWaidjH0NB9ABAM6Z/AKcR/4e10NVHWFfKXnQI8ojYv4OlxTfW2JiO8V9AGzcs57cluI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FPbX/E/zPR3DgBoBc5twjrOG0Lffv9CRsLpkkf+9x2M=; b=EqsZ7KHksWvkkTW7FhHMskWmuL
 Co1lcEpqtaztVWdKdcAPrxXaeD3OLtS3wjOYAvqAwAN+z4YCZXvnP3+DNNAGdqe7nT/sj1BfWBt2U
 8MMNEn/joicUG/JpkOr3+3aB7Zf1Jl2R+6cG23PsjSDbJjZ2nFGgnpO556Xh+BeVAd/M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nmRYi-001kL4-8O
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 May 2022 02:49:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D6F566189A;
 Thu,  5 May 2022 02:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D572C385A5;
 Thu,  5 May 2022 02:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651718966;
 bh=WsFxI8tAPwJTDxgTE3fIsf0Fr++lhBi5KhM8JEGqIKA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=By3loszQpJmgf45etbT6dtiYPHWUqSkk9Uyw/4f64S25gN8tjW+q3xqAzegMttCSo
 Clko/YftpeDtXalT88ONJEqs5QGnRUebZMgAatDy4cPwqaXmBLMvqM6toQy1Gs8f4O
 nJQ8nmcPxe+YEhRRzNNjusj+8CoV3w5kooAqJFh5GmQNm7oJWYJFKbMmKRFMb7t3BO
 x9edE0QeYb8BqzryYQp1y+a+Lv9EZrM0x3y6EXc9YpPt30xbNQ0Raapkn7elCbNbmZ
 km1hMAd7uOR8H4oIZ7V4IUu2s5z4txsOHiQZ3zU5Net19g7VWyU5isjxkdNPBdBuPj
 0EjdTes+iVg0w==
Message-ID: <173c51c2-eff3-8d76-7041-e9c58024a97e@kernel.org>
Date: Thu, 5 May 2022 10:49:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220428024940.12102-1-chao@kernel.org>
 <YnLwDx1smguDQ6qC@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YnLwDx1smguDQ6qC@google.com>
X-Spam-Score: -8.3 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/5 5:28, Jaegeuk Kim wrote: > On 04/28,
 Chao Yu wrote: >> As Yanming reported in bugzilla: >> >>
 https://bugzilla.kernel.org/show_bug.cgi?id=215895
 >> >> I have encountered a bug in F2FS file [...] 
 Content analysis details:   (-8.3 points, 6.0 required)
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
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nmRYi-001kL4-8O
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check for inline inode
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
Cc: Ming Yan <yanming@tju.edu.cn>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/5/5 5:28, Jaegeuk Kim wrote:
> On 04/28, Chao Yu wrote:
>> As Yanming reported in bugzilla:
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=215895
>>
>> I have encountered a bug in F2FS file system in kernel v5.17.
>>
>> The kernel message is shown below:
>>
>> kernel BUG at fs/inode.c:611!
>> Call Trace:
>>   evict+0x282/0x4e0
>>   __dentry_kill+0x2b2/0x4d0
>>   dput+0x2dd/0x720
>>   do_renameat2+0x596/0x970
>>   __x64_sys_rename+0x78/0x90
>>   do_syscall_64+0x3b/0x90
>>
>> The root cause is: fuzzed inode has both inline_data flag and encrypted
>> flag, so after it was deleted by rename(), during f2fs_evict_inode(),
>> it will cause inline data conversion due to flags confilction, then
>> page cache will be polluted and trigger panic in clear_inode().
>>
>> This patch tries to fix the issue by do more sanity checks for inline
>> data inode in sanity_check_inode().
>>
>> Cc: stable@vger.kernel.org
>> Reported-by: Ming Yan <yanming@tju.edu.cn>
>> Signed-off-by: Chao Yu <chao.yu@oppo.com>
>> ---
>>   fs/f2fs/f2fs.h  | 7 +++++++
>>   fs/f2fs/inode.c | 3 +--
>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 27aa93caec06..64c511b498cc 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -4173,6 +4173,13 @@ static inline void f2fs_set_encrypted_inode(struct inode *inode)
>>    */
>>   static inline bool f2fs_post_read_required(struct inode *inode)
>>   {
>> +	/*
>> +	 * used by sanity_check_inode(), when disk layout fields has not
>> +	 * been synchronized to inmem fields.
>> +	 */
>> +	if (file_is_encrypt(inode) || file_is_verity(inode) ||
>> +			F2FS_I(inode)->i_flags & F2FS_COMPR_FL)
>> +		return true;
>>   	return f2fs_encrypted_file(inode) || fsverity_active(inode) ||
>>   		f2fs_compressed_file(inode);
>>   }
>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>> index 83639238a1fe..234b8ed02644 100644
>> --- a/fs/f2fs/inode.c
>> +++ b/fs/f2fs/inode.c
>> @@ -276,8 +276,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>>   		}
>>   	}
>>   
>> -	if (f2fs_has_inline_data(inode) &&
>> -			(!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))) {
>> +	if (f2fs_has_inline_data(inode) && !f2fs_may_inline_data(inode)) {
> 
> It seems f2fs_may_inline_data() is breaking the atomic write case. Please fix.

sanity_check_inode() change only affect f2fs_iget(), during inode initialization,
file should not be set as atomic one, right?

I didn't see any failure during 'f2fs_io write atomic_write' testcase... could you
please provide me detail of the testcase?

Thanks,

> 
>>   		set_sbi_flag(sbi, SBI_NEED_FSCK);
>>   		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
>>   			  __func__, inode->i_ino, inode->i_mode);
>> -- 
>> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

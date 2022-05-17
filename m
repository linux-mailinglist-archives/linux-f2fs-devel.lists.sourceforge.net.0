Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC8E52975E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 May 2022 04:28:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nqmx1-0007fX-06; Tue, 17 May 2022 02:28:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nqmwo-0007fO-8Q
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 May 2022 02:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZuQoEjp9iqpqNo6C/igfj697tfmZBMUwWh0x7J9poSE=; b=bpAWtxRIxV3eKXDusSjN4hlGKC
 xd77A3bxa4pSomqFYRKBxTwJ7L7gqdsyU5WwRkRsfwXx3Sl9rADeGwO64P3yEfc7mNMabVo9SH28j
 FGPLKvvV14G2pmVaKcx2hraSrjMrnZzkg5Y9zloPcVYzqFE8OOKh+S1bFJnBwcG5oJ0c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZuQoEjp9iqpqNo6C/igfj697tfmZBMUwWh0x7J9poSE=; b=YBlj/4m696hHxmLKbIwdPQl0UB
 ky1sDvoSEZXBgYJiYm1Hj3Ihbonf2GLfJTGlQyd9PIXvXgx4d2Hd4nmcV0Oec/L3wJnPp9vcdRCyu
 b8Yc0/OWz3YmPFFmNNfVyfsmLf4R2HNPSGnjJP23UxRQGB1ji4Fsgoh/pRTuih7OzXNM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nqmwf-001kA5-7s
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 May 2022 02:28:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8A995B816A3;
 Tue, 17 May 2022 02:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1DADC385AA;
 Tue, 17 May 2022 02:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652754492;
 bh=2BK+qccsnYN9U4J+o3pYJeINww3jHTy6bx3/JTI0z3I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MEbKNlPKH8gSYH1nlIUFrAU9S7BvJyRP0at6+SbdlQfrai23Uc1GAG5RWHaiDpThW
 ISal0fCB2hXg5wXbtKyujurYcAycwltkYuT5tEUqMBg4tmgKgXUebeOMZGx7NYMfqU
 utxt2ZS+LP/ht3FZG8GBlNpSldZwtAW+UC+Gh0RSymGdTt+IGwQeE9R9QTS1IoIJLf
 1ncZa27hX+sRLZvNrn4Zxv5dhO9ne9WZfv0Ds7A2hKjNUCRgM6EsUic8Pd1sm2ek6/
 RmAHBom1p62paArJ/mSNLSoUW7lL/0KbzpwoKzEhRea4cAJSCiwSDXJyWy5avrGl27
 dkN1hkQm6h7vQ==
Message-ID: <ffef8bce-3eb8-0e7e-dd64-e97c59251d2b@kernel.org>
Date: Tue, 17 May 2022 10:28:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220515090547.1914-1-chao@kernel.org>
 <YoLwd3CUBIFn7+rS@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YoLwd3CUBIFn7+rS@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/17 8:46, Jaegeuk Kim wrote: > On 05/15, Chao Yu
 wrote: >> Yanming reported a kernel bug in Bugzilla kernel [1], which can
 be >> reproduced. The bug message is: >> >> The kernel message is sh [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqmwf-001kA5-7s
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to do sanity check for inline
 inode
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

On 2022/5/17 8:46, Jaegeuk Kim wrote:
> On 05/15, Chao Yu wrote:
>> Yanming reported a kernel bug in Bugzilla kernel [1], which can be
>> reproduced. The bug message is:
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
>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=215895
>>
>> The bug is due to fuzzed inode has both inline_data and encrypted flags.
>> During f2fs_evict_inode(), as the inode was deleted by rename(), it
>> will cause inline data conversion due to conflicting flags. The page
>> cache will be polluted and the panic will be triggered in clear_inode().
>>
>> Try fixing the bug by doing more sanity checks for inline data inode in
>> sanity_check_inode().
>>
>> Cc: stable@vger.kernel.org
>> Reported-by: Ming Yan <yanming@tju.edu.cn>
>> Signed-off-by: Chao Yu <chao.yu@oppo.com>
>> ---
>> v3:
>> - clean up commit message suggested by Bagas Sanjaya.
>>   fs/f2fs/f2fs.h  | 8 ++++++++
>>   fs/f2fs/inode.c | 3 +--
>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 492af5b96de1..0dc2461ef02c 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -4126,6 +4126,14 @@ static inline void f2fs_set_encrypted_inode(struct inode *inode)
>>    */
>>   static inline bool f2fs_post_read_required(struct inode *inode)
>>   {
>> +	/*
>> +	 * used by sanity_check_inode(), when disk layout fields has not
>> +	 * been synchronized to inmem fields.
>> +	 */
>> +	if (S_ISREG(inode->i_mode) && (file_is_encrypt(inode) ||
>> +		F2FS_I(inode)->i_flags & F2FS_COMPR_FL ||
>> +		file_is_verity(inode)))
>> +		return true;
> 
> Again, I prefer to check this in sanity_check_inode(), since we don't need to
> check all the time here.

Sure, how about adding a new parameter for f2fs_may_inline_data() to indicate
its caller is sanity_check_inode(), and do the checks here only for such path?

Thanks,

> 
>>   	return f2fs_encrypted_file(inode) || fsverity_active(inode) ||
>>   		f2fs_compressed_file(inode);
>>   }
>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>> index 2fce8fa0dac8..5e494c98e3c2 100644
>> --- a/fs/f2fs/inode.c
>> +++ b/fs/f2fs/inode.c
>> @@ -276,8 +276,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>>   		}
>>   	}
>>   
>> -	if (f2fs_has_inline_data(inode) &&
>> -			(!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))) {
>> +	if (f2fs_has_inline_data(inode) && !f2fs_may_inline_data(inode)) {
>>   		set_sbi_flag(sbi, SBI_NEED_FSCK);
>>   		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
>>   			  __func__, inode->i_ino, inode->i_mode);
>> -- 
>> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CCJ+LqS8MGoyWwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 05:01:56 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC7168B97C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 05:01:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="gfDg/jAt";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=ifs5q8dm;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=TtfOGvCm;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=GgVqetBn;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqh6eGF33Fkv1mHiAhPkV4uaDH6gzS3n6FcHLHJ0LeY=; b=gfDg/jAtbqFiAMxf4abWD4j1T1
	s9VyQq5Kmvwinkxazopho8A2bJNpNNaqb6zPVcUyBsMH1jkrjSaEYx1yfNQ24qBrl4ahuWfhn+gta
	OCRBbbcLuXG7LAI7E/sss8OAHEZsJ8q09gWk+WJoWPIl642GqE4OkhaFbcCf74s/E1RQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZK3e-0005A9-Nj;
	Tue, 16 Jun 2026 03:01:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZK3K-00058U-H5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 03:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B/RZnSljipJOZquW04rJPGF1VzGqqFUxaQmLb32LuJk=; b=ifs5q8dmIZ5accddMXSaV0hsu0
 x8MOa3dh9eXMtuK9PU1LTA4n9/g7sqXTWLarYTARqYk/HTBFW7RNt6FA8ykiSV4XwX6XYM0FO0Kum
 1Md/QaiYwPmp4vcZixG4oAy83lIB8sHzr2zmIG4H97q6vSCkqgmy4NDYxa6mP2L4/Xio=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B/RZnSljipJOZquW04rJPGF1VzGqqFUxaQmLb32LuJk=; b=TtfOGvCmg0bgQpTdKUM5F/N5rs
 N1JhUks+0wFWkStFa3WKLP1bvhr/+iB03iaQoBmdOhRS7yQqeS9fFZ1FpuiQ17jikgxYAj99QZQeL
 x99jCxWhsWmloQtFIcsctyDYddRYRKoysPYGLP0JMhwoJZOU/g8Jt9N39JGxCGEg8V8o=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZK3J-0001bC-KU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 03:01:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 820616008A;
 Tue, 16 Jun 2026 03:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F131F000E9;
 Tue, 16 Jun 2026 03:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781578880;
 bh=B/RZnSljipJOZquW04rJPGF1VzGqqFUxaQmLb32LuJk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=GgVqetBnaGkkZSvhQkn1D4n6wZH/IVW8VaFBiHpCnp650kgVd5no2HHzeC0ytO/qW
 9gNmHisgLQn+WdbcvUBPkeYUIpxHTJUb/dJK3kI8yjywsyFulCUAqxdXwIRcoDJYTx
 GwsqFp3s2Sf9iB6bLWLrrnpSbS759bxyC96dxxKvS98JrUUhDbTpxVt/PWpJm02sHz
 G0QshpQXgxVkeps9/xawQy3dbbI6nhU1ml7JrZi2Za/FEXb16gM/ZZok7EwyLW8uph
 YCAwSToulq7qdfBZXZjjIVU3wxvmnxUHS4nkLYcA7Lsi8OXKudMD1p5ArDRYqn7zjH
 untzXy5LmlGbA==
Message-ID: <ea312e9d-06e6-4575-b998-1788a688a74d@kernel.org>
Date: Tue, 16 Jun 2026 11:01:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, Mikhail Lobanov <m.lobanov@rosa.ru>
References: <20260615113613.20762-1-m.lobanov@rosa.ru>
 <ajAiNyPcqd4Blujr@google.com>
Content-Language: en-US
In-Reply-To: <ajAiNyPcqd4Blujr@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/16/26 00:03, Jaegeuk Kim wrote: > Thanks, I have made
 further clean-ups. Could you please check this? > >
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev
 The merged one looks good to me. 
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
X-Headers-End: 1wZK3J-0001bC-KU
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: read COW data with the original
 inode during atomic write
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
Cc: daehojeong@google.com, linux-f2fs-devel@lists.sourceforge.net,
 lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:m.lobanov@rosa.ru,m:daehojeong@google.com,m:linux-f2fs-devel@lists.sourceforge.net,m:lvc-project@linuxtesting.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rosa.ru:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DC7168B97C

On 6/16/26 00:03, Jaegeuk Kim wrote:
> Thanks, I have made further clean-ups. Could you please check this?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev

The merged one looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> 
> On 06/15, Mikhail Lobanov via Linux-f2fs-devel wrote:
>> When updating an atomic-write file, f2fs_write_begin() may read the
>> previously written data back from the COW inode:
>> prepare_atomic_write_begin() locates the block in the COW inode and sets
>> use_cow, and the read bio is then built with the COW inode:
>>
>> 	f2fs_submit_page_read(use_cow ? F2FS_I(inode)->cow_inode : inode,
>> 			      ...);
>>
>> and f2fs_grab_read_bio() decides whether to schedule fs-layer decryption
>> (STEP_DECRYPT) for the bio based on that inode via
>> fscrypt_inode_uses_fs_layer_crypto().
>>
>> However, the folio being filled belongs to the original inode
>> (folio->mapping->host == inode), and the data stored in the COW block was
>> encrypted (or left as plaintext) using the original inode's context, not
>> the COW inode's -- see f2fs_encrypt_one_page(), which keys off
>> fio->page->mapping->host.  fscrypt_decrypt_pagecache_blocks() likewise
>> operates on folio->mapping->host.
>>
>> The COW inode is created as a tmpfile in the parent directory and inherits
>> its encryption policy from there.  With test_dummy_encryption the newly
>> created COW inode gets the dummy policy and becomes encrypted, while a
>> pre-existing regular file -- created before the policy applied, e.g.
>> already present in the on-disk image -- stays unencrypted.  The read
>> path then sets STEP_DECRYPT based on the encrypted COW inode and calls
>> fscrypt_decrypt_pagecache_blocks() on a folio whose host (the unencrypted
>> original inode) has a NULL ->i_crypt_info, dereferencing it:
>>
>>   Oops: general protection fault, probably for non-canonical address ...
>>   KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
>>   RIP: 0010:fscrypt_decrypt_pagecache_blocks+0xa0/0x310
>>   Workqueue: f2fs_post_read_wq f2fs_post_read_work
>>   Call Trace:
>>    fscrypt_decrypt_bio+0x1eb/0x340
>>    f2fs_post_read_work+0xba/0x140
>>    process_one_work+0x91c/0x1a40
>>    worker_thread+0x677/0xe90
>>    kthread+0x2bc/0x3a0
>>
>> The COW inode is only needed to locate the on-disk block, and that block
>> address is already resolved into @blkaddr by prepare_atomic_write_begin()
>> via __find_data_block(cow_inode, ...); f2fs_submit_page_read() then reads
>> from that physical @blkaddr directly, so the inode argument only selects
>> the post-read crypto context, not which block is fetched.  Reading with
>> @inode therefore returns the same (latest, not-yet-committed) COW data,
>> while making both the fs-layer decryption decision and the inline crypto
>> path use the correct (original inode's) key.
>>
>> With the COW inode no longer used at the read site, the use_cow flag has no
>> remaining consumer; drop it from f2fs_write_begin() and
>> prepare_atomic_write_begin().
>>
>> Fixes: 591fc34e1f98 ("f2fs: use cow inode data when updating atomic write")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Mikhail Lobanov <m.lobanov@rosa.ru>
>> Reviewed-by: Chao Yu <chao@kernel.org>
>> ---
>> v2: drop the now-unused use_cow flag from f2fs_write_begin() and
>>     prepare_atomic_write_begin() (Chao Yu); no functional change beyond
>>     v1.  Carried Chao's Reviewed-by as the cleanup was his request.
>>     Rebased on current mainline (f2fs_submit_page_read() now takes a
>>     fsverity_info argument and returns void).
>>
>>  fs/f2fs/data.c | 17 ++++++++++++-----
>>  1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 8d4f1e75dee3..9016272b68c7 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -3822,7 +3822,7 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
>>  
>>  static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
>>  			struct folio *folio, loff_t pos, unsigned int len,
>> -			block_t *blk_addr, bool *node_changed, bool *use_cow)
>> +			block_t *blk_addr, bool *node_changed)
>>  {
>>  	struct inode *inode = folio->mapping->host;
>>  	struct inode *cow_inode = F2FS_I(inode)->cow_inode;
>> @@ -3839,7 +3839,6 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
>>  	if (err) {
>>  		return err;
>>  	} else if (*blk_addr != NULL_ADDR) {
>> -		*use_cow = true;
>>  		return 0;
>>  	}
>>  
>> @@ -3873,7 +3872,6 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>>  	struct folio *folio;
>>  	pgoff_t index = pos >> PAGE_SHIFT;
>>  	bool need_balance = false;
>> -	bool use_cow = false;
>>  	block_t blkaddr = NULL_ADDR;
>>  	int err = 0;
>>  
>> @@ -3936,7 +3934,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>>  
>>  	if (f2fs_is_atomic_file(inode))
>>  		err = prepare_atomic_write_begin(sbi, folio, pos, len,
>> -					&blkaddr, &need_balance, &use_cow);
>> +					&blkaddr, &need_balance);
>>  	else
>>  		err = prepare_write_begin(sbi, folio, pos, len,
>>  					&blkaddr, &need_balance);
>> @@ -3976,8 +3974,15 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>>  			err = -EFSCORRUPTED;
>>  			goto put_folio;
>>  		}
>> -		f2fs_submit_page_read(use_cow ? F2FS_I(inode)->cow_inode :
>> -						inode,
>> +		/*
>> +		 * Although the block may be stored in the COW inode, the folio
>> +		 * belongs to @inode and its data was encrypted (or not) using
>> +		 * @inode's context (see f2fs_encrypt_one_page()).  Read with
>> +		 * @inode so the post-read decryption decision matches the
>> +		 * folio's owner; otherwise an unencrypted @inode whose COW inode
>> +		 * is encrypted hits a NULL ->i_crypt_info on decryption.
>> +		 */
>> +		f2fs_submit_page_read(inode,
>>  				      NULL, /* can't write to fsverity files */
>>  				      folio, blkaddr, 0, true);
>>  
>>
>> -- 
>> 2.34.1
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

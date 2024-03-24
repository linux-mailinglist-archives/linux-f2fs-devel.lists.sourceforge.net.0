Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CDF887CA3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 24 Mar 2024 13:14:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1roMjk-0000vs-Ko;
	Sun, 24 Mar 2024 12:14:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1roMji-0000vk-C7
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 24 Mar 2024 12:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Er6MHTeKtHj233TmFGxvoBJZmj/noUnN9XZp1i2xBII=; b=ILa0wsf+bcQI6mg/MWzs0HwYuJ
 80N9yJdtYGY8kPGfYCQkzUV83Z0HvYuBshSizh6Ovi6vWKa6nUYDdwpRSyGtIrQDJBkA4M2zIzyOm
 p9VecfAxsA5AE7LeLrtsBWpP1z4hFkcdpNXrT2FZ2zcvBwjtuQ+oRFfrHrtajL33Gsug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Er6MHTeKtHj233TmFGxvoBJZmj/noUnN9XZp1i2xBII=; b=ic9+PNIG93s+4KYkRzQ6BBtpjw
 tVxl2EK+hI/0onZxnB9uvKDn0weNHSS4gpEBFVZC8L9pBHYdrIwy4URpViQunoNdkgh83pXPFfYDK
 ri8F1TKYfga8hCE4e4ZPrVfpc6uA1kqxt7Y0UTVOhgkS7yyL8aovJipKYWVUPLJRjrEM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1roMjg-0002zy-Tw for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 24 Mar 2024 12:14:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D5F05CE0A54;
 Sun, 24 Mar 2024 12:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C82C433F1;
 Sun, 24 Mar 2024 12:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711282433;
 bh=j0tdVAvKCmjLmpL5K4bMh/Z7e2Vn9xGCnyoFaVM+/tk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WlazkfrDr3ZR417qjKbKMg7dtYS6LU/jgKc2e3Vd3eOv5NKe47/PSE+Plnerg8CzC
 7SSBJYAFJOoaxSaOibaKsQo4Zyn/oLqN1kUc5WIpghu1EMxfRUhHID+uO1Uy+zP0k0
 VAGz1V+mODn5iLjYFRksBe5PuJRwJ7DwaOzus4DTlW7uUzfNn/urf2t1ez17sI8ZyQ
 NXkZzu9puqjPUJZXPOgghrHw3P4wR9gmfkr0J5DQ18/vsbT8yH+h7gpy7o+CIe6vfB
 grKYehpregRQVYPu3LxhSWyOZv13CxGiqMyP/ECAIkvUx/UWOm4RxVSzk/PFyGhB4I
 Ji75gqaVcOCTA==
Message-ID: <cd11bff9-46cc-4148-9dcf-4087e1621985@kernel.org>
Date: Sun, 24 Mar 2024 20:13:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
References: <CAHj4cs-kfojYC9i0G73PRkYzcxCTex=-vugRFeP40g_URGvnfQ@mail.gmail.com>
 <esesb6dg5omj7e5sdnltnapuuzgmbdfmezcz6owsx2waqayc5q@36yhz4dmrxh6>
 <CAHj4cs874FivTdmw=VMJwTzzLFZWb4OKqvNGRN0R0O+Oiv4aYA@mail.gmail.com>
 <CAHj4cs_eOSafp0=cbwjNPR6X2342GF_cnUTcXf6RjrMnoOHSmQ@mail.gmail.com>
 <msec3wnqtvlsnfsw34uyrircyco3j3y7yb4gj75ofz5gnn57mg@qzcq5eumjwy5>
 <CAHj4cs-DC7QQH1W3KSzXS8ERMPW-6XQ9-w_Mzr1zEGF7ZZ=K3w@mail.gmail.com>
 <d6vi6aq44c4a7ekhck6zxxy4woa5q7v5bnvn5qmad7nqk7egms@ptc72tum4bks>
 <gngdj77k4picagsfdtiaa7gpgnup6fsgwzsltx6milmhegmjff@iax2n4wvrqye>
 <f4f1cfac-8520-47a1-ad18-b9922aa0545d@kernel.org>
 <jpgro32y5r3mpyh24hoqnwkbcg67twbmcxeicoa5qt723u7ehk@4imddarhtt74>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <jpgro32y5r3mpyh24hoqnwkbcg67twbmcxeicoa5qt723u7ehk@4imddarhtt74>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/19 19:13, Shinichiro Kawasaki wrote: > On Mar 19, 
 2024 / 10:22, Chao Yu wrote: >> On 2024/3/18 13:47, Shinichiro Kawasaki via
 Linux-f2fs-devel wrote: >>> I confirmed that the trigger commit [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1roMjg-0002zy-Tw
Subject: Re: [f2fs-dev] [bug report]WARNING: CPU: 22 PID: 44011 at
 fs/iomap/iter.c:51 iomap_iter+0x32b observed with blktests zbd/010
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
Cc: linux-block <linux-block@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Yi Zhang <yi.zhang@redhat.com>, Bart Van Assche <bvanassche@acm.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/19 19:13, Shinichiro Kawasaki wrote:
> On Mar 19, 2024 / 10:22, Chao Yu wrote:
>> On 2024/3/18 13:47, Shinichiro Kawasaki via Linux-f2fs-devel wrote:
>>> I confirmed that the trigger commit is dbf8e63f48af as Yi reported. I took a
>>> look in the commit, but it looks fine to me. So I thought the cause is not
>>> in the commit diff.
>>>
>>> I found the WARN is printed when the f2fs is set up with multiple devices,
>>> and read requests are mapped to the very first block of the second device in the
>>> direct read path. In this case, f2fs_map_blocks() and f2fs_map_blocks_cached()
>>> modify map->m_pblk as the physical block address from each block device. It
>>> becomes zero when it is mapped to the first block of the device. However,
>>> f2fs_iomap_begin() assumes that map->m_pblk is the physical block address of the
>>> whole f2fs, across the all block devices. It compares map->m_pblk against
>>> NULL_ADDR == 0, then go into the unexpected branch and sets the invalid
>>> iomap->length. The WARN catches the invalid iomap->length.
>>>
>>> This WARN is printed even for non-zoned block devices, by following steps.
>>>
>>>    - Create two (non-zoned) null_blk devices memory backed with 128MB size each:
>>>      nullb0 and nullb1.
>>>    # mkfs.f2fs /dev/nullb0 -c /dev/nullb1
>>>    # mount -t f2fs /dev/nullb0 "${mount_dir}"
>>>    # dd if=/dev/zero of="${mount_dir}/test.dat" bs=1M count=192
>>>    # dd if="${mount_dir}/test.dat" of=/dev/null bs=1M count=192 iflag=direct
>>>
>>> I created a fix candidate patch [1]. It modifies f2fs_iomap_begin() to handle
>>> map->m_pblk as the physical block address from each device start, not the
>>> address of whole f2fs. I confirmed it avoids the WARN.
>>>
>>> But I'm not so sure if the fix is good enough. map->m_pblk has dual meanings.
>>> Sometimes it holds the physical block address of each device, and sometimes
>>> the address of the whole f2fs. I'm not sure what is the condition for
>>> map->m_pblk to have which meaning. I guess F2FS_GET_BLOCK_DIO flag is the
>>> condition, but f2fs_map_blocks_cached() does not ensure it.
>>>
>>> Also, I noticed that map->m_pblk is referred to in other functions below, and
>>> not sure if they need the similar change as I did for f2fs_iomap_begin().
>>>
>>>     f2fs_fiemap()
>>>     f2fs_read_single_page()
>>>     f2fs_bmap()
>>>     check_swap_activate()
>>>
>>> I would like to hear advices from f2fs experts for the fix.
>>>
>>>
>>> [1]
>>>
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index 26e317696b33..5232223a69e5 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -1569,6 +1569,7 @@ static bool f2fs_map_blocks_cached(struct inode *inode,
>>>    		int bidx = f2fs_target_device_index(sbi, map->m_pblk);
>>>    		struct f2fs_dev_info *dev = &sbi->devs[bidx];
>>> +		map->m_multidev_dio = true;
>>>    		map->m_bdev = dev->bdev;
>>>    		map->m_pblk -= dev->start_blk;
>>>    		map->m_len = min(map->m_len, dev->end_blk + 1 - map->m_pblk);
>>> @@ -4211,9 +4212,11 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>>>    			    unsigned int flags, struct iomap *iomap,
>>>    			    struct iomap *srcmap)
>>>    {
>>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>>    	struct f2fs_map_blocks map = {};
>>>    	pgoff_t next_pgofs = 0;
>>> -	int err;
>>> +	block_t pblk;
>>> +	int err, i;
>>>    	map.m_lblk = bytes_to_blks(inode, offset);
>>>    	map.m_len = bytes_to_blks(inode, offset + length - 1) - map.m_lblk + 1;
>>> @@ -4239,12 +4242,17 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>>>    	 * We should never see delalloc or compressed extents here based on
>>>    	 * prior flushing and checks.
>>>    	 */
>>> -	if (WARN_ON_ONCE(map.m_pblk == NEW_ADDR))
>>> +	pblk = map.m_pblk;
>>> +	if (map.m_multidev_dio && map.m_flags & F2FS_MAP_MAPPED)
>>> +		for (i = 0; i < sbi->s_ndevs; i++)
>>> +			if (FDEV(i).bdev == map.m_bdev)
>>> +				pblk += FDEV(i).start_blk;
>>> +	if (WARN_ON_ONCE(pblk == NEW_ADDR))
>>>    		return -EINVAL;
>>> -	if (WARN_ON_ONCE(map.m_pblk == COMPRESS_ADDR))
>>> +	if (WARN_ON_ONCE(pblk == COMPRESS_ADDR))
>>>    		return -EINVAL;
>>
>> Shoudn't we check NEW_ADDR and COMPRESS_ADDR before multiple-device
>> block address conversion?
> 
> As far as I understand, NEW_ADDR and COMPRESS_ADDR in map.m_pblk can be
> target of "map->m_pblk -= FDEV(bidx).start_blk;" in f2fs_map_blocks(),
> so I guessed that the address conversion should come first.
> 
>>
>>> -	if (map.m_pblk != NULL_ADDR) {
>>> +	if (pblk != NULL_ADDR) {
>>
>> How to distinguish NULL_ADDR and valid blkaddr 0? I guess it should
>> check F2FS_MAP_MAPPED flag first?
> 
> I guessed that physical block address for the whole f2fs (pblk) can not be 0, so
> the NULL_ADDR can have zero value. As for the physical block address of each
> device (map->m_pblk) can be 0. But this is still my *guess*, and I'm not sure.
> 
> 
> The comments from you and Daeho made me rethink. It looks problematic for me
> that map->m_pblk has two meanings as I had described: "1) physical block address
> from each device start", and "2) physical block address of whole f2fs". So how
> about to make it have only one meaning "2) physical block address address of
> whole f2fs"? I created another patch below [2]. It removes the
> 
>     map->m_pblk -= FDEV(bidx).start_blk;
> 
> lines in f2fs_map_blocks_cached() and f2fs_map_blocks() so that map->m_pblk do
> not have the meaning 1). Instead, the subtraction is done in f2fs_iomap_begin().
> I confirmed that this patch also avoids the WARN. I can have more confidence in
> this patch, and I hope it is easier to review.
> 
> P.S. If anyone has better solution idea, feel free to provide patches. I'm
>       willing to test them :)
> 
> 
> [2]
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 26e317696b33..7404b4fbcba3 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1569,8 +1569,8 @@ static bool f2fs_map_blocks_cached(struct inode *inode,
>   		int bidx = f2fs_target_device_index(sbi, map->m_pblk);
>   		struct f2fs_dev_info *dev = &sbi->devs[bidx];
>   
> +		map->m_multidev_dio = true;
>   		map->m_bdev = dev->bdev;
> -		map->m_pblk -= dev->start_blk;
>   		map->m_len = min(map->m_len, dev->end_blk + 1 - map->m_pblk);
>   	} else {
>   		map->m_bdev = inode->i_sb->s_bdev;
> @@ -1793,11 +1793,8 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>   
>   		if (map->m_multidev_dio) {
>   			block_t blk_addr = map->m_pblk;
> -
>   			bidx = f2fs_target_device_index(sbi, map->m_pblk);
> -
>   			map->m_bdev = FDEV(bidx).bdev;
> -			map->m_pblk -= FDEV(bidx).start_blk;
>   
>   			if (map->m_may_create)
>   				f2fs_update_device_state(sbi, inode->i_ino,
> @@ -4211,9 +4208,11 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>   			    unsigned int flags, struct iomap *iomap,
>   			    struct iomap *srcmap)
>   {
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct f2fs_map_blocks map = {};
>   	pgoff_t next_pgofs = 0;
> -	int err;
> +	block_t pblk;
> +	int err, bidx;
>   
>   	map.m_lblk = bytes_to_blks(inode, offset);
>   	map.m_len = bytes_to_blks(inode, offset + length - 1) - map.m_lblk + 1;
> @@ -4249,7 +4248,12 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>   		iomap->type = IOMAP_MAPPED;
>   		iomap->flags |= IOMAP_F_MERGED;
>   		iomap->bdev = map.m_bdev;
> -		iomap->addr = blks_to_bytes(inode, map.m_pblk);
> +		pblk = map.m_pblk;
> +		if (map.m_multidev_dio && map.m_flags & F2FS_MAP_MAPPED) {
> +			bidx = f2fs_target_device_index(sbi, map.m_pblk);
> +			pblk -= FDEV(bidx).start_blk;
> +		}
> +		iomap->addr = blks_to_bytes(inode, pblk);
>   	} else {
>   		if (flags & IOMAP_WRITE)
>   			return -ENOTBLK;

Hi Shinichiro,

Can you please check below diff? IIUC, for the case: f2fs_map_blocks()
returns zero blkaddr in non-primary device, which is a verified valid
block address, we'd better to check m_flags & F2FS_MAP_MAPPED instead
of map.m_pblk != NULL_ADDR to decide whether tagging IOMAP_MAPPED flag
or not.

---
  fs/f2fs/data.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6f66e3e4221a..41a56d4298c8 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4203,7 +4203,7 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
  	if (WARN_ON_ONCE(map.m_pblk == COMPRESS_ADDR))
  		return -EINVAL;

-	if (map.m_pblk != NULL_ADDR) {
+	if (map.m_flags & F2FS_MAP_MAPPED) {
  		iomap->length = blks_to_bytes(inode, map.m_len);
  		iomap->type = IOMAP_MAPPED;
  		iomap->flags |= IOMAP_F_MERGED;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
